<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="2">
<title>Insert title here</title>
<link rel="stylesheet" href="/searchBang/css/user/owner_join.css">
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
							<c:if test="${!nickname}">
								<td colspan="2"><input type="text" class="frmdate"
									id="ownerName" name="ownerName" value="${nickname }"></td>
							</c:if>
							<c:if test="${nickname }">
								<td colspan="2"><input type="text" class="frmdate"
									id="ownerName" name="ownerName" value="${nickname}"></td>
							</c:if>
						</tr>
						<tr>
							<td colspan="2" id="ownerNameP" class="label">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" class="label">&nbsp;&nbsp;이메일</td>
						</tr>
						<tr>
							<td style="width: 75%"><input type="email" class="frmdate"
								id="ownerEmail" name="ownerEmail" readonly="readonly" value="${email }"></td>
							<td style="width: 25%"><a
								class="initialism idchk_open btn btn-success"><button
										id="approvalbt" class="button" style="font-size: 12px;">인증하기</button></a></td>
						</tr>
						<tr>
							<td colspan="2" id="ownerEmailP" class="label">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" class="label">&nbsp;&nbsp;비밀번호</td>
						</tr>
						<tr>
							<td colspan="2"><input type="password" class="frmdate"
								id="ownerPw" name="ownerPw"></td>
						</tr>
						<tr>
							<td colspan="2" id="ownerPwP" class="label">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" class="label">&nbsp;&nbsp;비밀번호 확인</td>
						</tr>
						<tr>
							<td colspan="2"><input type="password" class="frmdate"
								id="ownerRePw" name="ownerRePw"></td>
						</tr>
						<tr>
							<td colspan="2" id="ownerRePwP" class="label">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" class="label">&nbsp;&nbsp;업체 대표 번호</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" class="frmdate"
								name="ownerPhone" id="ownerPhone"></td>
						</tr>
						<tr>
							<td colspan="2" id="ownerPhoneP" class="label">&nbsp;</td>
						</tr>
					</table>
					<table>
						<tr>
							<td align="left" width="50%"><button class="button"
									style="width: 95%;" id="back">이전</button></td>
							<td align="right" width="50%"><button class="button"
									type="button" id="next" style="width: 95%;">가입</button>
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
	<!-- 모달팝업 이메일인증 -->
	<div id="idchk">
		<div
			style="background-color: white; width: 500px; height: 500px; padding: 20px;">
			<jsp:include page="certify.jsp" flush="false" />
		</div>
	</div>
</body>
</html>