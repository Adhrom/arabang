<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/searchBang/css/user/userTop.css?ver=1">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<script src="/searchBang/js/common/jquery.datatables.min.js"></script>
<title>Insert title here</title>
<!-- 로그인 -->
<script src="/searchBang/js/admin/jquery.popupoverlay.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="/searchBang/js/user/facebook.js"></script>
<script src="https://apis.google.com/js/api:client.js"></script>
<script src="/searchBang/js/user/google.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script type="text/javascript">
	$(document).ready(function() {
		$('#login').popup({
			transition : 'all 0.3s'
		});
		$('#findPwModal').popup({
			transition : 'all 0.3s'
		});
		$('#loginbtn').click(function() {
			document.loginform.action = "loginProc.bang";
			document.loginform.submit();
		});
	});
</script>
<script src="/searchBang/js/owner/cookie.js"></script>
<style type="text/css">
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

.login-form {
	background-color: white;
}
</style>
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/searchBang/css/user/login_style.css?ver=2" />
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css" />
</head>
<body class="homepage">
	<c:if test="${msg == 'failure'}">
		<script type="text/javascript">
			alert("아이디 혹은 비밀번호를 틀렸습니다. 다시 로그인 해주세요.");
		<%session.removeAttribute("msg");%>

		</script>
	</c:if>
	<div id="page-wrapper">
		<div id="loginText">
			<ul>
				<li><c:choose>
						<c:when test="${memberEmail==null }">
							<i class="fa fa-sign-in " aria-hidden="true"></i>
							<a class="flatbtn login_open">로그인</a>
						</c:when>
						<c:otherwise>
							<i class="fa fa-sign-out" aria-hidden="true"></i>
							<a href="logout.bang">로그아웃</a>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</div>
		<!-- Header -->

		<div id="header-wrapper">

			<div id="header">

				<!-- Logo -->
				<h1 id="ara_logo">
					<a href="http://localhost:8080/searchBang/index.bang">알아방</a>
				</h1>

				<!-- Nav -->
				<div id="nav">
					<ul>
						<li class="current"><a href="index.bang">알아방으로 알아봐!</a></li>
						<li><a href="infoAdmin.bang">마이페이지</a></li>
						<li><a href="userReserve.bang">예약내역</a></li>
						<li><a href="noticeList.bang">공지사항</a></li>

					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="login" class="checks etrans" style="background-color: white;">
		<form class="loginform" name="loginform">
			<div id="login-box"
				style="padding: 30px; border: 3px solid #00a699; border-radius: 3px;">
				<h2 class="login-title" style="padding-left: 30px;">회원로그인</h2>
				<br />

				<h4 class="input-txt" style="font-size: 11px;">&nbsp;&nbsp;&nbsp;이메일</h4>
				<div id="input-box">
					<input type="text" class="input-type" name="email" id="email"
						placeholder="  이메일을 입력하세요." style="width: 225px;">
				</div>

				<h4 class="input-txt" style="font-size: 11px;">&nbsp;&nbsp;&nbsp;비밀번호</h4>
				<div id="input-box">
					<input type="password" class="input-type" name="password"
						id="password" placeholder="  비밀번호를 입력하세요." style="width: 225px;">
				</div>
				<br />
				<!-- 여기부터 소셜 로그인 넣으면될듯 -->
				<input type="checkbox" id="divECI_ISDVSAVE" /> <span> <label
					for="divECI_ISDVSAVE">아이디 저장</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="login_close findPwModal_open"><label>비밀번호 찾기</label></a>
				</span>
				<p>
					<span><button id="loginbtn" class="button">로그인</button></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span><input id="join-btn" type="button" value="회원가입"
						onclick="location.href='userReg.bang';" class="button"></span>
				</p>
				<p align="center">
				<div id="kakao-login-btn"></div>
				<p align="center">
				<div id="naver_id_login"></div>
				<p align="center">
				<div id="gSignInWrapper">
					<div id="customBtn" class="customGPlusSignIn">
						<span class="icon"></span> <span class="buttonText">Google계정으로
							로그인하기</span>
					</div>
				</div>
				<script>
					startApp();
				</script>
				<p align="center">
				<div id="fb-root"></div>
				<div id="face-click">
					<i class="fa fa-facebook-official" aria-hidden="true"></i>Facebook
					login
				</div>

				<!-- <table style="width: 280px;">
					<tr>
						<td>&nbsp;&nbsp;<input type="checkbox" id="divECI_ISDVSAVE" /><label
							for="divECI_ISDVSAVE">아이디 저장</label></td>
						<td><a href='findPw.bang' style="font-size: 12px;">비밀번호
								찾기</a></td>
					</tr>
					<tr>
						<td><input id="login-btn" type="button" value="로그인"
							onclick="loginProc();" class="button"></td>
						<td><input id="join-btn" type="button" value="회원가입"
							onclick="location.href='userReg.bang';" class="button"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><div id="kakao-login-btn"></div></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><div id="naver_id_login"></div></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><div id="gSignInWrapper">
								<div id="customBtn" class="customGPlusSignIn">
									<span class="icon"></span> <span class="buttonText">Google
										계정으로 로그인하기</span>
								</div>
							</div></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><div id="fb-root"></div>
							<div id="face-click">
								<i class="fa fa-facebook-official" aria-hidden="true"></i>Facebook
								login
							</div> data-auto-logout-link  = false 로 해야 login / logout 체인지 x</td>
					</tr>
				</table> -->

				<div></div>
			</div>
		</form>
	</div>
	<script src="/searchBang/js/user/SocialLogin.js"></script>
	<div id="findPwModal">
		<jsp:include page="findPw.jsp" flush="false"></jsp:include>
	</div>
</body>
</html>