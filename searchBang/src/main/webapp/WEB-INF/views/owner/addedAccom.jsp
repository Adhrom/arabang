
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
<link rel="stylesheet" href="/searchBang/css/common/checkboxstyle.css">
<link rel="stylesheet" href="/searchBang/css/owner/owner_mypage.css?ver=1">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script src="/searchBang/resources/ckeditor/ckeditor.js"></script>
<style type="text/css">
.divmargin {
	margin-bottom: 40px;
}

.divmargin2 {
	margin-bottom: 10px;
}

#holder {
	border: 1px solid #989898;
	width: 380px;
	min-height: 200px;
	color: #00a699;
	margin-bottom: 10px;
	font-size: 18px;
	border-radius: 3px;
}

#holder img {
	display: inline-block;
	margin: 15px 25px;
	width: 100px;
	height: 100px;
	cursor: pointer;
}

input[type=file] {
	display: none;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//주소찾기
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('accomAddress').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('accomAddress2').focus();
					}
				}).open();
	}

	// 다중 파일 업로드
	// 이미지 정보들을 담을 배열
	var sel_files = [];
	$(document).ready(function() {
		$("#input_imgs").on("change", handleImgFileSelect);
	});
	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}
	function handleImgFileSelect(e) {
		// 이미지 정보들을 초기화
		sel_files = [];
		$("#holder").empty();
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		var index = 0;
		var max = 9; // 최대 이미지 추가 9 장 제한

		if (filesArr.length > max) { // max를 초과하면 알림창을 띄우고 핸들러 함수를 종료한다.
			alert("파일은 최대 9개 까지만 가능합니다.");
			return;
		}
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_files.push(f);
					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
						$("#holder").append(html);
						index++;
					}
					reader.readAsDataURL(f);
				});
	}
	function deleteImageAction(index) {
		console.log("index : " + index);
		sel_files.splice(index, 1);
		var img_id = "#img_id_" + index;
		$(img_id).remove(); // 그 이미지아이디를 가진 a요소 와 img 요소 통째로 삭제한다.
		$("#input_imgs").val("54");
		console.log(sel_files);
	}
	function submitAction() {
		var data = new FormData();
		for (var i = 0, len = sel_files.length; i < len; i++) {
			var name = "image_" + i;
			data.append(name, sel_files[i]);
		}
		data.append("image_count", sel_files.length);
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "./study01_af.php");
		xhr.onload = function(e) {
			if (this.status == 200) {
				console.log("Result : " + e.currentTarget.responseText);
			}
		}
		xhr.send(data);
	}

	//등록
	$(document).ready(function() {
		
		$('#parking_free').click(function() {
			$('#parking_having_yes').prop("checked", true);
			$('#parking_having_no').prop("checked", false);
		});
		$('#parking_valet').click(function() {
			$('#parking_having_yes').prop("checked", true);
			$('#parking_having_no').prop("checked", false);
		});
		$('#parking_inCharge').click(function() {
			$('#parking_having_yes').prop("checked", true);
			$('#parking_having_no').prop("checked", false);
		});
		$('#parking_having_no').click(function() {
			$('#parking_free').prop("checked", false);
			$('#parking_valet').prop("checked", false);
			$('#parking_inCharge').prop("checked", false);
		});
		$('#parking_having_yes').click(function() {
			$('#parking_free').prop("checked", true);
		});
		$('#insertAccomBT').click(function() {
			var accomName = $("#accomName").val();
			var accomAddress = $("#accomAddress").val();
			var accomAddress2 = $('#accomAddress2').val();
			var accomPhone = $('#accomPhone').val();
			var regExp = /^\d{2,4}-\d{3,4}-\d{4}$/;
			if (accomName == "") {
				alert("숙소이름을 입력해주세요");
				return false;
			}
			if (accomAddress == "") {
				alert("주소를 입력해주세요");
				return false;
			}
			if (accomAddress2 == "") {
				alert("나머지 주소를 입력해주세요");
				return false;
			}
			if (accomPhone == "") {
				alert("숙소전화번호를 입력해주세요");
				return false;
			}
			if (!regExp.test(accomPhone)) {
				alert("'-'를 포함한 숫자만 이용하여 올바른 전화번호를 입력해주세요");
				return false;
			}
			if(!$('#hotel').is(":checked")){
				if(!$('#motel').is(":checked")){
					if(!$('#pention').is(":checked")){
						if(!$('#guesthouse').is(":checked")){
							alert("숙소 타입을 선택해주세요.");
							return false;
						}
					}
				}
			}
			if ($('#input_imgs').val() == ""){
				alert("사진을 최소 한장 등록해주세요");
				return false;
			}
			if(!$('#parking_having_yes').is(":checked")){
				if(!$('#parking_having_no').is(":checked")){
					alert("주차시설 보유 유무를 선택해주세요.");
					return false;
				}
			}
			document.insertAccom.action = "insertAccom.owner";
			document.insertAccom.submit();
		});
		$('#updateAccomBT').click(function() {
			var accomName = $("#accomName").val();
			var accomAddress = $("#accomAddress").val();
			var accomAddress2 = $('#accomAddress2').val();
			var accomPhone = $('#accomPhone').val();
			var regExp = /^\d{2,4}-\d{3,4}-\d{4}$/;
			if (accomName == "") {
				alert("숙소이름을 입력해주세요");
				return false;
			}
			if (accomAddress == "") {
				alert("주소를 입력해주세요");
				return false;
			}
			if (accomAddress2 == "") {
				alert("나머지 주소를 입력해주세요");
				return false;
			}
			if (accomPhone == "") {
				alert("숙소전화번호를 입력해주세요");
				return false;
			}
			if (!regExp.test(accomPhone)) {
				alert("'-'를 포함한 숫자만 이용하여 올바른 전화번호를 입력해주세요");
				return false;
			}
			if(!$('#hotel').is(":checked")){
				if(!$('#motel').is(":checked")){
					if(!$('#pention').is(":checked")){
						if(!$('#guesthouse').is(":checked")){
							alert("숙소 타입을 선택해주세요.");
							return false;
						}
					}
				}
			}
			if ($('#input_imgs').val() == ""){
				alert("사진을 최소 한장 등록해주세요");
				return false;
			}
			if(!$('#parking_having_yes').is(":checked")){
				if(!$('#parking_having_no').is(":checked")){
					alert("주차시설 보유 유무를 선택해주세요.");
					return false;
				}
			}
			document.insertAccom.action = "updateAccom.owner";
			document.insertAccom.submit();
		});
	});
	//에디터
	var ckeditor_config = {
		resize_enabled : false, // 에디터 크기를 조절하지 않음
		enterMode : CKEDITOR.ENTER_BR, // 엔터키를 <br> 로 적용함.
		shiftEnterMode : CKEDITOR.ENTER_P, // 쉬프트 + 엔터를 <p> 로 적용함.
		toolbarCanCollapse : true,
		removePlugins : "elementspath", // DOM 출력하지 않음
		filebrowserUploadUrl : '/bbs/file_upload', // 파일 업로드를 처리 할 경로 설정.

		// 에디터에 사용할 기능들 정의
		toolbar : [
				[ 'Source', '-', 'NewPage', 'Preview' ],
				[ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ],
				[ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript',
						'Superscript' ],
				[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight',
						'JustifyBlock' ], '/',
				[ 'Styles', 'Format', 'Font', 'FontSize' ],
				[ 'TextColor', 'BGColor' ],
				[ 'Image', 'Flash', 'Table', 'SpecialChar', 'Link', 'Unlink' ] ]
	};

	var editor = null;
	jQuery(function() {
		// ckeditor 적용
		editor = CKEDITOR.replace("accomInfo", ckeditor_config);
	});

	//수정시 정보 채워주기

	$(document).ready(function() {
		if($('#H_accomType').val()=='hotel')
			$('#hotel').prop("checked", true);
		if($('#H_accomType').val()=='motel')
			$('#motel').prop("checked", true);
		if($('#H_accomType').val()=='pention')
			$('#pention').prop("checked", true);
		if($('#H_accomType').val()=='guesthouse')
			$('#guesthouse').prop("checked", true);
		if($('#H_option_couplePC').val()=='on')
			$('#option_couplePC').prop("checked", true);
		if($('#H_option_partyRoom').val()=='on')
			$('#option_partyRoom').prop("checked", true);
		if($('#H_option_noPeople').val()=='on')
			$('#option_noPeople').prop("checked", true);
		if($('#H_option_duplex').val()=='on')
			$('#option_duplex').prop("checked", true);
		if($('#H_option_spa').val()=='on')
			$('#option_spa').prop("checked", true);
		if($('#H_option_pickUp').val()=='on')
			$('#option_pickUp').prop("checked", true);
		if($('#H_option_withAnimal').val()=='on')
			$('#option_withAnimal').prop("checked", true);
		if($('#H_option_business').val()=='on')
			$('#option_business').prop("checked", true);
		if($('#H_option_noSmoking').val()=='on')
			$('#option_noSmoking').prop("checked", true);
		if($('#H_option_barbecue').val()=='on')
			$('#option_barbecue').prop("checked", true);
		if($('#H_option_cleanroom').val()=='on')
			$('#option_cleanroom').prop("checked", true);
		if($('#H_option_playGround').val()=='on')
			$('#option_playGround').prop("checked", true);
		if($('#H_option_kitchen').val()=='on')
			$('#option_kitchen').prop("checked", true);
		if($('#H_option_hanok').val()=='on')
			$('#option_hanok').prop("checked", true);
		if($('#H_option_glamping').val()=='on')
			$('#option_glamping').prop("checked", true);
		if($('#H_option_seminar').val()=='on')
			$('#option_seminar').prop("checked", true);
		if($('#H_option_womenOnly').val()=='on')
			$('#option_womenOnly').prop("checked", true);
		if($('#H_option_nokids').val()=='on')
			$('#option_nokids').prop("checked", true);
		if($('#H_option_freeBlackfast').val()=='on')
			$('#option_freeBlackfast').prop("checked", true);
		if($('#H_option_snackBar').val()=='on')
			$('#option_snackBar').prop("checked", true);
		if($('#H_parking_valet').val()=='on')
			$('#parking_valet').prop("checked", true);
		if(!$('#H_parking_free').val()=='yes')
			$('#parking_inCharge').prop("checked", true);
		if(!$('#H_parking_having').val()=='yes')
			$('#parking_having_no').prop("checked", true);
		if($('#H_parking_free').val()=='yes')
			$('#parking_free').prop("checked", true);
		if($('#H_parking_having').val()=='yes')
			$('#parking_having_yes').prop("checked", true);

	});
