<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/searchBang/css/user/userTop.css">
<title>Insert title here</title>
</head>
<body class="homepage">
	<div id="page-wrapper">
		<c:if test="${msg == 'fail' }">
			<script type="text/javascript">
				alert("아이디 혹은 비밀번호가 틀렸슴니다. 다시 로그인해 주세요");
			</script>
		</c:if>
		<div id="loginText">
			<ul style="list-style: none;">
				<li><c:choose>
						<c:when test="${msg == 'success' }">
							<button type="button" class="btn btn-info btn-lg"
								data-toggle="modal" onclick="location.href='logout.bang';">로그아웃</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-info btn-lg"
								data-toggle="modal" data-target="#myModal">로그인</button>
						</c:otherwise>
					</c:choose>
			</ul>
		</div>
		<!-- Header -->

		<div id="header-wrapper">

			<div id="header">

				<!-- Logo -->
				<h1>
					<a href="http://localhost:8080/searchBang/index.bang">알아방</a>
				</h1>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a
							href="http://localhost:8080/searchBang/index.bang">알아방으로 알아봐!</a></li>
						<li><a href="userInfo.bang">마이페이지</a></li>
						<li><a href="left-sidebar.html">예약내역</a></li>
						<li><a href="no-sidebar.html">공지사항</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
<div class="modal fade" id="myModal" role="dialog">
	<div id="loginpopup" class="loginpopup" style="margin-top: 200px;">
		<jsp:include page="login.jsp"></jsp:include>
	</div>
</div>
</html>