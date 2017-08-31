<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색완료리스트</title>
</head>
<body>
	<c:forEach items="${list }" var="row">
		<table>
			<tr>
				<td rowspan="4" style="vertical-align: bottom;">
				<a href="roomManagement.owner?accom_no=${row.accom_no}">
				<img src="${row.accomimg1 }" height="330" width="466px"></a></td>
				<td style="height: 50px; vertical-align: middle; padding-left: 10px; font-size: 1.6em; font-weight: bold;">${row.accomName }</td>
			</tr>
			<tr>
				<td style="height: 50px; vertical-align: middle; padding-left: 10px;">${row.accomAddress}&nbsp;${row.accomAddress2}</td>
			</tr>
			<tr>
				<td style="height: 50px; vertical-align: middle; padding-left: 10px;">${row.accomPhone }</td>
			</tr>
			<tr>
				<td style="height: 50px; vertical-align: middle; padding-left: 5px;">
				<button type="button" onclick="accomU('${row.accom_no}')" class="button">수정</button>
				<button type="button" onclick="accomD('${row.accom_no}')" class="button">삭제</button></td>
			</tr>
		</table>
		<br />
	</c:forEach>
</body>
</html>