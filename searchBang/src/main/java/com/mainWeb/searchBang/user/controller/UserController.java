package com.mainWeb.searchBang.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	private Map<String, Object> map = new HashMap<String, Object>();
	
	@RequestMapping("/login.bang")
	public String userLogin(){
		map.clear();
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
	public @ResponseBody void setKakaoInfo(@RequestParam("nickname") String nickname, 
			@RequestParam("email") String email){
		map.put("nickname", nickname);
		map.put("email", email);
	}
	
	@RequestMapping(value="/navergetInfo.bang")
	public @ResponseBody void setNaverInfo(@RequestParam("email") String email, 
			@RequestParam("nickname") String nickname){
		map.put("email", email);
		map.put("nickname", nickname);
	}
	
	@RequestMapping("/sendInfo.bang")
	public ModelAndView sendInfo(){
		ModelAndView mv = new ModelAndView();
		mv.addObject("nickname",(String)map.get("nickname"));
		mv.addObject("email",(String)map.get("email"));
		mv.setViewName("owner_join");
		return mv;
	}
}