// Google login Script part..

var googleUser = {};
var startApp = function() {
	gapi
			.load(
					'auth2',
					function() {
						// Retrieve the singleton for the GoogleAuth library and
						// set up the client.
						auth2 = gapi.auth2
								.init({
									client_id : '524101724465-q405ponbf5i6ef0hdrcr52qcfm82njv2.apps.googleusercontent.com',
									cookiepolicy : 'single_host_origin',
								// Request scopes in addition to 'profile' and
								// 'email'
								// scope: 'additional_scope'
								});
						attachSignin(document.getElementById('customBtn'));
					});
};

function attachSignin(element) {
	console.log(element.id);

	auth2.attachClickHandler(element, {}, function(googleUser) {
		var profile = googleUser.getBasicProfile();
		// The ID token you need to pass to your backend:
		var id_token = googleUser.getAuthResponse().id_token;

		// googleUser은 사용자 정보가 담겨진 객체
		// login.aspx 에서 googleUser로 받은 사용자 정보를 조회해서 가입이 되어 있으면 로그인, 가입이 되어 있지
		// 않으면 회원가입 페이지로 이동한다, 그리고 토큰값에 대한 검증을 한다.

		$.ajax({
			type : "POST",
			url : "getInfo.bang",
			data : {
				"nickname" : profile.getName(),
				"email" : profile.getEmail()
			},
			dataType : "json"
		});
		location.href = "sendInfo.bang";

	}, function(error) {
		alert(JSON.stringify(error, undefined, 2));
	});
}