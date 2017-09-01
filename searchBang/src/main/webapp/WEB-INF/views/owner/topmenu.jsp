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
<link rel="stylesheet" href="/searchBang/css/admin/reset.css?ver=1">
<link rel="stylesheet" href="/searchBang/css/admin/adminstyle.css">
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css">
<link rel="stylesheet" href="/searchBang/css/common/checkboxstyle.css">
<!-- Resource style -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script src="/searchBang/js/admin/main.js"></script>
<script src="/searchBang/js/admin/jquery.popupoverlay.js"></script>
<script src="/searchBang/js/owner/index.min.js"></script>
<script src="/searchBang/js/owner/cookie.js"></script>
<!-- paging Datatables -->
<script src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="/searchBang/js/common/jquery.datatables.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#login').popup({
			transition : 'all 0.3s',
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
<title></title>
</head>
<body>
	<!-- 로그인실패 알터창 -->
	<c:if test="${msg == 'failure'}">
		<script type="text/javascript">
			alert("이메일 혹은 비밀번호를 틀렸습니다. 다시 로그인 해주세요.");
			<%session.removeAttribute("msg");%>
		</script>
	</c:if>
	<c:if test="${msg == 'notYet'}">
		<script type="text/javascript">
			alert("승인 대기중인 이메일 입니다. 잠시 후 다시 시도해 주세요.");
			<%session.removeAttribute("msg");%>
		</script>
	</c:if>
	<c:if test="${msg == 'no'}">
		<script type="text/javascript">
			alert("승인 거절된 이메일 입니다. 자세한 사항은 전화로 문의주세요.");
			<%session.removeAttribute("msg");%>
		</script>
	</c:if>
	<div class="logo-header"> <!-- 50% 잘린 헤더 좌측에 고정될 로고 메뉴클릭시 로고 고정용 -->
	<a id="cd-logo" href="index.owner"><img src="/searchBang/img/admin/logo.png" alt="Homepage"></a>
	</div>
	<!-- 헤더  -->
	<header>
		
		<nav id="cd-top-nav">
			<ul>
				<li><c:choose>
						<c:when test="${loginId==null }">
							<a class="login_open">Login</a>
						</c:when>
						<c:otherwise>
							<a href="logout.owner" id="logoutbtn">Logout</a>
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
			<li><a href="noticeList.owner">공지사항</a></li>
			<li><a href="myPage.owner">마이페이지</a></li>
			<li><a href="accomManagement.owner">숙소관리</a></li>
			<li><a href="QnA.owner">1:1문의</a></li>
			<li><a href="#">이용가이드</a></li>
		</ul>
	</nav>

	<div id="login"
		style="background-color: white; padding: 30px; width: 330px; border: 3px solid #00a699; border-radius: 5px;"
		class="checks etrans">
		<form class="login-form" id="loginForm" name="loginForm"
			action="loginProc.owner" method="post">

			<p style="font-size: 35px; font-weight: bold;">사장님 로그인</p><br/>
			<table style="width: 300px">
				<tr>
					<td style="font-size: 13px; padding-left: 20px;">이메일</td>
				</tr>
				<tr height="50px;">
					<td colspan="2"><input type="text" class="input-type" name="loginEmail" style="width: 90%; height: 30px;"></td>
				</tr>
				<tr>
					<td style="font-size: 13px; padding-left: 20px;">비밀번호</td>
				</tr>
				<tr height="50px;">
					<td colspan="2"><input type="password" class="input-type" name="loginPass" style="width: 90%; height: 30px;"></td>
				</tr>
				<tr height="30px;">
					<td style="padding-right: 10px;"><input type="checkbox" id="divECI_ISDVSAVE"
						name="divECI_ISDVSAVE" /> <label for="divECI_ISDVSAVE">아이디
							저장</label></td>
					<td style="text-align: right; font-size: 13px; padding-right: 30px;"><a href="#">비밀번호 찾기</a></td>
				</tr>
				<tr height="30px;">
					<td><input id="login-btn" type="button" value="로그인"
						onclick="sendit()" class="button" style="width: 95%"></td>
					<td style="padding-right: 30px; text-align: right;"><input id="join-btn" type="button" value="회원가입"
						onclick="javascript:self.location='newCompanyJoin.owner';"
						class="button" style="width: 95%"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>