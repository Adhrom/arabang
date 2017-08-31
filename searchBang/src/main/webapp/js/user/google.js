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
   
      //googleUser은 사용자 정보가 담겨진 객체
      //login.aspx 에서 googleUser로 받은 사용자 정보를 조회해서 가입이 되어 있으면 로그인, 가입이 되어 있지 않으면 회원가입 페이지로 이동한다, 그리고 토큰값에 대한 검증을 한다.
      $.post("/response.jsp", { "userid": profile.getId(), "email": profile.getEmail(), "username": profile.getName(), "fbaccesstoken": id_token },
      function (responsephp) {
         if (responsephp == "login") {
            //로그인 성공시 login.aspx에서 로그인 처리를 해 준 후 URL로 이동한다.
            alert("성공");
            location.href = 'userReg.bang';
            
         } else if (responsephp == "signup") {
            //회원의 정보(토큰,아이디,이름)은 쿠키나 파라미터로 넘겨서 회원가입 페이지에서 회원 정보를 이용해서 회원 등록을 진행한다.
            location.href = '회원 가입 URL';
         }
      });

        }, function(error) {
          alert(JSON.stringify(error, undefined, 2));
        });
  }