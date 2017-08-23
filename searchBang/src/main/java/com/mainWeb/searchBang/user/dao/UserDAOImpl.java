package com.mainWeb.searchBang.user.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mainWeb.searchBang.user.model.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession sqlsession;

	@Override
	public void insertUserDAO(UserVO vo) {
		sqlsession.insert("user.insertUser",vo);
	}

	@Override
	public UserVO getUserInfoDAO(Map<String, Object> info) {
		return sqlsession.selectOne("user.getUserInfo",info);
	}

	@Override
	public void deleteUserInfoDAO(Map<String, Object> info) {
		sqlsession.delete("user.deleteUserInfo", info);
	}
}
