package com.mainWeb.searchBang.owner.dao;

import java.util.Map;

import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.owner.model.RoomVO;

public interface OwnerDAO {

	// 등록
	public void insertOwner(OwnerVO ownerVO);

	// ID-Check
	public int idCheckOwner(String id);

	// login
	public String loginOwner(Map<String, Object> map);

	// 숙소등록
	public void addedAccom(AccomVO accomVO);

	// 방등록
	public void addedRoom(RoomVO roomVO);
}
