package cn.zrr.ssh.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.zrr.ssh.model.BlogModel;
import cn.zrr.ssh.model.UserModel;
import cn.zrr.ssh.service.IBlogService;

public class BlogModifyAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	private IBlogService blogService = null;

	@Autowired
	public void setBlogService(IBlogService blogService) {
		this.blogService = blogService;
	}

	private BlogModel blogModel = null;

	public BlogModel getBlogModel() {
		return blogModel;
	}

	public void setBlogModel(BlogModel blogModel) {
		this.blogModel = blogModel;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		UserModel userModel = (UserModel) session.get("user");
		blogModel.setAuthor(userModel.getUsername());
		blogModel.setAlter_time(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		blogService.modifyBlog(blogModel);
		System.out.println("文章已修改");
		return SUCCESS;
	}
}
