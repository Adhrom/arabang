<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/searchBang/js/user/certify.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/searchBang/css/user/joinCertify.css">
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css">
<script type="text/javascript">
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
	<div id="joinCertify">
		<form name="IDcertify" id="IDcertify" method="post">
			<table>
				<tr>
					<th colspan="2">본인인증</th>
				</tr>
				<tr align="center">

					<td><input type="text" name="idfield" id="idfield"
						maxlength="40" value="${email }" placeholder="이메일을 입력해 주세요">
					</td>
					<td align="center"><input type="button" value="인증하기"
						onclick="Start()" class="button" id="emailCheckBt"></td>

				</tr>

				<tr>
					<td colspan="2"><input type="text" name="certify" id="certify"
						placeholder="인증번호를 입력해 주세요"></td>

				</tr>
				<tr>
					<td></td>
					<td><div id="ViewTimer"></div>
				</tr>


			</table>

			<input type="button" align="center" value="다음" id="approval"
				class="button"> <input type="text" name="secret_ceritify"
				id="secret_ceritify" value="" style="display: none;">
		</form>
	</div>
</body>
</html>
