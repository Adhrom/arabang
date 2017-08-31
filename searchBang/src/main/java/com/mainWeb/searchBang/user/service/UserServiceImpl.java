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
	public boolean loginUserService(String id, String password,HttpSession session , UserInfoVO vo) throws Exception {
		System.out.println("service 진입 : " + id +" "+ password );
		vo.setMemberEmail(id);
		vo.setMemberPw(sha.getSha256(password.getBytes()));
		boolean result = dao.loginUserDAO(vo);
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
	public List<AccomVO> accomList(String address, String people) {
		info.put("accomAddress", address);
		info.put("roomUsingPeople", people);
		return dao.accomList(info);
	}

	@Override
	public void addFavorite(int accomNo, HttpSession session) {
		String email = (String) session.getAttribute("email");
		Map<String, Object> favorite  = new HashMap<String, Object>();
		favorite.put("accomNo", accomNo);
		favorite.put("email", email);
		dao.addFavorite(favorite);
	}

	@Override
	public List<AccomVO> getFavoriteList(HttpSession session) {
		String email = (String)session.getAttribute("email");
		return dao.getFavoriteList(email);
	}

	@Override
	public void deleteFavorite(int accomNo) {
		dao.deleteFavorite(accomNo);
	}
}