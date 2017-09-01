<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="/searchBang/css/user/index.css">
<script>
	$(document).ready(function() {
		var slider = $('.bxslider').bxSlider({
			auto : true,
			mode : 'fade',
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
	function openCity(cityName, elmnt, color) {
	    // Hide all elements with class="tabcontent" by default */
	    var i,  tabcontent, tablinks;
	    tabcontent =  document.getElementsByClassName("tabcontent");
	    for (i =  0; i < tabcontent.length; i++) {
	         tabcontent[i].style.display = "none";
	    }

	    // Remove the background color of all tablinks/buttons
	     tablinks = document.getElementsByClassName("tablink");
	     for (i = 0; i < tablinks.length; i++) {
	         tablinks[i].style.backgroundColor = "";
	    }

	    // Show the specific tab content
	     document.getElementById(cityName).style.display = "block";

	     // Add the specific color to the button used to open the tab content
	     elmnt.style.backgroundColor = color;
	}
	// Get the element with id="defaultOpen" and click on it
	$(document).ready(function() {
		document.getElementById("defaultOpen").click();
	});
</script>
<title>ARA BANG</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 1000px; margin: 0 auto;">
		<jsp:include page="search.jsp" flush="false"></jsp:include>
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
					<li class="houseButton"><img
						src="/searchBang/img/user/motelButton.jpg"></li>
					<li class="houseButton"><img
						src="/searchBang/img/user/hotelButton.jpg"></li>
					<li class="houseButton"><img
						src="/searchBang/img/user/pensionButton.jpg"></li>
					<li class="houseButton"><img
						src="/searchBang/img/user/guestButton.jpg"></li>
				</ul>
				<hr class="line" />
			</div>
			<div id="hotdeal">
				<h3>핫딜</h3>
				<button class="tablink" onclick="openCity('Paris', this, )"
					id="defaultOpen">서울</button>
				<button class="tablink" onclick="openCity('Tokyo', this,)">경기</button>
				<button class="tablink" onclick="openCity('Oslo', this, )">인천</button>
				<button class="tablink" onclick="openCity('Oslo', this, )">강원</button>
				<button class="tablink" onclick="openCity('Oslo', this, )">부산</button>
				<button class="tablink" onclick="openCity('Oslo', this, )">경남</button>
				<button class="tablink" onclick="openCity('Oslo', this, )">대구</button>
				<button class="tablink" onclick="openCity('Oslo', this,)">경북</button>
				<button class="tablink" onclick="openCity('Oslo', this, )">울산</button>
				<button class="tablink" onclick="openCity('Oslo', this,)">대전</button>
				<button class="tablink" onclick="openCity('Oslo', this, )">충남</button>
				<button class="tablink" onclick="openCity('Oslo', this, )">충북</button>
				<button class="tablink" onclick="openCity('Oslo', this, )">광주</button>
				<button class="tablink" onclick="openCity('Oslo', this, )">전남</button>
				<button class="tablink" onclick="openCity('Oslo', this, )">전북</button>
				<button class="tablink" onclick="openCity('Oslo', this, )">제주</button>


				<div id="London" class="tabcontent">
					<h3>London</h3>
					<p>London is the capital city of England.</p>
				</div>

				<div id="Paris" class="tabcontent">
					<h3>Paris</h3>
					<p>Paris is the capital of France.</p>
				</div>

				<div id="Tokyo" class="tabcontent">
					<h3>Tokyo</h3>
					<p>Tokyo is the capital of Japan.</p>
				</div>

				<div id="Oslo" class="tabcontent">
					<h3>Oslo</h3>
					<p>Oslo is the capital of Norway.</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>