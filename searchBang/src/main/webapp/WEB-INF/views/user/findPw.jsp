<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/searchBang/css/user/findPw.css">
<title>Insert title here</title>
</head>
<body class="top-section">
<header>
<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
</header>
	<div class="findpw-page-section" style="width: 800px; margin: 0 auto;">
	<input type="hidden" id="checkVal" name="checkVal" value="0">
	<div id="explain" align="center"><p class="pw-title">이메일 인증</p></div>
	<form action="existAccount.bang" method="post">
		<div class="input-box">
		<input class="input-style" type="text" id="Find-id" name="Find-id" placeholder="이메일 인증을 먼저 해주세요">
		<input class="btn-style" type="button" id="sendEmail" onclick="openCertify()" value="이메일 인증하기">
		<input class="input-style" type="text" id="Find-name" name="Find-name" placeholder="이름을 입력해 주세요">
		<input class="btn-style" type="submit" id="Find-pw" value="인증확인">
		</div>
	</form>
	</div>
	<div class="bottom-section"></div>
	<!--  하단에 모달팝업이 뜨게 처리 -->
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
	
	<!-- 모달팝업 띄울곳 -->
	<div class="certify" id="open">
	 	<div><jsp:include page="certify.jsp" /></div>
	</div>
</body>
</html>