package cn.zrr.ssh.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.zrr.ssh.model.UserModel;

public class UserLogoutAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		ActionContext ac = ActionContext.getContext();//相当于request对象
		Map<String, Object> session = ac.getSession();//相当于session对象
		session.put("user", null);//封装数据
		System.out.println("注销成功");
		return "success";
	}

}
