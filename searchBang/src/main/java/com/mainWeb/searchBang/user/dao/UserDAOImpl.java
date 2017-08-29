package com.mainWeb.searchBang.user.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.user.model.UserInfoVO;
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
	public boolean loginUserDAO(UserInfoVO vo) {
		System.out.println("dao 진입 : " + vo.getMemberEmail() + " / "+ vo.getMemberPw() );
		vo = sqlsession.selectOne("user.loginuser", vo);

		System.out.println(vo.toString());

		return (vo.getMemberEmail() == null) ? false : true;
	}

	@Override
	public UserInfoVO getUserInfoDAO(Map<String, Object> info) {
		return sqlsession.selectOne("user.getUserInfo",info);
	}

	@Override
	public void deleteUserInfoDAO(Map<String, Object> info) {
		sqlsession.delete("user.deleteUserInfo", info);
	}

	@Override
	public void changePassword(Map<String, Object> info) {
		sqlsession.update("user.changePassword", info);
	}

	@Override
	public void updateInfo(Map<String, Object> info) {
		sqlsession.update("user.updateInfo", info);
	}


	@Override
	public List<AccomVO> accomList(Map<String, Object> info) {
		System.out.println(info.entrySet());
		return sqlsession.selectList("user.accomList", info);
	}


}
