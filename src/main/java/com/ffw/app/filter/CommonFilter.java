package com.ffw.app.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ffw.app.util.RestTemplateUtil;

public class CommonFilter implements Filter {

	private Logger logger = LoggerFactory.getLogger(CommonFilter.class);

	@Autowired
	RestTemplateUtil rest;

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		String openID = request.getParameter("openid");
		if (StringUtils.isNotEmpty(openID)) {
			logger.info("=========>> openid:" + openID);
			request.getSession().setAttribute("openid", openID);
		}

		arg2.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
