<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/searchBang/css/admin/tablestyle.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<title>Notice List</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 800px; margin: 0 auto;">
		<h1>Notice List</h1>
		<hr />
		<br />
		<form name="conmpanyNoticeList" method="post" action="#">
			<table id="admintable">
				<tr class="admintr">
					<th class="adminth " style="border-right: 2px solid white;"
						width="100px;">NO.</th>
					<th class="adminth ">제목</th>
				</tr>
				<c:forEach var="row" items="${noticeList }">
					<tr>
						<td class="admintd">${row.notice_no }</td>
						<td class="admintd"><a
							href="noticeRead.owner?notice_no=${row.notice_no }">${row.subject}</a></td>
					</tr>
				</c:forEach>
				<tr style="border-top: 2px solid #00a699;">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
</body>
</html>