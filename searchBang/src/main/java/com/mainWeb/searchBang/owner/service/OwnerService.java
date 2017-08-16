package com.mainWeb.searchBang.owner.service;

import com.mainWeb.searchBang.owner.model.OwnerVO;

public interface OwnerService {

	// 등록
	public void insertOwner(OwnerVO ownerVO);
	
	// 아이디 체크
	public int idCheckOwner(String id);
}
