package com.mainWeb.searchBang.owner.controller;

import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.mainWeb.searchBang.owner.model.AccomVO;
import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.owner.service.OwnerService;
import com.mainWeb.searchBang.utils.CharMix;
import com.mainWeb.searchBang.utils.Mail;
import com.mainWeb.searchBang.utils.SHA256;

@Controller
public class OwnerController {

	@Inject
	private OwnerService service;
	// 암호화 객체 할당
	SHA256 sha = SHA256.getInsatnce();

	// 회원가입 화면
	@RequestMapping("/ownerReg.owner")
	public String onwer_join(){
		return "ownerReg";
	}

	// 로그인 화면
	@RequestMapping("/ownerLogin.owner")
	public String owner_login(){
		return "login";
	}

	// 컨트롤러 단에서 정보를 입력하는 단계..?
	@RequestMapping("/insertOwner.owner")
	public String insertOwner(@ModelAttribute OwnerVO ownerVO) throws Exception{

		// 바인딩해서 받은 vo객체의 pw만 get해서 암호화된 문자열로 변환
		String cryptStr = sha.getSha256(ownerVO.getOwnerPw().getBytes());
		// setters 이용
		ownerVO.setOwnerPw(cryptStr);

		service.insertOwner(ownerVO);

		return "index.owner";
	}

	// 실시간 아이디 체크(?)
	@RequestMapping(value="/checkId.owner")
	public @ResponseBody String  idCheckOwner(@RequestParam("idfield") String email){
		return String.valueOf(service.idCheckOwner(email));
	}

	// 버튼클릭시, 이메일로 인증번호를 보내는 ,,(?)
	@RequestMapping(value="/getCertificationNum.owner")
	public @ResponseBody String CharMixxing(@RequestParam("idfield") String address)
			throws AddressException,MessagingException{

		String message = CharMix.getInstance().makeMessage();

		new Mail(address,message); // Mail클래스가 메일전송을 대신하게,

		return message;
	}
	// 숙소추가페이지
	@RequestMapping("/addedAccom.owner")
	public String addedAccom(){
		return "addedAccom";
	}

	// 숙소추가
	@RequestMapping("/insertAccom.owner")
	public String insertAccom(@ModelAttribute AccomVO accomVO, HttpServletRequest request){
		//HttpSession session = request.getSession();
		//accomVO.setOwnerEmail((String)session.getAttribute("ownerEmail"));
		accomVO.setOwnerEmail("dlwjdtn777@gmail.com");
		service.addedAccom(accomVO);
		return "ownerReg";
	}


	// 로그인 처리
	@RequestMapping(value="/loginProc.owner",method=RequestMethod.POST)
	public ModelAndView loginCheck(@RequestParam("loginEmail") String id,
			@RequestParam("loginPass") String pass) throws Exception{

		Map<String, Object> map = new HashMap<String, Object>();
		String cryptPass = sha.getSha256(pass.getBytes());

		map.put("id", id);
		map.put("pass", cryptPass);

		ModelAndView mv = new ModelAndView();

		if(service.loginOwner(map).equals("y")){
			// 관리자 승인OK
		}

		else if(service.loginOwner(map).equals("n")){
			// 관리자승인 아직.
		}

		else if(service.loginOwner(map).equals("c")){
			// 관리자 승인 거절.
		}
		mv.setViewName("로그인 결과 뷰명칭");
		return mv;
	}
}
