<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<div class="findpw-page-section">
		<input type="hidden" id="checkVal" name="checkVal" value="0">
		<div id="explain">
			<p class="pw-title" align="center">비밀번호 찾기</p>
		</div>
		<form action="existAccount.bang" method="post">
			<div class="input-box">
				<input class="input-style" type="text" id="Find-id" name="Find-id"
					placeholder="이메일 인증을 먼저 해주세요" readonly="readonly"> <input
					class="btn-style certify_open" type="button" id="sendEmail"
					value="이메일 인증"> <input class="input-style" type="text"
					id="Find-name" name="Find-name" placeholder="이름을 입력해 주세요">
				<input class="btn-style" type="submit" id="Find-pw" value="다음">
			</div>
		</form>
	</div>
	<div class="bottom-section"></div>
	<!--  하단에 모달팝업이 뜨게 처리 -->
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>

	<!-- 모달팝업 띄울곳 -->
	<div class="certify" id="certify">
		<div><jsp:include page="certify.jsp" /></div>
	</div>
	<script>
      $(document).ready(function() {
         $('.certify').popup({
            transition : 'all 0.3s'
         });
      });
      $('#approval').click(function() {
			var v1 = $("#certify").val();
			var v2 = $("#secret_ceritify").val();
			var email = $('#idfield').val();
			if (email == "") {
				alert("이메일을 입력해 주세요.");
				return false;
			}
			if (v1 != v2) {
				alert("인증번호가 다릅니다 올바른 인증번호를 입력해주세요.");
				return false;
			}
			$('#ownerEmail').val($('#idfield').val());
			var bt = document.getElementById('approvalbt');
			bt.disabled = 'disabled';
			$('#idchk').popup('hide');
		});
   </script>
</body>
</html>