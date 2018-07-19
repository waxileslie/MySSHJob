package cn.zrr.ssh.service;

import cn.zrr.ssh.model.UserModel;

public interface IUserService {
	public void createUser(UserModel userModel) throws Exception;

	public UserModel getUser(String username) throws Exception;

	public UserModel modifyUser(UserModel userModel) throws Exception;

	public void removeUser(String username) throws Exception;
	
	public boolean isname(String username)throws Exception;
}
