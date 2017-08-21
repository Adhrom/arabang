package com.mainWeb.searchBang.owner.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mainWeb.searchBang.owner.dao.OwnerDAO;
import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.owner.model.RoomVO;

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

	@Override
	public void addedAccom(AccomVO accomVO) {
		if(accomVO.getOption_barbecue()==null)
			accomVO.setOption_barbecue("off");
		if(accomVO.getOption_business()==null)
			accomVO.setOption_business("off");
		if(accomVO.getOption_cleanroom()==null)
			accomVO.setOption_cleanroom("off");
		if(accomVO.getOption_couplePC()==null)
			accomVO.setOption_couplePC("off");
		if(accomVO.getOption_duplex()==null)
			accomVO.setOption_duplex("off");
		if(accomVO.getOption_freeBlackfast()==null)
			accomVO.setOption_freeBlackfast("off");
		if(accomVO.getOption_glamping()==null)
			accomVO.setOption_glamping("off");
		if(accomVO.getOption_hanok()==null)
			accomVO.setOption_hanok("off");
		if(accomVO.getOption_kitchen()==null)
			accomVO.setOption_kitchen("off");
		if(accomVO.getOption_nokids()==null)
			accomVO.setOption_nokids("off");
		if(accomVO.getOption_noPeople()==null)
			accomVO.setOption_noPeople("off");
		if(accomVO.getOption_noSmoking()==null)
			accomVO.setOption_noSmoking("off");
		if(accomVO.getOption_partyRoom()==null)
			accomVO.setOption_partyRoom("off");
		if(accomVO.getOption_pickUp()==null)
			accomVO.setOption_pickUp("off");
		if(accomVO.getOption_playGround()==null)
			accomVO.setOption_playGround("off");
		if(accomVO.getOption_seminar()==null)
			accomVO.setOption_seminar("off");
		if(accomVO.getOption_snackBar()==null)
			accomVO.setOption_snackBar("off");
		if(accomVO.getOption_spa()==null)
			accomVO.setOption_spa("off");
		if(accomVO.getOption_withAnimal()==null)
			accomVO.setOption_withAnimal("off");
		if(accomVO.getOption_womenOnly()==null)
			accomVO.setOption_womenOnly("off");
		if(accomVO.getParking_free()==null)
			accomVO.setParking_free("off");
		if(accomVO.getParking_having()==null)
			accomVO.setParking_having("no");
		if(accomVO.getParking_inCharge()==null)
			accomVO.setParking_inCharge("off");
		if(accomVO.getParking_valet()==null)
			accomVO.setParking_valet("off");
		dao.addedAccom(accomVO);
	}

	@Override
	public void addedRoom(RoomVO roomVO) {
		dao.addedRoom(roomVO);
	}

}
