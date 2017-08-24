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
<script type="text/javascript">
	function accomU(accom_no) {
		location.href="addedAccom.owner?accom_no="+accom_no;
	}
	function accomD(accom_no) {
		if (confirm("삭제하시겠습니까?") == true) {
			location.href="deleteAccom.owner?accom_no="+accom_no;
		} else {
			return;
		}
	}
</script>
<title>숙소 관리</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 1000px; margin: 0 auto;">
		<h1>숙소 관리</h1><span><a href="addedAccom.owner"><button class="button">등록</button></a></span>
		<hr />
		<br />
		<c:if test="${size eq 0}">
			등록된 방이 없습니다 방을 등록해 주세요
		</c:if>
		<c:forEach items="${list }" var="row">
			<table>
				<tr>
					<td rowspan="4"><img src="${row.accomimg1 }"></td>
					<td>${row.accomName }</td>
				</tr>
				<tr>
					<td>${row.accomAddress}&nbsp;${row.accomAddress2}</td>
				</tr>
				<tr>
					<td>${row.accomPhone }</td>
				</tr>
				<tr>
					<td><button type="button" onclick="accomU('${row.accom_no}')"
							class="button">수정</button>
						<button type="button" onclick="accomD('${row.accom_no}')"
							class="button">삭제</button>
					</td>
				</tr>
			</table>
		</c:forEach>
	</div>
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
</body>
</html>