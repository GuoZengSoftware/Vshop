package com.ygz.vshop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//检查用户是否登陆
public class CheckLogin implements Filter
{
	//初始化
	public void init(FilterConfig filterConfig) throws ServletException 
	{
		
	}
	//放行
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException 
	{
		//将ServletRequest转换为HttpServletRequest
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		 //判断用户是否登陆
        HttpSession session=req.getSession();
        String account=(String)session.getAttribute("account");
        //如果账号不为空
        if(session.getAttribute("account")!=null)
        {
        	chain.doFilter(req,res);
        }
        else
        {
        	//拦截器
        	res.sendRedirect("index.jsp");
        }
	}
	//销毁
	public void destroy() 
	{
	}
	
}
