package cn.zrr.ssh.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

import cn.zrr.ssh.model.BlogModel;
import cn.zrr.ssh.service.IBlogService;

public class BlogRemoveAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	private IBlogService blogService = null;

	@Autowired
	public void setBlogService(IBlogService blogService) {
		this.blogService = blogService;
	}

	private String number = null;

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		blogService.removeBlog(Integer.parseInt(number));
		System.out.println("文章已删除");
		return SUCCESS;
	}
}
