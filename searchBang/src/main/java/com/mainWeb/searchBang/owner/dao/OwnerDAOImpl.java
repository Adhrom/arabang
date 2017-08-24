package com.mainWeb.searchBang.owner.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.owner.model.RoomVO;

@Repository
public class OwnerDAOImpl implements OwnerDAO {

	@Inject
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertOwner(OwnerVO ownerVO) {
		sqlSessionTemplate.insert("owner.insertOwner",ownerVO);
	}

	@Override
	public int idCheckOwner(String id) {
		return sqlSessionTemplate.selectOne("owner.idCheckOwner", id);
	}

	@Override
	public String loginOwner(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("owner.loginOwner", map);
	}

	@Override
	public void addedAccom(AccomVO accomVO) {
		sqlSessionTemplate.insert("owner.addedAccom", accomVO);
	}

	@Override
	public void addedRoom(RoomVO roomVO) {
		sqlSessionTemplate.insert("owner.addedRoom",roomVO);
	}

	@Override
	public List<AdminNoticeVO> noticeList() {
		return sqlSessionTemplate.selectList("owner.noticeList");
	}

	@Override
	public List<AccomVO> accomList(String loginId) {
		return sqlSessionTemplate.selectList("owner.accomList",loginId);
	}

	@Override
	public AccomVO accomInfo(String accom_no) {
		return sqlSessionTemplate.selectOne("owner.accomInfo", accom_no);
	}

	@Override
	public List<RoomVO> roomList(String accom_no) {
		return sqlSessionTemplate.selectList("owner.roomList" , accom_no);
	}

	@Override
	public RoomVO roomInfo(String room_no) {
		return sqlSessionTemplate.selectOne("owner.roomInfo" , room_no);
	}

	@Override
	public void deleteAccom(String accom_no) {
		sqlSessionTemplate.delete("owner.deleteAccom",accom_no);
	}

	@Override
	public void updateAccom(String accom_no) {
		sqlSessionTemplate.update("owner.updateAccom",accom_no);
	}

	@Override
	public void deleteRoom(String room_no) {
		sqlSessionTemplate.delete("owner.deleteRoom",room_no);
	}

	@Override
	public void updateRoom(String room_no) {
		sqlSessionTemplate.update("owner.updateRoom",room_no);
	}

}
