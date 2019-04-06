package com.ffw.app.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ffw.api.model.PageData;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.RestTemplateUtil;

@Component
public class CommonFilter implements Filter {

	@Autowired
	RestTemplateUtil rest;

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		String openID = request.getParameter("openid");
		if (StringUtils.isNotEmpty(openID)) {
			PageData pdm = new PageData();
			pdm.put("WXOPEN_ID", openID);
			pdm = rest.post(IConstant.FFW_SERVICE_KEY, "member/findBy", pdm,
					PageData.class);
			request.getSession().setAttribute(IConstant.USER_SESSION, pdm);
		}

		if (null == request.getSession().getAttribute(IConstant.USER_SESSION)) {
			response.sendRedirect(request.getContextPath() + "/error/param");
		} else {
			arg2.doFilter(arg0, arg1);
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
