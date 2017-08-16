package com.mainWeb.searchBang.owner.controller;

import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.owner.service.OwnerService;
import com.mainWeb.searchBang.utils.CharMix;
import com.mainWeb.searchBang.utils.SHA256;

@Controller
public class OwnerController {

	@Inject
	private OwnerService service;

	@RequestMapping("/ownerReg.owner")
	public String onwer_join(){
		return "ownerReg";
	}

	// 컨트롤러 단에서 정보를 입력하는 단계..?
	@RequestMapping("/insertOwner.owner")
	public String insertOwner(@ModelAttribute OwnerVO ownerVO) throws Exception{
		// 암호화 객체 할당
		SHA256 sha = SHA256.getInsatnce();
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
		String host = "smtp.naver.com";

		final String username = "swift779"; // 네이버 아이디
		final String password = "wjdtntn779@"; // 네이버 비밀번호
		int port = 465;


		String recipient = address;
		String subject = "Arabang에서 인증번호를 보냅니다"; // 메일의 제목

		String body = " 인증번호는 "+message+" 입니다";

		Properties props = System.getProperties();

		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new Authenticator() {
			String un = username;
			String pw = password;

			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(un,pw);
			}
		});

		session.setDebug(true);

		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress("swift779@naver.com")); // 보내는이 아이디 + 메일주소 까지 통째로 ex) aaa0101@naver.com 이런식..
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		Transport.send(mimeMessage);

		return message;
	}
	// 숙소추가
	@RequestMapping("/addedAccom.owner")
	public String addedAccom(){
		return "addedAccom";
	}

}
