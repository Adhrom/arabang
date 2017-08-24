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
	function roomU(room_no) {
		location.href="addedRoom.owner?room_no="+room_no;
	}
	function roomD(roo_no) {
		if (confirm("삭제하시겠습니까?") == true) {
			location.href="deleteRoom.owner?room_no="+room_no;
		} else {
			return;
		}
	}
</script>
<title>방 관리</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 1000px; margin: 0 auto;">
		<h1>방 관리</h1><span><a href="addedRoom.owner"><button class="button">등록</button></a></span>
		<hr />
		<br />
		<c:if test="${size eq 0}">
			등록된 방이 없습니다 방을 등록해 주세요
		</c:if>
		<c:forEach items="${list }" var="row">
			<table>
				<tr>
					<td rowspan="4"><img src="${row.roomimg1 }"></td>
					<td>${row.roomType }</td>
				</tr>
				<tr>
					<td>${row.roomCount }</td>
				</tr>
				<tr>
					<td>${row.roomUsingPeople }</td>
				</tr>
				<tr>
					<td><button type="button" onclick="roomU('${row.room_no}')"
							class="button">수정</button>
						<button type="button" onclick="roomD('${row.room_no}')"
							class="button">삭제</button>
					</td>
				</tr>
			</table>
		</c:forEach>
	</div>
</body>
</html>