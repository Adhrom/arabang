package com.mainWeb.searchBang.owner.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mainWeb.searchBang.owner.dao.OwnerDAO;
import com.mainWeb.searchBang.owner.model.OwnerVO;

@Service
public class OwnerServiceImpl implements OwnerService {

	@Inject
	private OwnerDAO dao;
	
	@Override
	public void insertOwner(OwnerVO ownerVO) {
		dao.insertOwner(ownerVO);
	}
	
	public int idCheckOwner(String id){
		return dao.idCheckOwner(id);
	}

	@Override
	public String loginOwner(Map<String, Object> map) {
		return dao.loginOwner(map);
	}

}
