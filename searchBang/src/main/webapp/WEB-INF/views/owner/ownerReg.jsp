<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="/searchBang/css/owner/owner_style.css">
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script src="/searchBang/js/admin/jquery.popupoverlay.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#idchk').popup({
			color : 'white',
			opacity : 1,
			transition : '0.3s',
			scrolllock : true
		});
		$('#back').click(function() {
			history.go(-1);
		});
		$('#next').click(function() {
			var regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
			var ownerName = $('#ownerName').val();
			var ownerPw = $('#ownerPw').val();
			var ownerRePw = $('#ownerRePw').val();
			if (ownerName == "") {
				$('#ownerNameP').css("color", "red");
				$("#ownerNameP").text("이름을 입력해주세요.");
				$("#ownerName").focus();
				return;
			} else {
				$("#ownerNameP").text("　");
			}
			if (ownerPw == "") {
				$('#ownerPwP').css("color", "red");
				$("#ownerPwP").text("비밀번호를 입력해주세요.");
				$("#ownerPw").focus();
				return;
			} else {
				$("#ownerPwP").text("　");
			}
			if (ownerRePw == "") {
				$('#ownerRePwP').css("color", "red");
				$("#ownerRePwP").text("비밀번호를 입력해주세요.");
				$("#ownerRePw").focus();
				return;
			} else {
				$("#ownerRePwP").text("　");
			}
			if (ownerRePw != ownerPw) {
				$('#ownerRePwP').css("color", "red");
				$("#ownerRePwP").text("비밀번호가 다릅니다 확인해주세요.");
				$("#ownerRePw").focus();
				return;
			} else {
				$("#ownerRePwP").text("　");
			}
			if (!regExp.test($('#ownerPhone').val())) {
				$("#ownerPhoneP").css("color", "red");
				$("#ownerPhoneP").text("잘못된 전화번호 입니다 '-'를 포함한 숫자만 입력해주세요.");
				$("#ownerPhone").focus();
				return;
			} else {
				$("#ownerPhoneP").text("　");
			}

			document.regOwner.action = "insertOwner.owner";
			document.regOwner.submit();
		});
	});
</script>
</head>
<body>
	<!-- 헤더 -->
	<header id="header">
		<jsp:include page="nav.jsp" flush="false"></jsp:include>
	</header>
	<!-- 메인콘텐츠 -->
	<section class="section"
		style="margin-top: 20px; width: 800px; margin-left: auto; margin-right: auto;">
		<h4 id="title-a">알아방 가족이 되어주세요</h4>
		<b id="title-b">알아방 가족 신청 페이지</b>

		<!-- 똥그라미 랑 작때기 -->
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
							<td colspan="2"><input type="text" class="frmdate"
								id="ownerName" name="ownerName"></td>
						</tr>
						<tr>
							<td colspan="2" id="ownerNameP">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" class="label">&nbsp;&nbsp;이메일</td>
						</tr>
						<tr>
							<td style="width: 75%"><input type="email" class="frmdate"
								id="ownerEmail" name="ownerEmail"></td>
							<td style="width: 25%"><a
								class="initialism idchk_open btn btn-success"><button
										class="button" style="font-size: 12px">인증하기</button></a></td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" class="label">&nbsp;&nbsp;비밀번호</td>
						</tr>
						<tr>
							<td colspan="2"><input type="password" class="frmdate"
								id="ownerPw" name="ownerPw"></td>
						</tr>
						<tr>
							<td colspan="2" id="ownerPwP">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" class="label">&nbsp;&nbsp;비밀번호 확인</td>
						</tr>
						<tr>
							<td colspan="2"><input type="password" class="frmdate"
								id="ownerRePw" name="ownerRePw"></td>
						</tr>
						<tr>
							<td colspan="2" id="ownerRePwP">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" class="label">&nbsp;&nbsp;업체 대표 번호</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" class="frmdate"
								name="ownerPhone" id="ownerPhone"></td>
						</tr>
						<tr>
							<td colspan="2" id="ownerPhoneP">&nbsp;</td>
						</tr>
					</table>
					<table>
						<tr>
							<td align="left" width="50%"><button class="button"
									style="width: 95%;" id="back">이전</button></td>
							<td align="right" width="50%"><button class="button"
									type="button" id="next" style="width: 95%;">다음</button>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</section>
	<!-- 푸터 -->
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
	<!-- 모달팝업 이메일인증 -->
	<div id="idchk"></div>
</body>
</html>