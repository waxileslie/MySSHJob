package cn.zrr.ssh.service.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.zrr.ssh.model.MessageModel;
import cn.zrr.ssh.service.IMessageService;

@Service("messageServiceImpl")
@Transactional
public class MessageServiceImpl implements IMessageService {
	private SessionFactory sf;

	@Autowired
	public MessageServiceImpl(SessionFactory sf) {
		this.sf = sf;
	}

	@Autowired
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public void createMessage(MessageModel messageModel) throws Exception {
		// TODO Auto-generated method stub
		sf.getCurrentSession().save(messageModel);
	}

	@Override
	public MessageModel getMessage(int number) throws Exception {
		// TODO Auto-generated method stub
		MessageModel messageModel = sf.getCurrentSession().get(MessageModel.class, number);
		return messageModel;
	}

	@Override
	public void modifyMessage(MessageModel messageModel) throws Exception {
		// TODO Auto-generated method stub
		sf.getCurrentSession().update(messageModel);
	}

	@Override
	public void removeMessage(int number) throws Exception {
		// TODO Auto-generated method stub
		MessageModel messageModel = new MessageModel();
		messageModel.setNumber(number);
		sf.getCurrentSession().delete(messageModel);
	}

	@Override
	public List<MessageModel> getAllComment() throws Exception {
		// TODO Auto-generated method stub
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		String sql = "from MessageModel";
		Query<MessageModel> query = session.createQuery(sql, MessageModel.class);
		List<MessageModel> list = query.getResultList();
		tx.commit();
		session.close();
		return list;
	}

	@Override
	public List<MessageModel> getListByName(int row, int page) throws Exception {
		// TODO Auto-generated method stub
	
		Session  session=sf.openSession();
		
		Transaction tx=session.beginTransaction();
		String hql="from MessageModel mm where 1=1";

		Query<MessageModel> query=session.createQuery(hql,MessageModel.class);
		
		query.setFirstResult(row*(page-1));
		query.setMaxResults(row);
		List<MessageModel> list=query.getResultList();
		tx.commit();
		session.close();
		return list;
	}

	@Override
	public int getPage(int row) throws Exception {
		// TODO Auto-generated method stub
		return this.getCount()/row+1;
	}

	@Override
	public int getCount() throws Exception {
		// TODO Auto-generated method stub
		Session  session=sf.openSession();
		
		Transaction tx=session.beginTransaction();
		String hql="from MessageModel mm where 1=1";

		Query<MessageModel> query=session.createQuery(hql,MessageModel.class);

		
		List<MessageModel> list=query.getResultList();
		tx.commit();
		session.close();

		return list.size();
	}

}
