<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="IDcertify" id="IDcertify" action="approval.owner" method="post" onsubmit="validate();">
		<table>
			<tr>
				<td colspan="2"><input type="text" name="idfield" id="idfield" size="25" maxlength="40" oninput="checkID()"  placeholder="아이디를 입력해 주세요"></td>
				<td rowspan="2" align="center"><input type="button" value="인증하기" onclick="Start()"></td>
			</tr>
			<tr>
				<td><div id="idCheckfield"></div></td>
				<td><div id="ViewTimer"></div>
			</tr>
			<tr>
				<td><input type="text" name="certify" id="certify" size="20" placeholder="인증번호를 입력해 주세요" value=""></td>
				<td><input type="hidden" name="secret_ceritify" id="secret_ceritify" value=""></td>
				<td><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
</body>
</html>