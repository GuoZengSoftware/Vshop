package com.ygz.vshop.servlet;

import com.ygz.vshop.common.WebUtil;
import com.ygz.vshop.enity.User;
import com.ygz.vshop.service.UserService;
import com.ygz.vshop.serviceImpl.UserServiceImpl;
import com.ygz.vshop.util.StringHelper;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ygz on 2017/5/19.
 */

public class HandleAllUuserServlet extends HttpServlet {
	private UserService user;

	public HandleAllUuserServlet() {
		user = new UserServiceImpl();
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = WebUtil.getURI(request);
		if (path.equals("login.do")) {
			this.doLogin(request, response);
		}
		if (path.equals("info.do")) {
			this.doInfo(request, response);
		}
		// 修改用户信息
		if (path.equals("updateuserinfo.do")) {
			this.doUpdateUserInfo(request, response);
		}
		// 找回密码
		if (path.equals("retrievepassword.do")) {
			this.doRetrievePassword(request, response);
		}
		// 修改密码
		if (path.equals("alterpassword.do")) {
			this.doAlterPassword(request, response);
		}
		// 添加用户信息
		if (path.equals("add_userinfo.do")) {
			this.doAddUserInfo(request, response);
		}
		// 检查重复包含该数
		if (path.equals("check.do")) {
			this.doCheckUserAccount(request, response);
		}
		// 主页面
		if (path.equals("main.do")) {
			this.doMainServlet(request, response);
		}
		// 主界面查看联系人信息
		if (path.equals("user.do")) {
			this.doMainUserInfo(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	// 登陆
	protected void doLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		// 用户逻辑处理
		user = new UserServiceImpl();
		String returns = user.UserLogin(account, StringHelper.MD5(password));
		if (returns.equals("3")) {
			session.setAttribute("account", account);
			session.setMaxInactiveInterval(3600);
		}

		PrintWriter out = response.getWriter();
		// out.print("我是返回的结果值"); //思考题2： Ajax请求登录，返回值是中文乱码。怎么处理？
		// 把结果返回给Ajax请求
		out.println(returns);
	}

	// 信息
	protected void doInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		user = new UserServiceImpl();
		User userinfo = user.getUserInfo(session.getAttribute("account").toString());
		session.setAttribute("userinfo", userinfo);
		request.getRequestDispatcher("info.jsp").forward(request, response);
	}

	// 修改用户信息
	protected void doUpdateUserInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String account = (String) session.getAttribute("account");
		// 真实姓名
		String user_name = request.getParameter("user_name");
		// 出生日期
		String user_birth = request.getParameter("user_birth");
		// 手机号码
		String user_phone = request.getParameter("user_phone");
		// 所在城市
		String user_city = request.getParameter("user_city");
		// 密码
		String user_password = request.getParameter("user_password");
		// 要修改的密码
		String user_alter_password2 = request.getParameter("user_alter_password2");
		// 密保问题
		String user_matter = request.getParameter("user_matter");
		// 密保答案
		String user_answer = request.getParameter("user_answer");

		user = new UserServiceImpl();
		User userupdateinfo = user.getUserInfo(account);
		userupdateinfo.setUser_name(user_name);
		userupdateinfo.setUser_birth(user_birth);
		userupdateinfo.setUser_phone(user_phone);
		userupdateinfo.setUser_city(user_city);
		if (!user_alter_password2.equals("")) {
			userupdateinfo.setUser_password(user_alter_password2);
		} else {
			userupdateinfo.setUser_password(user_password);
		}
		userupdateinfo.setUser_matter(user_matter);
		userupdateinfo.setUser_answer(user_answer);
		boolean bool = user.saveUserInfo(userupdateinfo);
		if (bool == true) {
			String msg = "保存信息成功";
			session.setAttribute("msg", msg);
			session.setMaxInactiveInterval(3600);
			request.getRequestDispatcher("info.do").forward(request, response);
		} else {
			String msg = "保存信息失败";
			session.setAttribute("msg", msg);
			session.setMaxInactiveInterval(3600);
			request.getRequestDispatcher("info.do").forward(request, response);
		}
	}

