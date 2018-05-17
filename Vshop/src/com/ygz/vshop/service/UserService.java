package com.ygz.vshop.service;

import java.util.List;
import com.ygz.vshop.enity.User;

/**
 * 用户业务逻辑接口
 * Created by Ygz on 2017/5/19.
 */
public interface UserService
{
    //登陆接口
    public String UserLogin(String user_account,String user_password);
    //根据账号获取用户信息
    public User getUserInfo(String account);
    //根据账号保存用户信息
    public boolean saveUserInfo(User user);
    //添加用户信息
    public boolean addUserInfo(User user);
    //找回密码
    public String getUserPassword(String user_account,String user_matter,String user_answer);
    //更新左下标的值
    public boolean updateLeft_number(int right,int user_id);
    //更新右下标的值
    public boolean updateRight_number(int left,int user_id);
    //根据用户账号获取账号所在的层级数
    public int getUser_level(String account);
    //根据账号更新账号所在的层级数
    public boolean updateUser_level(int user_level,String account);
    //查询当前节点的子节点的集合
    public List<User> selectList(int user_left,int user_right,int user_level);
}
