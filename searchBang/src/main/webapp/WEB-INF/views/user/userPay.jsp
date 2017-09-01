<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="/searchBang/css/user/userPay.css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document).ready(function() {
		var startDate =  "<%=(String)session.getAttribute("startDate")%>"
		var endDate =  "<%=(String)session.getAttribute("endDate")%>"
		var arr1 = startDate.split('-');
		var arr2 = endDate.split('-');
		var sdt = arr1[1]+'/'+arr1[2]+'/'+arr1[0]
		var edt = arr2[1]+'/'+arr2[2]+'/'+arr2[0]
		var dt1 = new Date(sdt);
		var dt2 = new Date(edt);
		var diff = (dt2 - dt1) + (1000 * 60 * 60 * 24);
		var day = 1000 * 60 * 60 * 24;
		var datecal = diff/day;
		if ($('#rentAndLodge').val() == 'rent') {
			$('#hiddenPrice').val($('#rent').val()*datecal);
			//var price = $('#rent').val()*datecal;
			document.getElementById("price").innerHTML = $('#rent').val()*datecal+'원';
		}
		if ($('#rentAndLodge').val() == 'lodge') {
			$('#hiddenPrice').val($('#lodge').val()*datecal);
			//var price = $('#lodge').val()*datecal;
			document.getElementById("price").innerHTML = $('#lodge').val()*datecal+'원';
		}

		$('#btnPayment').click(function() {
			document.reservation.action = "doReservation.bang";
			document.reservation.submit();
		});

	});
