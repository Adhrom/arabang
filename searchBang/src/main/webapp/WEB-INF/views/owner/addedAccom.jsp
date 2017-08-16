 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>숙소 추가 페이지</title>
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script src="/searchBang/js/admin/jquery.popupoverlay.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('accomAddress').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('accomAddress2').focus();
            }
        }).open();
    }
</script>
</head>
<body>
	<!-- 헤더 -->
	<header id="header">
		<jsp:include page="nav.jsp" flush="false"></jsp:include>
	</header>
	<!-- 메인콘텐츠 -->
	<section class="section"
		style="margin-top: 20px; width: 1000px; margin-left: auto; margin-right: auto;">
		<h1>숙소 추가 페이지</h1>
		<hr/>
		<form action="">
		<div id = "left" style="width: 420px;">
			<div id="imgUpload"></div>
			<div id="accomtype">
				<strong>업체타입</strong><br/>&nbsp;
				<input type="radio" name="accomType" id="hotel"><label for="hotel">호텔</label>
				<input type="radio" name="accomType" id="motel"><label for="motel">모텔</label>
				<input type="radio" name="accomType" id="pention"><label for="pention">펜션/풀빌라</label>
				<input type="radio" name="accomType" id="guesthouse"><label for="guesthouse">게스트 하우스</label>
			</div>
			<div id="accomOption">
				<Strong>숙소 옵션</Strong>
				<br/>&nbsp;
				<input type="checkbox" name="option_couplePC" id="option_couplePC"><label for="option_couplePC">커플 PC</label>
				<input type="checkbox" name="option_partyRoom" id="option_partyRoom"><label for="option_partyRoom">파티룸</label>
				<input type="checkbox" name="option_duplex" id="option_duplex"><label for="option_duplex">복층구조</label>
				<input type="checkbox" name="option_spa" id="option_spa"><label for="option_spa">스파/월풀</label>
				<input type="checkbox" name="option_pickUp" id="option_pickUp"><label for="option_pickUp">픽업</label>
				<br/>&nbsp;
				<input type="checkbox" name="option_noPeople" id="option_noPeople"><label for="option_noPeople">무인텔</label>
				<input type="checkbox" name="option_withAnimal" id="option_withAnimal"><label for="option_withAnimal">동물입실</label>
				<input type="checkbox" name="option_business" id="option_business"><label for="option_business">비즈니스</label>
				<input type="checkbox" name="option_noSmoking" id="option_noSmoking"><label for="option_noSmoking">객실금연</label>
				<input type="checkbox" name="option_barbecue" id="option_barbecue"><label for="option_barbecue">바베큐</label>
				<br/>&nbsp;
				<input type="checkbox" name="option_cleanroom" id="option_cleanroom"><label for="option_cleanroom">세탁시설</label>
				<input type="checkbox" name="option_playGround" id="option_playGround"><label for="option_playGround">운동장</label>
				<input type="checkbox" name="option_kitchen" id="option_kitchen"><label for="option_kitchen">주방</label>
				<input type="checkbox" name="option_hanok" id="option_hanok"><label for="option_hanok">한옥</label>
				<input type="checkbox" name="option_glamping" id="option_glamping"><label for="option_glamping">글램핑</label>
				<br/>&nbsp;
				<input type="checkbox" name="option_seminar" id="option_seminar"><label for="option_seminar">세미나실</label>
				<input type="checkbox" name="option_womenOnly" id="option_womenOnly"><label for="option_womenOnly">여성전용</label>
				<input type="checkbox" name="option_nokids" id="option_nokids"><label for="option_nokids">노키즈존</label>
				<br/>&nbsp;
				<input type="checkbox" name="option_freeBlackfast" id="option_freeBlackfast"><label for="option_freeBlackfast">무료 조식 제공</label>
				<input type="checkbox" name="option_snackBar" id="option_snackBar"><label for="option_snackBar">프론트 스낵바 무료이용</label>
			</div>
		</div>
		<div id = "right" style="width: 530px;">
			<table>
				<tr>
					<td>
						<input type="text" id="accomName" name="accomName" placeholder="숙소이름">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="accomAddress" name="accomAddress" placeholder="주소" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="accomAddress2" name="accomAddress2" placeholder="나머지 주소">
					</td>
					<td>
						<input type="button" value="검색" onclick="execDaumPostcode()">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="accomPhone" name="accomPhone" placeholder="숙소 전화번호">
					</td>
				</tr>
			</table>
		</div>
		</form>
	</section>
	<!-- 푸터 -->
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
</body>
</html>