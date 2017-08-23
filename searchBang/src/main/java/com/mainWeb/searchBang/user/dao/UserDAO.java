package com.mainWeb.searchBang.user.dao;

import java.util.Map;

import com.mainWeb.searchBang.user.model.UserVO;

public interface UserDAO {

	// 계정 등록
	public void insertUserDAO(UserVO vo);
	
	// 계정 가져오기
	public UserVO getUserInfoDAO(Map<String, Object> info);
	
	// 계정 수정
	
	// 계정 삭제
	public void deleteUserInfoDAO(Map<String, Object> info);
}