</script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<!-- 메인콘텐츠 -->
	<div class="cd-main-content" style="width: 1000px; margin: 50px auto;">
		<h1>숙소 추가 페이지</h1>
		<br/>
		<hr />
		<br/>
		<form enctype="multipart/form-data" name="insertAccom" method="post">
			<div id="left" style="width: 450px; float: left;">
				<div id="imgUpload" class="divmargin">
					<div id="holder">
						<c:choose>
						<c:when test="${vo.accomName ne null}">
				
						<br/>수정 시에는 사진을 다시 등록 해 주시기 바랍니다.
						</c:when>
						<c:otherwise>
						<br />파일 업로드 버튼을 눌러 이미지를 추가하세요<br /> <br />맨 첫번째 이미지가 대표이미지로
						설정됩니다<br /> <br />사진은 최대 9장까지 등록이 가능합니다
						</c:otherwise>
						</c:choose>
					</div>
					<div class="input_wrap">
						<a href="javascript:" onclick="fileUploadAction();" class="button">파일
							업로드</a> <input type="file" id="input_imgs" multiple accept="image/*"
							name="uploadFile" />
					</div>
				</div>
				<div id="accomtype" class="checks etrans divmargin">
					<strong>숙소타입</strong>
					<div class="divmargin2"></div>
					&nbsp; <input type="radio" name="accomType" id="hotel"
						value="hotel"><label for="hotel">호텔</label>&nbsp;&nbsp; <input
						type="radio" name="accomType" id="motel" value="motel"><label
						for="motel">모텔</label>&nbsp;&nbsp; <input type="radio"
						name="accomType" id="pention" value="pention"><label
						for="pention">펜션/풀빌라</label>&nbsp;&nbsp; <input type="radio"
						name="accomType" id="guesthouse" value="guesthouse"><label
						for="guesthouse">게스트 하우스</label>
				</div>
				<div id="accomOption" class="checks etrans divmargin">
					<Strong>숙소 옵션</Strong>
					<div class="divmargin2"></div>
					&nbsp; <input type="checkbox" name="option_couplePC"
						id="option_couplePC"><label for="option_couplePC">커플
						PC</label>&nbsp;&nbsp; <input type="checkbox" name="option_partyRoom"
						id="option_partyRoom"><label for="option_partyRoom">파티룸</label>&nbsp;&nbsp;
					<input type="checkbox" name="option_duplex" id="option_duplex"><label
						for="option_duplex">복층구조</label>&nbsp;&nbsp; <input
						type="checkbox" name="option_spa" id="option_spa"><label
						for="option_spa">스파/월풀</label>&nbsp;&nbsp; <input type="checkbox"
						name="option_pickUp" id="option_pickUp"><label
						for="option_pickUp">픽업</label>
					<div class="divmargin2"></div>
					&nbsp; <input type="checkbox" name="option_noPeople"
						id="option_noPeople"><label for="option_noPeople">무인텔</label>&nbsp;&nbsp;
					<input type="checkbox" name="option_withAnimal"
						id="option_withAnimal"><label for="option_withAnimal">동물입실</label>&nbsp;&nbsp;
					<input type="checkbox" name="option_business" id="option_business"><label
						for="option_business">비즈니스</label>&nbsp;&nbsp; <input
						type="checkbox" name="option_noSmoking" id="option_noSmoking"><label
						for="option_noSmoking">객실금연</label>&nbsp;&nbsp; <input
						type="checkbox" name="option_barbecue" id="option_barbecue"><label
						for="option_barbecue">바베큐</label>
					<div class="divmargin2"></div>
					&nbsp; <input type="checkbox" name="option_cleanroom"
						id="option_cleanroom"><label for="option_cleanroom">세탁시설</label>&nbsp;&nbsp;
					<input type="checkbox" name="option_playGround"
						id="option_playGround"><label for="option_playGround">운동장</label>&nbsp;&nbsp;
					<input type="checkbox" name="option_kitchen" id="option_kitchen"><label
						for="option_kitchen">주방</label>&nbsp;&nbsp; <input type="checkbox"
						name="option_hanok" id="option_hanok"><label
						for="option_hanok">한옥</label>&nbsp;&nbsp; <input type="checkbox"
						name="option_glamping" id="option_glamping"><label
						for="option_glamping">글램핑</label>
					<div class="divmargin2"></div>
					&nbsp; <input type="checkbox" name="option_seminar"
						id="option_seminar"><label for="option_seminar">세미나실</label>&nbsp;&nbsp;
					<input type="checkbox" name="option_womenOnly"
						id="option_womenOnly"><label for="option_womenOnly">여성전용</label>&nbsp;&nbsp;
					<input type="checkbox" name="option_nokids" id="option_nokids"><label
						for="option_nokids">노키즈존</label>
					<div class="divmargin2"></div>
					&nbsp; <input type="checkbox" name="option_freeBlackfast"
						id="option_freeBlackfast"><label
						for="option_freeBlackfast">무료 조식 제공</label>&nbsp;&nbsp; <input
						type="checkbox" name="option_snackBar" id="option_snackBar"><label
						for="option_snackBar">프론트 스낵바 무료이용</label>
				</div>
			</div>
			<div id="right" style="width: 530px; float: right;">
				<div id="accominfo" class="divmargin">
					<table style="width: 100%;">
						<tr>
							<td colspan="2" style="padding: 5px 0px 5px 0px;"><input
								type="text" id="accomName" name="accomName" placeholder="숙소이름"
								style="width: 96%; height: 30px; padding-left: 15px;" value="${vo.accomName }"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" id="accomAddress"
								name="accomAddress" placeholder="주소" readonly="readonly"
								style="width: 96%; height: 30px; padding-left: 15px;" value="${vo.accomAddress }"></td>
						</tr>
						<tr>
							<td width="85%"><input type="text" id="accomAddress2"
								name="accomAddress2" placeholder="나머지 주소"
								style="width: 99%; height: 30px; padding-left: 15px;" value="${vo.accomAddress2 }"></td>
							<td><input type="button" value="검색"
								onclick="execDaumPostcode()" class="button"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" id="accomPhone"
								name="accomPhone" placeholder="숙소 전화번호"
								style="width: 96%; height: 30px; padding-left: 15px;" value="${vo.accomPhone }"></td>
						</tr>
					</table>
				</div>
				<div id="parking" class="checks etrans divmargin">
					<strong>주차장 정보</strong>
					<div class="divmargin2"></div>
					&nbsp; <input type="radio" name="parking_having"
						id="parking_having_yes" value="yes" ><label
						for="parking_having_yes">주차시설 보유(이용 전 숙소에 문의해주세요)</label>&nbsp;&nbsp;
					<input type="radio" name="parking_having" id="parking_having_no"
						value="no"><label for="parking_having_no">주차시설 미보유</label>
					<div class="divmargin2"></div>
					&nbsp; <input type="checkbox" name="parking_valet"
						id="parking_valet"><label for="parking_valet">무료
						발렛파킹</label>&nbsp;&nbsp; <input type="radio" name="parking_free"
						id="parking_free" value="yes"><label for="parking_free">무료
						주차</label>&nbsp;&nbsp; <input type="radio" name="parking_free"
						id="parking_inCharge" value="no"><label
						for="parking_inCharge">유료 주차</label>
				</div>
				<div id="info" class="divmargin">
					<strong>추가 안내사항</strong><br />
					<div class="divmargin2"></div>
					<textarea rows="20" cols="71" name="accomInfo" id="accomInfo">${vo.accomInfo }</textarea>
				</div>
			</div>
			<div
				style="clear: both; width: 100px; margin: 0 auto; padding-right: 50px;">
				<c:choose>
				<c:when test="${vo.accomType eq null }">
				<input type="button" value="등록" class="button" id="insertAccomBT">
				</c:when>
				<c:otherwise>
				<input type="button" value="수정" class="button" id="updateAccomBT">
				</c:otherwise>
				</c:choose>
				
			</div>
			<input type="hidden" value="${vo.accomType }" id="H_accomType" >
			<input type="hidden" value="${vo.option_couplePC }" id="H_option_couplePC" >
			<input type="hidden" value="${vo.option_partyRoom }" id="H_option_partyRoom" >
			<input type="hidden" value="${vo.option_noPeople }" id="H_option_noPeople" >
			<input type="hidden" value="${vo.option_duplex }" id="H_option_duplex" >
			<input type="hidden" value="${vo.option_spa }" id="H_option_spa" >
			<input type="hidden" value="${vo.option_pickUp }" id="H_option_pickUp" >
			<input type="hidden" value="${vo.option_withAnimal }" id="H_option_withAnimal" >
			<input type="hidden" value="${vo.option_business }" id="H_option_business" >
			<input type="hidden" value="${vo.option_noSmoking }" id="H_option_noSmoking" >
			<input type="hidden" value="${vo.option_barbecue }" id="H_option_barbecue" >
			<input type="hidden" value="${vo.option_cleanroom }" id="H_option_cleanroom" >
			<input type="hidden" value="${vo.option_playGround }" id="H_option_playGround" >
			<input type="hidden" value="${vo.option_kitchen }" id="H_option_kitchen" >
			<input type="hidden" value="${vo.option_hanok }" id="H_option_hanok" >
			<input type="hidden" value="${vo.option_glamping }" id="H_option_glamping" >
			<input type="hidden" value="${vo.option_seminar }" id="H_option_seminar" >
			<input type="hidden" value="${vo.option_womenOnly }" id="H_option_womenOnly">
			<input type="hidden" value="${vo.option_nokids }" id="H_option_nokids" >
			<input type="hidden" value="${vo.option_freeBlackfast }" id="H_option_freeBlackfast" >
			<input type="hidden" value="${vo.option_snackBar }" id="H_option_snackBar" >
			<input type="hidden" value="${vo.parking_valet }" id="H_parking_valet" >
			<input type="hidden" value="${vo.parking_free }" id="H_parking_free" >
			<input type="hidden" value="${vo.parking_having }" id="H_parking_having" >
			<input type="hidden" value="${vo.accom_no }" id="accom_no" name="accom_no">
		</form>
	</div>
	<!-- 푸터 -->
	<footer style="clear: both">
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
</body>
</html>