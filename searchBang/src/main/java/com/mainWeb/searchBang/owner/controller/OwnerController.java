package com.mainWeb.searchBang.owner.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.admin.service.AdminService;
import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.owner.model.QnAVO;
import com.mainWeb.searchBang.owner.model.ReviewCountVO;
import com.mainWeb.searchBang.owner.model.RoomVO;
import com.mainWeb.searchBang.owner.model.SalesVO;
import com.mainWeb.searchBang.owner.model.WeekSalesVO;
import com.mainWeb.searchBang.owner.service.OwnerService;
import com.mainWeb.searchBang.user.model.ReviewVO;
import com.mainWeb.searchBang.utils.CharMix;
import com.mainWeb.searchBang.utils.Mail;
import com.mainWeb.searchBang.utils.SHA256;

@Controller
public class OwnerController {

	@Inject
	private OwnerService service;
	@Inject
	AdminService adminService;
	// 암호화 객체 할당
	SHA256 sha = SHA256.getInsatnce();

	// 오너 인덱스
	@RequestMapping("/index.owner")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		List<AdminNoticeVO> list = service.noticeList();
		mv.addObject("list", list);
		mv.setViewName("index");
		return mv;
	}

	// 회원가입 화면
	@RequestMapping("/newCompanyJoin.owner")
	public String companyjoin() {
		return "newCompanyJoin";
	}

	@RequestMapping("/ownerReg1.owner")
	public String onwer_join1() {
		return "ownerReg1";
	}

	@RequestMapping("/ownerReg2.owner")
	public String onwer_join2() {
		return "ownerReg2";
	}

	@RequestMapping("/ownerReg3.owner")
	public String onwer_join3() {
		return "ownerReg3";
	}

	// 로그인 화면
	@RequestMapping("/ownerLogin.owner")
	public String owner_login() {
		return "login";
	}

	// 로그인 처리
	@RequestMapping(value = "/loginProc.owner", method = RequestMethod.POST)
	public ModelAndView loginCheck(@RequestParam("loginEmail") String id, @RequestParam("loginPass") String pass,
			HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		String cryptPass = sha.getSha256(pass.getBytes());

		map.put("id", id);
		map.put("pass", cryptPass);

		ModelAndView mv = new ModelAndView();
		try {
			if (service.loginOwner(map).equals("y")) {
				session.setAttribute("loginId", id);
				// 관리자 승인OK
			}

			else if (service.loginOwner(map).equals("n")) {
				session.setAttribute("msg", "notYet");
				// 관리자승인 아직.
			}

			else if (service.loginOwner(map).equals("c")) {
				session.setAttribute("msg", "no");
				// 관리자 승인 거절.
			}
		} catch (NullPointerException e) {
			session.setAttribute("msg", "failure");
		}
		mv.setViewName("redirect:index.owner");
		return mv;
	}

	// 컨트롤러 단에서 정보를 입력하는 단계..?
	@RequestMapping("/insertOwner.owner")
	public String insertOwner(@ModelAttribute OwnerVO ownerVO) throws Exception {

		// 바인딩해서 받은 vo객체의 pw만 get해서 암호화된 문자열로 변환
		String cryptStr = sha.getSha256(ownerVO.getOwnerPw().getBytes());
		// setters 이용
		ownerVO.setOwnerPw(cryptStr);

		service.insertOwner(ownerVO);

		return "ownerReg3";
	}

	// 실시간 아이디 체크(?)
	@RequestMapping(value = "/checkId.owner")
	public @ResponseBody String idCheckOwner(@RequestParam("idfield") String email) {
		return String.valueOf(service.idCheckOwner(email));
	}

	// 버튼클릭시, 이메일로 인증번호를 보내는 ,,(?)
	@RequestMapping(value = "/getCertificationNum.owner")
	public @ResponseBody String CharMixxing(@RequestParam("idfield") String address)
			throws AddressException, MessagingException {

		String message = CharMix.getInstance().makeMessage();

		new Mail(address, message); // Mail클래스가 메일전송을 대신하게,

		return message;
	}

	// 로그아웃
	@RequestMapping("/logout.owner")
	public String logout(HttpSession session) {
		service.logout(session);
		return "redirect:index.owner";
	}

	// 숙소관리
	@RequestMapping("/accomManagement.owner")
	public ModelAndView accomManagement(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession(false);
		String loginId = (String) session.getAttribute("loginId");
		List<AccomVO> list = service.accomList(loginId);
		mv.addObject("size", list.size());
		mv.addObject("list", list);
		mv.setViewName("accomManagement");
		return mv;
	}

	// 숙소추가페이지
	@RequestMapping("/addedAccom.owner")
	public ModelAndView addedAccom(@RequestParam(value = "accom_no", required = false) String accom_no) {
		ModelAndView mv = new ModelAndView();
		try {
			if (accom_no.length() != 0) {
				AccomVO vo = service.accomInfo(accom_no);
				mv.addObject("vo", vo);
			}
		} catch (Exception e) {
		}
		mv.setViewName("addedAccom");
		return mv;
	}

	// 숙소추가
	@RequestMapping(value = "/insertAccom.owner", method = RequestMethod.POST)
	public String insertAccom(@ModelAttribute AccomVO accomVO, MultipartHttpServletRequest req)
			throws IllegalStateException, IOException {

		HttpSession session = req.getSession(false);
		List<MultipartFile> files = accomVO.getUploadFile(); // MultipartFile타입의
																// 리스트
		String fileName[] = new String[files.size()]; // 파일 이름을 닮을 배열
		String root_path = session.getServletContext().getRealPath("/"); // 루트
																			// 경로
		String real_path = "img/owner/Accom/"; // 상대경로
		String path = root_path + real_path; // 전체경로\
		File Dir = new File(path); // 폴더가 없으면 만들기 위해서
		if (!Dir.exists())
			Dir.mkdirs();
		if (!files.isEmpty()) // 업로드파일이 비어 있지 않다면
		{
			for (int i = 0; i < files.size(); i++) {
				UUID uuid = UUID.randomUUID();
				fileName[i] = files.get(i).getOriginalFilename();
				String saveName = uuid.toString() + "_" + fileName[i];
				files.get(i).transferTo(new File(path + saveName));
				if (i == 0)
					accomVO.setAccomimg1("/searchBang/" + real_path + saveName);
				if (i == 1)
					accomVO.setAccomimg2("/searchBang/" + real_path + saveName);
				if (i == 2)
					accomVO.setAccomimg3("/searchBang/" + real_path + saveName);
				if (i == 3)
					accomVO.setAccomimg4("/searchBang/" + real_path + saveName);
				if (i == 4)
					accomVO.setAccomimg5("/searchBang/" + real_path + saveName);
				if (i == 5)
					accomVO.setAccomimg6("/searchBang/" + real_path + saveName);
				if (i == 6)
					accomVO.setAccomimg7("/searchBang/" + real_path + saveName);
				if (i == 7)
					accomVO.setAccomimg8("/searchBang/" + real_path + saveName);
				if (i == 8)
					accomVO.setAccomimg9("/searchBang/" + real_path + saveName);
			}
		}
		accomVO.setOwnerEmail((String) session.getAttribute("loginId"));
		service.addedAccom(accomVO);
		return "redirect:accomManagement.owner";
	}

	// 숙소수정
	@RequestMapping(value = "/updateAccom.owner", method = RequestMethod.POST)
	public String updateAccom(@ModelAttribute AccomVO accomVO, MultipartHttpServletRequest req)
			throws IllegalStateException, IOException {

		HttpSession session = req.getSession(false);
		List<MultipartFile> files = accomVO.getUploadFile(); // MultipartFile타입의
																// 리스트
		String fileName[] = new String[files.size()]; // 파일 이름을 닮을 배열

		String root_path = session.getServletContext().getRealPath("/"); // 루트
		// 경로

		String real_path = "img/owner/Accom/"; // 상대경로
		String path = root_path + real_path; // 전체경로\
		File Dir = new File(path); // 폴더가 없으면 만들기 위해서
		if (!Dir.exists())
			Dir.mkdirs();

		if (!files.isEmpty()) // 업로드파일이 비어 있지 않다면
		{
			for (int i = 0; i < files.size(); i++) {
				UUID uuid = UUID.randomUUID();
				fileName[i] = files.get(i).getOriginalFilename();
				String saveName = uuid.toString() + "_" + fileName[i];

				files.get(i).transferTo(new File(path + saveName));
				if (i == 0)
					accomVO.setAccomimg1("/searchBang/" + real_path + saveName);
				if (i == 1)
					accomVO.setAccomimg2("/searchBang/" + real_path + saveName);
				if (i == 2)
					accomVO.setAccomimg3("/searchBang/" + real_path + saveName);
				if (i == 3)
					accomVO.setAccomimg4("/searchBang/" + real_path + saveName);
				if (i == 4)
					accomVO.setAccomimg5("/searchBang/" + real_path + saveName);
				if (i == 5)
					accomVO.setAccomimg6("/searchBang/" + real_path + saveName);
				if (i == 6)
					accomVO.setAccomimg7("/searchBang/" + real_path + saveName);
				if (i == 7)
					accomVO.setAccomimg8("/searchBang/" + real_path + saveName);
				if (i == 8)
					accomVO.setAccomimg9("/searchBang/" + real_path + saveName);
			}
		}
		accomVO.setOwnerEmail((String) session.getAttribute("loginId"));

		service.updateAccom(accomVO);

		return "redirect:accomManagement.owner";
	}

	// 숙소삭제
	@RequestMapping("/deleteAccom.owner")
	public String deleteAccom(@RequestParam(value = "accom_no", required = true) String accom_no) {
		service.deleteAccom(accom_no);
		return "redirect:accomManagement.owner";
	}

	// 방관리
	@RequestMapping("/roomManagement.owner")
	public ModelAndView roomManagement(@RequestParam(value = "accom_no", required = false) String accom_no,
			HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.setAttribute("accom_no", accom_no);
		ModelAndView mv = new ModelAndView();
		List<RoomVO> list = service.roomList(accom_no);
		mv.addObject("size", list.size());
		mv.addObject("list", list);
		mv.setViewName("roomManagement");
		return mv;
	}

	// 방추가페이지
	@RequestMapping("/addedRoom.owner")
	public ModelAndView addedRoom(@RequestParam(value = "room_no", required = false) String room_no) {
		ModelAndView mv = new ModelAndView();
		try {
			if (room_no.length() != 0) {
				RoomVO vo = service.roomInfo(room_no);
				mv.addObject("vo", vo);
			}
		} catch (Exception e) {
		}
		mv.setViewName("addedRoom");
		return mv;
	}

	// 방추가
	@RequestMapping(value = "/insertRoom.owner", method = RequestMethod.POST)
	public String insertRoom(MultipartHttpServletRequest req, @ModelAttribute RoomVO roomVO)
			throws IllegalStateException, IOException {
		HttpSession session = req.getSession();
		List<MultipartFile> files = roomVO.getUploadFile(); // MultipartFile타입의
															// 리스트
		String fileName[] = new String[files.size()]; // 파일 이름을 닮을 배열
		String root_path = session.getServletContext().getRealPath("/"); // 루트
																			// 경로
		String real_path = "img/owner/Room/"; // 상대경로
		String path = root_path + real_path; // 전체경로
		File Dir = new File(path); // 폴더가 없으면 만들기 위해서
		if (!Dir.exists())
			Dir.mkdirs();
		if (!files.isEmpty()) // 업로드파일이 비어 있지 않다면
		{
			for (int i = 0; i < files.size(); i++) {
				UUID uuid = UUID.randomUUID();
				fileName[i] = files.get(i).getOriginalFilename();
				String saveName = uuid.toString() + "_" + fileName[i];
				files.get(i).transferTo(new File(path + saveName));
				if (i == 0)
					roomVO.setRoomimg1("/searchBang/" + real_path + saveName);
				if (i == 1)
					roomVO.setRoomimg2("/searchBang/" + real_path + saveName);
				if (i == 2)
					roomVO.setRoomimg3("/searchBang/" + real_path + saveName);
				if (i == 3)
					roomVO.setRoomimg4("/searchBang/" + real_path + saveName);
				if (i == 4)
					roomVO.setRoomimg5("/searchBang/" + real_path + saveName);
				if (i == 5)
					roomVO.setRoomimg6("/searchBang/" + real_path + saveName);
				if (i == 6)
					roomVO.setRoomimg7("/searchBang/" + real_path + saveName);
				if (i == 7)
					roomVO.setRoomimg8("/searchBang/" + real_path + saveName);
				if (i == 8)
					roomVO.setRoomimg9("/searchBang/" + real_path + saveName);
			}
		}
		service.addedRoom(roomVO, session);
		return "redirect:accomManagement.owner";
	}

	// 방수정
	@RequestMapping(value = "/updateRoom.owner", method = RequestMethod.POST)
	public String updateRoom(MultipartHttpServletRequest req, @ModelAttribute RoomVO roomVO)
			throws IllegalStateException, IOException {
		System.out.println("roomVO = " + roomVO.getRoom_no());
		HttpSession session = req.getSession();
		List<MultipartFile> files = roomVO.getUploadFile(); // MultipartFile타입의
															// 리스트
		String fileName[] = new String[files.size()]; // 파일 이름을 닮을 배열
		String root_path = session.getServletContext().getRealPath("/"); // 루트
																			// 경로
		String real_path = "img/owner/Room/"; // 상대경로
		String path = root_path + real_path; // 전체경로
		File Dir = new File(path); // 폴더가 없으면 만들기 위해서
		if (!Dir.exists())
			Dir.mkdirs();
		if (!files.isEmpty()) // 업로드파일이 비어 있지 않다면
		{
			for (int i = 0; i < files.size(); i++) {
				UUID uuid = UUID.randomUUID();
				fileName[i] = files.get(i).getOriginalFilename();
				String saveName = uuid.toString() + "_" + fileName[i];
				files.get(i).transferTo(new File(path + saveName));
				if (i == 0)
					roomVO.setRoomimg1("/searchBang/" + real_path + saveName);
				if (i == 1)
					roomVO.setRoomimg2("/searchBang/" + real_path + saveName);
				if (i == 2)
					roomVO.setRoomimg3("/searchBang/" + real_path + saveName);
				if (i == 3)
					roomVO.setRoomimg4("/searchBang/" + real_path + saveName);
				if (i == 4)
					roomVO.setRoomimg5("/searchBang/" + real_path + saveName);
				if (i == 5)
					roomVO.setRoomimg6("/searchBang/" + real_path + saveName);
				if (i == 6)
					roomVO.setRoomimg7("/searchBang/" + real_path + saveName);
				if (i == 7)
					roomVO.setRoomimg8("/searchBang/" + real_path + saveName);
				if (i == 8)
					roomVO.setRoomimg9("/searchBang/" + real_path + saveName);
			}
		}
		service.updateRoom(roomVO);
		return "redirect:accomManagement.owner";
	}

	// 방삭제
	@RequestMapping("/deleteRoom.owner")
	public String deleteRoom(@RequestParam(value = "room_no", required = true) String room_no) {
		service.deleteRoom(room_no);
		return "redirect:accomManagement.owner";
	}

	// 공지사항리스트
	@RequestMapping("/noticeList.owner")
	public ModelAndView companyNoticeList() {
		String noticeType = "company";
		List<AdminNoticeVO> noticeList = adminService.NoticeList(noticeType);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("noticeList");
		mv.addObject("noticeList", noticeList);
		mv.addObject("size", noticeList.size());
		return mv;
	}

	// 공지사항 읽기
	@RequestMapping("/noticeRead.owner")
	public ModelAndView noticeRead(@RequestParam(value = "notice_no", required = true) String notice_no) {
		AdminNoticeVO noticeVO = adminService.noticeRead(notice_no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("noticeVO", noticeVO);
		mv.setViewName("noticeRead");
		return mv;
	}

	// QnA
	@RequestMapping("/QnA.owner")
	public ModelAndView QnA(@ModelAttribute QnAVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		vo.setOwnerEmail((String) session.getAttribute("loginId"));
		ModelAndView mv = new ModelAndView();
		List<QnAVO> list = service.QnAList(vo);
		mv.addObject("size", list.size());
		mv.addObject("list", list);
		mv.setViewName("QnA");
		return mv;
	}

	// QnA인서트
	@RequestMapping("/QnAInsert.owner")
	public String QnAInsert(@ModelAttribute QnAVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		vo.setOwnerEmail((String) session.getAttribute("loginId"));
		service.QnAInsert(vo);
		return "redirect:QnA.owner";
	}

	// 마이페이지
	@RequestMapping("/myPage.owner")
	public ModelAndView myPage(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		String ownerEmail = (String) session.getAttribute("loginId");
		List<AccomVO> list = service.accomList(ownerEmail);
		OwnerVO vo = service.ownerInfo(ownerEmail);
		mv.addObject("list", list);
		mv.addObject("size", list.size());
		mv.addObject("vo", vo);
		mv.setViewName("myPage");
		return mv;
	}

	// 핫딜온오프
	@RequestMapping("hotdeal.owner")
	public @ResponseBody void hotdeal(@RequestParam(value = "accom_no", required = true) String accom_no,
			@RequestParam(value = "accomHotdeal", required = true) String accomHotdeal,
			@RequestParam(value = "accomHotdeal_DC", required = false) String accomHotdeal_DC) {
		AccomVO vo = new AccomVO();
		vo.setAccom_no(Integer.parseInt(accom_no));
		vo.setAccomHotdeal(accomHotdeal);
		if (accomHotdeal_DC == null)
			vo.setAccomHotdeal_DC("0");
		else
			vo.setAccomHotdeal_DC(accomHotdeal_DC);
		service.hotdeal(vo);
	}

	// 오너 업데이트
	@RequestMapping("updateOwner.owner")
	public String updateOwner(@ModelAttribute OwnerVO vo) throws Exception {
		// 바인딩해서 받은 vo객체의 pw만 get해서 암호화된 문자열로 변환
		String cryptStr = sha.getSha256(vo.getOwnerPw().getBytes());
		// setters 이용
		vo.setOwnerPw(cryptStr);
		service.updateOwner(vo);
		return "redirect:myPage.owner";
	}

	// 오너 삭제
	@RequestMapping("deleteOwner.owner")
	public String deleteOwner(@RequestParam(value = "ownerEmail", required = true) String ownerEmail) {
		service.deleteOwner(ownerEmail);
		return "redirect:index.owner";
	}

	// 오너 매니지먼트페이지
	@RequestMapping("/ownerManagement.owner")
	public ModelAndView ownerManagement(@RequestParam(value = "accom_no") String accom_no, HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.setAttribute("accom_no", accom_no);
		AccomVO vo = service.accomInfo(accom_no);
		List<RoomVO> roomList = service.roomList(accom_no);
		List<ReviewVO> reviewList = service.reviewList(accom_no);
		int todayCount = service.todayCount(accom_no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("roomList", roomList);
		mv.addObject("reviewList", reviewList);
		mv.addObject("reviewListSize", reviewList.size());
		mv.addObject("todayCount", todayCount);
		mv.setViewName("ownerManagement");
		return mv;
	}

	// 일간매출
	@RequestMapping("/sales.owner")
	public @ResponseBody Object sales(@RequestParam(value = "accom_no") String accom_no) {
		List<SalesVO> list = new ArrayList<SalesVO>();
		list = service.sales(accom_no);
		return list;
	}

	// 주간 예약자
	@RequestMapping("/weekSales.owner")
	public @ResponseBody Object weekSales(@RequestParam(value = "accom_no") String accom_no) {
		List<WeekSalesVO> list = new ArrayList<WeekSalesVO>();
		list = service.weekSales(accom_no);
		return list;
	}

	// 평점 통계
	@RequestMapping("/reviewGrade.owner")
	public @ResponseBody Object reviewGrade(@RequestParam(value = "accom_no") String accom_no) {
		List<ReviewCountVO> list = new ArrayList<ReviewCountVO>();
		list = service.reviewGrade(accom_no);
		return list;
	}

	// 오너 등급 업데이트
	@RequestMapping("/updateGrade.owner")
	public String updateGrade(@RequestParam(value="accom_no")String accom_no){
		service.updateGrade(accom_no);
		return "redirect:/myPage.owner";
	}

	// 리뷰 신고
	@RequestMapping("declrationReview.owner")
	public String declration(@RequestParam(value= "declration")String declration , HttpServletRequest req){
		String url = req.getHeader("REFERER");
		return "redirect:"+url;
	}
	//오너가이드
	@RequestMapping("ownerGuide.owner")
	public String ownerGuide(){
		return "ownerGuide";
	}
}
