package com.mainWeb.searchBang.owner.dao;

import java.util.Map;

import com.mainWeb.searchBang.owner.model.OwnerVO;

public interface OwnerDAO {

	// 등록
	public void insertOwner(OwnerVO ownerVO);
	
	// ID-Check
	public int idCheckOwner(String id);
	
	// login
	public String loginOwner(Map<String, Object> map);
}
