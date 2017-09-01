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
<title>review List</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 800px; margin: 0 auto;">
		<h1>review List</h1>
		<hr />
		<br />
	</div>
	<table>
		<tbody>
			<c:forEach var="row" items="${list }">
				<tr>
					<td>숙소번호${row.acoom_no }</td>
					<td>글쓴이${row.memberEmail }</td>
					<td><a href="deleteReview.admin?review_no=${row.rewvie_no }&declration=${param.declration}"><button>삭제</button></a>
					<c:if test="${param.declration =='y' }">
							<a href="cancelReview.admin?review_no=${row.review_no }&declration=${param.declration}"><button>취소</button></a>
						</c:if></td>
				</tr>
				<tr>
					<td colspan="3">${row.content }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>