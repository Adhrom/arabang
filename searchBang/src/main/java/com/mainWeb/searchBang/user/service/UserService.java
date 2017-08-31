package com.mainWeb.searchBang.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.user.model.UserInfoVO;
import com.mainWeb.searchBang.user.model.UserVO;

public interface UserService {

	// 계정 추가
	public void insertUserService(UserVO vo) throws Exception;

	//로그인
	public boolean loginUserService(String id, String pass, HttpSession session , UserInfoVO vo) throws Exception;

	// 계정 정보 가져오기
	public UserInfoVO getUserInfoService(String id, String password) throws Exception;

	// 계정 삭제
	public void deleteUserInfoService(String id, String password) throws Exception;

	// 비밀번호 변경
	public void changePasswordService(String id, String password) throws Exception;

	// 정보변경
	public void updateInfoService(String id, String password, String nickname, String phone) throws Exception;

	//숙소리스트
	public List<AccomVO> accomList(String address , String people);
	
	// 즐겨찾기 추가
	public void addFavorite(int accomNo,HttpSession session);
	
	// 즐겨찾기 리스트 보기
	public List<AccomVO> getFavoriteList(HttpSession session);
	
	// 즐겨찾기 삭제
	public void deleteFavorite(int accomNo);
}
