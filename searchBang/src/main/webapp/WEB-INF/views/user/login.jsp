<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="/searchBang/js/user/facebook.js"></script>
<script src="https://apis.google.com/js/api:client.js"></script>
<script src="/searchBang/js/user/google.js"></script>
<script src="/searchBang/js/user/loginProc.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
._5h0f ._5h0o {
	font-size: 13px;
	margin-right: 8px;
}

._5h0o {
	border: none;
	font-family: Helvetica, Arial, sans-serif;
	letter-spacing: .25px;
	overflow: hidden;
	text-align: center;
	text-overflow: clip;
	white-space: nowrap;
}

._5h0c {
	background-color: #4267b2;
	color: #fff;
	cursor: pointer;
	display: inline-block;
	vertical-align: top;
}

#face-click {
	border-radius: 4px;
	width: 222px;
	height: 40px;
	padding-top: 10px;
	font-size: 18px;
	vertical-align: middle;
}

#face-click i {
	float: left;
	margin-left: 12px;
	margin-right: -30px;
	font-size: 30px;
	margin-top: -5px;
}

#naver_id_login {
	margin-top: 2px;
	margin-bottom: 2px;
}
</style>

<title>Login View</title>
<!-- HTTPS required. HTTP will give a 403 forbidden response -->
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/searchBang/css/user/login_style.css?ver=2" />
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css" />
</head>
<body>
	<form class="login-form">
		<div id="login-box">
			<h2 class="login-title">회원로그인</h2>

			<h4 class="input-txt">이메일</h4>
			<div id="input-box">
				<input type="text" class="input-type" name="email" id="login-userId"
					placeholder="  이메일을 입력하세요.">
			</div>

			<h4 class="input-txt">비밀번호</h4>
			<div id="input-box">
				<input type="password" class="input-type" name="password"
					id="login-userPw" placeholder="  비밀번호를 입력하세요.">
			</div>
			<table style="width: 224px;">
				<tr>
					<td>&nbsp;&nbsp;<input type="checkbox" id="divECI_ISDVSAVE" /><label
						for="divECI_ISDVSAVE">아이디 저장</label></td>
					<td><a href='findPw.bang' style="font-size: 12px;">비밀번호 찾기</a></td>
				</tr>
				<tr>
					<td><input id="login-btn" type="button" value="로그인"
						onclick="loginProc();" class="button"></td>
					<td><input id="join-btn" type="button" value="회원가입"
						onclick="location.href='userReg.bang';" class="button"><br /></td>
				</tr>
				<tr>
					<td><div id="kakao-login-btn"></div></td>
				</tr>
				<tr>
					<td><div id="naver_id_login"></div></td>
				</tr>
				<tr>
					<td>
						<div id="gSignInWrapper">
							<div id="customBtn" class="customGPlusSignIn">
								<span class="icon"></span> <span class="buttonText">Google
									계정으로 로그인하기</span>
							</div>
						</div> <script>
							startApp();
						</script>
					</td>
				</tr>
				<tr>
					<td><div id="fb-root"></div>
						<div id="face-click">
							<i class="fa fa-facebook-official" aria-hidden="true"></i>Facebook
							login
						</div> <!-- data-auto-logout-link  = false 로 해야 login / logout 체인지 x--></td>
				</tr>
			</table>
			<div></div>
		</div>
	</form>
</body>
<script src="/searchBang/js/user/SocialLogin.js"></script>
</html>