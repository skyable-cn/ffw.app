package com.ffw.app.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.app.constant.IConstant;

public class CommonInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String path = request.getServletPath();
		if ("/wechat/user".equals(path) || "/system/init".equals(path) || "/mini".equals(path) || "/index".equals(path)
				|| "/wxNotify".equals(path)) {
			return true;
		}

		PageData user = (PageData) request.getSession().getAttribute(IConstant.USER_SESSION);
		if (user != null) {
			return true;
		} else {
			response.sendRedirect(request.getContextPath() + "/mini");
			return false;
		}

	}

}
