package com.mainWeb.searchBang.owner.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.owner.dao.OwnerDAO;
import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.owner.model.QnAVO;
import com.mainWeb.searchBang.owner.model.ReviewCountVO;
import com.mainWeb.searchBang.owner.model.RoomVO;
import com.mainWeb.searchBang.owner.model.SalesVO;
import com.mainWeb.searchBang.owner.model.WeekSalesVO;
import com.mainWeb.searchBang.user.model.ReviewVO;

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
		if(accomVO.getParking_valet()==null)
			accomVO.setParking_valet("off");
		if(accomVO.getParking_free()==null)
			accomVO.setParking_free("off");
		if(accomVO.getAccomimg1()==null)
			accomVO.setAccomimg1("null");
		if(accomVO.getAccomimg2()==null)
			accomVO.setAccomimg2("null");
		if(accomVO.getAccomimg3()==null)
			accomVO.setAccomimg3("null");
		if(accomVO.getAccomimg4()==null)
			accomVO.setAccomimg4("null");
		if(accomVO.getAccomimg5()==null)
			accomVO.setAccomimg5("null");
		if(accomVO.getAccomimg6()==null)
			accomVO.setAccomimg6("null");
		if(accomVO.getAccomimg7()==null)
			accomVO.setAccomimg7("null");
		if(accomVO.getAccomimg8()==null)
			accomVO.setAccomimg8("null");
		if(accomVO.getAccomimg9()==null)
			accomVO.setAccomimg9("null");
		dao.addedAccom(accomVO);
	}

	@Override
	public void addedRoom(RoomVO roomVO , HttpSession session) {
		if(roomVO.getRoomimg1()==null)
			roomVO.setRoomimg1("null");
		if(roomVO.getRoomimg2()==null)
			roomVO.setRoomimg2("null");
		if(roomVO.getRoomimg3()==null)
			roomVO.setRoomimg3("null");
		if(roomVO.getRoomimg4()==null)
			roomVO.setRoomimg4("null");
		if(roomVO.getRoomimg5()==null)
			roomVO.setRoomimg5("null");
		if(roomVO.getRoomimg6()==null)
			roomVO.setRoomimg6("null");
		if(roomVO.getRoomimg7()==null)
			roomVO.setRoomimg7("null");
		if(roomVO.getRoomimg8()==null)
			roomVO.setRoomimg8("null");
		if(roomVO.getRoomimg9()==null)
			roomVO.setRoomimg9("null");
		roomVO.setAccom_no(Integer.parseInt((String) session.getAttribute("accom_no")));
		dao.addedRoom(roomVO);
	}



	@Override
	public List<AdminNoticeVO> noticeList() {
		return dao.noticeList();
	}

	@Override
	public List<AccomVO> accomList(String loginId) {
		return dao.accomList(loginId);
	}

	@Override
	public AccomVO accomInfo(String accom_no) {
		return dao.accomInfo(accom_no);
	}

	@Override
	public List<RoomVO> roomList(String accom_no) {
		return dao.roomList(accom_no);
	}

	@Override
	public RoomVO roomInfo(String room_no) {
		return dao.roomInfo(room_no);
	}

	@Override
	public void deleteAccom(String accom_no) {
		dao.deleteAccom(accom_no);
	}

	@Override
	public void updateAccom(AccomVO accomVO) {
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
		if(accomVO.getParking_valet()==null)
			accomVO.setParking_valet("off");
		if(accomVO.getParking_free()==null)
			accomVO.setParking_free("off");
		if(accomVO.getAccomimg1()==null)
			accomVO.setAccomimg1("null");
		if(accomVO.getAccomimg2()==null)
			accomVO.setAccomimg2("null");
		if(accomVO.getAccomimg3()==null)
			accomVO.setAccomimg3("null");
		if(accomVO.getAccomimg4()==null)
			accomVO.setAccomimg4("null");
		if(accomVO.getAccomimg5()==null)
			accomVO.setAccomimg5("null");
		if(accomVO.getAccomimg6()==null)
			accomVO.setAccomimg6("null");
		if(accomVO.getAccomimg7()==null)
			accomVO.setAccomimg7("null");
		if(accomVO.getAccomimg8()==null)
			accomVO.setAccomimg8("null");
		if(accomVO.getAccomimg9()==null)
			accomVO.setAccomimg9("null");

		dao.updateAccom(accomVO);
	}

	@Override
	public void deleteRoom(String room_no) {
		dao.deleteRoom(room_no);
	}

	@Override
	public void updateRoom(RoomVO roomVO) {
		if(roomVO.getRoomimg1()==null)
			roomVO.setRoomimg1("null");
		if(roomVO.getRoomimg2()==null)
			roomVO.setRoomimg2("null");
		if(roomVO.getRoomimg3()==null)
			roomVO.setRoomimg3("null");
		if(roomVO.getRoomimg4()==null)
			roomVO.setRoomimg4("null");
		if(roomVO.getRoomimg5()==null)
			roomVO.setRoomimg5("null");
		if(roomVO.getRoomimg6()==null)
			roomVO.setRoomimg6("null");
		if(roomVO.getRoomimg7()==null)
			roomVO.setRoomimg7("null");
		if(roomVO.getRoomimg8()==null)
			roomVO.setRoomimg8("null");
		if(roomVO.getRoomimg9()==null)
			roomVO.setRoomimg9("null");
		dao.updateRoom(roomVO);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public List<QnAVO> QnAList(QnAVO vo) {
		return dao.QnAList(vo);
	}

	@Override
	public void QnAInsert(QnAVO vo) {
		dao.QnAInsert(vo);
	}

	@Override
	public OwnerVO ownerInfo(String ownerEmail) {
		return dao.ownerInfo(ownerEmail);
	}

	@Override
	public void hotdeal(AccomVO vo) {
		dao.hotdeal(vo);
	}

	@Override
	public void updateOwner(OwnerVO vo) {
		dao.updateOwner(vo);
	}

	@Override
	public void deleteOwner(String ownerEmail) {
		dao.deleteOwner(ownerEmail);
	}

	@Override
	public List<ReviewVO> reviewList(String accom_no) {
		return dao.reviewList(accom_no);
	}

	@Override
	public void reviewDeclration(String review_no) {
		dao.reviewDeclration(review_no);
	}

	@Override
	public List<SalesVO> sales(String accom_no) {
		return dao.sales(accom_no);
	}

	@Override
	public List<WeekSalesVO> weekSales(String accom_no) {
		return dao.weekSales(accom_no);
	}

	@Override
	public int todayCount(String accom_no) {
		return dao.todayCount(accom_no);
	}

	@Override
	public List<ReviewCountVO> reviewGrade(String accom_no) {
		return dao.reviewGrade(accom_no);
	}


}
