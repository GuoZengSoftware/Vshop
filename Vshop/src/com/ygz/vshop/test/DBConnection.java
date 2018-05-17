package com.ygz.vshop.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	static Connection con;
	 static String driver = "com.mysql.jdbc.Driver";
	 static String url = "jdbc:mysql://localhost:3306/vshop?useUnicode=true&characterEncoding=utf-8&useSSL=true";
	 static String user = "root";
	 static String password = "mysql";
	 static 
		{
			try
			{
				Class.forName(driver);
			}
			catch(Exception v)
			{
				System.err.println("加载驱动异常");
			}
		}	
	//获取数据库的连接
		public static Connection getConnection()
		{
			try
			{
				if(con==null || con.isClosed())
				{      //驱动处理			获取数据库连接
					con = DriverManager.getConnection(url,user,password);
				}
				if(!con.isClosed())
					  System.out.println("Succeeded connecting to the Database!");
				 Statement statement = con.createStatement();
			}
			//数据库异常
			catch(SQLException e)
			{
				//打印异常
				e.printStackTrace();
			}
			return con;
		}
	 
	 
	 public static void main(String[] args) 
	 {
		 DBConnection db=new DBConnection();
		 System.out.println(db.getConnection());
	}
}

