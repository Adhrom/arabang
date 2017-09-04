package com.mainWeb.searchBang.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.CookieGenerator;

import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.RoomVO;
import com.mainWeb.searchBang.user.model.ReservationVO;
import com.mainWeb.searchBang.user.model.ReviewVO;
import com.mainWeb.searchBang.user.model.UserInfoVO;
import com.mainWeb.searchBang.user.service.UserService;
import com.mainWeb.searchBang.utils.CharMix;
import com.mainWeb.searchBang.utils.Mail;

@Controller
public class UserController {

	@Inject
	private UserService service;
	
	public  String getSession(HttpSession session) {
		String ss = (String)session.getAttribute("email");
		return ss;
	}

	// 메인인덱스
	@RequestMapping("index.bang")
	public String index() {
		return "index";
	}

	@RequestMapping("/login.bang")
	public String userLogin() {
		return "login";
	}

	@RequestMapping("/userReg.bang")
	public String userRegistForm() {
		return "user_join";
	}

	@RequestMapping("/naverLoginProc.bang")
	public String naverLoginProc() {
		return "naverLoginProc";
	}
	

	// social-login get(email, nickname)
	@RequestMapping(value = "/getInfo.bang", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody void setKakaoInfo(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.setAttribute("nickname", request.getParameter("nickname"));
		session.setAttribute("email", request.getParameter("email"));
	}

	// social-login -> resist-form
	@RequestMapping("/sendInfo.bang")
	public ModelAndView sendInfo(HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:userReg.bang");
		mv.addObject("nickname", session.getAttribute("nickname"));
		mv.addObject("email", session.getAttribute("email"));
		return mv;
	}

	// 가입
	@RequestMapping(value = "/resistUser.bang", method = RequestMethod.POST)
	public String registInfo(@RequestParam("userName") String nickname, @RequestParam("userEmail") String email,
			@RequestParam("userPw") String password, @RequestParam("userPhone") String phone) throws Exception {
		service.insertUserService(email, password, nickname, phone);
		return "redirect:/index.bang";
	}
	
	// 로그인 처리
	@RequestMapping(value = "/loginProc.bang", method = { RequestMethod.POST, RequestMethod.GET })
	public String loginProc(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
		boolean result = service.loginUserService(email, password, session);

		if (result) {
			redirectAttributes.addFlashAttribute("msg","success");
		}
		else {
			redirectAttributes.addFlashAttribute("msg","fail");
		}
		return "redirect:/index.bang";
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout.bang")
	public String logout(HttpSession session) {
		service.logout(session);
		return "redirect:/index.bang";
	}

	// 정보수정
	@RequestMapping(value = "/updateInfo.bang", method = {RequestMethod.POST, RequestMethod.GET})
	public String updateInfo(@RequestParam("updateForm-id") String email,
			@RequestParam("updateForm-password") String password, @RequestParam("updateForm-nickname") String nickname,
			@RequestParam("updateForm-phone") String phone) throws Exception {
		service.updateInfoService(email, password, nickname, phone);
		return "updateFin";
	}
	
	@RequestMapping(value="/deleteInfo.bang", method=RequestMethod.GET)
	public String deleteInfo(HttpSession session) {
		service.deleteUser(session);
		return "index";
	}

	@RequestMapping(value = "/searchView.bang", method = RequestMethod.GET)
	public ModelAndView searchView(@RequestParam(value = "address") String address,
			@RequestParam(value = "date") String date, @RequestParam(value = "people") String people,
			HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.setAttribute("startDate", date.substring(0, 10));
		session.setAttribute("endDate", date.substring(13, 23));
		// session.setAttribute("room_no", vo.getRoom_no();
		List<AccomVO> list = service.accomList(address, people);
		List<RoomVO> r_list = service.roomList(address, people);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("r_list", r_list);
		mv.addObject("date", date);
		mv.setViewName("searchView");
		return mv;
	}

	// 예약하기
	@RequestMapping("/doReservation.bang")
	public String doReservation(@ModelAttribute ReservationVO vo, @RequestParam(value = "point") String point,
			HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		System.out.println(vo + "/" + point + "/" + (String) session.getAttribute("email"));
		service.doReservation(vo, point, "aaa@naver.com");
		return "index";
	}

	// 리뷰등록
	@RequestMapping("/insertReview.bang")
	public String insertReview(HttpServletRequest req, @ModelAttribute ReviewVO vo) {
		HttpSession session = req.getSession();
		String memberEmail = (String) session.getAttribute("email");
		vo.setMemberEmail(memberEmail);
		return null;
	}

	// 페이페이지
	@RequestMapping("/userPay.bang")
	public ModelAndView userPay(@RequestParam(value = "room_no") String room_no,
			@RequestParam(value = "rentAndLodge") String rentAndLodge, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String memberEmail = (String) session.getAttribute("email");
		UserInfoVO userInfoVO = service.getUserInfo(memberEmail);
		RoomVO roomVO = service.roomInfoForReservation(room_no);
		AccomVO accomVO = service.accomInfoForReservation(room_no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("userInfoVO", userInfoVO);
		mv.addObject("roomVO", roomVO);
		mv.addObject("accomVO", accomVO);
		mv.setViewName("userPay");
		return mv;
	}

	@RequestMapping("/userInfo.bang")
	public ModelAndView userInfo(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String str = this.getSession(session);
		if(!str.equals(null)) {
			mv.setViewName("userInfo");
			mv.addObject("point",service.getPoint(session)); // 세션에 따라 포인트 조회해서 오기.
		}
		else {
			mv.setViewName("index");
			mv.addObject("msg","fail");
		}
		return mv;
	}

	@RequestMapping("/infoAdmin.bang")
	public ModelAndView infoAdmin(HttpSession session) {
		ModelAndView mv = new ModelAndView("infoAdmin");
		UserInfoVO vo =  service.getInfo1(session);
		vo.setMemberPw("");
		mv.addObject("info",vo);
		return mv;
	}

	// 즐겨찾기 추가
	@RequestMapping(value = "/addFavorite.bang", method = RequestMethod.GET)
	public @ResponseBody void addfavorite(@RequestParam("accomNo") int accomNo, HttpSession session) {
		service.addFavorite(accomNo, session);
	}

	// 즐겨찾기 리스트
	@RequestMapping(value = "/getfavoriteList.bang")
	public ModelAndView getFavoriteList(HttpSession session) {
		List<AccomVO> list = new ArrayList<AccomVO>();
		list = service.getFavoriteList(session);
		ModelAndView mv = new ModelAndView("favoriteList");
		mv.addObject("list",list);
		return mv;
	}

	// 즐겨찾기 삭제
	@RequestMapping(value="/deleteFavorite.bang")
	public @ResponseBody void deleteFavorite(@RequestParam("accomNo") String accomNo) {
		service.deleteFavorite(Integer.parseInt(accomNo));
	}

	// 버튼클릭시, 이메일로 인증번호를 보내는 ,,(?)
	@RequestMapping(value = "/getCertificationNum.bang")
	public @ResponseBody String CharMixxing(@RequestParam("idfield") String address)
			throws AddressException, MessagingException {
		String message = CharMix.getInstance().makeMessage();
		new Mail(address, message); // Mail클래스가 메일전송을 대신하게,
		return message;
	}

	// 정보를 가져오는..
	@RequestMapping(value = "existAccount.bang", method = RequestMethod.POST)
	public ModelAndView getInfo(@RequestParam("Find-id") String email, @RequestParam("Find-name") String name)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("uservo", service.getInfo(email, name));
		mv.setViewName("updateInfo");
		return mv;
	}

	// 업체내용과 방정보 불러오기
	@RequestMapping("room_info.bang")
	public ModelAndView accom_Information(@RequestParam("accom_no") String accom_no, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		
		// line 216~219 쿠키를 굽는..
		CookieGenerator cg = new CookieGenerator();
		cg.setCookieMaxAge(1*60*60); // 1hour?
		cg.setCookieName("accom_no");
		cg.addCookie(response, accom_no);
		
		AccomVO vo = service.accomInfo(accom_no);
		List<RoomVO> list = service.roomInfo(accom_no);
		mv.addObject("vo", vo);
		mv.addObject("list", list);
		mv.setViewName("room_info");
		return mv;
	}
	
//	@RequestMapping("/getCookies.bang")
//	public ModelAndView getCookies(HttpServletRequest request) {
//		String cookieValue = "";
//		Cookie [] cookie = request.getCookies();
//		
//		if(cookie != null && cookie.length > 0) {
//			for (Cookie cc : cookie) {
//				cookieValue = cc.getValue();
//			}
//		}
//		
//		ModelAndView mv = new ModelAndView("getCookies");
//		mv.addObject("cookie",cookieValue);
//		return mv;
//	}
}