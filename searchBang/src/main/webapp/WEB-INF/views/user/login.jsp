<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
   src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
   charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://apis.google.com/js/api:client.js"></script>
<script type="text/javascript">
	function loginProc(){
		var emailval = $("#login-userId").val();
		var passwordval = $("#login-userPw").val();
		document.getElementById("test11").innerHTML = emailval +"//"+ passwordval;
		$.ajax({
			data : {
				email : emailval,
				password : passwordval
			},
			type : "POST",
			url : "loginProc.bang",
			success : function(data){
				document.getElementById("test22").innerHTML = data
			},
			error : function(request,status,error){
				document.getElementById("test11").innerHTML
						= "code:"+request.status+"\n"
						+"message:"+request.responseText+"\n"
						+"error:"+error;
			}
		});
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login View</title>
<!-- HTTPS required. HTTP will give a 403 forbidden response -->
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/searchBang/css/user/style.css" />
</head>
<body>

   <h1 class="title">회원가입</h1>
   <form class="login-form">
      <div id="login-box">
         <h3 class="login-title">회원로그인</h3>

         <h4 class="input-txt">이메일</h4>
         <div id="input-box">
            <input type="text" class="input-type" name="login-userId" id="login-userId">
         </div>

         <h4 class="input-txt">비밀번호</h4>
         <div id="input-box">
            <input type="password" class="input-type" name="login-userPw" id="login-userPw">
         </div>

         <input type="checkbox" id="divECI_ISDVSAVE" /><label
            for="divECI_ISDVSAVE">아이디 저장</label>

         <div id="remember-txt-sector">
            <h4 id="pwd-search">
               <a href="#">비밀번호 찾기</a>
            </h4>
         </div>
         <input id="login-btn" type="button" value="로그인" onclick="loginProc();"> 
         <input id="join-btn" type="button" value="회원가입" onclick="location.href='userReg.bang';"><br />
         <!--  -->
         <div id="kakao-login-btn"></div>
         <!-- naver -->
         <div id="naver_id_login"></div>
         <!-- facebook -->
         <div id="fb-root"></div>
         <div class="fb-login-button" data-max-rows="1" data-size="large"
            data-button-type="login_with" data-show-faces="false"
            data-auto-logout-link="false" data-use-continue-as="false"></div>
         <!-- data-auto-logout-link  = false 로 해야 login / logout 체인지 x-->
         <div id="test1" style="display: none"></div>
         <!-- 로그인 했을때 정보가 나오게 하는 div태그 지워도 상관 x -->
         <!-- google -->
         <div id="gSignInWrapper">
            <span class="label" style="display:none">구글 연동:</span>
            <div id="customBtn" class="customGPlusSignIn">
               <span class="icon" ></span> <span class="buttonText">Google 계정으로 로그인하기</span>
            </div>
         </div>
		<div id="test11"></div>
		<div id="test22"></div>
         <script>
      function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
          console.log('User signed out.');
          document.getElementById('name').innerText = "";
          document.getElementById('id').innerText = "";
          document.getElementById('email').innerText = "";
       
        });
         
      }
      

      </script>
         <script>startApp();</script>


      </div>
   </form>
</body>
<script type="text/javascript">
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
         document.getElementById('test1').innerHTML = 'please log'
               + 'into this app';
      } else {
         // fb 로그인 되어있찌 않음, 따라서 앱에 로그인 되어있는지 여부가 불확실
         document.getElementById('test1').innerHTML = 'please log'
               + 'into facebook';
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
         document.getElementById('test1').innerHTML = nickname + " : "
               + email; // 테스트 구문..
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
         //location.href = "sendInfo.bang";
      });
   }

   // Google login Script part..
   
   var googleUser = {};
  var startApp = function() {
    gapi.load('auth2', function(){
      // Retrieve the singleton for the GoogleAuth library and set up the client.
      auth2 = gapi.auth2.init({
        client_id: '524101724465-q405ponbf5i6ef0hdrcr52qcfm82njv2.apps.googleusercontent.com',
        cookiepolicy: 'single_host_origin',
        // Request scopes in addition to 'profile' and 'email'
        //scope: 'additional_scope'
      });
      attachSignin(document.getElementById('customBtn'));
    });
  };

  function attachSignin(element) {
    console.log(element.id);
   
    auth2.attachClickHandler(element, {},
        function(googleUser) {
       var profile = googleUser.getBasicProfile();
      // The ID token you need to pass to your backend:
      var id_token = googleUser.getAuthResponse().id_token;
   
      document.getElementById('name').innerText = "이름 : " +
        profile.getName()+"님 로그인을 환영합니다!";
       document.getElementById('id').innerText = "아이디 : " +
        profile.getId();
         document.getElementById('email').innerText = "이메일 : " +
       profile.getEmail();
         
         
      alert("로그인 성공");
      // w = location.href = 'http://localhost:8080/AjaxEx/room_information.jsp';

      //googleUser은 사용자 정보가 담겨진 객체
      //login.aspx 에서 googleUser로 받은 사용자 정보를 조회해서 가입이 되어 있으면 로그인, 가입이 되어 있지 않으면 회원가입 페이지로 이동한다, 그리고 토큰값에 대한 검증을 한다.
      $.post("/response.jsp", { "userid": profile.getId(), "email": profile.getEmail(), "username": profile.getName(), "fbaccesstoken": id_token },
      function (responsephp) {
         if (responsephp == "login") {
            //로그인 성공시 login.aspx에서 로그인 처리를 해 준 후 URL로 이동한다.
            alert("성공");
            location.href = 'http://localhost:8080/AjaxEx/room_information.jsp';
            
         } else if (responsephp == "signup") {
            //회원의 정보(토큰,아이디,이름)은 쿠키나 파라미터로 넘겨서 회원가입 페이지에서 회원 정보를 이용해서 회원 등록을 진행한다.
            location.href = '회원 가입 URL';
         }
      });

        }, function(error) {
          alert(JSON.stringify(error, undefined, 2));
        });
  }
</script>
<style type="text/css">
#customBtn {
   display: inline-block;
   background: white;
   color: #444;
   width: 250px;
   border-radius: 5px;
   border: thin solid #888;
   box-shadow: 1px 1px 1px grey;
   white-space: nowrap;
}

#customBtn:hover {
   cursor: pointer;
}

span.label {
   font-family: serif;
   font-weight: normal;
}

span.icon {
   background: url('/searchBang/img/user/commonKXZUNFVY.jpg') transparent 5px 50% no-repeat;
   display: inline-block;
   vertical-align: middle;
   width: 42px;
   height: 42px;
}

span.buttonText {
   display: inline-block;
   vertical-align: middle;
   padding-left: 5px;
   padding-right: 42px;
   font-size: 14px;
   font-weight: bold;
   /* Use the Roboto font that is loaded in the <head> */
   font-family: 'Roboto', sans-serif;
}
</style>
</html>