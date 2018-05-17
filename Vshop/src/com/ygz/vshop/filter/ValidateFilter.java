package com.ygz.vshop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//配置用户登陆操作
public class ValidateFilter implements Filter
{
	private ServletContext servletcontext;
	//初始化
	public void init(FilterConfig config) throws ServletException 
	{
		servletcontext=config.getServletContext();
	}
	//放行
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException
	{
		//将HttpServletRequest转换为ServletRequest
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		HttpSession session=req.getSession();
		String login_page=servletcontext.getInitParameter("login_page");
		//获取公共的用户访问的路径信息
		String common_page=servletcontext.getInitParameter("common_page");
		//获取公共的需要验证访问的路径信息
		String validate_page=servletcontext.getInitParameter("validate_page");
		String current_page=req.getServletPath();
		System.out.println("当前页面是:"+current_page);
		//判断是否可以登陆
		if(common_page.indexOf(current_page)!=-1)
		{
			System.out.println("我是公共的页面");
			chain.doFilter(req,res);
		}
		else if(validate_page.indexOf(current_page)!=-1 && session.getAttribute("account")!=null)
		{
			System.out.println("我是需要验证的页面");
			chain.doFilter(req,res);
		}
		else
		{
			res.sendRedirect(req.getContextPath()+login_page);
		}
		
	}
	
	//销毁
	public void destroy()
	{
		servletcontext=null;
	}

}
