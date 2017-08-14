package com.mainWeb.searchBang.admin.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.admin.model.AdminVO;
import com.mainWeb.searchBang.owner.model.OwnerVO;

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

	@Override
	public void insertNotice(AdminNoticeVO noticeVO) {
		sqlSession.insert("admin.insertNotice", noticeVO);
	}

	@Override
	public List<AdminNoticeVO> NoticeList(String noticeType) {
		return sqlSession.selectList("admin.NoticeList", noticeType);
	}

	@Override
	public AdminNoticeVO noticeRead(String notice_no) {
		return sqlSession.selectOne("admin.noticeRead", notice_no);
	}

	@Override
	public void noticeDel(String notice_no) {
		sqlSession.delete("admin.noticeDel", notice_no);
	}

	@Override
	public void noticeUpdate(AdminNoticeVO noticeVO) {
		sqlSession.update("admin.noticeUpdate", noticeVO);
	}

	@Override
	public List<OwnerVO> companyApprove() {
		return sqlSession.selectList("admin.approveCompany");
	}

	@Override
	public void approve(String approve, OwnerVO ownerVO) {
		if (approve.equals("ok"))
			sqlSession.update("admin.approveOk", ownerVO);
		if (approve.equals("cancel"))
			sqlSession.update("admin.approveCancel", ownerVO);
	}

	@Override
	public List<OwnerVO> companyList() {
		return sqlSession.selectList("admin.approveList");
	}

}
