package com.mainWeb.searchBang.admin.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.mainWeb.searchBang.admin.dao.AdminDAO;
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

	@Override
	public List<OwnerVO> companyApprove() {
		return adminDAO.companyApprove();
	}

	@Override
	public void approve(String approve,OwnerVO ownerVO) {
		adminDAO.approve(approve, ownerVO);
	}

	@Override
	public List<OwnerVO> companyList() {
		return adminDAO.companyList();
	}

	@Override
	public void insertReply(QnAVO vo) {
		adminDAO.insertReply(vo);
	}

	@Override
	public List<QnAVO> QnAList() {
		return adminDAO.QnAList();
	}

	@Override
	public List<ReviewVO> reviewList() {
		return adminDAO.reviewList();
	}

	@Override
	public List<ReviewVO> declrationReviewList() {
		return adminDAO.declrationReviewList();
	}

	@Override
	public void deleteReview(String review_no) {
		adminDAO.deleteReview(review_no);
	}

	@Override
	public void cancelReview(String review_no) {
		adminDAO.cancelReview(review_no);
	}

	@Override
	public List<UserInfoVO> userList() {
		return adminDAO.userList();
	}

	@Override
	public List<SalesVO> sales_fees() {
		return adminDAO.sales_fees();
	}

	@Override
	public List<OwnerCountVO> ownerCount() {
		return adminDAO.ownerCount();
	}

	@Override
	public List<ReservationChartVO> reservationChart() {
		return adminDAO.reservationChart();
	}

	@Override
	public List<ReviewCountVO> ownerGradeChart() {
		return adminDAO.ownerGradeChart();
	}

	@Override
	public int totalAccom() {
		return adminDAO.totalAccom();
	}

}
