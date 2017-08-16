<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/searchBang/js/owner/cookie.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login View</title>
<!-- HTTPS required. HTTP will give a 403 forbidden response -->
</head>
<link rel="stylesheet" href="/searchBang/css/owner/login.css" />
<body>
	<h1 class="title">회원가입</h1>
	<form class="login-form" id="loginForm" name="loginForm" 
											action="loginProc.owner" method="post">
		<div id="login-box">
			<h3 class="login-title">회원로그인</h3>

			<h4 class="input-txt">이메일</h4>
			<div id="input-box">
				<input type="text" class="input-type" name="loginEmail">
			</div>

			<h4 class="input-txt">비밀번호</h4>
			<div id="input-box">
				<input type="password" class="input-type" name="loginPass">
			</div>

			<input type="checkbox" id="divECI_ISDVSAVE" name="divECI_ISDVSAVE"/>
			<label for="divECI_ISDVSAVE">아이디 저장</label>

			<div id="remember-txt-sector">
				<h4 id="pwd-search">
					<a href="#">비밀번호 찾기</a>
				</h4>

				<input id="login-btn" type="button" value="로그인" onclick="sendit()"> 
				<input id="join-btn" type="button" value="회원가입" onclick="javascript:self.location='ownerReg.owner';">

			</div>
		</div>
	</form>
</body>
</html>