<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<script src="/searchBang/js/common/jquery.datatables.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#reviewTable').dataTable({
	"info": false,
	"scrollY": 353,// 게시판 height 세로길이고정
	"order": [[ 0, "desc" ]], //마지막 등록한 글이 위로가게 내림차순 정렬
	"pageLength": 5,//페이지 등록글 갯수 4개로 고정
	"oLanguage": {
		"sLoadingRecords": "데이터를 불러오는 중입니다.",
		"sProcessing": "데이터를 처리중 입니다.",
		"sEmptyTables": "데이터가 없습니다.",
		"sSearch": "<span>검색</span> _INPUT_",//검색
		"sZeroRecords": "검색 결과가 없습니다.",
		"sLengthMenu" : "<span>페이지 갯수</span> _MENU_"
	}

	});

});
</script>
<meta charset="UTF-8">
<title>tab</title>
<link rel="stylesheet" href="css/user/tab_star_style.css" />
<style>
html {
	width: 100%;
	height: 100%;
}

body {
	font-family: "Roboto", sans-serif;
	font-size: 16px;
	line-height: 1.6em;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

[ripple] .ripple {
	position: absolute;
	background: #FFFFFF;
	width: 12px;
	height: 12px;
	border-radius: 100%;
	-webkit-animation: ripple 1.6s;
	animation: ripple 1.6s;
}

@
-webkit-keyframes ripple { 0% {
	-webkit-transform: scale(1);
	transform: scale(1);
	opacity: 0.2;
}

100%
{
-webkit-transform


:scale(40)


;
transform


:scale(40)


;
opacity


:


0;
}
}
@
keyframes ripple { 0% {
	-webkit-transform: scale(1);
	transform: scale(1);
	opacity: 0.2;
}

100%
{
-webkit-transform


:scale(40)


;
transform


:scale(40)


;
opacity


:


0;
}
}
.tabs {
	z-index: 15px;
	position: relative;
	background: #FFFFFF;
	width: 950px;
	border-radius: 4px;
	height: auto;
	margin: 100px auto 10px;
	overflow: hidden;
}

.tabs-header {
	position: relative;
	background: tabs-header;
	overflow: hidden;
	border-bottom: 1px solid #dfdfdf;
}

.tabs-header .border {
	position: absolute;
	bottom: 0;
	left: 0;
	background: #00a699;
	width: auto;
	height: 3px;
	-webkit-transition: 0.3s ease;
	transition: 0.3s ease;
}

.tabs-header ul {
	padding: 0;
	margin: 0;
	list-style: none;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	width: calc(100% - 68px);
}

.tabs-header li {
	-webkit-transition: 0.3s ease;
	transition: 0.3s ease;
}

.tabs-header a {
	display: block;
	box-sizing: border-box;
	padding: 15px 20px;
	color: #00a699;
	text-decoration: none;
	text-transform: uppercase;
	font-weight: 600;
	font-size: 1.2em;
}

.tabs-content {
	position: relative;
	padding: 15px 20px;
	-webkit-transition: 0.3s ease;
	transition: 0.3s ease;
	overflow: hidden;
}

.tabs-content:after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 0;
	display: block;
	width: 100%;
	height: 1px;
	box-shadow: 0 0 20px 10px #FFFFFF;
}

.tabs-content .tab {
	display: none;
}

.tabs-content .tab.active {
	display: block;
}

.pen-footer {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-ms-flex-pack: justify;
	justify-content: space-between;
	width: 600px;
	margin: 20px auto 100px;
}

.pen-footer a {
	color: #FFFFFF;
	font-size: 12px;
	text-decoration: none;
	text-shadow: 1px 2px 0 rgba(0, 0, 0, 0.1);
}

.pen-footer a .material-icons {
	width: 12px;
	margin: 0 5px;
	vertical-align: middle;
	font-size: 12px;
}

.cp-fab {
	background: #FFFFFF !important;
	color: #4285F4 !important;
}
</style>


