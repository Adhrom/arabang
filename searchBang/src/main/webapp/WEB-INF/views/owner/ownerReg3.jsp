<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/searchBang/css/owner/ownerReg3.css">
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ARA 가족신청</title>
</head>

<body>
	<!-- 헤더 -->

	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div id="cd-main-content">
			<!-- 메인콘텐츠 -->
		<div class="cd-main-content">

			<ul>
				<li id="title-a">알아방으로 다양한 혜택을 알아보세요</li>
				<li id="title-b">알아방 회원가입</li>
			</ul>

				<!-- 진행숫자 -->
			<div class="circle-wrapper">
				<div class="circle1">
					<b>1</b>
				</div>
				<div class="circle2">
					<b>2</b>
				</div>
				<div class="circle3">
					<b>3</b>
				</div>
				<div class="line1"></div>

				<div class="line2"></div>
			</div>

			<div id="welcome">
				<img id="commemoration" alt="웰컴이미지"
					src="/searchBang/img/owner/commemoration.png">

				<ul>
					<li class="text" id="success">가입이 성공적으로 완료되었습니다.</li>
					<li class="text" id="family">알아방의 가족이 되신것을 환영합니다.</li>
				</ul>
				<div style="width: 85px; margin: 0 auto;">
					<a href="index.owner"><button class="button">홈으로</button></a>
				</div>
				<br />
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>

</body>
</html>