package com.mainWeb.searchBang.admin.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mainWeb.searchBang.admin.model.AdminVO;

public interface AdminDAO {
	// loginCheck
	public boolean loginCheck(AdminVO vo);

	// login info
	public AdminVO viewAdmin(AdminVO vo);

	// logout
	public void logout(HttpSession session);

	// adminList
	public List<AdminVO> adminList();

	// insertAdmin
	public void insertAdmin(AdminVO vo);

	// deleteAdmin
	public void deleteAdmin(String adminId);
}
