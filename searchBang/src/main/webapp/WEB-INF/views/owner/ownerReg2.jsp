<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ARA 가족신청</title>
<link rel="stylesheet" href="/searchBang/css/owner/owner_style.css">
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#idchk').popup({
			transition : 'all 0.3s'
		});
		$('#back').click(function() {
			history.go(-1);
		});
		$('#next').click(function() {
			var regExp = /^\d{2,4}-\d{3,4}-\d{4}$/;
			var ownerName = $('#ownerName').val();
			var ownerEmail = $('#ownerEmail').val();
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
			if (ownerEmail == "") {
				$('#ownerEmailP').css("color", "red");
				$("#ownerEmailP").text("이메일 인증을 해주세요.");
				return;
			} else {
				$("#ownerEmailP").text("　");
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
	});

	//이메일인증

	var bubblingClickFlag = false;
	var SetTime = 300; // 최초 설정 시간(기본 : 초)

	// 시간설정 함수
	function msg_time() {
		m = Math.floor(SetTime / 60) + " : " + (SetTime % 60) + " 초";
		var msg = "<font color='red'>" + m + "</font>";
		document.all.ViewTimer.innerHTML = msg; // div 영역에 보여줌
		SetTime--; // 1초씩 감소
		if (SetTime < 0) { // 시간이 종료 되었을때
			clearInterval(tid); // 타이머 해제

			// div 태그 에 다른 메시지 출력
			document.all.ViewTimer.innerHTML = "<font color = red > 시간초과 </font>";
			// 다시 버튼을 눌렀을때, 시간이 돌아감과 동시에 임의의 문자를 새로생성해야함
			// 만들어야함
		}
	}

	// 중복클릭 방지
	function bubblingClickChecking() {
		if (bubblingClickFlag) // true
			return bubblingClickFlag;
		else { // false
			bubblingClickFlag = true;
			return false;
		}
	}

	// 실제로 타이머가 돌아가는 함수
	function Start() {
		var email = $('#idfield').val();
		if (email == "") {
			alert("이메일을 입력해 주세요.");
			return false;
		}
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if (!regExp.test($('#idfield').val())) {
			alert("올바른 이메일을 적어주세요.");
			return false;
		}
		var input = $('input[id="idfield"]').parent().parent().find(
				'input[type="text"]').val();
		if (bubblingClickChecking())
			return;
		tid = setInterval('msg_time()', 1000)

		$.ajax({
			data : {
				idfield : input
			}, // key : value
			url : "getCertificationNum.owner",
			success : function(data) {
				document.getElementById("secret_ceritify").value = data; // hidden 태그의 인증번호 셋팅
			}
		});
	};

	// 아이디 실시간 검증
	function checkID() {
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		// var x = document.getElementById("idfield").val();
		if (!regExp.test($('#idfield').val())) {
			var message = "<font color = red>" + "올바른 이메일을 적어주세요." + "</font>";
			document.getElementById("idCheckfield").innerHTML = message;
			return false;
		}
		var input = $('input[id="idfield"]').parent().parent().find(
				'input[type="text"]').val();
		$
				.ajax({
					data : {
						idfield : input
					},
					type : "get",
					url : "checkId.owner",
					success : function(data) {
						if (data == "1") {
							var message = "<font color = red>"
									+ "사용할 수 없는 아이디 입니다" + "</font>";
							document.getElementById("idCheckfield").innerHTML = message;
						} else if (data == "0") {
							var message = "<font color = blue>"
									+ "사용할 수 있는 아이디 입니다" + "</font>";
							document.getElementById("idCheckfield").innerHTML = message;
						}
					}
				});
	}
</script>
</head>
<body>
	<!-- 헤더 -->

	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>

	<!-- 메인콘텐츠 -->
	<div class="cd-main-content" style="width: 1000px; margin: 0 auto;">
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
							<c:if test="${!name}">
								<td colspan="2"><input type="text" class="frmdate"
									id="ownerName" name="ownerName" value=""></td>
							</c:if>
							<c:if test="${name }">
								<td colspan="2"><input type="text" class="frmdate"
									id="ownerName" name="ownerName" value="${name}"></td>
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
								id="ownerEmail" name="ownerEmail" readonly="readonly"></td>
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
									type="button" id="next" style="width: 95%;">다음</button>
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