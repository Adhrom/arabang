package com.mainWeb.searchBang.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
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

	// 공지사항등록
	public void insertNotice(AdminNoticeVO noticeVO);

	// 공지사항목록
	public List<AdminNoticeVO> NoticeList(String noticeType);

	// 공지사항 내용
	public AdminNoticeVO noticeRead(String notice_no);

	// 공지사항 삭제
	public void noticeDel(String notice_no);

	// 공지사항 수정
	public void noticeUpdate(AdminNoticeVO noticeVO);
}
