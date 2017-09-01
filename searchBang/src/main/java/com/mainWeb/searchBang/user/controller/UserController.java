package com.mainWeb.searchBang.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mainWeb.searchBang.owner.model.AccomVO;
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

	// 메인인덱스
	@RequestMapping("/index.bang")
	public String index(){
		return "index";
	}

	@RequestMapping("/login.bang")
	public String userLogin(){
		return "login";
	}

	@RequestMapping("/userReg.bang")
	public String userRegistForm(){
		return "user_join";
	}

	@RequestMapping("/naverLoginProc.bang")
	public String naverLoginProc(){
		return "naverLoginProc";
	}

	@RequestMapping("/findPw.bang")
	public String findPassword(){
		return "findPw";
	}

	@RequestMapping(value="/getInfo.bang", method={RequestMethod.GET , RequestMethod.POST})
	public @ResponseBody void setKakaoInfo(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		session.setAttribute("nickname",request.getParameter("nickname"));
		session.setAttribute("email",request.getParameter("email"));
	}

	@RequestMapping("/sendInfo.bang")
	public ModelAndView sendInfo(HttpSession session){
		ModelAndView mv = new ModelAndView("redirect:userReg.bang");
		mv.addObject("nickname",session.getAttribute("nickname"));
		mv.addObject("email",session.getAttribute("email"));
		return mv;
	}

	@RequestMapping(value="/resistUser.bang", method=RequestMethod.POST)
	public String registInfo(@RequestParam("userName") String nickname, @RequestParam("userEmail") String email
			, @RequestParam("userPw") String password, @RequestParam("userPhone") String phone) throws Exception{
		service.insertUserService(email, password, nickname, phone);
		return "index";
	}
 
	@RequestMapping(value="/loginProc.bang", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView loginProc(@RequestParam("email") String email,
			@RequestParam("password") String password, HttpSession session, Model model) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:login.bang");
		UserInfoVO vo = new UserInfoVO();
		boolean result = service.loginUserService(email, password, session , vo);

		if(result)
			model.addAttribute("msg","success");
		else
			model.addAttribute("msg","fail");

		return mv;
	}

	//	 정보 삭제 과정
	//	public String deleteInfo(Model model, @RequestParam("email") String id,
	//			@RequestParam("password") String password) throws Exception{
	//		service.deleteUserInfoService(id, password);
	//	return null;
	//	}

	@RequestMapping(value="/updateInfo.bang", method=RequestMethod.POST)
	public String updateInfo(@RequestParam("updateForm-id") String email,  @RequestParam("updateForm-password") String password,
			@RequestParam("updateForm-nickname") String nickname, @RequestParam("updateForm-phone") String phone) throws Exception{
		service.updateInfoService(email, password, nickname, phone);
		return "updateFin";
	}

	//서치뷰
	public ModelAndView searchView(@RequestParam(value="address")String address,@RequestParam(value="date")String date,@RequestParam(value="people")String people, HttpServletRequest req){
		HttpSession session = req.getSession(false);
		session.setAttribute("startDate", date.substring(0,10 ));
		session.setAttribute("endDate", date.substring(13,23 ));
		//session.setAttribute("room_no", vo.getRoom_no();
		List<AccomVO> list = service.accomList(address, people);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("date", date);
		mv.setViewName("searchView");
		return mv;
	}
	//예약하기
	@RequestMapping("/doReservation.bang")
	public String doReservation(@ModelAttribute ReservationVO vo , @RequestParam(value="point")String point , @RequestParam(value="memberEmail")String memberEmail){
		service.doReservation(vo, point , memberEmail);
		return "index";
	}
	//리뷰등록
	@RequestMapping("/insertReview")
	public String insertReview(HttpServletRequest req , @ModelAttribute ReviewVO vo){
		HttpSession session = req.getSession();
		String memberEmail = (String)session.getAttribute("email");
		vo.setMemberEmail(memberEmail);
		return null;
	}

	// 즐겨찾기 추가
	@RequestMapping(value="/addFavorite.bang", method=RequestMethod.GET)
	public @ResponseBody void addfavorite(@RequestParam("accomNo") int accomNo, HttpSession session){
		service.addFavorite(accomNo, session);
	}

	// 즐겨찾기 리스트
	@RequestMapping(value="/abc.bang")
	public ModelAndView getFavoriteList(HttpSession session){
		List<AccomVO> list = new ArrayList<AccomVO>();
		list = service.getFavoriteList(session);

		ModelAndView mv = new ModelAndView();

		return mv;
	}

	// 즐겨찾기 삭제
	public @ResponseBody void deleteFavorite(@RequestParam("accomNo") int accomNo){
		service.deleteFavorite(accomNo);
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
	@RequestMapping(value="existAccount.bang", method=RequestMethod.POST)
	public ModelAndView getInfo(@RequestParam("Find-id") String email, 
			@RequestParam("Find-name") String name) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("uservo",service.getInfo(email, name));
		mv.setViewName("updateInfo");
		return mv;
	}
}