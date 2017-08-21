<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login View</title>
<!-- HTTPS required. HTTP will give a 403 forbidden response -->

</head>
<link rel="stylesheet" href="/searchBang/css/user/style.css" />
<body>

<h1 class="title">회원가입</h1>
<form class="login-form">
<div id="login-box">
<h3 class="login-title">회원로그인</h3>

<h4 class="input-txt">이메일</h4>
<div id="input-box">
<input type="text" class="input-type" name="login-userId">
</div>

<h4 class="input-txt">비밀번호</h4>
<div id="input-box">
<input type="password" class="input-type" name="login-userPw">
</div>

<input type="checkbox" id="divECI_ISDVSAVE" /><label for="divECI_ISDVSAVE">아이디 저장</label>

<div id="remember-txt-sector">
<h4 id="pwd-search"><a href="#">비밀번호 찾기</a></h4>
</div>
<input id="login-btn" type="button" value="로그인">
<input id="join-btn" type="button" value="회원가입"><br/>
<div id="kakao-login-btn"></div>
<div id="naver_id_login"></div>
</div>
</form>
</body>
<script type="text/javascript">

	// Kakao Login Script part..

	Kakao.init("075f14a8a68560c031b7e0995d499666"); // (for kakao) 앱 생성해서 받은, javascript 키..
	Kakao.Auth.createLoginButton({
		container : "#kakao-login-btn",
		success : function(res){
			getKakaoUserProfile();
		},
		fail : function(err){
			console.log(err); // 에러시 크롬 콘솔창(f12) 눌렀을때 하단에 있는 창에 뜸
		}
	});

	// 카카오톡으로부터 정보를 얻어오는 ....
	function getKakaoUserProfile(){
		Kakao.API.request({
			url : "/v1/user/me",
			success : function(res){ // 연결 성공시 쓰일 콜백함수..
				var nickname = res.properties.nickname;
				var email = res.kaccount_email;
				$.ajax({
					type : "POST",
					url : "kakaogetInfo.bang",
					data : {
							"nickname" : nickname,
							"email" : email
							},
					dataType : "json"
				});
				location.href="sendInfo.bang";
			} // end success
		});
	}

	// Naver Login Script part..

	var naver_id_login = new naver_id_login("kXBtEL5qMwuVauovcqW0", "http://localhost:8080/searchBang/naverLoginProc.bang");  // (for naver) 내가 앱 생성해서 받은 javascript client id  & callback url
	naver_id_login.setButton("green",3,48); // 네이버의 경우 3번째 숫자만 바꾸면 크기가 알아서 줄어듭니다..
	var state = naver_id_login.getUniqState();
	naver_id_login.setDomain("http://localhost:8080/searchBang/"); // service url
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login(); // setButton & init 두 함수가 있어야 버튼이 구현되는것 같음..


</script>
</html>