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
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
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
			</tr>
			<c:set var="break" value="false" />
			<c:forEach items="${r_list}" var = "room"  >
			<c:if test="${break != true}">
				<c:if test="${row.accom_no == room.accom_no }">
        
			   <c:set var="break" value="true" /> <!-- if문을 한번 찍었으면 true 를 준다. -->
			<tr class="price_tr">
				<td><label for="price_1"  class="price">대여가격 </label><span id="price_1"class="price_V"><fmt:formatNumber  value="${room.roomRent }"/></span>	</td>
			</tr>
			<tr>
				<td><label for="price_2" class="price">숙박가격 </label><span id="price_2"class="price_V"><fmt:formatNumber  value="${room.roomLodge }"/></span></td>	
			</tr>

      			</c:if> <!-- 업체에 맞는 방리스트 뽑기 -->
      		  
 			</c:if> <!--  break가 true 이면 출력하지 않는다.-->
      		  
        	
			
			 
			</c:forEach>
		
		</table>
		<br />
	</c:forEach>
	<!--
<ul>
	<li>
			<div class="entry">
				<div class="txt-bg">현장 방문 시, 오픈 특가 적용</div>
				<div class="banner-txt-b">종로 부티크 호텔K</div>
				<div class="banner-txt-c">9.6 최고에요 (934)</div>
				<div class="banner-txt-d">종로구 관철동</div>
				<div class="banner-price-a">대실 20,000원</div>
				<div class="banner-price-b">숙박</div>
				<div id="reserve">예약</div>
				<div class="banner-price-c">50,000원</div>
		</div>
	</li>
	<li>
			<div class="entry">
				<div class="txt-bg">현장 방문 시, 오픈 특가 적용</div>
				<div class="banner-txt-b">종로 부티크 호텔K</div>
				<div class="banner-txt-c">9.6 최고에요 (934)</div>
				<div class="banner-txt-d">종로구 관철동</div>
				<div class="banner-price-a">대실 20,000원</div>
				<div class="banner-price-b">숙박</div>
				<div id="reserve">예약</div>
				<div class="banner-price-c">50,000원</div>
		</div>
	</li>
	<li>
			<div class="entry">
				<div class="txt-bg">현장 방문 시, 오픈 특가 적용</div>
				<div class="banner-txt-b">종로 부티크 호텔K</div>
				<div class="banner-txt-c">9.6 최고에요 (934)</div>
				<div class="banner-txt-d">종로구 관철동</div>
				<div class="banner-price-a">대실 20,000원</div>
				<div class="banner-price-b">숙박</div>
				<div id="reserve">예약</div>
				<div class="banner-price-c">50,000원</div>
		</div>
	</li>
	<li>
			<div class="entry">
				<div class="txt-bg">현장 방문 시, 오픈 특가 적용</div>
				<div class="banner-txt-b">종로 부티크 호텔K</div>
				<div class="banner-txt-c">9.6 최고에요 (934)</div>
				<div class="banner-txt-d">종로구 관철동</div>
				<div class="banner-price-a">대실 20,000원</div>
				<div class="banner-price-b">숙박</div>
				<div id="reserve">예약</div>
				<div class="banner-price-c">50,000원</div>
		</div>
	</li>
	<li>
			<div class="entry">
				<div class="txt-bg">현장 방문 시, 오픈 특가 적용</div>
				<div class="banner-txt-b">종로 부티크 호텔K</div>
				<div class="banner-txt-c">9.6 최고에요 (934)</div>
				<div class="banner-txt-d">종로구 관철동</div>
				<div class="banner-price-a">대실 20,000원</div>
				<div class="banner-price-b">숙박</div>
				<div id="reserve">예약</div>
				<div class="banner-price-c">50,000원</div>
		</div>
	</li>
	<li>
			<div class="entry">
				<div class="txt-bg">현장 방문 시, 오픈 특가 적용</div>
				<div class="banner-txt-b">종로 부티크 호텔K</div>
				<div class="banner-txt-c">9.6 최고에요 (934)</div>
				<div class="banner-txt-d">종로구 관철동</div>
				<div class="banner-price-a">대실 20,000원</div>
				<div class="banner-price-b">숙박</div>
				<div id="reserve">예약</div>
				<div class="banner-price-c">50,000원</div>
		</div>
	</li>
	<li>
			<div class="entry">
				<div class="txt-bg">현장 방문 시, 오픈 특가 적용</div>
				<div class="banner-txt-b">종로 부티크 호텔K</div>
				<div class="banner-txt-c">9.6 최고에요 (934)</div>
				<div class="banner-txt-d">종로구 관철동</div>
				<div class="banner-price-a">대실 20,000원</div>
				<div class="banner-price-b">숙박</div>
				<div id="reserve">예약</div>
				<div class="banner-price-c">50,000원</div>
		</div>
	</li>
</ul>
 -->
</body>
</html>