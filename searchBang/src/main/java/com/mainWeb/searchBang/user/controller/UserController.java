package com.mainWeb.searchBang.user.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.CookieGenerator;

import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.user.model.UserInfoVO;
import com.mainWeb.searchBang.user.model.UserVO;
import com.mainWeb.searchBang.user.service.UserService;

@Controller
public class UserController {

	@Inject
	private UserService service;

	// 메인인덱스
	@RequestMapping("index.bang")
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
	public String registInfo(@ModelAttribute UserVO vo) throws Exception{
		service.insertUserService(vo);
		return null;
	}


	@RequestMapping(value="/loginProc.bang", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView loginProc(@RequestParam("email") String email,
			@RequestParam("password") String password, HttpSession session, Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		UserInfoVO vo = new UserInfoVO();
		boolean result = service.loginUserService(email, password, session , vo);
		
		if(result){
			mv.addObject("msg","success");
			mv.setViewName("redirect:index.bang");
		}
		else{
			mv.addObject("msg","fail");
			mv.setViewName("redirect:login.bang");
		}
		return mv;
	}

//	정보를 가져오는 과정
//	public String getInfo(Model model,@RequestParam("email") String id,
//			@RequestParam("password") String password) throws Exception{
//		UserVO info = service.getUserInfoService(id, password);
//		model.addAttribute("info",info);
//		return null;
//	}

//	 정보 삭제 과정
//	public String deleteInfo(Model model, @RequestParam("email") String id,
//			@RequestParam("password") String password) throws Exception{
//		service.deleteUserInfoService(id, password);
//	return null;
//	}

	// 정보 변경
	@RequestMapping(value="/updateInfo.bang", method=RequestMethod.POST)
	public String updateInfo(Model model, @RequestParam("email") String id,  @RequestParam("password") String password,
			@RequestParam("nickname") String nickname, @RequestParam("phone") String phone) throws Exception{
		service.updateInfoService(id, password, nickname, phone);
		return null;
	}

	//서치뷰
	@RequestMapping(value = "/searchView.bang", method=RequestMethod.GET)
	public ModelAndView searchView(@RequestParam(value="address")String address,@RequestParam(value="date")String date,
			@RequestParam(value="people")String people){
		List<AccomVO> list = service.accomList(address, people);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("date", date);
		mv.setViewName("searchView");
		return mv;
	}
}