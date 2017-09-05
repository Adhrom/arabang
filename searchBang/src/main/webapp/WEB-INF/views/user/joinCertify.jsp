

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/searchBang/js/user/certify.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/searchBang/css/user/joinCertify.css">
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css">



</head>
<body>
	<div id="joinCertify">
	<form name="IDcertify" id="IDcertify" method="post">
		<table>
			<tr>
				<th colspan="2">본인인증</th>
			</tr>
			<tr align="center">
				
				<td>
					<input type="text" name="idfield" id="idfield" maxlength="40" value="${email }" placeholder="이메일을 입력해 주세요">
				</td>
				<td align="center">
					<input type="button" value="인증하기" onclick="Start()" class="button" id="emailCheckBt">
				</td>
				
			</tr>
			
			<tr>
				<td colspan="2"><input type="text" name="certify" id="certify"placeholder="인증번호를 입력해 주세요"></td>
				
			</tr>
			<tr>			
			<td></td>
			<td><div id="ViewTimer"></div>
			</tr>

			
		</table>
	
		<input type="button" align="center" value="다음" id="approval" class="button">	
		<input type="text" name="secret_ceritify" id="secret_ceritify" value="" style="display: none;">
	</form>
	</div>
</body>
</html>
