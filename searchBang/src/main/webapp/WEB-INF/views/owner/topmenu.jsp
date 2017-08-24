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
<script src="/searchBang/js/owner/index.min.js"></script>
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
			alert("아이디 혹은 비밀번호를 틀렸습니다. 다시 로그인 해주세요.");
		</script>
	</c:if>
	<!-- 헤더  -->
	<header>
		<a id="cd-logo" href="index.owner"><img
			src="/searchBang/img/admin/logo.png" alt="Homepage"></a>
		<nav id="cd-top-nav">
			<ul>
				<li><c:choose>
						<c:when test="${loginId==null }">
							<a href="ownerLogin.owner">Login</a>
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
			<li><a href="#0">마이페이지</a></li>
			<li><a href="accomManagement.owner">숙소관리</a></li>
			<li><a href="#">1:1문의</a></li>
			<li><a href="#">이용가이드</a></li>
		</ul>
	</nav>
</body>
</html>