package com.mainWeb.searchBang.user.dao;

import java.util.List;
import java.util.Map;

import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.user.model.ReservationVO;
import com.mainWeb.searchBang.user.model.ReviewVO;
import com.mainWeb.searchBang.user.model.UserInfoVO;

public interface UserDAO {

	// 계정 등록
	public void insertUserDAO(UserInfoVO vo);

	// 로그인 처리
	public boolean loginUserDAO(UserInfoVO vo);

	// 계정 가져오기
	public UserInfoVO getUserInfoDAO(Map<String, Object> info);

	// 계정 삭제
	public void deleteUserInfoDAO(Map<String, Object> info);

	// 비밀번호 변경
	public void changePassword(Map<String, Object> info);

	// 정보수정
	public void updateInfo(Map<String, Object> info);

	// 숙소리스트
	public List<AccomVO> accomList(Map<String, Object> info);

	// 예약하기
	public void doReservation(ReservationVO vo, Map<String, Object> info);

	// 예약인터셉터
	public boolean reservationInterceptor(int room_no, Map<String, Object> info);

	// 리뷰등록
	public void insertReview(ReviewVO vo);
}
