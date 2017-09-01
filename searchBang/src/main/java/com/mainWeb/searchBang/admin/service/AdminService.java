package com.mainWeb.searchBang.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.admin.model.AdminVO;
import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.owner.model.QnAVO;
import com.mainWeb.searchBang.user.model.ReviewVO;
import com.mainWeb.searchBang.user.model.UserInfoVO;

public interface AdminService {
	// 로그인
	public boolean loginCheck(AdminVO vo, HttpSession session);

	// 로그인정보
	public AdminVO viewAdmin(AdminVO vo);

	// 로그아웃
	public void logout(HttpSession session);

	// 관리자등록리스트
	public List<AdminVO> adminList();

	// 관리자등록
	public void insertAdmin(AdminVO vo);

	// 관리자삭제
	public void deleteAdmin(String adminId);

	// 공지사항등록
	public void insertNotice(AdminNoticeVO noticeVO);

	// 공지사항리스트
	public List<AdminNoticeVO> NoticeList(String noticeType);

	// 공지사항읽기
	public AdminNoticeVO noticeRead(String notice_no);

	// 공지사항삭제
	public void noticeDel(String notice_no);

	// 공지사항수정
	public void noticeUpdate(AdminNoticeVO noticeVO);

	// 오너승인리스트
	public List<OwnerVO> companyApprove();

	// 오너승인
	public void approve(String approve, OwnerVO ownerVO);

	// 오너리스트
	public List<OwnerVO> companyList();

	// QnA 리스트
	public List<QnAVO> QnAList();

	// QnA 답변달기
	public void insertReply(QnAVO vo);

	// 리뷰리스트
	public List<ReviewVO> reviewList();

	// 신고된 리뷰 리스트
	public List<ReviewVO> declrationReviewList();

	// 리뷰 삭제
	public void deleteReview(String review_no);

	// 리뷰 삭제취소
	public void cancelReview(String review_no);

	//커스토머 리스트
	public List<UserInfoVO> userList();
}
