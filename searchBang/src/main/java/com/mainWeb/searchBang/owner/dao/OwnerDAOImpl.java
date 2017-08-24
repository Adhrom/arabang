package com.mainWeb.searchBang.owner.dao;

import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
		System.out.println(roomVO);
		sqlSessionTemplate.insert("owner.addedRoom",roomVO);
	}

}