	// 找回密码
	protected void doRetrievePassword(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String user_account = request.getParameter("user_account");
		String user_matter = request.getParameter("user_matter");
		String user_answer = request.getParameter("user_answer");
		user = new UserServiceImpl();
		String trues = user.getUserPassword(user_account, user_matter, user_answer);
		if (trues.equals("3")) {
			System.out.println("正确");
			session.setAttribute("account", user_account);
			session.setMaxInactiveInterval(3600);
		}
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(trues);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 修改密码
	protected void doAlterPassword(HttpServletRequest request, HttpServletResponse response) {
		String user_account = request.getParameter("user_account");
		// 密码
		String user_password = request.getParameter("user_password");
		user = new UserServiceImpl();
		User useralterpassword = user.getUserInfo(user_account);
		useralterpassword.setUser_password(StringHelper.MD5(user_password));
		boolean bool = user.saveUserInfo(useralterpassword);
		try {
			if (bool == true) {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("getpassword.jsp.jsp").forward(request, response);
			}
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 添加用户信息
	protected void doAddUserInfo(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String user_account = request.getParameter("user_account");
		String user_name = request.getParameter("user_name");
		String user_birth = request.getParameter("user_birth");
		String user_phone = request.getParameter("user_phone");
		String user_city = request.getParameter("user_city");
		System.out.println(user_city);
		String user_password = request.getParameter("user_password2");
		String user_recommend = session.getAttribute("account").toString();

		User add_user = new User();
		add_user.getUser_id();
		add_user.setUser_name(user_name);
		add_user.setUser_phone(user_phone);
		add_user.setUser_date(StringHelper.getCurrentTimeStamp());
		add_user.setUser_account(user_account);
		add_user.setUser_password(StringHelper.MD5(user_password));
		add_user.setUser_birth(user_birth);
		add_user.setUser_city(user_city);
		add_user.setUser_recommend(user_recommend);
		System.out.println(user_recommend);

		user = new UserServiceImpl();
		// 查询父节点的实体类
		User father = user.getUserInfo(user_recommend);

		// (1)新增节点的的左下标等于父节点的右下标值
		// 新增节点的右下标等于父节点的右下标值+1

		// (2)大于等于新增节点的左下标值等于右下标
		// 大于等于新增节点的右下标值等于左下标

		// 查询数目
		// (1)获取子节点 =(父节点的右下标值-父节点的左下标值-1)/2
		//
		// 新增节点的右下表等于父节点的右下标+1
		add_user.setUser_right(father.getUser_right() + 1);
		// 新增节点的左下表等于父节点的右下标
		add_user.setUser_left(father.getUser_right());
		if (user.addUserInfo(add_user)) {
			// 获取
			User current = user.getUserInfo(user_account);
			// 更新 大于等于新增节点的左下标值的右下标 都要 +2
			user.updateRight_number(add_user.getUser_left(), current.getUser_id());
			// 更新新增节点右下标值的左下标，都要+2
			user.updateLeft_number(add_user.getUser_right(), current.getUser_id());
			// 根据账号获取树型结构层级数
			int user_level = user.getUser_level(user_account);
			// 更新该账号的树形结构图
			user.updateUser_level(user_level, user_account);
			request.setAttribute("msg", "添加成功");
		} else {
			request.setAttribute("msg", "添加失败");
		}
		try {
			request.getRequestDispatcher("add.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 检查是否包含该数
	protected void doCheckUserAccount(HttpServletRequest request, HttpServletResponse response) {
		String user_account = request.getParameter("user_account");
		user = new UserServiceImpl();
		User isexists = user.getUserInfo(user_account);
		try {
			// 0表示不存在该账号、1表示存在该账号
			PrintWriter out = response.getWriter();
			if (isexists == null) {
				out.println("0");
			} else {
				out.println("1");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 主界面
	protected void doMainServlet(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String account=request.getParameter("user_account");
		if(account==null)
		{
			account = session.getAttribute("account").toString();
		}
		user = new UserServiceImpl();
		User current_userinfo = user.getUserInfo(account);
		try {
			if (current_userinfo != null) {
				List<User> main_userinfo = user.selectList(current_userinfo.getUser_left(),
						current_userinfo.getUser_right(), current_userinfo.getUser_level());
				int count = 0;
				for (User alluserinfo : main_userinfo) {
					if (alluserinfo.getUser_level() == current_userinfo.getUser_level() + 1) {
						switch (count) {
						case 0:
							request.setAttribute("user2_1", alluserinfo);
							break;
						case 1:
							request.setAttribute("user2_2", alluserinfo);
							break;
						default:
							request.setAttribute("user2_3", alluserinfo);
							break;
						}
						count++;
						System.out.println(count+"alluserinfo="+alluserinfo.getUser_level());
					} else {
						//第三层
						if (alluserinfo.getUser_level() == current_userinfo.getUser_level() + 2) {
							count=0;
							// 第三层
							switch (count) {
							case 0:
								request.setAttribute("user3_1", alluserinfo);
								break;
							case 1:
								request.setAttribute("user3_2", alluserinfo);
								break;
							default:
								request.setAttribute("user3_3", alluserinfo);
								break;
							}
							count++;
						}
					}
				}
				// request.setAttribute("main_userinfo", main_userinfo);
				request.setAttribute("current_userinfo", current_userinfo);
				request.getRequestDispatcher("main.jsp").forward(request, response);
			} else {
				response.sendRedirect("index.jsp");
			}
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	protected void doMainUserInfo(HttpServletRequest request, HttpServletResponse response) {
		String user_account = request.getParameter("user_account");
		user = new UserServiceImpl();
		User mainuserinfo = user.getUserInfo(user_account);
		if (mainuserinfo != null) {
			request.setAttribute("mainuserinfo", mainuserinfo);
			try {
				request.getRequestDispatcher("user.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("error.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
