<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/searchBang/js/user/certify.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="IDcertify" id="IDcertify" method="post">
		<table border="1">
			<tr align="center">
				
				<td colspan="2">
					<input type="text" name="idfield" id="idfield" size="25" maxlength="40" value="${email }" placeholder="이메일을 입력해 주세요">
				</td>
				<td rowspan="2" align="center">
					<input type="button" value="인증하기" onclick="Start()" class="button">
				</td>
				
			</tr>
			<tr align="center">
				<td colspan="2"><div id="idCheckfield">&nbsp;</div></td>
			</tr>
			<tr align="center">
				<td><input type="text" name="certify" id="certify" size="25" placeholder="인증번호를 입력해 주세요"></td>
				<td><div id="ViewTimer"></div>
				<td align="center">
					<input type="button" value="다음" id="approval" class="button" style="padding: 5px 32px;">
				</td>
			</tr>
		</table>
		<input type="text" name="secret_ceritify" id="secret_ceritify" value="">
	</form>
</body>
</html>