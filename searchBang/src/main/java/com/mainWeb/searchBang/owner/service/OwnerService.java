package com.mainWeb.searchBang.owner.service;

import java.util.Map;

import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.OwnerVO;

public interface OwnerService {

	// 등록
	public void insertOwner(OwnerVO ownerVO);

	// 아이디 체크
	public int idCheckOwner(String id);

	// 로그인 처리
	public String loginOwner(Map<String, Object> map);

	// 숙소등록
	public void addedAccom(AccomVO accomVO);
}
