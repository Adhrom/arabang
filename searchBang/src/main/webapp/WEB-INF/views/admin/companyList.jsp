<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<link rel="stylesheet" href="/searchBang/css/admin/tablestyle.css">
<title>Company List</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 800px; margin: 0 auto;">
		<h1>CompanyList</h1>
		<hr />
		<br />
		<form name="approve" method="post">
			<input type="hidden" name="ownerEmail" id="hiddenOwnerEmail">
			<table id="admintable">
				<tr class="admintr">
					<th class="adminth" style="border-right: 2px solid white;">EMAIL</th>
					<th class="adminth" style="border-right: 2px solid white;">이름</th>
					<th class="adminth" style="border-right: 2px solid white;">전화번호</th>
					<th>&nbsp;</th>
				</tr>
				<c:forEach var="row" items="${list }">
					<tr class="adminList">
						<td class="admintd">${row.ownerEmail}</td>
						<td class="admintd">${row.ownerName}</td>
						<td class="admintd">${row.ownerPhone}</td>
						<td class="admintd">상세보기</td>
					</tr>
				</c:forEach>
				<tr style="border-top: 2px solid #00a699;">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>