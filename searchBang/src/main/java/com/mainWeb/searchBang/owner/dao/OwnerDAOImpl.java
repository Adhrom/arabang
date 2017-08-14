package com.mainWeb.searchBang.owner.dao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mainWeb.searchBang.owner.model.OwnerVO;

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

}
