<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	//이메일인증
	var bubblingClickFlag = false;
	var SetTime = 300; // 최초 설정 시간(기본 : 초)

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
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="IDcertify" id="IDcertify" method="post">
		<table border="1">
			<tr align="center">
				<td colspan="2"><input type="text" name="idfield" id="idfield"
					size="25" maxlength="40" oninput="checkID()"
					placeholder="이메일을 입력해 주세요"></td>
				<td rowspan="2" align="center"><input type="button"
					value="인증하기" onclick="Start()" class="button"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><div id="idCheckfield">&nbsp;</div></td>

			</tr>
			<tr align="center">
				<td><input type="text" name="certify" id="certify" size="25"
					placeholder="인증번호를 입력해 주세요" value=""></td>
				<td><div id="ViewTimer"></div>
				<td align="center"><input type="button" value="확인" id="approval" class="button" style="padding: 5px 32px;"></td>
			</tr>
		</table>
		<input type="hidden" name="secret_ceritify" id="secret_ceritify"
			value="">
	</form>
</body>
</html>