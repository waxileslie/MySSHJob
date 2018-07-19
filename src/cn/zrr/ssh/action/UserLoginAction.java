package cn.zrr.ssh.action;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Validateable;

import cn.zrr.ssh.model.UserModel;
import cn.zrr.ssh.service.IUserService;
@Controller("login")
public class UserLoginAction extends ActionSupport implements Validateable{

	private static final long serialVersionUID = 1L;

	private IUserService userService = null;

	@Autowired
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	private UserModel userModel = null;

	public UserModel getUserModel() {
		return userModel;
	}

	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}

	@Override
	public String execute() throws Exception {
		if (userService.getUser(userModel.getUsername()) == null) {
			System.out.println("不存在" + userModel.getUsername() + "该用户");
			return "nouser";
		} else {
			UserModel user = userService.getUser(userModel.getUsername());
			System.out.println("用户" + userModel.getUsername() + "存在");
			if (user.getPassword().equals(userModel.getPassword())) {
				System.out.println("用户：" + userModel.getUsername() + " 登录成功");
				ActionContext ac = ActionContext.getContext();
				Map<String, Object> session = ac.getSession();
				session.put("user", user);
				return SUCCESS;
			} else {
				System.out.println("用户：" + userModel.getUsername() + " 密码错误");
				return "failed";
			}
		}
	}
	
	
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		super.validate();
	}

}
