package com.mainWeb.searchBang.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.user.dao.UserDAO;
import com.mainWeb.searchBang.user.model.UserInfoVO;
import com.mainWeb.searchBang.user.model.UserVO;
import com.mainWeb.searchBang.utils.SHA256;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;
	
	SHA256 sha = SHA256.getInsatnce();
	Map<String, Object> info = new HashMap<String, Object>();
	public void setMapping(String id, String password) throws Exception{
		info.clear();
		info.put("id", id);
		info.put("password", sha.getSha256(password.getBytes()));
	}

	@Override
	public void insertUserService(UserVO vo) throws Exception {
		vo.setMemberPw(sha.getSha256(vo.getMemberPw().getBytes()));
		dao.insertUserDAO(vo);
	}
	
	@Override
	public boolean loginUserService(String id, String password,HttpSession session) throws Exception {
		System.out.println("service 진입 : " + id +" "+ password );
		setMapping(id, password);
		boolean result = dao.loginUserDAO(info);
		if(result){
			session.setAttribute("id", id);
			session.setAttribute("loginresult", "success");
		}
		return result;
	}
	
	@Override
	public UserInfoVO getUserInfoService(String id, String password) throws Exception {
		setMapping(id, password);
		return dao.getUserInfoDAO(this.info);
	}

	@Override
	public void deleteUserInfoService(String id, String password) throws Exception {
		setMapping(id, password);
		dao.deleteUserInfoDAO(info);
	}

	@Override
	public void changePasswordService(String id, String password) throws Exception {
		setMapping(id, password);
		dao.changePassword(info);
	}

	@Override
	public void updateInfoService(String id, String password, String nickname, String phone) throws Exception {
		info.put("memberEmail", id);
		info.put("memberPw", sha.getSha256(password.getBytes()));
		info.put("memberNickname", nickname);
		info.put("memberPhone", phone);
		dao.updateInfo(info);
	}

	@Override
	public List<AccomVO> accomListService(String dong) {
		return dao.accomList("%"+dong+"%");
	}
}