<script>
	$(document).ready(function() {

		// Intial Border Position
		var activePos = $('.tabs-header .active').position();

		// Change Position
		function changePos() {

			// Update Position
			activePos = $('.tabs-header .active').position();

			// Change Position & Width
			$('.border').stop().css({
				left : activePos.left,
				width : $('.tabs-header .active').width()
			});
		}

		changePos();

		// Intial Tab Height
		var tabHeight = $('.tab.active').height();

		// Animate Tab Height
		function animateTabHeight() {

			// Update Tab Height
			tabHeight = $('.tab.active').height();

			// Animate Height
			$('.tabs-content').stop().css({
				height : tabHeight + '-100px'
			});
		}

		animateTabHeight();

		// Change Tab
		function changeTab() {
			var getTabId = $('.tabs-header .active a').attr('tab-id');

			// Remove Active State
			$('.tab').stop().fadeOut(300, function() {
				// Remove Class
				$(this).removeClass('active');
			}).hide();

			$('.tab[tab-id=' + getTabId + ']').stop().fadeIn(300, function() {
				// Add Class
				$(this).addClass('active');

				// Animate Height
				animateTabHeight();
			});
		}

		// Tabs
		$('.tabs-header a').on('click', function(e) {
			e.preventDefault();

			// Tab Id
			var tabId = $(this).attr('tab-id');

			// Remove Active State
			$('.tabs-header a').stop().parent().removeClass('active');

			// Add Active State
			$(this).stop().parent().addClass('active');

			changePos();

			// Update Current Itm
			tabCurrentItem = tabItems.filter('.active');

			// Remove Active State
			$('.tab').stop().fadeOut(300, function() {
				// Remove Class
				$(this).removeClass('active');
			}).hide();

			// Add Active State
			$('.tab[tab-id="' + tabId + '"]').stop().fadeIn(300, function() {
				// Add Class
				$(this).addClass('active');

				// Animate Height
				animateTabHeight();
			});
		});

		// Tab Items
		var tabItems = $('.tabs-header ul li');

		// Tab Current Item
		var tabCurrentItem = tabItems.filter('.active');

		// Next Button
		$('#next').on('click', function(e) {
			e.preventDefault();

			var nextItem = tabCurrentItem.next();

			tabCurrentItem.removeClass('active');

			if (nextItem.length) {
				tabCurrentItem = nextItem.addClass('active');
			} else {
				tabCurrentItem = tabItems.first().addClass('active');
			}

			changePos();
			changeTab();
		});

		// Prev Button
		$('#prev').on('click', function(e) {
			e.preventDefault();

			var prevItem = tabCurrentItem.prev();

			tabCurrentItem.removeClass('active');

			if (prevItem.length) {
				tabCurrentItem = prevItem.addClass('active');
			} else {
				tabCurrentItem = tabItems.last().addClass('active');
			}

			changePos();
			changeTab();
		});
		/*
		 // Ripple(잔물결)
		 $('[ripple]').on('click', function (e) {
		 var rippleDiv = $('<div class="ripple" ></div>'),
		 rippleOffset = $(this).offset(),
		 rippleY = e.pageY - rippleOffset.top,
		 rippleX = e.pageX - rippleOffset.left,
		 ripple = $('.ripple');

		 rippleDiv.css({
		 top: rippleY - (ripple.height() / 2),
		 left: rippleX - (ripple.width() / 2),
		 background: $(this).attr("ripple-color")
		 }).appendTo($(this));

		 window.setTimeout(function () {
		 rippleDiv.remove();
		 }, 1500);
		 });

		 */
	});
</script>
<script>
	$(document).ready(function() {
		var slider = $('.bxslider2').bxSlider({
			auto : true,
			mode : 'fade'
		});
		// 클릭시 멈춤 현상 해결 //
		$(document).on('click', '.bx-next, .bx-prev', function() {
			slider.stopAuto();
			slider.startAuto();
			slider.stopAuto();
			slider.startAuto();
		});
		$(document).on('mouseover', '.bx-pager, #bx-pager1', function() {
			slider.stopAuto();
			slider.startAuto();
			slider.stopAuto();
			slider.startAuto();
			slider.stopAuto();
			slider.startAuto();
		});
	});
</script>



<style>
.bx-wrapper {
	position: relative;
	top: 10px;
	padding: 0px;
	width: 310px;
	height: 240px;
	margin-right: 10px;
}

}
.room_info {
	border: 2px solid #dfdfdf;
	padding: 0px 10px;
	margin: 20px 0;
}

