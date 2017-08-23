package com.mainWeb.searchBang.user.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;

import com.mainWeb.searchBang.user.dao.UserDAO;
import com.mainWeb.searchBang.user.model.UserVO;
import com.mainWeb.searchBang.utils.SHA256;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;
	
	SHA256 sha = SHA256.getInsatnce();
	Map<String, Object> info = new HashMap<String, Object>();                                         

	@Override
	public void insertUserService(UserVO vo) throws Exception {
		vo.setMemberPw(sha.getSha256(vo.getMemberPw().getBytes()));
		dao.insertUserDAO(vo);
	}
	
	@Override
	public UserVO getUserInfoService(String id, String password) throws Exception {
		info.put("id", id);
		info.put("password", sha.getSha256(password.getBytes()));
		return dao.getUserInfoDAO(info);
	}

	@Override
	public void deleteUserInfoService(String id, String password) throws Exception {
		info.put("id", id);
		info.put("password", sha.getSha256(password.getBytes()));
		dao.deleteUserInfoDAO(info);
	}
}