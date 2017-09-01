package com.mainWeb.searchBang.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.user.model.ReservationVO;
import com.mainWeb.searchBang.user.model.ReviewVO;
import com.mainWeb.searchBang.owner.model.RoomVO;
import com.mainWeb.searchBang.user.model.UserInfoVO;

public interface UserService {

	// 계정 추가
	public void insertUserService(UserInfoVO vo) throws Exception;

	//로그인
	public boolean loginUserService(String id, String pass, HttpSession session , UserInfoVO vo) throws Exception;

	// 계정 정보 가져오기
	public UserInfoVO getUserInfoService(String id, String password) throws Exception;

	// 계정 삭제
	public void deleteUserInfoService(String id, String password) throws Exception;

	// 비밀번호 변경
	public void changePasswordService(String id, String password) throws Exception;

	// 정보변경
	public void updateInfoService(String email, String password, String nickname, String phone) throws Exception;

	//숙소리스트
	public List<AccomVO> accomList(String address , String people);
	
	//방리스트
	public List<RoomVO> roomList(String address , String people);
	
	// 즐겨찾기 추가
	public void addFavorite(int accomNo,HttpSession session);
	
	// 즐겨찾기 리스트 보기
	public List<AccomVO> getFavoriteList(HttpSession session);
	
	// 즐겨찾기 삭제
	public void deleteFavorite(int accomNo);
	
	// 수정용 계정정보 가져오기
	public UserInfoVO getInfo(String email, String name) throws Exception;

	//예약하기
	public void doReservation(ReservationVO vo , String point , String memberEmail);

	//리뷰등록
	public void insertReview(ReviewVO vo);

	// 숙소정보 불러오기
	public AccomVO accomInfo(String accom_no);

	// 방 정보 불러오기
	public List<RoomVO> roomInfo(String accom_no);
	
}
