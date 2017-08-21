<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="3">
<title>Insert title here</title>
<link rel="stylesheet" href="owner_join.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	function changeView(value) {
		if (value == "0") {
			location.href = "owner_index.jsp";
		} else if (value == "4") {
			location.href = "owner_index.jsp?contentPage=owner_join2.jsp";
		}
	}
	function idCheck(email) {
		if (email.value.length == 0) {
			alert("이메일을 입력해 주세요.")
			email.focus();

		} else {
			url = "idcheck.jsp?id=" + id;
			window.open(url, "post", "width=300, height=150");
		}
	}
	function nextJoin() {

	}
</script>
</head>
<body>

	<section class="section"
		style="margin-top: 20px; width: 1000px; margin-left: auto; margin-right: auto;">
		<h4 id="title-a">알아방 가족이 되어주세요</h4>
		<b id="title-b">알아방 가족 신청 페이지</b>

		<div class="circle-wrapper">
			<div class="circle1"> <b> 1 </b>
			</div>
			<div class="circle2"> <b> 2 </b>
			</div>
			<div class="circle3"> <b> 3 </b>
			</div>

			<div class="line1"></div>
			<div class="line2"></div>
		</div>

		<div class="input-box">
			<input type="hidden" name="idCheckval" id="idCheckVal" value=0>
			<c:if test=""> <!-- 아이디 체크를 거쳤을 경우 세팅 될 값..? -->
				<input type="hidden" name="idCheckVal" id="idCheckVal" value="${CheckVal}"> 
			</c:if>		
			
			<input id="idchk-btn" type="submit" value="중복 확인" 
			onClick="idCheck(document.getElementById('email'));">
			
			<div class="input-box-value">
			 
			<b id="input-name-text">이름</b><br /> 
			<input class="input-value" type="text" name="name"
			 value="${nickname }"><br />
			 
			<b id="input-name-text">이메일</b><br /> 
			<input class="input-value"type="email" name="email" 
			id="email" value="${email }"><br />
			<b id="input-asterisk">*이메일 주소를 적어주세요.</b>
			 
			<b id="input-name-text">비밀번호</b><br />
			<input class="input-value" type="password" name="password"><br />
			<b id="input-asterisk">*영문,숫자,특수문자 6~20 자리로 입력해주세요.</b>
			 
			<b id="input-name-text">비밀번호 확인</b><br /> 
			<input class="input-value" type="password" name="repassword"><br />
			 
			<b id="input-name-text">업체 대표 번호</b><br /> 
			<input class="input-value" type="tel" name="phone"> 
			
			<input id="back-btn" type="button" name="back" value="이전"> 
			<input id="next-btn" type="submit" id="next" value="다음" onClick="changeView(4);">
			</div>
		</div>
	</section>
</body>
</html>