package com.mainWeb.searchBang.user.controller;

import javax.inject.Inject;
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

	@RequestMapping("/naverLoginProc.bang")
	public String naverLoginProc(){
		return "naverLoginProc";
	}
	
	@RequestMapping(value="/getInfo.bang", method={RequestMethod.GET , RequestMethod.POST})
	public @ResponseBody void setKakaoInfo(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		session.setAttribute("nickname",request.getParameter("nickname"));
		session.setAttribute("email",request.getParameter("email"));
	}

	@RequestMapping("/sendInfo.bang")
	public ModelAndView sendInfo(HttpSession session){
		ModelAndView mv = new ModelAndView("owner_join");
		mv.addObject("nickname",session.getAttribute("nickname"));
		mv.addObject("email",session.getAttribute("email"));
		return mv;
	}
	
	@RequestMapping(value="/resistUser.bang", method=RequestMethod.POST)
	public String registInfo(@ModelAttribute UserVO vo){
		service.insertUserService(vo);
		return null;
	}
	
//	정보를 가져오는 과정
//	public String getInfo(Model model,@RequestParam("nickname") String id, 
//			@RequestParam("password") String password){
//		UserVO info = service.getUserInfoService(id, password);
//		model.addAttribute("info",info);
//		
//		return null;
//	}
	
//	 정보 삭제 과정
//	public String deleteInfo(Model model, @RequestParam("nickname") String id, 
//			@RequestParam("password") String password){
//		service.deleteUserInfoService(id, password);
//		
//		return null;
//	}
	
}