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
		url : "getCertificationNum.bang",
		success : function(data) {
			document.getElementById("secret_ceritify").value = data; // hidden 태그의 인증번호 셋팅
			$('#secret_certify_num').val(1);
		}
	});
};