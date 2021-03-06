package com.mainWeb.searchBang.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.RoomVO;
import com.mainWeb.searchBang.user.dao.UserDAO;
import com.mainWeb.searchBang.user.model.ReservationVO;
import com.mainWeb.searchBang.user.model.ReviewVO;
import com.mainWeb.searchBang.user.model.UserInfoVO;
import com.mainWeb.searchBang.user.model.ViewReservation;
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
	public void insertUserService(String email, String password, String nickname, String phone) throws Exception {
		info.put("email", email);
		info.put("password", sha.getSha256(password.getBytes()));
		info.put("nickname", nickname);
		info.put("phone", phone);
		dao.insertUserDAO(info);
		info.clear();
	}

	@Override
	public boolean loginUserService(String email, String password,HttpSession session) throws Exception {
		this.setMapping(email, password);
		boolean result = dao.loginUserDAO(info);
		if(result){
			session.setAttribute("email", email);
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
	public void updateInfoService(String email, String password, String nickname, String phone) throws Exception {
		info.put("email", email);
		info.put("password", sha.getSha256(password.getBytes()));
		info.put("nickname", nickname);
		info.put("phone", phone);
		dao.updateInfo(info);
	}

	@Override
	public List<AccomVO> accomList(String address, String people) {
		info.put("accomAddress", address);
		info.put("roomUsingPeople", people);
		return dao.accomList(info);
	}

	@Override
	public List<RoomVO> roomList(String address, String people) {
		info.put("accomAddress", address);
		info.put("roomUsingPeople", people);
		return dao.roomList(info);
	}

	@Override
	public void addFavorite(int accomNo, HttpSession session) {
		String email = (String) session.getAttribute("memberEmail"); // 세션에서 email이 저장안되는듯 ...,
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

	@Override
	public void deleteFavorite(int accomNo) {
		dao.deleteFavorite(accomNo);
	}

	@Override
	public UserInfoVO getInfo(String email, String name) throws Exception {
		info.put("email", email);
		info.put("name", name);
		UserInfoVO vo =  dao.getInfo(info);
		vo.setMemberPw("");
		return vo;
	}

	public int getPoint(HttpSession session) {
		String email = (String) session.getAttribute("email");
		return dao.getPoint(email);
	}

	public void logout(HttpSession session) {
		session.invalidate();
	}

	public UserInfoVO getInfo1(HttpSession session) {
		return dao.getUserInfo((String) session.getAttribute("email"));
	}

	public void deleteUser(HttpSession session) {
		dao.deleteUser((String)session.getAttribute("email"));
	}

	@Override
	public List<AccomVO> hotdeal() {
		return dao.hotdeal();
	}

	@Override
	public List<AccomVO> accomTypeForRoomtype(String roomType) {
		return dao.accomTypeForRoomtype(roomType);
	}

	@Override
	public List<ViewReservation> viewReservation(String memberEmail) {
		return dao.viewReservation(memberEmail);
	}

	@Override
	public void cancelReservation(String reservation_no) {
		dao.cancelReservation(reservation_no);
	}

	@Override
	public List<AdminNoticeVO> noticeList() {
		return dao.noticeList();
	}

	@Override
	public List<ReviewVO> reviewList(String accom_no) {
		return dao.reviewList(accom_no);
	}
}