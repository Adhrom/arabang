<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/searchBang/css/user/index.css">
<title>ARA BANG</title>
</head>
<style>
.tabcontent{
height: 30px;
}
.tabcontent ul{
text-align: center;
vertical-align: middle;
}
.items {
float: left;
cursor : pointer;
margin-left: 15px;
margin-top: 10px;

}
.items_info {
background-color: #dfdfdf;
height: 23px;
vertical-align: middle;

}
.items_info label{
float: left;
margin-left: 10px;
font-size: 1em;
}
.items_info span{
float: right;
font-weight: bold;
font-size : 1em;
color: red;
}
</style>
<body>
	<div id="main">
		<header>
			<jsp:include page="userTop.jsp" flush="false"></jsp:include>
		</header>
		<script>
		<!--슬라이드-->
			$(document).ready(
					function() {
						var slider = $('.bxslider').bxSlider({
							auto : true,
							mode : 'fade',
						});

						// 클릭시 멈춤 현상 해결 //
						$(document).on('click', '.bx-next, .bx-prev',
								function() {
									slider.stopAuto();
									slider.startAuto();
									slider.stopAuto();
									slider.startAuto();
								});
						$(document).on('mouseover', '.bx-pager, #bx-pager1',
								function() {
									slider.stopAuto();
									slider.startAuto();
									slider.stopAuto();
									slider.startAuto();
									slider.stopAuto();
									slider.startAuto();
								});
					});
		</script>
		<div class="cd-main-content">
			<div id="search">
				<jsp:include page="search.jsp" flush="false"></jsp:include>
			</div>
			<!-- 광고 이미지 -->
			<div>
				<div id="s_banner_wrap">
					<ul class="bxslider">
						<li class="banner_01"><img src="/searchBang/img/user/ad1.jpg"></li>
						<li class="banner_02"><img src="/searchBang/img/user/ad2.jpg"></li>
					</ul>
				</div>

				<div>
					<ul id="houseButton">
						<li class="houseButton"><a href="searchView2.bang?accomType=motel"><img
							src="/searchBang/img/user/motelButton.jpg"></a></li>
						<li class="houseButton"><a href="searchView2.bang?accomType=hotel"><img
							src="/searchBang/img/user/hotelButton.jpg"></a></li>
						<li class="houseButton"><a href="searchView2.bang?accomType=pention"><img
							src="/searchBang/img/user/pensionButton.jpg"></a></li>
						<li class="houseButton"><a href="searchView2.bang?accomType=guesthoues"><img
							src="/searchBang/img/user/guestButton.jpg"></a></li>
					</ul>

				</div>
				<div class="tab">
					<button class="tablinks" onclick="openCity(event, 'Seoul')"
						id="defaultOpen">서울</button>
					<button class="tablinks" onclick="openCity(event, 'Inchon')">인천</button>
					<button class="tablinks" onclick="openCity(event, 'Busan')">부산</button>
					<button class="tablinks" onclick="openCity(event, 'Deagu')">대구</button>
					<button class="tablinks" onclick="openCity(event, 'Wulsan')">울산</button>
					<button class="tablinks" onclick="openCity(event, 'Deajeun')">대전</button>
					<button class="tablinks" onclick="openCity(event, 'Guangju')">광주</button>
					<button class="tablinks" onclick="openCity(event, 'Kyunggi')">경기</button>
					<button class="tablinks" onclick="openCity(event, 'Gangwon')">강원도</button>
					<button class="tablinks" onclick="openCity(event, 'Chungnam')">충청도</button>
					<button class="tablinks" onclick="openCity(event, 'Jeunnam')">전라도</button>
					<button class="tablinks" onclick="openCity(event, 'Gyeongnam')">경상도</button>
					<button class="tablinks" onclick="openCity(event, 'Jeju')">제주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>

				<div id="Seoul" class="tabcontent">
					<ul>
						<c:forEach var="row" items="${list }">
							<c:if test="${fn:contains(row.accomAddress , '서울') }">
								<li class="items" style="width: 305px;height: 200px; ">
									<div>
										<a href="room_info.bang?accom_no=${row.accom_no }"><img src="${row.accomimg1 }" width="305px" height="160px"></a>
									</div>
									<div class="items_info">
										<label for="hotdel_dc">${row.accomName }</label>
										<span id ="hotdel_dc">${row.accomHotdeal_DC }% 할인!</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>

				<div id="Kyunggi" class="tabcontent">
					<ul>
						<c:forEach var="row" items="${list }">
							<c:if test="${fn:contains(row.accomAddress , '경기') }">
								<li class="items" style="width: 305px;height: 200px; ">
									<div>
										<a href="room_info.bang?accom_no=${row.accom_no }"><img src="${row.accomimg1 }" width="305px" height="160px"></a>
									</div>
									<div class="items_info">
										<label for="hotdel_dc">${row.accomName }</label>
										<span id ="hotdel_dc">${row.accomHotdeal_DC }% 할인!</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>

				<div id="Inchon" class="tabcontent">
					<ul>
						<c:forEach var="row" items="${list }">
							<c:if test="${fn:contains(row.accomAddress , '인천') }">
								<li class="items" style="width: 305px;height: 200px; ">
									<div>
										<a href="room_info.bang?accom_no=${row.accom_no }"><img src="${row.accomimg1 }" width="305px" height="160px"></a>
									</div>
									<div class="items_info">
										<label for="hotdel_dc">${row.accomName }</label>
										<span id ="hotdel_dc">${row.accomHotdeal_DC }% 할인!</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>

				<div id="Gangwon" class="tabcontent">
					<ul>
						<c:forEach var="row" items="${list }">
							<c:if test="${fn:contains(row.accomAddress , '강원') }">
								<li class="items" style="width: 305px;height: 200px; ">
									<div>
										<a href="room_info.bang?accom_no=${row.accom_no }"><img src="${row.accomimg1 }" width="305px" height="160px"></a>
									</div>
									<div class="items_info">
										<label for="hotdel_dc">${row.accomName }</label>
										<span id ="hotdel_dc">${row.accomHotdeal_DC }% 할인!</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>

				<div id="Busan" class="tabcontent">
				<ul>
						<c:forEach var="row" items="${list }">
							<c:if test="${fn:contains(row.accomAddress , '부산') }">
								<li class="items" style="width: 305px;height: 200px; ">
									<div>
										<a><img src="${row.accomimg1 }" width="305px" height="160px"></a>
									</div>
									<div class="items_info">
										<label for="hotdel_dc">${row.accomName }</label>
										<span id ="hotdel_dc">${row.accomHotdeal_DC }% 할인!</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>

				<div id="Gyeongnam" class="tabcontent">
				<ul>
						<c:forEach var="row" items="${list }">
							<c:if test="${fn:contains(row.accomAddress , '경상') }">
								<li class="items" style="width: 305px;height: 200px; ">
									<div>
										<a href="room_info.bang?accom_no=${row.accom_no }"><img src="${row.accomimg1 }" width="305px" height="160px"></a>
									</div>
									<div class="items_info">
										<label for="hotdel_dc">${row.accomName }</label>
										<span id ="hotdel_dc">${row.accomHotdeal_DC }% 할인!</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>

				<div id="Deagu" class="tabcontent">
				<ul>
						<c:forEach var="row" items="${list }">
							<c:if test="${fn:contains(row.accomAddress , '대구') }">
								<li class="items" style="width: 305px;height: 200px; ">
									<div>
										<a href="room_info.bang?accom_no=${row.accom_no }"><img src="${row.accomimg1 }" width="305px" height="160px"></a>
									</div>
									<div class="items_info">
										<label for="hotdel_dc">${row.accomName }</label>
										<span id ="hotdel_dc">${row.accomHotdeal_DC }% 할인!</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div id="Wulsan" class="tabcontent">
					<ul>
						<c:forEach var="row" items="${list }">
							<c:if test="${fn:contains(row.accomAddress , '울산') }">
								<li class="items" style="width: 305px;height: 200px; ">
									<div>
										<a href="room_info.bang?accom_no=${row.accom_no }"><img src="${row.accomimg1 }" width="305px" height="160px"></a>
									</div>
									<div class="items_info">
										<label for="hotdel_dc">${row.accomName }</label>
										<span id ="hotdel_dc">${row.accomHotdeal_DC }% 할인!</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div id="Deajeun" class="tabcontent">
					<ul>
						<c:forEach var="row" items="${list }">
							<c:if test="${fn:contains(row.accomAddress , '대전') }">
								<li class="items" style="width: 305px;height: 200px; ">
									<div>
										<a href="room_info.bang?accom_no=${row.accom_no }"><img src="${row.accomimg1 }" width="305px" height="160px"></a>
									</div>
									<div class="items_info">
										<label for="hotdel_dc">${row.accomName }</label>
										<span id ="hotdel_dc">${row.accomHotdeal_DC }% 할인!</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div id="Chungnam" class="tabcontent">
					<ul>
						<c:forEach var="row" items="${list }">
							<c:if test="${fn:contains(row.accomAddress , '충청') }">
								<li class="items" style="width: 305px;height: 200px; ">
									<div>
										<a href="room_info.bang?accom_no=${row.accom_no }"><img src="${row.accomimg1 }" width="305px" height="160px"></a>
									</div>
									<div class="items_info">
										<label for="hotdel_dc">${row.accomName }</label>
										<span id ="hotdel_dc">${row.accomHotdeal_DC }% 할인!</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div id="Guangju" class="tabcontent">
					<ul>
						<c:forEach var="row" items="${list }">
							<c:if test="${fn:contains(row.accomAddress , '광주') }">
								<li class="items" style="width: 305px;height: 200px; ">
									<div>
										<a href="room_info.bang?accom_no=${row.accom_no }"><img src="${row.accomimg1 }" width="305px" height="160px"></a>
									</div>
									<div class="items_info">
										<label for="hotdel_dc">${row.accomName }</label>
										<span id ="hotdel_dc">${row.accomHotdeal_DC }% 할인!</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div id="Jeunnam" class="tabcontent">
					<ul>
						<c:forEach var="row" items="${list }">
							<c:if test="${fn:contains(row.accomAddress , '전라') }">
								<li class="items" style="width: 305px;height: 200px; ">
									<div>
										<a href="room_info.bang?accom_no=${row.accom_no }"><img src="${row.accomimg1 }" width="305px" height="160px"></a>
									</div>
									<div class="items_info">
										<label for="hotdel_dc">${row.accomName }</label>
										<span id ="hotdel_dc">${row.accomHotdeal_DC }% 할인!</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div id="Jeju" class="tabcontent">
					<ul>
						<c:forEach var="row" items="${list }">
							<c:if test="${fn:contains(row.accomAddress , '제주') }">
								<li class="items" style="width: 305px;height: 200px; ">
									<div>
										<a href="room_info.bang?accom_no=${row.accom_no }"><img src="${row.accomimg1 }" width="305px" height="160px"></a>
									</div>
									<div class="items_info">
										<label for="hotdel_dc">${row.accomName }</label>
										<span id ="hotdel_dc">${row.accomHotdeal_DC }% 할인!</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<footer style = " clear:both;">
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
	<!--미니탭-->
	<script>
		function openCity(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}

		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>
</body>
</html>