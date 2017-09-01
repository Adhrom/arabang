<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ARA BANG</title>
</head>
<link rel="stylesheet" href="/searchBang/css/user/index.css">
<link rel="stylesheet" href="/searchBang/css/user/jquery.bxslider.css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/searchBang/js/user/jquery.bxslider.js"></script>

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
<body>


<div class="menu-bar">
<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
</div>
<div class="search-bar">
<jsp:include page="search.jsp" flush="false"></jsp:include>
</div>

<div  class="index-bang">
		<!-- 광고 이미지 -->
		<div>
			<div class="s_banner_wrap">
				<ul class="bxslider">
					<li class="banner_01"><img src="/searchBang/img/user/ad1.jpg"></li>
					<li class="banner_02"><img src="/searchBang/img/user/ad2.jpg"></li>
				</ul>
			</div>
			</div>
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
               
            </div>
            
            <div class="tab">
               <button class="tablinks" onclick="openCity(event, 'Seoul')"
                  id="defaultOpen">서울</button>
               <button class="tablinks" onclick="openCity(event, 'Kyunggi')">경기</button>
               <button class="tablinks" onclick="openCity(event, 'Inchon')">인천</button>
               <button class="tablinks" onclick="openCity(event, 'Gangwon')">강원</button>
               <button class="tablinks" onclick="openCity(event, 'Busan')">부산</button>
               <button class="tablinks" onclick="openCity(event, 'Gyeongnam')">경남</button>
               <button class="tablinks" onclick="openCity(event, 'Deagu')">대구</button>
               <button class="tablinks" onclick="openCity(event, 'Gyeongbuk')">경북</button>
               <button class="tablinks" onclick="openCity(event, 'Wulsan')">울산</button>
               <button class="tablinks" onclick="openCity(event, 'Deajeun')">대전</button>
               <button class="tablinks" onclick="openCity(event, 'Chungnam')">충남</button>
               <button class="tablinks" onclick="openCity(event, 'Chungbuk')">충북</button>
               <button class="tablinks" onclick="openCity(event, 'Guangju')">광주</button>
               <button class="tablinks" onclick="openCity(event, 'Jeunnam')">전남</button>
               <button class="tablinks" onclick="openCity(event, 'Jeunbuk')">전북</button>
               <button class="tablinks" onclick="openCity(event, 'Jeju')">제주</button>
            </div>

            <div id="Seoul" class="tabcontent">
               <h3>London</h3>
               <p>London is the capital city of England.</p>
            </div>

            <div id="Kyunggi" class="tabcontent">
               <h3>Paris</h3>
               <p>Paris is the capital of France.</p>
            </div>

            <div id="Inchon" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
            
            <div id="Gangwon" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
            
            <div id="Busan" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
            
            <div id="Gyeongnam" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
            
            <div id="Deagu" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
            <div id="Gyeongbuk" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
            <div id="Wulsan" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
            <div id="Deajeun" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
            <div id="Chungnam" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
            <div id="Chungbuk" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
            <div id="Guangju" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
            <div id="Jeunnam" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
            <div id="Jeunbuk" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
            <div id="Jeju" class="tabcontent">
               <h3>Tokyo</h3>
               <p>Tokyo is the capital of Japan.</p>
            </div>
         
   <jsp:include page="footer.jsp" flush="false"></jsp:include>

</body>
</html>