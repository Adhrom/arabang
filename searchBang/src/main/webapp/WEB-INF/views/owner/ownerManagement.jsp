<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<!-- 차트 -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<!-- 방문자차트 -->
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script type="text/javascript" src="/searchBang/js/owner/visitChart.js"></script>
<!-- css -->
<link rel="stylesheet" href="/searchBang/css/owner/visitChart.css" />
<!-- 방문자차트 끝-->

<!-- 평점 차트 -->
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script type="text/javascript" src="/searchBang/js/owner/gradeChart.js"></script>
<!-- css -->
<link rel="stylesheet" href="/searchBang/css/owner/gradeChart.css" />
<!-- 평점 차트 끝-->

<!-- 결제차트 -->

<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script type="text/javascript"
	src="/searchBang/js/owner/paymentChart.js?ver=1"></script>

<!-- css -->
<link rel="stylesheet" href="/searchBang/css/owner/paymentChart.css" />
<!-- 결제차트 끝 -->

<!-- 미니탭 -->
<script type="text/javascript" src="/searchBang/js/owner/miniTab.js"></script>
<!-- css -->
<link rel="stylesheet" href="/searchBang/css/owner/miniTab.css" />
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css" />
<!-- 미니탭 끝 -->
<script type="text/javascript">
	$(document).ready(
			function() {
				document.getElementById("defaultOpen").click();
				//페이먼트차트
				var accom_no = "";
				accom_no = document.getElementById("accom_no").value;
				$.getJSON(
						"http://localhost:8080/searchBang/sales.owner?accom_no="
								+ accom_no, function(data) {
							paymentChart.dataProvider = data;
							paymentChart.validateData();
						});
				$.getJSON(
						"http://localhost:8080/searchBang/weekSales.owner?accom_no="
								+ accom_no, function(data) {
							visitChart.dataProvider = data;
							visitChart.validateData();
						});
				$.getJSON(
						"http://localhost:8080/searchBang/reviewGrade.owner?accom_no="
								+ accom_no, function(data) {
								gradeChart.dataProvider = data;
								gradeChart.validateData();
						});
			});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/searchBang/css/owner/ownerManagement.css?ver=1">
<link rel="stylesheet" href="/searchBang/css/admin/tablestyle.css">
<!-- dataTables.bootstrap.css  datatable 검색과 목록간 밑단 픽셀 간격이 맞춰짐-->
<!-- dataTables.bootstrap.css sorting 구간 ㅁ자 table.dataTable thead .sorting:after opacity 0으로 제거   -->
<link rel="stylesheet" href="/searchBang/css/common/dataTables.bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<!-- Paging Datatables -->
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
	<script src="/searchBang/js/common/jquery.datatables.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#admintable').dataTable({
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

<title>숙소 관리</title>
</head>
<body>
<div class="page">
<div class="owner-main-content">
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
</div>

	<input type="hidden" id="accom_no" value="${vo.accom_no}">
	<div class="owner-management" id="ownerManagement">
		<div>
			<ul id="management">
				<li id="companyTitle">숙소 관리</li>
				<li id="companyText">● 관리중인 숙소의 모든 정보 확인 및 수정이 가능합니다.</li>
			</ul>

		</div>
		<div id="topLine"></div>
		<!-- 상단 기본정보 -->
		<!-- 업체 정보 -->
		<div id=companyInfoContainer>
			<div id="human_icon">
				<ul>
					<li><img id="human_icon" alt="회원이미지"
						src="/searchBang/img/owner/human_icon.png"></li>
				</ul>
			</div>
			<div class="companyInfomation">
				<ul>
					<li class="companyInfoText" id="companyInfoName">${vo.accomName }</li>
					<li class="companyInfoText">${vo.accomPhone }</li>
					<li class="companyInfoText">${vo.accomAddress }</li>
				</ul>
			</div>

			<!-- 투데이, 새리뷰, 평점 -->
			<!-- 투데이 -->
			<div class="companyInfo">
				<ul class="companyInfoDB">
					<li class="companyInfosubject">Today</li>
					<li>${todayCount }</li>
				</ul>
			</div>
			<!-- 새리뷰 -->
			<div class="companyInfo">
				<ul class="companyInfoDB">
					<li class="companyInfosubject">Review</li>
					<li>${reviewListSize }</li>
				</ul>
			</div>

			<!-- 평점 -->
			<div class="companyInfo">
				<ul class="companyInfoDB">
					<li class="companyInfosubject">Grade</li>
					<li>${vo.accomGrade}</li>
				</ul>
			</div>
		</div></div>

		<div class="center-info">
		<!-- 객실 현황 및 차트 -->

		<div class="roomAndChart">

			<%-- <div id="roomNow">
				<table>
					<c:forEach var="row" items="${roomList }">
						<tr>
							<td>${row.roomType }</td>
							<td><button>SOLD OUT</button></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="2"><a href="addedRoom.owner"><button>방
									추가</button></a></td>
					</tr>
				</table>
			</div> --%>
			<div id="roomNow">

				<div id="roomNowName">My Room 관리</div>

				<div class="roomInfo">
					<c:forEach var="row" items="${roomList }">
						<p><label for="soldoutBt">${row.roomType }</label>
						<button id="soldoutBt">SOLD OUT</button></p>
					</c:forEach>
				</div>
			</div>
		</div>
		</div> <!-- center-info end -->

		<!-- 판매차트 -->
			<div id="visitChart">
				<div class="tab">
					<button class="tablinks" onclick="openCity(event, 'London')"
						id="defaultOpen">매출</button>
					<button class="tablinks" onclick="openCity(event, 'Paris')">주간
						예약자</button>
					<button class="tablinks" onclick="openCity(event, 'Tokyo')">평점</button>
				</div>

				<div id="London" class="tabcontent">
					<div id="paymentChartdiv"></div>

				</div>

				<div id="Tokyo" class="tabcontent">
					<div id="gradeChartdiv"></div>
				</div>

				<div id="Paris" class="tabcontent">
					<div id="visitChartdiv"></div>
				</div>

			</div>

		<div class="bottom-info"></div>
		<!-- 리뷰 -->
			<div class="review">
				<table id="admintable">
					<thead>
						<tr style="background:#00a699; height:50px; color:white;">
							<td style="width:170px;">글쓴이</td>
							<td style="width:500px;">내용</td>
							<td style="width:50px;">평점</td>
							<td style="width:80px;">신고</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reviewList }" var="row">
						<tr>
							<td>${row.memberEmail }</td>
							<td>${row.content }</td>
							<td>${row.reviewGrade }</td>
							<td><a href="declrationReview.owner?declration=${row.review_no }"><button class="button">신고하기</button></a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		<!-- cd-main-content end -->
		</div>
	<footer>
		<jsp:include page="footer.jsp" flush="false" />
	</footer>
</body>
</html>