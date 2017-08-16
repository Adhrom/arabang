// 창이 띄워질때
window.onload = function(){
	if(getCookie("id")){
		document.loginForm.loginEmail.value = getCookie("id");
		document.loginForm.divECI_ISDVSAVE.checked = true;
	}
}
// 쿠키 세팅
function setCookie(name, value, expiredays){ // cookie save func
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path =/; expires=" + todayDate.toGMTString() + ";"
}
// 쿠키 가져오기
function getCookie(Name) {
	var search = Name + "=";
	if (document.cookie.length > 0) { // if there are any cookies
		offset = document.cookie.indexOf(search);
		if (offset != -1) {
			offset += search.length;
			end = document.cookie.indexOf(";", offset);
			if (end == -1)
				end = document.cookie.length;
			return unescape(document.cookie.substring(offset, end));
		}
	}
}
// 로그인 버튼 눌렀을때 검증
function sendit(){
	var frm = document.loginForm;
	if(!frm.loginEmail.value){
		alert("이메일을 입력 해 주세요!");
		frm.loginEmail.focus();
		return ;
	}
	if(!frm.loginPass.value){
		alert("비밀번호를 입력해 주세요!");
		frm.loginPass.focus();
		return ;
	}
	if(document.loginForm.divECI_ISDVSAVE.checked == true){
		setCookie("id",document.loginForm.loginEmail.value,7);
	}else{
		setCookie("id",document.loginForm.loginEmail.value,0);
	}
	document.loginForm.submit();
}