package com.mainWeb.searchBang.user.service;

import com.mainWeb.searchBang.user.model.UserVO;

public interface UserService {
	
	// 계정 추가
	public void insertUserService(UserVO vo) throws Exception;
	
	// 계정 정보 가져오기
	public UserVO getUserInfoService(String id, String password) throws Exception;
	
	// 계정 수정
	
	// 계정 삭제
	public void deleteUserInfoService(String id, String password) throws Exception;
}
