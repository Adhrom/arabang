package com.mainWeb.searchBang.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.RoomVO;
import com.mainWeb.searchBang.user.dao.UserDAO;
import com.mainWeb.searchBang.user.model.ReservationVO;
import com.mainWeb.searchBang.user.model.ReviewVO;
import com.mainWeb.searchBang.user.model.UserInfoVO;
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
	public void insertUserService(UserInfoVO vo) throws Exception {
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
			session.setAttribute("email", id);
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
	public void doReservation(ReservationVO vo, String point ,String memberEmail) {
		info.put("point", point);
		info.put("memberEmail", memberEmail);
		vo.setMemberEmail(memberEmail);
		dao.doReservation(vo, info);
	}

	@Override
	public void insertReview(ReviewVO vo) {
		dao.insertReview(vo);
	}

	@Override
	public AccomVO accomInfo(String accom_no) {
		return dao.accomInfo(accom_no);
	}

	@Override
	public List<RoomVO> roomInfo(String accom_no) {
		return dao.roomInfo(accom_no);
	}

	@Override
	public UserInfoVO getUserInfo(String memberEmail) {
		return dao.getUserInfo(memberEmail);
	}

	@Override
	public RoomVO roomInfoForReservation(String room_no) {
		return dao.roomInfoForReservation(room_no);
	}

	@Override
	public AccomVO accomInfoForReservation(String room_no) {
		return dao.accomInfoForReservation(room_no);
	}

}