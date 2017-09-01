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
<title>Customer List</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 800px; margin: 0 auto;">
		<h1>Customer List</h1>
		<hr />
		<br />
		<table>
			<thead>
				<tr>
					<th>EMAIL</th>
					<th>NICKNAME</th>
					<th>PHONE</th>
					<th>POINT</th>
					<th>REGDATE</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list }">
					<tr>
						<td>${row.memberEmail }</td>
						<td>${row.memberNickname }</td>
						<td>${row.memberPhone }</td>
						<td>${row.point }</td>
						<td>${row.memberReg }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>