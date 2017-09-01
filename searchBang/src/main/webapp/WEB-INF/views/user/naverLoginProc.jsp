<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
var naver_id_login = new naver_id_login(); // 로그인 객체 할당
naver_id_login.get_naver_userprofile("naverSignInCallback()");
function naverSignInCallback() {
	var mailvalue = naver_id_login.getProfileData('email');
	var nicknamevalue = naver_id_login.getProfileData('nickname');
	/* alert(mailvalue);
	alert(nicknamevalue); */
	$.ajax({
		data : {
			email : mailvalue,
			nickname : nicknamevalue
		},
		type : "post",
		dataType : "json",
		url : "getInfo.bang"
	});
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
</html>