package com.mainWeb.searchBang.owner.dao;

import java.util.List;
import java.util.Map;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.owner.model.QnAVO;
import com.mainWeb.searchBang.owner.model.RoomVO;
import com.mainWeb.searchBang.owner.model.SalesVO;
import com.mainWeb.searchBang.user.model.ReviewVO;

public interface OwnerDAO {

	// 등록
	public void insertOwner(OwnerVO ownerVO);

	// ID-Check
	public int idCheckOwner(String id);

	// login
	public String loginOwner(Map<String, Object> map);

	// 숙소등록
	public void addedAccom(AccomVO accomVO);

	// 방등록
	public void addedRoom(RoomVO roomVO);

	// 공지사항 리스트
	public List<AdminNoticeVO> noticeList();

	// 숙소관리 리스트
	public List<AccomVO> accomList(String loginId);

	// 숙소정보 불러오기
	public AccomVO accomInfo(String accom_no);

	// 방 관리 리스트
	public List<RoomVO> roomList(String accom_no);

	// 방정보 불러오기
	public RoomVO roomInfo(String room_no);

	// 숙소삭제
	public void deleteAccom(String accom_no);

	// 숙소 수정
	public void updateAccom(AccomVO accomVO);

	// 방 삭제
	public void deleteRoom(String room_no);

	// 방 수정
	public void updateRoom(RoomVO roomVO);

	// QnA리스트
	public List<QnAVO> QnAList(QnAVO vo);

	// QnA등록
	public void QnAInsert(QnAVO vo);

	// 회원정보
	public OwnerVO ownerInfo(String ownerEmail);

	// 핫딜 온오프
	public void hotdeal(AccomVO vo);

	// 오너업데이트
	public void updateOwner(OwnerVO vo);

	// 오너 삭제
	public void deleteOwner(String ownerEmail);

	// 리뷰 리스트
	public List<ReviewVO> reviewList(String accom_no);

	// 리뷰 신고하기
	public void reviewDeclration(String review_no);

	// 매출통계
	public List<SalesVO> sales(String accom_no);

}
