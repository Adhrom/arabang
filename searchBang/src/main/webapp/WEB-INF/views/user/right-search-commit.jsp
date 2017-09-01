<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
					style="height: 10px; vertical-align: middle; padding-left: 10px; font-size: 1.6em; font-weight: bold;">${row.accomName }</td>
			</tr>
			<tr>
				<td
					style="height: 10px; vertical-align: middle; padding-left: 10px;">${row.accomAddress}&nbsp;${row.accomAddress2}</td>
			</tr>
			<tr>
				<td
					style="height: 10px; vertical-align: middle; padding-left: 10px;">${row.accomPhone }</td>
			</tr>
			<tr>
				<td
					style="height: 10px; vertical-align: middle; padding-left: 10px;">대실 : ${row. }</td>
			</tr>
			<tr>
				<td
					style="height: 10px; vertical-align: middle; padding-left: 10px;">숙박 : ${row.accomPhone }</td>
			</tr>
		
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