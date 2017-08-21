package com.mainWeb.searchBang.user.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mainWeb.searchBang.user.service.UserService;

@Controller
@SessionAttributes({"nickname","email"})
public class UserController {
	
	@Inject
	private UserService service;
	
	@RequestMapping("/login.bang")
	public String userLogin(){
		return "login";
	}
	
	@RequestMapping("/naverLoginProc.bang")
	public String naverLoginProc(){
		return "naverLoginProc";
	}
	
	//  setKakaoInfo() , setNaverInfo() 함수는 모두 같은 형태를 띄고 있어서 facebook / google 
	// 로그인 연동 또한 이런 같은 형태의 모형이 나온다면 한번에 합칠예정임.
	// 일단은 되는대로 함수만들어서 세팅중임 .... 
	
	@RequestMapping(value="/kakaogetInfo.bang", method={RequestMethod.GET , RequestMethod.POST})
	public void socialInfoSetting(Model model, HttpServletRequest request){
		model.addAttribute("nickname",request.getParameter("nickname"));
		model.addAttribute("email",request.getParameter("email"));
	}

	@RequestMapping("/sendInfo.bang")
	public String sendInfo(@ModelAttribute(value="nickname") String name){
		System.out.println(name);
		return "owner_join";
	}
}