</script>
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" value="${roomVO.roomRent }" id="rent">
	<input type="hidden" value="${roomVO.roomLodge }" id="lodge">
	<input type="hidden" value="${param.rentAndLodge }" id="rentAndLodge">
	<form method="post" name="reservation">
	<div id="pageForPay">
		<div class="payRoomInfo">
			<div id="roomImage">
				<img alt="방이미지" src="${roomVO.roomimg1 }">
				<div id="roomInfo">
					<h1>방 타입 : ${roomVO.roomType }</h1>
					<h3>숙소 이름 : ${accomVO.accomName }</h3>
					<h3>숙소 주소 : ${accomVO.accomAddress }</h3>
				</div>
			</div>
		</div>
		<!-- 필수입력사항 -->
		<div id="payPage">
			<ul class="pay">
				<li class="bigTitle">필수 입력 사항</li>
				<li class="surelyInput">예약자명</li>
				<li class="surelyInput"><input type="text" name="" id=""
					value="">
				<li class="surelyInput"><img alt="" src="">● 예약자명은 실명으로
					기입해주세요.</li>
			</ul>

			<!-- 전화번호 데이터 불러와야함 -->
			<ul class="pay" id="celphoeInput">
				<li class="celphoneInput">휴대전화</li>
				<li class="celphoneInput"><input type="text" name="" id=""
					value="${userInfoVO.memberPhone }"
					onFocus="this.className='input_focus'"
					onBlur="if ( this.value == '' ) { this.className='input_blur' }"
					class="input_blur" />
			</ul>

			<ul class="pay">
				<li class="bigTitle" id="visit">방문형태</li>
				<li class="parking"><input type="radio" id="radio1"
					name="radios"> <label for="radio1">차량</label>
				<li class="parking"><input type="radio" id="radio1"
					name="radios"> <label for="radio1">도보</label>
				<li class="parking"><img style="width: 10px;" src="">●
					주차장 이용을 안내해드립니다.</li>
			</ul>

			<!-- 할인 -->
			<ul class="pay">
				<li class="bigTitle">할인</li>
				<li class="discount">포인트 할인</li>
				<li class="discount"></li>
				<li class="discount"><button class="discountBt">전액사용</button>(${userInfoVO.point }P
					보유)</li>
				<li class="discount">1,000P 단위로 사용할 수 있습니다.</li>
			</ul>

			<!-- 결제선택 -->
			<ul class="pay">
				<li class="bigTitle">결제선택</li>
				<li class="choiceRadio"><input type="radio" id="cardPay"
					name="userPay"> <label for="cardPay">카드결제</label></li>
				<li class="choiceRadio"><input type="radio" id="naverPay"
					name="userPay"> <label for="cardPay">네이버페이</label></li>
				<li class="choiceRadio"><input type="radio" id="celphonePay"
					name="userPay"> <label for="cardPay">휴대폰결제</label></li>
				<li class="choiceRadio"><input type="radio" id="paycoPay"
					name="userPay"> <label for="cardPay">페이코</label></li>
			</ul>


			<!-- 취소규정 및 약관동의 -->
			<p />
			<p />
			<div class="agreeText">
				취소 규정 및 약관동의

				<p />
				<input type="checkbox" name="cancleCheck" id="cancleCheckbox"><label
					for="cancleCheckbox">취소규정 약관을 확인하였으며 이에 동의합니다.</label><br> <br>
				<div class="Tb_area">
					<table class="choice_tbl" id="policyTb">
						<colgroup>
							<col width="50%">
							<col width="50%">

						</colgroup>
						<thead>
							<tr>
								<th>취소기준일</th>
								<th>취소 수수료</th>
							</tr>
						</thead>
						<tbody>
							<tr>

								<td>입실 1일전 까지</td>
								<td>없음</td>
							</tr>
							<tr>
								<td>입실일 및 No-Show</td>
								<td>환불 불가</td>
							</tr>
						</tbody>

					</table>
					<br>

				</div>
				<br>

			</div>
			<p />
			<p />

			<!-- 개인정보 -->
			<p />
			<p />

			<div class="agreeText1" id="privacy">
				개인정보 제 3자 제공<br> <br> <input type="checkbox"
					name="cancleCheck" id="cancleCheckbox"><label
					for="cancleCheckbox">개인정보 수집/이용, 개인정보 제3자 제공 약관을 확인하였으며 이에
					동의합니다.</label><br> <br>
				<div class="tb_area">
					<table class="choice_tbl" id="policyTb">
						<colgroup>
							<col width="10%">
							<col width="24%">
							<col width="39%">
							<col width="37%">
						</colgroup>
						<thead>
							<tr>
								<th>분류</th>
								<th>이용목적</th>
								<th>이용항목</th>
								<th>보유 파기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3">필수 정보</td>
								<td>예약 서비스 이용</td>
								<td>예약자명, 휴대폰번호, 결제정보</td>
								<td rowspan="2">5년 보관<br> (전자상거래 등에서의 소비자보호에 관한 법률)
								</td>
							</tr>
							<tr>
								<td>결제 서비스 이용</td>
								<td>- 신용카드결제:<br> 카드번호, 유효기간, 이메일등<br> <br>
									- 휴대폰결제 :<br> 휴대폰 번호, 통신사, 결제 승인 번호등
								</td>
							</tr>
							<tr>
								<td>서비스 이용 및<br>부정거래 기록 확인
								</td>
								<td>서비스 이용 시간/이용 기록, 접속 로그, 이용 콘텐츠, 쿠키, 접속IP 정보, 주소, 사용된
									신용카드 정보, 기기 모델명, 브라우저 정보</td>
								<td>6개월<br>(통신 비밀 보호법에 관한 법률)
								</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>

		<!-- 결제페이지 -->
		<div class="PayPanel">
			<div id="DateRangePickerTop">
				<span class="datepickerCheckIn">체크인</span> <span
					class="datepickerCheckOut">체크아웃</span>
			</div>
			<div class="DateRangePicker">
				<div>
					<div class="DateRangePickerInput DateRangePickerInput--disabled">
						<div class="DateInput DateInput--disabled">
							<input type="text" aria-label="YYYY-MM-DD"
								class="DateInput__input needsclick" id="startDate"
								name="startDate" value="2017-08-22" placeholder="YYYY-MM-DD"
								autocomplete="off" disabled="disabled" aria-describedby="" readonly="readonly">
							<!-- react-text: 2933 -->
							<!-- /react-text -->
							<div
								class="DateInput__display-text DateInput__display-text--has-input DateInput__display-text--disabled">${sessionScope.startDate }</div>
						</div>
						<div class="DateRangePickerInput__arrow">
							<span></span>
						</div>
						<div class="DateInput DateInput--disabled">
							<input type="text" aria-label="YYYY-MM-DD"
								class="DateInput__input needsclick" id="endDate" name="endDate"
								value="2017-08-23" placeholder="YYYY-MM-DD" autocomplete="off"
								disabled="disabled" aria-describedby="" readonly="readonly">
							<!-- react-text: 2939 -->
							<!-- /react-text -->
							<div
								class="DateInput__display-text DateInput__display-text--has-input DateInput__display-text--disabled">${sessionScope.endDate }</div>
						</div>
					</div>
				</div>
				<div class="sideBodycont">
					<div class="infoBox">
						<ul>
							<li><span class="f-left">포인트 할인</span> <em class="f-right">
									<!-- react-text: 2957 -->- <!-- /react-text --> <!-- react-text: 2958 -->0<!-- /react-text -->
									<!-- react-text: 2959 -->P<!-- /react-text -->
							</em></li>
						</ul>
						<ul>
							<li><span class="f-left">적립 포인트</span> <em class="f-right">
									<!-- react-text: 2964 -->+ <!-- /react-text --> <!-- react-text: 2965 -->0<!-- /react-text -->
									<!-- react-text: 2966 -->P<!-- /react-text -->
							</em></li>
							<li><div class="txt-tip">
									<!-- react-text: 2969 -->
									※ 결제금액이 1만원 미만인 경우 포인트가 적립 되지않습니다.
									<!-- /react-text -->
								</div></li>

						</ul>
						<div class="sideBodycont">
							<ul class="totalPay">

								<li><span class="f-left">결제금액</span><em class="f-right" id="price">

								</em></li>
							</ul>
						</div>
						<button type="button" id="btnPayment">결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="${accomVO.accom_no }" name="accom_no">
	<input type="hidden" value="${roomVO.room_no }" name="room_no">
	<input type="hidden" value="${sessionScope.startDate }" name="checkIn">
	<input type="hidden" value="${sessionScope.endDate }" name="checkOut">
	<input type="hidden" value="${userInfoVO.point }" name="point">
	<input type="hidden" name="price" id="hiddenPrice">
	</form>
</body>
</html>