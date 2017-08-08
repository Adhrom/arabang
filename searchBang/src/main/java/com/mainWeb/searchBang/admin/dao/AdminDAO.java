package com.mainWeb.searchBang.admin.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mainWeb.searchBang.admin.model.AdminVO;

public interface AdminDAO {
	// �α���
	public boolean loginCheck(AdminVO vo);

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

}
