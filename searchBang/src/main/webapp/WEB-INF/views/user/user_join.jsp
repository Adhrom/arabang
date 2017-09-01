<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 회원가입 페이지</title>
<link rel="stylesheet" href="/searchBang/css/user/owner_join.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#back').click(function() {
		history.go(-1);
	});
	$('#next').click(function() {
		var regExp = /^\d{2,4}-\d{3,4}-\d{4}$/;
		var userName = $('#userName').val();
		var userEmail = $('#userEmail').val();
		var userPw = $('#userPw').val();
		var userRePw = $('#userRePw').val();
		if (userName == "") {
			$('#userNameP').css("color", "red");
			$("#userNameP").text("이름을 입력해주세요.");
			$("#userName").focus();
			return;
		} else {
			$("#userNameP").text("　");
		}
		if (userEmail == "") {
			$('#userEmailP').css("color", "red");
			/* $("#userEmailP").text("이메일 인증을 해주세요"); */
			return;
		} 
		else {
			$("#ownerEmailP").text("　");
		}
		if (userPw == "") {
			$('#userPwP').css("color", "red");
			$("#userPwP").text("비밀번호를 입력해주세요.");
			$("#userPw").focus();
			return;
		} 
		else {
			$("#ownerPwP").text("　");
		}
		if (userRePw == "") {
			$('#userRePwP').css("color", "red");
			$("#userRePwP").text("비밀번호를 입력해주세요.");
			$("#userRePwP").focus();
			return;
		} 
		else {
			$("#userRePwP").text("　");
		}
		if (userRePw != userPw) {
			$('#userRePwP').css("color", "red");
			$("#userRePwP").text("비밀번호가 다릅니다 확인해주세요.");
			$("#userRePwP").focus();
			return;
		} else {
			$("#userRePwP").text("　");
		}
		if (!regExp.test($('#userPhone').val())) {
			$("#userPhoneP").css("color", "red");
			$("#userPhoneP").text("잘못된 전화번호 입니다 '-'를 포함한 숫자만 입력해주세요.");
			$("#ownerPhone").focus();
			return;
		} 
		else {
			$("#userPhoneP").text("　");
		}
		document.regOwner.action = "resistUser.bang"
  		document.regOwner.submit();
	});
});
</script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<!-- 메인콘텐츠 -->
	<div class="cd-main-content" style="width: 1000px; margin: 0 auto;">
		<h4 id="title-a">알아방 가족이 되어주세요</h4><br>
		<b id="title-b">알아방 가족 신청 페이지</b>

		<!-- 똥그라미 랑 작때기 -->
		<div class="circle-wrapper">
			
		</div>
		<!-- 똥그라미 랑 작때기 -->
		<div class="input-box">
			<!-- 정보입력칸 -->
			<div class="input-box-value">
				<form name="regOwner" method="post">
					<table>
						<tr>
							<td colspan="2" class="label">&nbsp;&nbsp;이름</td>
						</tr>
						<tr>
								<td colspan="2"><input type="text" class="frmdate" id="userName" name="userName" value="${nickname }"></td>
						</tr>
						<tr>
							<td colspan="2" id="userNameP" class="label">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" class="label">&nbsp;&nbsp;이메일</td>
						</tr>
						<tr>
							<td style="width: 75%"><input type="email" class="frmdate" id="userEmail" name="userEmail" readonly="readonly" placeholder="이메일인증을 먼저해주세요" value=""></td>
							<td style="width: 25%"><input class="btn-style certify_open" type="button" id="sendEmail" value="이메일 인증"></td>
						</tr>
						<tr>
							<td colspan="2" id="userEmailP" class="label">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" class="label">&nbsp;&nbsp;비밀번호</td>
						</tr>
						<tr>
							<td colspan="2"><input type="password" class="frmdate" id="userPw" name="userPw"></td>
						</tr>
						<tr>
							<td colspan="2" id="userPwP" class="label">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" class="label">&nbsp;&nbsp;비밀번호 확인</td>
						</tr>
						<tr>
							<td colspan="2"><input type="password" class="frmdate" id="userRePw" name="userRePw"></td>
							
						</tr>
						<tr>
							<td colspan="2" id="userRePwP" class="label">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" class="label">&nbsp;&nbsp;전화번호 입력</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" id="userPhone" name="userPhone"></td>
						</tr>
						<tr>
							<td colspan="2" id="ownerPhoneP" class="label">&nbsp;</td>
						</tr>
					</table>
					<table>
						<tr>
							<td align="left" width="50%"><button class="button" style="width: 95%;" id="back">이전</button></td>
							<td align="right" width="50%"><button class="button" type="button" id="next" style="width: 95%;">가입</button>
							<td><input type="hidden" name="secret_certify_num" id="secret_certify_num" value=""></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
	<!-- modal popup -->
	<div class="certify" id="certify">
		<div><jsp:include page="joinCertify.jsp" /></div>
	</div>
	<script type="text/javascript">
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
				$('#userEmail').val($('#idfield').val());
				var bt = document.getElementById('approval');
				bt.disabled = 'disabled';
				$('#certify').popup('hide');
			}
		});
      // 인증여부 확인 & 닉네임 입력 안했을때
      function certifyCheck(){
    	  if($("#userPw").val() == ""){
         	 alert("비밀번호를 입력해 주세요");
         	 $("#userPw").focus();
         	 return ;
          }
    	  else if($("#userRePw").val() == ""){
    		  alert("비밀번호확인을 입력해 주세요");
          	 $("#userRePw").focus();
    	  }
    	  else if($("#userPhone").val() == ""){
    		 alert("전화번호을 입력해 주세요");
           	 $("#userPhone").focus();
    	  } 
    	  else if($("#secret_certify_num").val() != 1){
    		  alert("인증이 되지 않았습니다. 다시 시행해 주세요");
    		  return ;
    	  }
      }
      </script>
</body>
</html>