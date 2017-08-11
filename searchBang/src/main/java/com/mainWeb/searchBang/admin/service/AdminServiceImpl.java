package com.mainWeb.searchBang.admin.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.mainWeb.searchBang.admin.dao.AdminDAO;
import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.admin.model.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO adminDAO;

	@Override
	public boolean loginCheck(AdminVO vo, HttpSession session) {
		boolean result = adminDAO.loginCheck(vo);
		if (result) {
			AdminVO vo2 = viewAdmin(vo);
			session.setAttribute("loginId", vo2.getAdminId());
			session.setAttribute("loginCheck", "success");
		}
		return result;
	}

	@Override
	public AdminVO viewAdmin(AdminVO vo) {
		return adminDAO.viewAdmin(vo);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public List<AdminVO> adminList() {
		return adminDAO.adminList();
	}

	@Override
	public void insertAdmin(AdminVO vo) {
		adminDAO.insertAdmin(vo);
	}

	@Override
	public void deleteAdmin(String adminId) {
		adminDAO.deleteAdmin(adminId);
	}

	@Override
	public void insertNotice(AdminNoticeVO noticeVO) {
		adminDAO.insertNotice(noticeVO);
	}

	@Override
	public List<AdminNoticeVO> NoticeList(String noticeType) {
		return adminDAO.NoticeList(noticeType);
	}

	@Override
	public AdminNoticeVO noticeRead(String notice_no) {
		return adminDAO.noticeRead(notice_no);
	}

	@Override
	public void noticeDel(String notice_no) {
		adminDAO.noticeDel(notice_no);
	}

	@Override
	public void noticeUpdate(AdminNoticeVO noticeVO) {
		adminDAO.noticeUpdate(noticeVO);
	}

}
