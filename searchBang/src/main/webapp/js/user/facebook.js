

$(document).ready(function(){

	$("#face-click").addClass("_5h0f _5h0o _5h0o _5h0c");
	$("#face-click").click(function(){
				//$(this).css("color","red");
				//$(this).text("버튼이 클릭되었습니다.");
				FB.login(function(response) {
					  if (response.status === 'connected') {
						  testAPI();
					  } else {
					    // The person is not logged into this app or we are unable to tell.
					  }
					});


	});
 });

//FaceBook login Script part..
function statusChangeCallback(response) {

	console.log('statusChangeCallback');
	console.log(response);
	// response 객체는 로그인 상태를 나타내줌
	// 앱에서 현재의 로그인 상태에 따라 동작
	// FB.getLoginStatus(). 의 레퍼런스에서 더 자세한 내용이 참조 가능

	if (response.status === 'connected') {
		// 사용자가 Facebook에 로그인하고 앱에 로그인했습니다.
		//  testAPI();



	} else if (response.status === 'not_authorized') {
		// 사용자가 Facebook에는 로그인했지만 앱에는 로그인하지 않았습니다.


	} else {
		// 'unknown' 사용자가 Facebook에 로그인하지 않았으므로 사용자가 앱에 로그인했거나
		// FB.logout()이 호출되었는지 알 수 없어, Facebook에 연결할 수 없습니다.


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
		appId : '1742557225789044',
		cookie : true,
		xfbml : true,
		version : 'v2.1'
	});

	// javascript sdk 를 초기화 했으니, FB.getLoginStatus() 를 호출
	// 이 함수는 이페이지의 사용자가 현재 로그인 되어있는 상태 3가지 중 하나를 콜백에 리턴함.
	// 그 3가지 상태는 아래와 같다.


	// 'connect', 'not_authorized', 페이스북에 로그인이 되어있지 않아서 앱에 로그인이 되었는 지 불확실..

	// 위에서 구현한 콜백 함수는 이 3가지를 다루도록 되어있다...

	/* FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	}); */

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
	js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.10&appId=1742557225789044";
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

		location.href= "sendInfo.bang" ;
	});
}

