<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/searchBang/css/owner/owner_mypage.css?ver=1">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
	<script type="text/javascript">
	function roomU(room_no) {
		location.href="addedRoom.owner?room_no="+room_no;
	}
	function roomD(room_no) {
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
	<div class="cd-main-content" style="width: 1000px; margin: 50px auto;">
		<h1 id="owner-mypage-title1">&nbsp;&nbsp;방 관리</h1>
		<div id="question-mark">?</div>
		<h4 id="owner-mypage-title2">방에 대한 정보확인 및 등록,수정,삭제를 할 수 있습니다.</h4>
		<br />
		<hr class="hr-style" />
		<a href="addedRoom.owner" style="position: relative; left: 900px; top: -55px;"><button class="button">등록</button></a>
		<br />
		<c:if test="${size eq 0}">
			등록된 방이 없습니다 방을 등록해 주세요
		</c:if>
		<c:forEach items="${list }" var="row">
			<table>
				<tr>
					<td rowspan="4" style="vertical-align: bottom;"><img src="${row.roomimg1 }" height="250" width="350px"></td>
					<td style="height: 50px; vertical-align: middle; padding-left: 10px; font-size: 1.6em; font-weight: bold;">${row.roomType }</td>
				</tr>
				<tr>
					<td style="height: 50px; vertical-align: middle; padding-left: 10px;" >방갯수 : ${row.roomCount}</td>
				</tr>
				<tr>
					<td style="height: 50px; vertical-align: middle; padding-left: 10px;">사용 가능 최대 인원 : ${row.roomUsingPeople }</td>
				</tr>
				<tr>
					<td style="height: 50px; vertical-align: middle; padding-left: 5px;"><button type="button" onclick="roomU('${row.room_no}')"
							class="button">수정</button>
						<button type="button" onclick="roomD('${row.room_no}')"
							class="button">삭제</button>
					</td>
				</tr>
			</table>
			<br/>
		</c:forEach>
	</div>
</body>
</html>