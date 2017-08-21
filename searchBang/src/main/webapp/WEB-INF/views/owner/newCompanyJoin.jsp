<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/searchBang/css/owner/newCompanyJoin.css">
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css">
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 -->

	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 1000px; margin: 0 auto;">
		<div id="welcomeJoin">
			<h4 id="title-a">알아방 가족이 되어주세요</h4>
			<b id="title-b">알아방 가족 신청 페이지</b>

			<div id="join">
				<ul>
					<li id="newJoin">신규 업체 가입</li>
					<li class="joinMent">간편한 회원가입으로 내 업체 관리 바로바로 손쉽게!</li>
					<li class="joinMent">리뷰관리, 서비스통계, 매출관리등의 다양한 혜택들을 살펴보세요.</li>
				</ul>
					<div style="width: 300px; margin: 0 auto;">
					<a href="ownerReg1.owner"><button class="button">가입하기</button></a>
					</div>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
</html>