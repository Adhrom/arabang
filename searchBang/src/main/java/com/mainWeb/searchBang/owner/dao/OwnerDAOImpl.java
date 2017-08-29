package com.mainWeb.searchBang.owner.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.owner.model.QnAVO;
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
		System.out.println(roomVO);
		sqlSessionTemplate.insert("owner.addedRoom",roomVO);
	}

	@Override
	public List<QnAVO> QnAList(QnAVO vo) {
		return sqlSessionTemplate.selectList("owner.QnAList",vo);
	}

	@Override
	public void QnAInsert(QnAVO vo) {
		sqlSessionTemplate.insert("owner.QnAInsert", vo);
	}

	@Override
	public OwnerVO ownerInfo(String ownerEmail) {
		return sqlSessionTemplate.selectOne("owner.ownerInfo", ownerEmail);
	}

	@Override
	public void hotdeal(AccomVO vo) {
		sqlSessionTemplate.update("owner.hotdeal" , vo);
	}

	@Override
	public void updateOwner(OwnerVO vo) {
		sqlSessionTemplate.update("owner.updateOwner", vo);
	}

	@Override
	public void deleteOwner(String ownerEmail) {
		sqlSessionTemplate.delete("owner.deleteOwner", ownerEmail);
	}

	@Override
	public List<AdminNoticeVO> noticeList() {
		return sqlSessionTemplate.selectList("owner.noticeList");
	}

	@Override
	public List<AccomVO> accomList(String loginId) {
		return sqlSessionTemplate.selectList("owner.accomList");
	}

	@Override
	public AccomVO accomInfo(String accom_no) {
		return sqlSessionTemplate.selectOne("owner.accomInfo", accom_no);
	}

	@Override
	public List<RoomVO> roomList(String accom_no) {
		return sqlSessionTemplate.selectList("owner.roomList", accom_no);
	}

	@Override
	public RoomVO roomInfo(String room_no) {
		return sqlSessionTemplate.selectOne("owner.roomInfo", room_no);
	}

	@Override
	public void deleteAccom(String accom_no) {
		sqlSessionTemplate.delete("owner.deleteAccom", accom_no);
	}

	@Override
	public void updateAccom(String accom_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteRoom(String room_no) {
		sqlSessionTemplate.delete("owner.deleteRoom", room_no);
	}

	@Override
	public void updateRoom(String room_no) {
		// TODO Auto-generated method stub

	}


}
