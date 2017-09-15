<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세조건</title>
</head>
<body>


	<form>
	<div id="aside-left">
		<h3 id="left-title-a">상세조건</h3>
	</div>


	<div id="aside-btn">

		<input id="btn-reset" type="reset" value="초기화">
		<input id="btn-submit" type="submit" value="적용">

	<!-- aside left-detail-condition-btn 끝 -->
	</div>



			<div id="aside-left-list" class="check_gap">
			<h3 id="left-title-b">타입</h3>
			<input type="checkbox" name="special1st">호텔<br/>
			<input type="checkbox" name="special">모텔<br/>
			<input type="checkbox" name="1st">펜션/풀빌라<br/>
			<input type="checkbox" name="visit">게스트하우스<br/>


			<div id="aside-left-list-split-l" class="check_gap">
			<h3 id="left-title-b">옵션</h3>
					<input type="checkbox" name="fitnese">커플PC<br/>
					<input type="checkbox" name="sauna">파티룸<br/>
					<input type="checkbox" name="restrant">복층구조<br/>
					<input type="checkbox" name="lounge">스파/월풀<br/>
					<input type="checkbox" name="bbq">픽업<br/>
					<input type="checkbox" name="sap">무인텔<br/>
					<input type="checkbox" name="semina">동물입실<br/>
					<input type="checkbox" name="karaoke">비즈니스<br/>
					<input type="checkbox" name="clening">객실금연<br/>
					<input type="checkbox" name="waterdry">바베큐<br/>
					<input type="checkbox" name="cook">세탁시설<br/>
					<input type="checkbox" name="hotspring">운동장<br/>
					<input type="checkbox" name="hotspring">주방<br/>
					<input type="checkbox" name="hotspring">한옥<br/>
					<input type="checkbox" name="hotspring">글램핑<br/>
					<input type="checkbox" name="hotspring">세미나실<br/>
					<input type="checkbox" name="hotspring">여성전용<br/>
					<input type="checkbox" name="hotspring">노키즈존<br/>
					<input type="checkbox" name="hotspring">무료조식제공<br/>
					<input type="checkbox" name="hotspring">스넥바무료<br/>
			</div>

			<div id="aside-left-list-split-r" class="check_gap">
			<h3 id="left-title-b">주자시설</h3>
			<input type="checkbox" name="nosmoking">주차시설보유<br/>
			<input type="checkbox" name="valletparking">주차시설미보유<br/>
			<input type="checkbox" name="roomkitchen">무료발렛파킹<br/>
			<input type="checkbox" name="keep">무료주차<br/>
			<input type="checkbox" name="freeparking">유료주차<br/>
			<br/>
			</div>
		</div><!-- aside-left end -->
		</form>


</body>
</html>