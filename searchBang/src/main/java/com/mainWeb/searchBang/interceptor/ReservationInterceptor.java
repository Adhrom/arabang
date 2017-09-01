package com.mainWeb.searchBang.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mainWeb.searchBang.user.dao.UserDAO;

public class ReservationInterceptor extends HandlerInterceptorAdapter {

	@Inject
	private UserDAO dao;
	Map<String, Object> info = new HashMap<String, Object>();
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object oj) throws Exception {
		try {
			HttpSession session = req.getSession(false);
			int room_no = (int)session.getAttribute("room_no");
			String startDate = (String)session.getAttribute("startDate");
			String endDate = (String)session.getAttribute("endDate");
			info.put("startDate", startDate);
			info.put("endDate", endDate);
			info.put("room_no", room_no);
			if(!dao.reservationInterceptor(room_no, info)){
				session.setAttribute("reservationSuccess", "failure");
				res.sendRedirect("index.bang");
				return false;
			}else{
				session.setAttribute("reservationSuccess", "success");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return true;
	}

}