package com.ygz.vshop.filter;
import com.ygz.vshop.common.AllCommonStyle;

import javax.servlet.Filter;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.FilterChain;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Created by Ygz on 2017/5/13.
 */
public class AllCharEncoding implements Filter
{
    private String encoding=null;
    //初始化
    public void init(FilterConfig config) throws ServletException
    {
        this.encoding=config.getInitParameter("encoding");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
    {
        //将servletRequest转换为HttpServletRequest
        HttpServletRequest req=(HttpServletRequest)request;
        //将servletResponse转换为HttpServletResponse
        HttpServletResponse res=(HttpServletResponse)response;
        //判断配置文件是否存在字符编码
        if(this.encoding!=null || !this.encoding.equals(""))
        {
            req.setCharacterEncoding(this.encoding);
            res.setContentType(this.encoding);
            res.setContentType("text/html;charset="+this.encoding);
        }
        else
        {
            req.setCharacterEncoding(AllCommonStyle.ENCODING);//设定客户端提交的数据是按UTF-8编码提交
            res.setContentType(AllCommonStyle.ENCODING);//告知浏览器是以UTF-8编码解析内容
            res.setContentType("text/html;charset="+AllCommonStyle.ENCODING);
        }
        /* 清除页面缓存 */
        res.setHeader("Pragma", "No-cache");
        res.setHeader("Cache-Control", "no-cache");
        res.setDateHeader("Expires", -10);
        //放行
        chain.doFilter(req,res);
    }

    //销毁
    public void destroy()
    {

    }
}
