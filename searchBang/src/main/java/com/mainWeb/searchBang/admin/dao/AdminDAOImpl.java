package com.mainWeb.searchBang.admin.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mainWeb.searchBang.admin.model.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public boolean loginCheck(AdminVO vo) {
		String name = sqlSession.selectOne("admin.loginCheck", vo);
		return (name == null) ? false : true;
	}

	@Override
	public AdminVO viewAdmin(AdminVO vo) {
		return sqlSession.selectOne("admin.viewAdmin", vo);
	}

	@Override
	public void logout(HttpSession session) {
	}

	@Override
	public List<AdminVO> adminList() {
		return sqlSession.selectList("admin.adminList");
	}

	@Override
	public void insertAdmin(AdminVO vo) {
		sqlSession.insert("admin.regAdmin", vo);
	}

	@Override
	public void deleteAdmin(String adminId) {
		sqlSession.delete("admin.delAdmin", adminId);
	}

}
