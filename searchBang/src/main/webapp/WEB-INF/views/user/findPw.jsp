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
		<div id="explain">
			<p class="pw-title" align="center">비밀번호 찾기</p>
		</div>
		<form method="post" id="certiform" name="certiform">
			<div class="input-box">
				<input class="input-style" type="text" id="Find-id" name="Find-id" placeholder="이메일 인증을 먼저 해주세요" readonly="readonly"> 
				<input class="btn-style certify_open" type="button" id="sendEmail" value="이메일 인증">
				<input class="input-style" type="text" id="Find-name" name="Find-name" placeholder="이름을 입력해 주세요">
				<input class="btn-style" type="button" id="Find-pw" value="다음" onclick="certifyCheck()">
				<input type="hidden" name="secret_certify_num" id="secret_certify_num" value="">
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
			var v1 =  $('input[id="certify"]').parent().parent().find('input[type="text"]').val(); // 값이 안넘어와서 좀복잡하게 처리
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
			else {
				alert("인증이 성공되었습니다");
				$('#secret_certify_num').val(1); // 인증여부확인 변수 체크, 
				$('#Find-id').val($('#idfield').val());
				var bt = document.getElementById('approval');
				bt.disabled = 'disabled';
				$('#certify').popup('hide');
			}
		});
      
      // 인증여부 확인 & 닉네임 입력 안했을때
      function certifyCheck(){
    	  if($("#Find-name").val() == ""){
         	 alert("이름/닉네임을 입력해 주세요");
         	 $("#Find-name").focus();
         	 return ;
          }
    	  
    	  else if($("#secret_certify_num").val() != 1){
    		  alert("인증이 되지 않았습니다. 다시 시행해 주세요");
    		  return ;
    	  }
    	  else{
    		  document.certiform.action = "existAccount.bang"
    		  document.certiform.submit();
    	  }
      }
   </script>
</body>
</html>