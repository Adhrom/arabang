<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="searchBang/css/user/updateinfo.css">
<title>정보수정페이지</title>
</head>
<body>
<div class="top-section">
	<form action="updateInfo.bang" method="post">
	
		<p class="userinfo-title">회원정보변경</p>
		<div class="container">
		<div class="left-name">
			<p class="input-name">아이디 : &nbsp;</p> 
			<p class="input-name">비밀번호 : &nbsp;</p> 
			<p class="input-name">닉네임 : &nbsp;</p> 
			<p class="input-name">전화번호 : &nbsp;</p> 
		</div>
		<div class="center-input">
			<input class="input-style" type="text" id="updateForm-id" name="updateForm-id" value="${uservo.getMemberMail() }" readonly="readonly">
			<input class="input-style" type="text" id="updateForm-password" name="updateForm-password" value="${uservo.getMemberPw() }">
			<input class="input-style" type="text" id="updateForm-nickname" name="updateForm-nickname" value="${uservo.getMemberNickname() }">
			<input class="input-style" type="text" id="updateForm-phone" name="updateForm-phone" value="${uservo.getMemberPhone() }">
		</div>
		</div>
		<div class="bottom-btn" align=center>
			<input class="btn-style" type="button" onclick="#" value="돌아가기">
			<input class="btn-style" type="submit" value="정보수정">
		</div>
		
	</form>
	</div>
	<div class="bottom-section"></div>
</body>
</html>