<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS reset -->
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,600,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/searchBang/css/admin/reset.css">
<link rel="stylesheet" href="/searchBang/css/admin/adminstyle.css">
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css">
<!-- Resource style -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script src="/searchBang/js/admin/main.js"></script>
<script src="/searchBang/js/admin/jquery.popupoverlay.js"></script>
<script>
	$(document).ready(function() {
		//모달팝업
		var loginCheck = "<%=(String) session.getAttribute("loginCheck")%>";

		if (loginCheck == "failure") {
			$('#login').popup({
				color : 'white',
				opacity : 1,
				transition : '0.3s',
				scrolllock : true,
				autoopen : true
			});
		} else {
			$('#login').popup({
				color : 'white',
				opacity : 1,
				transition : '0.3s',
				scrolllock : true
			});
		}
		// 로그인
		$("#btnLogin").click(function() {
			var adminId = $("#adminId").val();
			var adminPw = $("#adminPw").val();
			if (adminId == "") {
				alert("아이디를 입력하세요.");
				$("#adminId").focus();
				return;
			}
			if (adminPw == "") {
				alert("비밀번호를 입력하세요.");
				$("#adminPw").focus();
				return;
			}
			// 폼 내부의 데이터를 전송할 주소
			document.loginform.action = "login.admin"
			// 제출
			document.loginform.submit();
		});
	});
</script>
<style type="text/css">
.inputarea {
	width: 100%;
	border-radius: 4px;
	border: 2px solid #989898;
	color: #989898;
	padding: 5px;
}

#cd-lateral-nav .item-has-children>a::after {
	content: '';
	display: block;
	height: 11px;
	width: 8px;
	position: absolute;
	top: 50%;
	bottom: auto;
	-webkit-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	-o-transform: translateY(-50%);
	transform: translateY(-50%);
	right: 1em;
	background: url("/searchBang/img/admin/cd-arrow.svg") no-repeat center
		center;
	background-size: 8px 11px;
	-webkit-transition-property: -webkit-transform;
	-moz-transition-property: -moz-transform;
	transition-property: transform;
	-webkit-transition-duration: 0.2s;
	-moz-transition-duration: 0.2s;
	transition-duration: 0.2s;
}
</style>
<title>Notice List</title>
</head>
<body>
	<!-- 로그인실패 알터창 -->
	<c:if test="${msg == 'failure'}">
		<script type="text/javascript">
			alert("아이디 혹은 비밀번호를 틀렸습니다. 다시 로그인 해주세요.");
		</script>
	</c:if>
	<!-- 헤더  -->
	<header>
		<a id="cd-logo" href="index.admin"><img
			src="/searchBang/img/admin/logo.png" alt="Homepage"></a>
		<nav id="cd-top-nav">
			<ul>
				<li><c:choose>
						<c:when test="${loginId==null }">
							<a class="initialism login_open btn btn-success"
								href="login.admin">Login</a>
						</c:when>
						<c:otherwise>
							<a href="logout.admin" id="logoutbtn">Logout</a>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</nav>
		<a id="cd-menu-trigger" href="#0"><span class="cd-menu-text">Menu</span><span
			class="cd-menu-icon"></span></a>
	</header>
	<!-- 오른쪽메뉴 -->
	<nav id="cd-lateral-nav">
		<ul class="cd-navigation">
			<li class="item-has-children"><a href="#0">공지사항</a>
				<ul class="sub-menu">
					<li><a href="companyNoticeList.admin">업체공지사항</a></li>
					<li><a href="customerNoticeList.admin">고객공지사항</a></li>
				</ul></li>
			<li class="item-has-children"><a href="#0">업체관리</a>
				<ul class="sub-menu">
					<li><a href="companyApprove.admin">업체승인/거절</a></li>
					<li><a href="companyList.admin">업체리스트</a></li>
					<li><a href="companyStats.admin">업체통계</a></li>
				</ul></li>
			<li class="item-has-children"><a href="#0">고객관리</a>
				<ul class="sub-menu">
					<li><a href="customerList.admin">고객리스트</a></li>
					<li><a href="customerStats.admin">고객통계</a></li>
				</ul></li>
			<li><a href="salesStats.admin">매출통계</a></li>
			<li><a href="adminManagement.admin">관리자등록</a></li>
		</ul>
	</nav>
	<!-- 로그인 모달팝업 -->
	<div id="login">
		<h1>ADMIN LOGIN</h1>
		<form name="loginform" method="post">
			<table style="width: 300px;">
				<tr>
					<td><input name="adminId" id="adminId" class="inputarea"
						placeholder="ID"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><input type="password" name="adminPw" id="adminPw"
						placeholder="PASSWORD" class="inputarea"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>
						<button type="button" id="btnLogin" class="button"
							style="width: 100%;">LOGIN</button>
					</td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
</body>
</html>