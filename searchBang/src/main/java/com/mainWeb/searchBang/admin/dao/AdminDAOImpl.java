package com.mainWeb.searchBang.admin.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.admin.model.AdminVO;
import com.mainWeb.searchBang.admin.model.OwnerCountVO;
import com.mainWeb.searchBang.admin.model.ReservationChartVO;
import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.owner.model.QnAVO;
import com.mainWeb.searchBang.owner.model.ReviewCountVO;
import com.mainWeb.searchBang.owner.model.SalesVO;
import com.mainWeb.searchBang.user.model.ReviewVO;
import com.mainWeb.searchBang.user.model.UserInfoVO;

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

	@Override
	public void insertReply(QnAVO vo) {
		System.out.println(vo);
		sqlSession.update("admin.insertReply" , vo);
	}

	@Override
	public List<QnAVO> QnAList() {
		return sqlSession.selectList("admin.QnAList");
	}

	@Override
	public List<ReviewVO> reviewList() {
		return sqlSession.selectList("admin.reviewAll");
	}

	@Override
	public List<ReviewVO> declrationReviewList() {
		return sqlSession.selectList("admin.reviewDeclration");
	}

	@Override
	public void deleteReview(String review_no) {
		sqlSession.delete("admin.reviewDelete", review_no);
	}

	@Override
	public void cancelReview(String review_no) {
		sqlSession.update("admin.reviewCancel", review_no);
	}

	@Override
	public List<UserInfoVO> userList() {
		return sqlSession.selectList("admin.userList");
	}

	@Override
	public List<SalesVO> sales_fees() {
		return sqlSession.selectList("admin.sales_fees");
	}

	@Override
	public List<OwnerCountVO> ownerCount() {
		return sqlSession.selectList("admin.ownerCount");
	}

	@Override
	public List<ReservationChartVO> reservationChart() {
		return sqlSession.selectList("admin.reservationChart");
	}

	@Override
	public List<ReviewCountVO> ownerGradeChart() {
		return sqlSession.selectList("admin.ownerGradeChart");
	}

	@Override
	public int totalAccom() {
		return sqlSession.selectOne("admin.totalAccom");
	}

}
