package com.mainWeb.searchBang.user.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.RoomVO;
import com.mainWeb.searchBang.user.model.ReservationVO;
import com.mainWeb.searchBang.user.model.ReviewVO;
import com.mainWeb.searchBang.user.model.UserInfoVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlsession;

	@Override
	public void insertUserDAO(UserInfoVO vo) {
		sqlsession.insert("user.insertUser", vo);
	}

	@Override
	public boolean loginUserDAO(UserInfoVO vo) {
		System.out.println("dao 진입 : " + vo.getMemberEmail() + " / " + vo.getMemberPw());
		vo = sqlsession.selectOne("user.loginuser", vo);

		System.out.println(vo.toString());

		return (vo.getMemberEmail() == null) ? false : true;
	}

	@Override
	public UserInfoVO getUserInfoDAO(Map<String, Object> info) {
		return sqlsession.selectOne("user.getUserInfo", info);
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
		return sqlsession.selectList("user.accomList", info);
	}

	@Override
	public AccomVO accomInfo(String accom_no) {
		return sqlsession.selectOne("user.accomInfo", accom_no);
	}

	@Override
	public List<RoomVO> roomInfo(String accom_no) {
		return sqlsession.selectList("user.roomInfoList", accom_no);
	}

	@Override
	public void doReservation(ReservationVO vo, Map<String, Object> info) {
		sqlsession.insert("user.doReservation", vo);

		// sqlsession.update("user.pointUpdate", info);
	}

	@Override
	public boolean reservationInterceptor(int room_no, Map<String, Object> info) {
		int roomCount = sqlsession.selectOne("user.roomCount", room_no);
		int reservationCount = sqlsession.selectOne("user.reservationCount", info);
		if (roomCount > reservationCount)
			return true;
		else
			return false;
	}

	@Override
	public void insertReview(ReviewVO vo) {
		sqlsession.insert("user.insertReview", vo);
	}

	@Override
	public UserInfoVO getUserInfo(String memberEmail) {
		return sqlsession.selectOne("user.getUserInfo", memberEmail);
	}

	@Override
	public RoomVO roomInfoForReservation(String room_no) {
		return sqlsession.selectOne("user.roomInfoForReservation", room_no);
	}

	@Override
	public AccomVO accomInfoForReservation(String room_no) {
		return sqlsession.selectOne("user.accomInfoForReservation", room_no);
	}
}
