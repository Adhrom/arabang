function loginProc(){
	var emailval = $("#login-userId").val();
	var passwordval = $("#login-userPw").val();
	$.ajax({
		data : {
			email : emailval,
			password : passwordval
		},
		type : "POST",
		url : "loginProc.bang"
	});
}
$(document).ready(function(){
	$("#login-userId").focus();
	$("#login-userId").focus(function(){
		$(this).css("background-color","#aaccff");
	});
	$("#login-userId").blur(function(){
		$(this).css("background-color","white");
	});
	$("#login-userPw").focus(function(){
		$(this).css("background-color","#aaccff");
	});
	$("#login-userPw").blur(function(){
		$(this).css("background-color","white");
	});
});