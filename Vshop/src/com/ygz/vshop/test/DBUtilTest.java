package com.ygz.vshop.test;


import com.ygz.vshop.dao.UserDao;
import com.ygz.vshop.daoImpl.UserDaoImpl;
import com.ygz.vshop.db.DBUtil;

/**
 * Created by $Ygz on 2017/5/17.
 */
public class DBUtilTest
{
    public static void main(String [] args)
    {
        //数据库连接池已经连接
        System.out.println(DBUtil.getConnection());
       // String account="ygz";
       // String password="password";
        //单个查询
        //System.out.println(DBUtil.executeQuery("select user_id from user where user_id=1"));
        //UserService user=new UserServiceImpl();
       //String obj=(user.UserLogin(account,password));
       //System.out.println(obj);
        /*
        System.out.println("---------------------------------------------");
        //当前的时间
        System.out.println(StringHelper.getCurrentFormatDate());

        System.out.println(StringHelper.getCurrentTimeStamp());
        
        System.out.println("md5"+StringHelper.MD5("123456"));
        System.out.println("================================================");
        //测试成功
        //查询用户信息有用
        UserDao us=new UserDaoImpl();
        User u=us.getUserInfo("110");
        u.setUser_city("安远");
        //System.out.println(us.getUserInfo("110").getUser_phone());
        System.out.println(us.saveUserInfo(u));
        System.out.println("==============================================");
        
        User users=new User();
        users.setUser_id(2);
        users.setUser_account("xp");
        users.setUser_password(StringHelper.MD5("111"));
        users.setUser_name("as");
        users.setUser_level(1);
        users.setUser_left(1);
        users.setUser_right(20);
        users.setUser_birth("1999-03-03");
        users.setUser_phone("10086");
        users.setUser_city("上海");
        users.setUser_matter("0");
        users.setUser_answer("hl");
        users.setUser_recommend("gz");
        users.setUser_date(StringHelper.getCurrentTimeStamp());
        System.out.println(user.addUserInfo(users));
        */
        //UserDao us=new UserDaoImpl();
        //User users=us.getUserInfo("gz");
        //System.out.println(users.getUser_left());
        UserDao us=new UserDaoImpl();
        System.out.println(us.selectList(1,10,3));
        
    }
}
