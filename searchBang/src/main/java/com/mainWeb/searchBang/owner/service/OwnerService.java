package com.mainWeb.searchBang.owner.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.owner.model.QnAVO;
import com.mainWeb.searchBang.owner.model.RoomVO;

public interface OwnerService {

	// 등록
	public void insertOwner(OwnerVO ownerVO);

	// 아이디 체크
	public int idCheckOwner(String id);

	// 로그인 처리
	public String loginOwner(Map<String, Object> map);

	// 로그아웃
	public void logout(HttpSession session);

	// 숙소등록
	public void addedAccom(AccomVO accomVO);

	// 방등록
	public void addedRoom(RoomVO roomVO, HttpSession session);

	// 공지사항 리스트
	public List<AdminNoticeVO> noticeList();

	// 숙소관리 리스트
	public List<AccomVO> accomList(String loginId);

	// 숙소인포
	public AccomVO accomInfo(String accom_no);

	// 방 관리 리스트
	public List<RoomVO> roomList(String accom_no);

	// 방인포
	public RoomVO roomInfo(String room_no);

	// 숙소삭제
	public void deleteAccom(String accom_no);

	// 숙소 수정
	public void updateAccom(String accom_no);

	// 방 삭제
	public void deleteRoom(String room_no);

	// 방 수정
	public void updateRoom(String room_no);

	// QnA리스트
	public List<QnAVO> QnAList(QnAVO vo);
	
	// QnA등록
	public void QnAInsert(QnAVO vo);

	// 회원정보
	public OwnerVO ownerInfo(String ownerEmail);

	//핫딜 온오프
	public void hotdeal(AccomVO vo);

	//오너업데이트
	public void updateOwner(OwnerVO vo);

	//오너 삭제
	public void deleteOwner(String ownerEmail);
}