.info {
	display: inline-block;
	margin: 0px 0px;
	padding: 1px 0px;
}

.info .half {
	margin: 0px;
	display: inline-block;
	padding: 10px;
	width: 260px;
}

.info .full {
	margin: 0px;
	display: inline-block;
	padding: 10px;
	width: 520px;
}

.info .title {
	display: block;
	font-weight: bold;
	font-size: 1.2em;
}

/*@media all and (min-width:1024px)*/
.room_info .info button {
	display: block;
	width: 100%;
	height: 40px;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	font-weight: normal;
	color: #fff;
	text-align: center;
}

.gra_left_right_red {
	background: #00a699;
}

button {
	cursor: pointer;
}

textarea, button, input, select {
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	border-radius: 0;
	font-family: "Apple SD Gothic Neo", "맑은 고딕", "맑은고딕", "Malgun Gothic",
		sans-serif;
}

a, input, button, div, li, textarea, form, label, select {
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

.room_info .info .price .price_info {
	border-bottom: 1px solid #dfdfdf;
}

.reserve-line {
	text-align: right;
}

/*@media all and (min-width:1024px)*/
.room_info .info .price div p span {
	display: inline-block;
	position: relative;
	top: -2px;
	margin-right: 4px;
	padding: 2px 2px 1px 2px;
	background: #00a699;
	font-size: 14px;
	line-height: normal;
	border-radius: 3px;
	color: #fff;
}

.room_info .info .price ul {
	list-style: none;
	padding: 0px;
}

.room_info .info .price ul li {
	text-align: left;
}

.price strong {
	font-size: 1em;
}

.span_label {
	float: left;
	width: 150px;
}

#tab2_div {
	padding: 5px 30px;
	background-color: #dfdfdf;
	width: auto;
	border-radius: 4px;
}

.tab2_dl {
	margin: 30px;
}

.tab2_dt {
	font-size: 1.2em;
	font-weight: bold;
	margin-bottom: 10px;
}

#tab2_opsion_dl {
	width: 700px;
}

#tab2_opsion_dl dd {
	display: inline;
	margin-left: 5px;
}

#bxdiv {
	display: inline-block;
}

.room_info {
	padding-top: 10px;
	border: 1px solid #dfdfdf;
	text-align: center;
}

.room_info .info {
	position: relative;
	top: -10px;
	border: 1px solid #dfdfdf;
}
</style>


