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
	
	@RequestMapping("/userReg.bang")
	public String userRegistForm(){
		return "user_join";
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
	public String loginProc(@RequestParam("email") String email, 
			@RequestParam("password") String password, HttpSession session, Model model) throws Exception{
		System.out.println("컨트롤러 진입 :"+email + " / "+password);
		boolean result = service.loginUserService(email, password, session);
		
		if(result)
			model.addAttribute("msg","success");
		else
			model.addAttribute("msg","fail");
		
		return "redirect:login.bang";
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
	
//	비밀번호 변경
//	public String changePassword(Model model, @RequestParam("email") String id, 
//			@RequestParam("password") String password) throws Exception{
//		service.changePasswordService(id, password);
//		return null;
//	}
	
//	정보수정
//	public String updateInfo(Model model, @RequestParam("email") String id,  @RequestParam("password") String password,
//			@RequestParam("nickname") String nickname, @RequestParam("phone") String phone) throws Exception{
//		service.updateInfoService(id, password, nickname, phone);
//		return null;
//	}
	
//	숙소정보 받아오기
//	public String getAccomList(Model model, @RequestParam("dong") String dong){
//		List<AccomVO> accomList = service.accomListService(dong);
//		model.addAttribute("accomList",accomList);
//		return null;
//	}
	
	
}