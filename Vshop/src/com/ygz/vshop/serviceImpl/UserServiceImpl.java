package com.ygz.vshop.serviceImpl;

import java.util.List;

import com.ygz.vshop.dao.UserDao;
import com.ygz.vshop.daoImpl.UserDaoImpl;
import com.ygz.vshop.enity.User;
import com.ygz.vshop.service.UserService;

/**
 * 实现用户操作接口
 * Created by Ygz on 2017/5/19.
 */
public class UserServiceImpl implements UserService {
    //登陆操作接口
    public String UserLogin(String user_account,String user_password)
    {
        UserDao userdao=new UserDaoImpl();
        return userdao.login(user_account,user_password);
    }

	//根据账号获取用户信息
	public User getUserInfo(String account)
	{
		UserDao userdao=new UserDaoImpl();
		return userdao.getUserInfo(account);
	}

	//根据用户保存
	public boolean saveUserInfo(User user) 
	{
		UserDao userdao=new UserDaoImpl();
		return userdao.saveUserInfo(user);
	}

	//添加用户信息
	public boolean addUserInfo(User user) 
	{
		UserDao userdao=new UserDaoImpl();
		return userdao.addUserInfo(user);
	}

	//根据账号找回密码
	public String getUserPassword(String user_account, String user_matter, String user_answer)
	{
		UserDao userdao=new UserDaoImpl();
		return userdao.getUserPassword(user_account,user_matter,user_answer);
	}

	//更新左下标的值
	public boolean updateLeft_number(int right, int user_id)
	{
		UserDao userdao=new UserDaoImpl();
		return userdao.updateLeft_number(right,user_id);
	}

	//更新右下标的值
	public boolean updateRight_number(int left, int user_id) 
	{
		UserDao userdao=new UserDaoImpl();
		return userdao.updateRight_number(left,user_id);
	}

	//根据用户账号获取账号所在的层级数
	public int getUser_level(String account)
	{
		UserDao userdao=new UserDaoImpl();
		return userdao.getUser_level(account);
	}
	//根据用户账号更新用户所在的层级数
	public boolean updateUser_level(int user_level,String account)
	{
		UserDao userdao=new UserDaoImpl();
		return userdao.updateUser_level(user_level,account);
	}

	//查询当前节点的层级数
	public List<User> selectList(int user_left, int user_right, int user_level)
	{
		UserDao userdao=new UserDaoImpl();
		return userdao.selectList(user_left,user_right,user_level);
	}
}
