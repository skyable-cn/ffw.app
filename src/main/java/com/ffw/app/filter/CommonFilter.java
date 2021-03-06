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

import com.ffw.api.model.PageData;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.RestTemplateUtil;

public class CommonFilter implements Filter {

	private Logger logger = LoggerFactory.getLogger(CommonFilter.class);

	@Autowired
	RestTemplateUtil rest;

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		String openID = request.getParameter("openid");
		if (StringUtils.isNotEmpty(openID)) {

			PageData pdm = new PageData();
			pdm.put("WXOPEN_ID", openID);
			pdm = rest.post(IConstant.FFW_SERVICE_KEY, "member/findBy", pdm, PageData.class);
			request.getSession().setAttribute(IConstant.USER_SESSION, pdm);

			PageData market = new PageData();
			market.put("MARKET_ID", pdm.getString("MARKET_ID"));
			market = rest.post(IConstant.FFW_SERVICE_KEY, "market/find", market, PageData.class);
			request.getSession().setAttribute(IConstant.MARKET_SESSION, market);

		}

		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		if (StringUtils.isNotEmpty(latitude) && StringUtils.isNotEmpty(longitude)) {

			PageData location = new PageData();
			location.put("LATITUDE", latitude);
			location.put("LONGITUDE", longitude);
			request.getSession().setAttribute(IConstant.LOCATION_SESSION, location);

		}

		arg2.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
