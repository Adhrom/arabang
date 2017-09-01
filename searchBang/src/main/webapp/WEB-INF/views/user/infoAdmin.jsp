<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/searchBang/css/user/infoAdmin.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="userTop.jsp" flush="false"></jsp:include>
	<div class="top-infoAdmin">

		<jsp:include page="userInfoTab.jsp" flush="false"></jsp:include>

		<div id="infoChange">

			<div id="infoAdmin-container">
				<div class="infoAdmin-title">개인정보 수정</div>
				<div class="container">
					<div class="left-name">
						<div class="input-name">닉네임</div>
						<input class="input-style" type="text" id="updateForm-id"
							name="updateForm-id" value="" readonly="readonly">
						<div class="input-name">비밀번호</div>
						<input class="input-style" type="password"
							id="updateForm-password" name="updateForm-password" value="">
						<div class="input-name">이메일</div>
						<input class="input-style" type="text" id="updateForm-nickname"
							name="updateForm-nickname" value="">
						<div class="input-name">휴대폰 번호</div>
						<input class="input-style" type="text" id="updateForm-phone"
							name="updateForm-phone" value="">

						<div id="info-btn-style">

							<input class="info-btn" type="button" onClick="" value="탈퇴하기">
							<input class="info-btn" type="submit" value="변경하기">
						</div>


					</div>


				</div>

			</div>
		</div>

	</div>

</body>
</html>