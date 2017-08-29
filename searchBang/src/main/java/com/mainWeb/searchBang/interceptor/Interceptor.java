package com.mainWeb.searchBang.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object oj) throws Exception {
		try {
			HttpSession session = req.getSession(false);
			String loginId = (String) session.getAttribute("loginId");
			if (loginId==null) {
				session.setAttribute("loginCheck", "failure");
				res.sendRedirect("index.admin");
				return false;
			}else{
				session.setAttribute("loginCheck", "success");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return true;
	}

}
