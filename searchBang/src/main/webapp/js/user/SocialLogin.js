// Kakao Login Script part..
Kakao.init("075f14a8a68560c031b7e0995d499666"); // (for kakao) 앱 생성해서 받은, javascript 키..
Kakao.Auth.createLoginButton({
	container : "#kakao-login-btn",
	success : function(res) {
		getKakaoUserProfile();
	},
	fail : function(err) {
		console.log(err); // 에러시 크롬 콘솔창(f12) 눌렀을때 하단에 있는 창에 뜸
	}
});

// 카카오톡으로부터 정보를 얻어오는 ....
function getKakaoUserProfile() {
	Kakao.API.request({
		url : "/v1/user/me",
		success : function(res) { // 연결 성공시 쓰일 콜백함수..
			var nickname = res.properties.nickname;
			var email = res.kaccount_email;
			$.ajax({
				type : "POST",
				url : "getInfo.bang",
				data : {
					"nickname" : nickname,
					"email" : email
				},
				dataType : "json"
			});
			location.href = "sendInfo.bang";
		} // end success
	});
}

// Naver Login Script part..

var naver_id_login = new naver_id_login("kXBtEL5qMwuVauovcqW0",
"http://localhost:8080/searchBang/naverLoginProc.bang"); // (for naver) 내가 앱 생성해서 받은 javascript client id  & callback url
naver_id_login.setButton("green", 3, 48); // 네이버의 경우 3번째 숫자만 바꾸면 크기가 알아서 줄어듭니다..
var state = naver_id_login.getUniqState();
naver_id_login.setDomain("http://localhost:8080/searchBang/"); // service url
naver_id_login.setState(state);
naver_id_login.setPopup();
naver_id_login.init_naver_id_login(); // setButton & init 두 함수가 있어야 버튼이 구현되는것 같음..


// FaceBook login Script part..
function statusChangeCallback(response) {
	console.log('statusChangeCallback');
	console.log(response);
	// response 객체는 로그인 상태를 나타내줌
	// 앱에서 현재의 로그인 상태에 따라 동작
	// FB.getLoginStatus(). 의 레퍼런스에서 더 자세한 내용이 참조 가능

	if (response.status === 'connected') {
		// fb을 통해 로그인이 되어있다.
		testAPI();
	} else if (response.status === 'not_authorized') {
		// fb 로그인 했으나, 앱에는 로그인 되어있지 않음.
		/* document.getElementById('test1').innerHTML = 'please log'
               + 'into this app'; */
	} else {
		// fb 로그인 되어있찌 않음, 따라서 앱에 로그인 되어있는지 여부가 불확실
		/* document.getElementById('test1').innerHTML = 'please log'
               + 'into facebook'; */
	}
}

// 이 함수는 누군가가 로그인 버튼에 대한 처리가 끝났을때 호출
function checkLoginState() {
	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});
}

window.fbAsyncInit = function() {
	FB.init({
		appId : '112623762774896',
		cookie : true,
		xfbml : true,
		version : 'v2.1'
	});

	// javascript sdk 를 초기화 했으니, FB.getLoginStatus() 를 호출 
	// 이 함수는 이페이지의 사용자가 현재 로그인 되어있는 상태 3가지 중 하나를 콜백에 리턴함.
	// 그 3가지 상태는 아래와 같다.

	// 'connect', 'not_authorized', 페이스북에 로그인이 되어있지 않아서 앱에 로그인이 되었는 지 불확실..

	// 위에서 구현한 콜백 함수는 이 3가지를 다루도록 되어있다...

	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});
};

// SDK를 비동기적으로 호출..

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.10&appId=112623762774896";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// 로그인이 성공한 다음에는 간단한 그래프 ㅇAPI를 호출, 
// 이 호출은 statusChangeCallback()에서 이루어짐..

function testAPI() {
	FB.api('/me', {
		fields : 'name,email'
	}, function(response) {
		var nickname = response.name;
		var email = response.email;

		// 여기까지 이메일 & 이름 가져오는건 성공함. 
		$.ajax({
			type : "POST",
			url : "getInfo.bang",
			data : {
				"nickname" : nickname,
				"email" : email
			},
			dataType : "json"
		});
		
	});
}