</head>
<body>


	<div class="tabs">
		<div class="tabs-header">
			<div class="border"></div>
			<ul>
				<li class="active"><a href="#tab-1" tab-id="1" ripple="ripple"
					ripple-color="yellow">객실안내/예약</a></li>
				<li><a href="#tab-2" tab-id="2" ripple="ripple"
					ripple-color="lightgreen">숙소정보</a></li>
				<li><a href="#tab-3" tab-id="3" ripple="ripple"
					ripple-color="aqua">리뷰</a></li>

			</ul>

		</div>
		<div class="tabs-content">
			<div tab-id="1" class="tab active">

				<c:forEach var="list" items="${list}">
					<div class="room_info">

						<div id="bxdiv">
							<ul class="bxslider2">
								<c:if test="${list.roomimg1 != 'null'}">
									<li class="banner_01"><img alt="이미지 정보"
										src="${list.roomimg1}" width="310" height="240"></li>
								</c:if>
								<c:if test="${list.roomimg2 != 'null'}">
									<li class="banner_02"><img alt="이미지 정보"
										src="${list.roomimg2}" width="310" height="240"></li>
								</c:if>
								<c:if test="${list.roomimg3 != 'null'}">
									<li class="banner_03"><img alt="이미지 정보"
										src="${list.roomimg3}" width="310" height="240"></li>
								</c:if>
								<c:if test="${list.roomimg4 != 'null'}">
									<li class="banner_04"><img alt="이미지 정보"
										src="${list.roomimg4}" width="310" height="240"></li>
								</c:if>
								<c:if test="${list.roomimg5 != 'null'}">
									<li class="banner_05"><img alt="이미지 정보"
										src="${list.roomimg5}" width="310" height="240"></li>
								</c:if>
								<c:if test="${list.roomimg6 != 'null'}">
									<li class="banner_06"><img alt="이미지 정보"
										src="${list.roomimg6}" width="310" height="240"></li>
								</c:if>
								<c:if test="${list.roomimg7 != 'null'}">
									<li class="banner_07"><img alt="이미지 정보"
										src="${list.roomimg7}" width="310" height="240"></li>
								</c:if>
								<c:if test="${list.roomimg8 != 'null'}">
									<li class="banner_08"><img alt="이미지 정보"
										src="${list.roomimg8}" width="310" height="240"></li>
								</c:if>
								<c:if test="${list.roomimg9 != 'null'}">
									<li class="banner_09"><img alt="이미지 정보"
										src="${list.roomimg9}" width="310" height="240"></li>
								</c:if>
							</ul>
						</div>

						<div class="info">
							<strong class="title">${list.roomType }</strong>
							<c:choose>
								<c:when
									test="${list.roomRent ne '0' and list.roomLodge eq '0' }">
									<div class="full">
										<div class="price">
											<strong> 대실 </strong>
											<div class="price_info">
												<br />

												<p class="reserve-line">
													<span>예약</span> <b style="color: rgba(0, 0, 0, 1)"> <fmt:formatNumber
															value="${list.roomRent }" />원
													</b>
													<!-- 표시금액 -->
												</p>

											</div>


											<ul>
												<li><span class="span_label">마감시간</span>${list.roomRent_Closingtime }시까지</li>
												<li><span class="span_label">이용시간</span>최대
													${list.roomRent_Usetime }시간</li>
											</ul>

										</div>

										<button type="button"
											onclick="location.href='userPay.bang?room_no=${list.room_no}&rentAndLodge=rent'"
											class="gra_left_right_red">대실 예약</button>
									</div>
								</c:when>
								<c:when
									test="${list.roomRent eq '0' and list.roomLodge ne '0' }">
									<div class="full">
										<div class="price">
											<strong> 숙박 </strong>
											<div class="price_info">
												<br>
												<p class="reserve-line">
													<span>예약</span> <b style="color: rgba(0, 0, 0, 1)"><fmt:formatNumber
															value="${list.roomLodge }" />원</b>
													<!-- 표시금액 -->
												</p>


											</div>

											<ul>
												<li><span class="span_label">입실시간</span>${list.roomLodge_Checkin }시부터</li>
												<li><span class="span_label">퇴실시간</span>익일
													${list.roomLodge_Checkout }시</li>
											</ul>

										</div>

										<button type="button"
											onclick="location.href='userPay.bang?room_no=${list.room_no}&rentAndLodge=lodge'"
											class="gra_left_right_red">숙박 예약</button>
									</div>
								</c:when>
								<c:otherwise>
									<div class="half">
										<div class="price">
											<strong> 대실 </strong>
											<div class="price_info">
												<br />

												<p class="reserve-line">
													<span>예약</span> <b style="color: rgba(0, 0, 0, 1)"> <fmt:formatNumber
															value="${list.roomRent }" />원
													</b>
													<!-- 표시금액 -->
												</p>

											</div>


											<ul>
												<li><span class="span_label">마감시간</span>${list.roomRent_Closingtime }시까지</li>
												<li><span class="span_label">이용시간</span>최대
													${list.roomRent_Usetime }시간</li>
											</ul>

										</div>

										<button type="button"
											onclick="location.href='userPay.bang?room_no=${list.room_no}&rentAndLodge=rent'"
											class="gra_left_right_red">대실 예약</button>
									</div>
									<div class="half">
										<div class="price">
											<strong> 숙박 </strong>
											<div class="price_info">
												<br>
												<p class="reserve-line">
													<span>예약</span> <b style="color: rgba(0, 0, 0, 1)"><fmt:formatNumber
															value="${list.roomLodge }" />원</b>
													<!-- 표시금액 -->
												</p>


											</div>

											<ul>
												<li><span class="span_label">입실시간</span>${list.roomLodge_Checkin }시부터</li>
												<li><span class="span_label">퇴실시간</span>익일
													${list.roomLodge_Checkout }시</li>
											</ul>
										</div>
										<button type="button"
											onclick="location.href='userPay.bang?room_no=${list.room_no}&rentAndLodge=lodge'"
											class="gra_left_right_red">숙박 예약</button>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

				</c:forEach>

			</div>


			<div tab-id="2" id="tab1" class="tab">
				<div id=tab2_div>

					<dl class="tab2_dl" id="tab2_opsion_dl">
						<dt class="tab2_dt">숙소 옵션</dt>
						<c:if test="${vo.option_couplePC != 'off'}">
							<dd>커플PC</dd>
						</c:if>
						<c:if test="${vo.option_partyRoom != 'off'}">
							<dd>파티룸</dd>
						</c:if>
						<c:if test="${vo.option_noPeople != 'off'}">
							<dd>복층구조</dd>
						</c:if>
						<c:if test="${vo.option_duplex != 'off'}">
							<dd>스파/월풀</dd>
						</c:if>
						<c:if test="${vo.option_spa != 'off'}">
							<dd>픽업</dd>
						</c:if>
						<c:if test="${vo.option_pickUp != 'off'}">
							<dd>무인텔</dd>
						</c:if>
						<c:if test="${vo.option_withAnimal != 'off'}">
							<dd>동물입실</dd>
						</c:if>
						<c:if test="${vo.option_business != 'off'}">
							<dd>비즈니스</dd>
						</c:if>
						<c:if test="${vo.option_noSmoking != 'off'}">
							<dd>객실금연</dd>
						</c:if>
						<c:if test="${vo.option_barbecue != 'off'}">
							<dd>바베큐</dd>
						</c:if>
						<c:if test="${vo.option_cleanroom != 'off'}">
							<dd>세탁시설</dd>
						</c:if>
						<c:if test="${vo.option_playGround != 'off'}">
							<dd>운동장</dd>
						</c:if>
						<c:if test="${vo.option_kitchen != 'off'}">
							<dd>주방</dd>
						</c:if>
						<c:if test="${vo.option_hanok != 'off'}">
							<dd>한옥</dd>
						</c:if>
						<c:if test="${vo.option_glamping != 'off'}">
							<dd>글램핑</dd>
						</c:if>
						<c:if test="${vo.option_seminar != 'off'}">
							<dd>세미나실</dd>
						</c:if>
						<c:if test="${vo.option_womenOnly != 'off'}">
							<dd>여성전용</dd>
						</c:if>
						<c:if test="${vo.option_nokids != 'off'}">
							<dd>노키드존</dd>
						</c:if>
						<c:if test="${vo.option_snackBar != 'off'}">
							<dd>무료 조식 제공</dd>
						</c:if>
						<c:if test="${vo.option_freeBlackfast != 'off'}">
							<dd>프론트 스낵바 무료이용</dd>
						</c:if>
					</dl>

					<dl class="tab2_dl">
						<dt class="tab2_dt">주차장 정보</dt>

						<c:choose>
							<c:when test="${vo.parking_having == 'yes'}">
								<c:if test="${vo.parking_valet == 'on'}">
									<dd>무료 발렛 파킹</dd>
								</c:if>
								<c:if test="${vo.parking_inCharge == 'off'}">
									<dd>유료주차</dd>
								</c:if>
								<c:if test="${vo.parking_free == 'yes'}">
									<dd>무료주차</dd>
								</c:if>
							</c:when>
							<c:otherwise>
								<dd>주차 시설 미보유</dd>
							</c:otherwise>
						</c:choose>
					</dl>

					<dl class="tab2_dl">
						<dt class="tab2_dt">추가 안내사항</dt>
						<c:if test="${vo.accomInfo != null}">
							<dd>${vo.accomInfo }</dd>
						</c:if>
					</dl>

				</div>
			</div>

			<div tab-id="3" class="tab">
				<table id="reviewTable" style="width: 100%">
					<thead>
					<tr>
						<td>리뷰작성자</td>
						<td>점수</td>
						<td>내용</td>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="row" items="${list2 }">
						<tr>
							<td>${row.memberEmail }</td>
							<td>${row.reviewGrade }</td>
							<td>${row.content }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>


</body>
</html>
