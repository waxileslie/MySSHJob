package cn.zrr.ssh.action;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

import cn.zrr.ssh.model.MessageModel;
import cn.zrr.ssh.service.IMessageService;

public class MessageFrontAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private int count =0;
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	private int page=0;
	private int pageCount=0;
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRow() {
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}

	public IMessageService getMessageService() {
		return messageService;
	}

	private int row=5;

	private IMessageService messageService = null;

	@Autowired
	public void setMessageService(IMessageService messageService) {
		this.messageService = messageService;
	}

	private List<MessageModel> listMessage = null;

	public List<MessageModel> getListMessage() {
		return listMessage;
	}

	public void setListMessage(List<MessageModel> listMessage) {
		this.listMessage = listMessage;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		pageCount=messageService.getPage(row);
		count=messageService.getCount();
		if(page<1){
			page=1;
		}
		listMessage = messageService.getListByName(row, page);
		return SUCCESS;
	}

}
