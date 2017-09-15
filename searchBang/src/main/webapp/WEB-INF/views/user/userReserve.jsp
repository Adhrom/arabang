<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<link rel="stylesheet" href="/searchBang/css/user/userReserve.css">
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약내역</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#insertReplyBT').click(function() {
		if ($('#content').val() == "") {
			alert("리뷰내용을 적어주세요");
			return false;
		}
		document.reviewform.action = "insertReview.bang";
		document.reviewform.submit();
	});
});
function cancelReservation(reservation_no) {
	if (confirm("예약을 취소하시겠습니까?") == true) {
		location.href="cancelReservation.bang?reservation_no="+reservation_no;
	} else {
		return;
	}
}
function visibleDIV(idMyDiv){
    var objDiv = document.getElementById(idMyDiv);
    if(objDiv.style.display=="block"){ objDiv.style.display = "none"; }
     else{ objDiv.style.display = "block"; }
}
</script>
</head>
<body>
	<jsp:useBean id="toDay" class="java.util.Date" />
	<jsp:include page="userTop.jsp" flush="false"></jsp:include>
	<div id="userReserve">
		<jsp:include page="userInfoTab.jsp" flush="false"></jsp:include>
		<div id="myRoomList">
			<span>총</span>${size }<span>곳</span>

			<form method="post" name="reviewform">
				<div class="tb_area">
					<table class="list_tbl" id="listTb">
						<thead>
							<tr>
								<th>이름</th>
								<th>방타입</th>
								<th>위치</th>
								<th>전화번호</th>
								<th>체크인</th>
								<th>체크아웃</th>
								<th>결제가격</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${list }" varStatus="number"
								begin="0" end="${size }" step="1">
								<tr>
									<td>${row.accomName }</td>
									<td>${row.roomType }</td>
									<td>${row.accomAddress }</td>
									<td>${row.accomPhone }</td>
									<td>${row.checkIn }</td>
									<td>${row.checkOut }</td>
									<td>${row.price }</td>
									<td><fmt:parseDate var="parsedDate" value="${row.checkIn}"
											pattern="yy/MM/dd" /> <fmt:parseNumber
											value="${toDay.time / (1000*60*60*24)}" integerOnly="true"
											var="strDate"></fmt:parseNumber> <fmt:parseNumber
											value="${parsedDate.time / (1000*60*60*24)}"
											integerOnly="true" var="endDate"></fmt:parseNumber> <c:choose>
											<c:when test="${strDate-endDate >= 0}">
												<a onclick="visibleDIV(${number.count-1})"><i
													class="fa fa-pencil" aria-hidden="true"
													style="font-size: 20px;"></i></a>
											</c:when>
											<c:otherwise>
												<a onclick="cancelReservation(${row.reservation_no})"><i
													class="fa fa-times" aria-hidden="true"
													style="font-size: 23px;"></i></a>
											</c:otherwise>
										</c:choose></td>
								</tr>
								<tr>
									<td style="width: 100%" colspan="8">
										<div id="${number.count-1 }"
											style="display: none; margin: 10px;">
											<textarea rows="5" cols="80" name="content"></textarea>
											<br />
											<select name="reviewGrade">
												<option value="1">★</option>
												<option value="2">★★</option>
												<option value="3">★★★</option>
												<option value="4">★★★★</option>
												<option value="5">★★★★★</option>
											</select> <input type="button" id="insertReplyBT" value="등록하기"
												class="button"> <input type="hidden"
												value="${row.accom_no }" name="accom_no">
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>

</body>
</html>