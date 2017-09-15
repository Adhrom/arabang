<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
function addfavorite(accomvalue){
	alert(accomvalue);
	$.ajax({
		type : "get",
		data : {
			accomNo : accomvalue
		},
		url : "addFavorite.bang",
		success : alert("즐겨찾기에 추가 하였습니다"),
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색완료리스트</title>
</head>
<body>
	<c:forEach items="${list }" var="row">
		<table>
			<tr>
				<td rowspan="5" style="vertical-align: bottom;"><a
					href="room_info.bang?accom_no=${row.accom_no }"><img
						src="${row.accomimg1 }" height="250px" width="350px"></a></td>
				<td
					style="height: 10px; width:500px; vertical-align: middle; padding-left: 10px; font-size: 1.6em; font-weight: bold;">${row.accomName }</td>
			</tr>
			<tr>
				<td
					style="height: 10px; vertical-align: middle; padding-left: 10px;">${row.accomAddress}&nbsp;${row.accomAddress2}</td>
			</tr>
			<tr>
				<td style="height: 10px; vertical-align: middle; padding-left: 10px;"><span id="spanphone">예약</span>${row.accomPhone }</td>
				<td style="height: 10px; vertical-align: middle; padding-left: 10px;"><input type="button" onclick="addfavorite('${row.accom_no}')" value="즐겨찾기에 추가" class="button">
			</tr>
			<c:set var="break" value="false" />
			<c:forEach items="${r_list}" var = "room"  >
			<c:if test="${break != true}">
				<c:if test="${row.accom_no == room.accom_no }">

			   <c:set var="break" value="true" /> <!-- if문을 한번 찍었으면 true 를 준다. -->
					<tr class="price_tr">
						<td><c:if test="${room.roomRent ne '0' }"><label for="price_1"  class="price">대실가격 </label><span id="price_1"class="price_V"><fmt:formatNumber  value="${room.roomRent }"/></span></c:if></td>
					</tr>
					<tr>
						<td><c:if test="${room.roomLodge ne '0' }"><label for="price_2" class="price">숙박가격 </label><span id="price_2"class="price_V"><fmt:formatNumber  value="${room.roomLodge }"/></span></c:if></td>
					</tr>

      			</c:if> <!-- 업체에 맞는 방리스트 뽑기 -->

 			</c:if> <!--  break가 true 이면 출력하지 않는다.-->
			</c:forEach>
		</table>
		<br />
	</c:forEach>

</body>
</html>