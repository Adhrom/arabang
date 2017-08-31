<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://apis.google.com/js/api:client.js"></script>
<script src="/searchBang/js/user/google.js"></script> 
<script src="/searchBang/js/user/loginProc.js"></script> 
<script type="text/javascript">
function moveParent(){
	opener.parent.location="sendInfo.bang"
	window.close();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login View</title>
<!-- HTTPS required. HTTP will give a 403 forbidden response -->
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/searchBang/css/user/login_style.css" />
</head>
<body>
	<jsp:include page="topmenu.jsp" />
	<form class="login-form">
	<h2	 class="login-title">회원로그인</h2>
		<div id="login-box">

			<h4 class="input-txt" >이메일</h4>
			<div id="input-box">
				<input type="text" class="input-type" name="login-userId"
					id="login-userId" required="required" placeholder="  이메일을 입력하세요.">
			</div>

			<h4 class="input-txt" >비밀번호</h4>
			<div id="input-box">
				<input type="password" class="input-type" name="login-userPw"
					id="login-userPw" required="required" placeholder="  비밀번호를 입력하세요.">
			</div>

			<div>
			<input type="checkbox" id="divECI_ISDVSAVE" /><label
				for="divECI_ISDVSAVE">아이디 저장</label>
			</div>
			
			<input id="login-btn" type="button" value="로그인"
				onclick="loginProc();"> <input id="join-btn" type="button"
				value="회원가입" onclick="location.href='userReg.bang';"><br />
				
			<div id="login_module" >
			<!-- kakao -->
			<div id="kakao-login-btn"></div>
			<!-- naver -->
			<div id="naver_id_login"></div>
			<!-- google -->
			<div id="gSignInWrapper">
				<div id="customBtn" class="customGPlusSignIn">
					<span class="icon"></span> <span class="buttonText">Google
						계정으로 로그인하기</span>
				</div>
			</div>
			<script>startApp();</script>
			<!-- facebook -->
			<div id="fb-root"></div>
			<div class="fb-login-button" data-max-rows="1" data-size="large"
				data-button-type="login_with" data-show-faces="false"
				data-auto-logout-link="true" data-use-continue-as="false"></div>
			<!-- data-auto-logout-link  = false 로 해야 login / logout 체인지 x-->
			</div>

			<div id="remember-txt-sector">
			<a href='findPw.bang'>비밀번호 찾기</a>
			</div>
		</div>
	</form>
</body>
<script src="/searchBang/js/user/SocialLogin.js"></script> 
</html>