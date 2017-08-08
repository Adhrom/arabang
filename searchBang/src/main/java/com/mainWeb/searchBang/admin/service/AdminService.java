package com.mainWeb.searchBang.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mainWeb.searchBang.admin.model.AdminVO;

public interface AdminService {
	// 로그인
	public boolean loginCheck(AdminVO vo, HttpSession session);

	// 로그인정보
	public AdminVO viewAdmin(AdminVO vo);

	// 로그아웃
	public void logout(HttpSession session);

	// 아이디목록
	public List<AdminVO> adminList();

	// 아이디등록
	public void insertAdmin(AdminVO vo);

	// 아이디삭제
	public void deleteAdmin(String adminId);

}
