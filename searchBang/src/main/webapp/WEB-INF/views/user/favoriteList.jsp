<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/searchBang/css/user/infoAdmin.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function deleteFavorite(accomval){
	alert(accomval);
	$.ajax({
		type : "get",
		data : {"accomNo" : accomval},
		dataType : "json",
		url : "deleteFavorite.bang"
	});
}
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="userTop.jsp" flush="false"></jsp:include>
	<div class="top-infoAdmin">
		<jsp:include page="userInfoTab.jsp" flush="false"></jsp:include>
		<c:forEach items="${list}" var="row">
			<table>
				<tr>
					<td rowspan="5" style="vartical-align: bottom;">
						<a href="room_info.bang?accom_no=${row.accom_no }">
						<img src="${row.accomimg1 }" height="250px" width="350px"></a>
					</td>
					
					<td style="height: 10px; width: 500px; vertical-align: middle; 
						padding-left: 10px; font-size: 1.6em; font-weight: bold;">${row.accomName }</td>
				</tr>
				
				<tr>
					<td style="height: 10px; vertical-align: middle; padding-left: 10px;">${row.accomAddress}&nbsp;${row.accomAddress2}</td>
				</tr>
				<tr>
					<td style="height: 10px; vertical-align: middle; padding-left: 10px;"><span id="spanphone">예약</span>${row.accomPhone }</td>
				</tr>
				<tr>
					<td style="height: 10px; vertical-align: middle; padding-left: 10px;"><input type="button" value="삭제" onclick="deleteFavorite('${row.accom_no}')" id="accom_no" name="accom_no">
				</tr>
			</table>
		</c:forEach>
	</div>
</body>
</html>