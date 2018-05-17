package com.ygz.vshop.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ygz.vshop.dao.UserDao;
import com.ygz.vshop.db.DBUtil;
import com.ygz.vshop.db.IResultSetUtil;
import com.ygz.vshop.enity.User;

/**
 * 业务逻辑处理 Created by Ygz on 2017/5/19.
 */
public class UserDaoImpl implements UserDao {
	// 登陆业务逻辑处理(1、账号错误、2、用户密码错误、3、正确)
	public String login(String user_account, String user_password) {
		String sql = "select user_password from user where user_account=?";
		Object obj = DBUtil.executeQuery(sql,user_account);
		System.out.println(obj);
		if (obj == null) {
			return "1";// 用户名为空
		} else {
			if (obj.toString().equals(user_password)) {
				return "3";// 正确
			} else {
				return "2";// 密码错误
			}
		}
	}

	//根据用户账号获取用户信息
	public User getUserInfo(final String account) {
		// 推荐人 真实姓名 出生日期 手机号码 所在城市 修改密码 确定密码 密保问题 密保答案 创建时间
		String sql = "select user_id,user_recommend,user_name,user_birth,user_phone,user_city,user_password,user_matter,user_answer,user_level,user_left,user_right,user_date from user where user_account=?";
		return (User) DBUtil.executeQuery(sql, new IResultSetUtil() {
			public Object doHandler(ResultSet rs) throws SQLException {
				if (rs.next()) {
					User user = new User();
					user.setUser_id(rs.getInt(1));
					user.setUser_account(account);
					user.setUser_recommend(rs.getString(2));
					user.setUser_name(rs.getString(3));
					user.setUser_birth(rs.getString(4));
					user.setUser_phone(rs.getString(5));
					user.setUser_city(rs.getString(6));
					user.setUser_password(rs.getString(7));
					user.setUser_matter(rs.getString(8));
					user.setUser_answer(rs.getString(9));
					user.setUser_level(rs.getInt(10));
					user.setUser_left(rs.getInt(11));
					user.setUser_right(rs.getInt(12));
					user.setUser_date(rs.getLong(13));
					return user;
				}
				return null;
			}

		}, account);
	}
	
	//根据账号保存用户信息
	public boolean saveUserInfo(User user) 
	{
		String sql="update user set user_id=?,user_name=?,user_birth=?,user_phone=?,user_city=?,user_password=?,user_matter=?,user_answer=?,user_level=?,user_left=?,user_right=?,user_date=?  where user_account=?";
		return DBUtil.executeUpdate(sql,user.getUser_id(),user.getUser_name(),user.getUser_birth(),user.getUser_phone(),user.getUser_city(),user.getUser_password(),user.getUser_matter(),user.getUser_answer(),user.getUser_level(),user.getUser_left(),user.getUser_right(),user.getUser_date(),user.getUser_account())>0;
	}
	
	
	//添加用户信息
	public boolean addUserInfo(User user) 
	{
			String sql="insert into user(user_id,user_account,user_password,user_level,user_left,user_right,user_name,user_birth,user_phone,user_city,user_matter,user_answer,user_recommend,user_date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			return DBUtil.executeUpdate(sql,user.getUser_id(),user.getUser_account(),user.getUser_password(),user.getUser_level(),user.getUser_left(),user.getUser_right(),user.getUser_name(),user.getUser_birth(),user.getUser_phone(),user.getUser_city(),user.getUser_matter(),user.getUser_answer(),user.getUser_recommend(),user.getUser_date())>0;
	}
	
	

	//根据找回找回密码
	public String getUserPassword(String user_account, String user_matter, String user_answer) 
	{
		String sql="select user_answer,user_password from user where user_account=? and user_matter=?";
		Object obj=DBUtil.executeQuery(sql,user_account,user_matter);
		if(obj==null)
		{
			//账号为空
			return "1";
		}
		else
		{
			if(obj.toString().equals(user_answer))
			{
				//正确
				return "3";
			}
			else
			{
				//密码为空
				return "2";
			}
		}
	}

	//更新用户左边的值
	public boolean updateLeft_number(int right, int user_id)
	{
		//大于等于新增节点左边的节点的右下标都要 +2
		String sql="update user set user_left=user_left+2 where user_left>=? and user_id <> ?";
		return DBUtil.executeUpdate(sql,right,user_id)>0;
	}

	//更新用户右边的值
	public boolean updateRight_number(int left, int user_id) 
	{
		//大于等于新增节点的右下标的左下标都要+2
		String sql="update user set user_right=user_right+2 where user_right>=? and user_id <> ?";
		return DBUtil.executeUpdate(sql,left,user_id)>0;
	}

	//根据用户账号获取账号所在的层级数
	public int getUser_level(String account)
	{
		String sql="select count(father.user_account)+1 from user as node,user as father where node.user_left>father.user_left and node.user_left<father.user_right and node.user_account=?";
		return DBUtil.executeQuery(sql,account) == null ? 0 : Integer.parseInt(DBUtil.executeQuery(sql, account).toString());
	}
	
	//根据用户账号更新账号所在的层级数
	public boolean updateUser_level(int user_level,String account)
	{
		String sql="update user set user_level=? where user_account=?";
		return DBUtil.executeUpdate(sql,user_level,account)>0;
	}

	//查询用户所有节点的集合
	@SuppressWarnings("unchecked")
	public List<User> selectList(int user_left, int user_right, int user_level) 
	{
		String sql="select user_account,user_left,user_right,user_level,user_date from user where user_left>? and user_right<? and user_level<=? order by user_left asc  limit 12";
		return (List<User>)DBUtil.executeQuery(sql,new IResultSetUtil() {
			public Object doHandler(ResultSet rs) throws SQLException 
			{
				List<User> list=new ArrayList<User>();
				while(rs.next())
				{
					User user=new User();
					user.setUser_account(rs.getString(1));
					user.setUser_left(rs.getInt(2));
					user.setUser_right(rs.getInt(3));
					user.setUser_level(rs.getInt(4));
					user.setUser_date(rs.getLong(5));
					list.add(user);
				}
				return list;
			}
		},user_left,user_right,(user_level+2));
	}
}