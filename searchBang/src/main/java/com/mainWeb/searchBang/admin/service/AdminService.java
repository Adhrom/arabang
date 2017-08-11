package com.mainWeb.searchBang.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.admin.model.AdminVO;

public interface AdminService {
	// �α���
	public boolean loginCheck(AdminVO vo, HttpSession session);

	// �α�������
	public AdminVO viewAdmin(AdminVO vo);

	// �α׾ƿ�
	public void logout(HttpSession session);

	// ���̵���
	public List<AdminVO> adminList();

	// ���̵���
	public void insertAdmin(AdminVO vo);

	// ���̵����
	public void deleteAdmin(String adminId);

	// �������׵��
	public void insertNotice(AdminNoticeVO noticeVO);

	// �������׸��
	public List<AdminNoticeVO> NoticeList(String noticeType);

	// �������� ����
	public AdminNoticeVO noticeRead(String notice_no);

	// �������� ����
	public void noticeDel(String notice_no);

	// �������� ����
	public void noticeUpdate(AdminNoticeVO noticeVO);
}
