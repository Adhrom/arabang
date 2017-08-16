package com.mainWeb.searchBang.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	public Mail(String address, String message) throws MessagingException{
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
	}
}
