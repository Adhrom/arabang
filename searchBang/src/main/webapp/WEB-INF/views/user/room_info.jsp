<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>방상세보기</title>

<link rel="stylesheet" type="text/css"
	href="/searchBang/css/user/roominfo_style.css">
<link rel="stylesheet" href="css/user/userTop.css">

<!-- jQuery library (served from Google) -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="/js/common/jquery.bxslider.min.js"></script>
<!-- bxSlider CSS file -->
<link href="/css/common/jquery.bxslider.css" rel="stylesheet" />
</head>


<body style="width: 1000px; margin: 0 auto;">
	<div>
		<!-- <header> -->
		<%-- 	<jsp:include page="topmenu.jsp" /> --%>
		<!-- </header> -->
		<jsp:include page="userTop.jsp" flush="false"></jsp:include>

		<input type="hidden" id="accomAddress" value="${vo.accomAddress }">
		<div id="maindiv">
			<div class="top">
				<div id="t_left">

					<jsp:include page="galley_accom.jsp"></jsp:include>


				</div>
				<div id="right">
					<div id="banner-a">



						<h1 id="txt-bg-a">특급</h1>
						<h2 id="txt-title">${vo.accomName }</h2>

						<h5 id="txt-bg-b">9.0</h5>
						<h3 id="txt-bg-b-txt">추천해요</h3>
						<div class="txt-info">
							<label for="txt-info-value1">주소</label>
							<p id="txt-info-value1">${vo.accomAddress }</p>
							<label for="txt-info-value2">대표번호</label>
							<p id="txt-info-value2">${vo.accomPhone }</p>
							<label for="txt-info-value3">테마</label>
							<p id="txt-info-value3">주차가능 와이파이</p>
						</div>





						<span id="centerbtn" onclick="panTo()">지도 원래위치로 돌아가기</span>
						<div id="map">
							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bce46dd9b2717e6bba5193f3753bcb71&libraries=services"></script>
							<script>
								var mapContainer = document
										.getElementById('map'), // 지도를 표시할 div
								mapOption = {
									center : new daum.maps.LatLng(33.450701,
											126.570667), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};

								// 지도를 생성합니다
								var map = new daum.maps.Map(mapContainer,
										mapOption);

								function panTo() {
									// 이동할 위도 경도 위치를 생성합니다
									var moveLatLon = new daum.maps.LatLng(
											33.450580, 126.574942);

									// 지도 중심을 부드럽게 이동시킵니다
									// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
									map.panTo(coords);
								}

								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new daum.maps.services.Geocoder();
								var coords;
								// 주소로 좌표를 검색합니다
								geocoder
										.addressSearch(
												$("#accomAddress").val(),
												function(result, status) {

													// 정상적으로 검색이 완료됐으면
													if (status === daum.maps.services.Status.OK) {

														coords = new daum.maps.LatLng(
																result[0].y,
																result[0].x);

														// 결과값으로 받은 위치를 마커로 표시합니다
														var marker = new daum.maps.Marker(
																{
																	map : map,
																	position : coords
																});

														// 인포윈도우로 장소에 대한 설명을 표시합니다
														var infowindow = new daum.maps.InfoWindow(
																{
																	content : '<div style="width:150px;text-align:center;padding:6px 0; "></div>' // div안에 마커에 표시될 내용을 넣는다.
																});
														infowindow.open(map,
																null); // marker or null

														// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
														map.setCenter(coords);
													}
												});

								//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
								var mapTypeControl = new daum.maps.MapTypeControl();

								// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
								// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
								map.addControl(mapTypeControl,
										daum.maps.ControlPosition.TOPRIGHT);

								// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
								var zoomControl = new daum.maps.ZoomControl();
								map.addControl(zoomControl,
										daum.maps.ControlPosition.RIGHT);
							</script>
						</div>
						<!-- map -->
					</div>
					<!-- banner-a -->
				</div>
				<!-- right -->
			</div>
			<!-- top -->



			<div id="bottom_tap">

				<%@include file="tab.jsp"%>


			</div>
		</div>




		<footer><jsp:include page="footer.jsp" /></footer>
	</div>
</body>

</html>