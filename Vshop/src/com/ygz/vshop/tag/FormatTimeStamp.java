package com.ygz.vshop.tag;
import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.ygz.vshop.util.StringHelper;

public class FormatTimeStamp extends SimpleTagSupport
{
	/**
	 * 自定义标签用于格式化时间
	 * 
	 */
	private Long timestamp;
	//自定义时间格式   yyyy-MM-DD			yyyy-MM-DD HH-mm-ss
	private String format;
	public void doTag() throws JspException,IOException 
	{
		JspWriter out=this.getJspContext().getOut();
		out.println(StringHelper.getDateByTimeStamp(timestamp,format));
	}
	public Long getTimestamp() 
	{
		return timestamp;
	}
	public void setTimestamp(Long timestamp)
	{
		this.timestamp = timestamp;
	}
	public String getFormat()
	{
		return format;
	}
	public void setFormat(String format) 
	{
		this.format = format;
	}
	
}
