package com.mainWeb.searchBang.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.user.model.ReservationVO;
import com.mainWeb.searchBang.user.model.ReviewVO;
import com.mainWeb.searchBang.owner.model.RoomVO;
import com.mainWeb.searchBang.user.model.UserInfoVO;
import com.mainWeb.searchBang.user.model.ViewReservation;

public interface UserService {

	// 계정 추가
	public void insertUserService(String email, String password, String nickname, String phone) throws Exception;

	// 로그인
	public boolean loginUserService(String id, String pass, HttpSession session) throws Exception;

	// 계정 정보 가져오기
	public UserInfoVO getUserInfoService(String id, String password) throws Exception;

	// 계정 삭제
	public void deleteUserInfoService(String id, String password) throws Exception;

	// 비밀번호 변경
	public void changePasswordService(String id, String password) throws Exception;

	// 정보변경
	public void updateInfoService(String email, String password, String nickname, String phone) throws Exception;

	// 숙소리스트
	public List<AccomVO> accomList(String address, String people);

	// 방리스트
	public List<RoomVO> roomList(String address, String people);

	// 즐겨찾기 추가
	public void addFavorite(int accomNo, HttpSession session);

	// 즐겨찾기 리스트 보기
	public List<AccomVO> getFavoriteList(HttpSession session);

	// 즐겨찾기 삭제
	public void deleteFavorite(int accomNo);

	// 수정용 계정정보 가져오기
	public UserInfoVO getInfo(String email, String name) throws Exception;

	// 예약하기
	public void doReservation(ReservationVO vo, String point, String memberEmail);

	// 리뷰등록
	public void insertReview(ReviewVO vo);

	// 숙소정보 불러오기
	public AccomVO accomInfo(String accom_no);

	// 방 정보 불러오기
	public List<RoomVO> roomInfo(String accom_no);

	// 유저정보불러오기
	public UserInfoVO getUserInfo(String memberEmail);

	// 예약->방정보 가져오기
	public RoomVO roomInfoForReservation(String room_no);

	// 예약->숙소정보 가져오기
	public AccomVO accomInfoForReservation(String room_no);

	// 포인트 가져오기
	public int getPoint(HttpSession session);

	// 로그아웃
	public void logout(HttpSession session);

	// 세션으로 정보조회하기.
	public UserInfoVO getInfo1(HttpSession session);

	// 계정탈퇴
	public void deleteUser(HttpSession session);

	// 핫딜 리스트
	public List<AccomVO> hotdeal();

	// 타입으로 검색
	public List<AccomVO> accomTypeForRoomtype(String roomType);

	// 예약내역 끌어오기
	public List<ViewReservation> viewReservation(String memberEmail);

	// 예약취소
	public void cancelReservation(String reservation_no);

	// 공지사항 리스트
	public List<AdminNoticeVO> noticeList();

	// 리뷰 리스트
	public List<ReviewVO> reviewList(String accom_no);
}
