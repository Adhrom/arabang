<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- 등록된 숙소 차트 -->
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script type="text/javascript" src="/searchBang/js/owner/gradeChart.js"></script>
<!-- css -->
<link rel="stylesheet" href="/searchBang/css/owner/gradeChart.css" />
<!-- 등록된 숙소 차트 끝-->

<!-- 매출차트 -->
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script type="text/javascript"
	src="/searchBang/js/owner/paymentChart.js?ver=1"></script>
<!-- css -->
<link rel="stylesheet" href="/searchBang/css/owner/paymentChart.css" />
<!-- 매출차트 끝 -->
<!-- 등록숙소 그래이드 차트 -->
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script type="text/javascript" src="/searchBang/js/owner/gradeChart.js"></script>
<!-- css -->
<link rel="stylesheet" href="/searchBang/css/owner/gradeChart.css" />
<!-- 등록숙소 그래이드 차트 끝-->
<!-- 사장님 신규등록 -->
<script type="text/javascript"
	src="/searchBang/js/admin/newOwnerChart.js?ver=1"></script>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script
	src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<!-- 사장님 신규등록 끝-->
<!-- 예약 -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script
	src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script type="text/javascript"
	src="/searchBang/js/admin/reservationChart.js?ver=1"></script>
<!-- 예약끝 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$
								.getJSON(
										"http://localhost:8080/searchBang/sales_fees.admin",
										function(data) {
											paymentChart.dataProvider = data;
											paymentChart.validateData();
										});
						$
								.getJSON(
										"http://localhost:8080/searchBang/ownerCount.admin",
										function(data) {
											newOwnerChart.dataProvider = data;
											newOwnerChart.validateData();
										});
						$
								.getJSON(
										"http://localhost:8080/searchBang/reservationChart.admin",
										function(data) {
											reservationChart.dataProvider = data;
											reservationChart.validateData();
										});
						$
								.getJSON(
										"http://localhost:8080/searchBang/ownerGradeChart.admin",
										function(data) {
											gradeChart.dataProvider = data;
											gradeChart.validateData();
										});
					});
</script>
<style type="text/css">
#newOwnerChartdiv {
	width: 350px;
	height: 350px;
	font-size: 11px;
}

#reservationChartdiv {
	width: 340px;
	height: 340px;
	font-size: 11px;
}

#paymentChartdiv {
	width: 340px;
	height: 340px;
	font-size: 11px;
}

#gradeChartdiv {
	width: 340px;
	height: 340px;
	font-size: 11px;
}

#chart {
	text-align: center;
	margin: 20px 0px;
}

#chart tr td {
	vertical-align: middle;
	padding: 20px 20px;
	width: 400px;
	font-size: 1.2em;
	font-weight: bold;
	border: 1px solid #dfdfdf;
}
</style>
<title>Stats</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 800px; margin: 0 auto;">
		<h1>Stats</h1>
		<hr />
		<br />
		<p style="text-align: right; font-size: 1em;">총등록 업체수 :${size}</p>


		<table id="chart">
			<tr>
				<td><div class="chart_size" id="paymentChartdiv"></div> <br />매출지표</td>
				<td><div class="chart_size" id="gradeChartdiv"></div> <br />등급차트</td>
			</tr>
			<tr>
				<td><div class="chart_size" id="newOwnerChartdiv"></div> <br />신규
					등록한 사장님 차트</td>
				<td><div class="chart_size" id="reservationChartdiv"></div> <br />예약
					차트</td>
			</tr>
		</table>
		<br /> <br />
	</div>
</body>
</html>