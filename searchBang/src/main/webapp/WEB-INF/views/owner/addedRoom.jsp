<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>방 추가 페이지</title>
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css">
<link rel="stylesheet" href="/searchBang/css/common/checkboxstyle.css">
<link rel="stylesheet" href="/searchBang/css/owner/owner_mypage.css?ver=1">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<style type="text/css">
.divmargin2 {
	margin-bottom: 10px;
}

#holder {
	border: 1px solid #989898;
	width: 380px;
	min-height: 200px;
	margin: 10px auto;
	color: #00a699;
	font-size: 18px;
	padding: 10px 20px;
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
<script>
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
	$(document)
			.ready(
					function() {
						$('#insertRoomBT')
								.click(
										function() {
											if (!$('#rent').is(":checked")) {
												if (!$('#lodge').is(":checked")) {
													alert("대실과 숙박중 하나는 선택을 해주세요");
													return false;
												}
											}
											if (!$('#normalRoom')
													.is(":checked")) {
												if (!$('#normalTwinRoom').is(
														":checked")) {
													if (!$('#sweetRoom').is(
															":checked")) {
														if (!$('#sweetTwinRoom')
																.is(":checked")) {
															if (!$('#ondol')
																	.is(
																			":checked")) {
																if (!$(
																		'#specialRoom')
																		.is(
																				":checked")) {
																	if (!$(
																			'#specialTwinRoom')
																			.is(
																					":checked")) {
																		if (!$(
																				'#subspecialRoom')
																				.is(
																						":checked")) {
																			alert("방 타입을 선택해 주세요");
																			return false;
																		}
																	}
																}
															}
														}
													}
												}
											}
											if ($('#rent').is(":checked")) {
												if ($('#roomRent_Closingtime')
														.val() == "") {
													alert("대실 마감시간을 적어주세요");
													return;
												}
												if ($('#roomRent_Usetime')
														.val() == "") {
													alert("대실 이용시간을 적어주세요");
													return;
												}
												if ($('#roomRent').val() == "") {
													alert("대실 가격을 적어주세요");
													return;
												}
											}
											if ($('#lodge').is(":checked")) {
												if ($('#roomLodge_Checkin')
														.val() == "") {
													alert("숙박 입실시간을 적어주세요");
													return;
												}
												if ($('#roomLodge_Checkout')
														.val() == "") {
													alert("숙박 퇴실시간을 적어주세요");
													return;
												}
												if ($('#roomLodge').val() == "") {
													alert("숙박 가격을 적어주세요");
													return;
												}
											}
											if (!$('#rent').is(":checked")) {
												$('#roomRent_Closingtime').val(
														0);
												$('#roomRent_Usetime').val(0);
												$('#roomRent').val(0);
											}
											if (!$('#lodge').is(":checked")) {
												$('#roomLodge_Checkin').val(0);
												$('#roomLodge_Checkout').val(0);
												$('#roomLodge').val(0);
											}
											if ($('#roomCount').val() == "") {
												alert("방 갯수를 적어주세요");
												return;
											}
											if ($('#roomUsingPeople').val() == "") {
												alert("방 이용가능 인원 수를 적어주세요");
												return;
											}
											if ($('#input_imgs').val() == "") {
												alert("사진을 최소 한장 등록해주세요");
												return false;
											}
											document.insertRoom.action = "insertRoom.owner";
											document.insertRoom.submit();
										});
						if ($('#H_roomType').val() == 'normalRoom')
							$('#normalRoom').prop("checked", true);
						if ($('#H_roomType').val() == 'normalTwinRoom')
							$('#normalTwinRoom').prop("checked", true);
						if ($('#H_roomType').val() == 'sweetRoom')
							$('#sweetRoom').prop("checked", true);
						if ($('#H_roomType').val() == 'sweetTwinRoom')
							$('#sweetTwinRoom').prop("checked", true);
						if ($('#H_roomType').val() == 'ondol')
							$('#ondol').prop("checked", true);
						if ($('#H_roomType').val() == 'specialRoom')
							$('#specialRoom').prop("checked", true);
						if ($('#H_roomType').val() == 'specialTwinRoom')
							$('#specialTwinRoom').prop("checked", true);
						if ($('#H_roomType').val() == 'subspecialRoom')
							$('#subspecialRoom').prop("checked", true);
						if ($('#roomRent').val() != "")
							$('#rent').prop("checked", true);
						if ($('#roomLodge').val() != "")
							$('#lodge').prop("checked", true);
					});
</script>
</head>
<body>
	<!-- 헤더 -->

	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>

	<!-- 메인콘텐츠 -->
	<div class="cd-main-content" style="width: 1000px; margin: 50px auto;">
		<h1>MY 룸 관리</h1>
		<br/>
		<hr />
		<br/>
		<form enctype="multipart/form-data" name="insertRoom" method="post">
			<div id="imgUpload">
				<div id="holder">
					<c:choose>
						<c:when test="${vo.roomCount ne null}">
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
			<div id="roomType" class="checks etrans">
				<input type="radio" name="roomType" value="normalRoom"
					id="normalRoom"><label for="normalRoom">일반</label> <input
					type="radio" name="roomType" value="normalTwinRoom"
					id="normalTwinRoom"><label for="normalTwinRoom">일반
					트윈룸</label> <input type="radio" name="roomType" value="sweetRoom"
					id="sweetRoom"><label for="sweetRoom">스위트룸</label> <input
					type="radio" name="roomType" value="sweetTwinRoom"
					id="sweetTwinRoom"><label for="sweetTwinRoom">스위트
					트윈룸</label>
				<div class="divmargin2"></div>
				<input type="radio" name="roomType" value="ondol" id="ondol"><label
					for="ondol">온돌</label> <input type="radio" name="roomType"
					value="specialRoom" id="specialRoom"><label
					for="specialRoom">특실</label> <input type="radio" name="roomType"
					value="specialTwinRoom" id="specialTwinRoom"><label
					for="specialTwinRoom">특실 트윈룸</label> <input type="radio"
					name="roomType" value="subspecialRoom" id="subspecialRoom"><label
					for="subspecialRoom">준특실</label>
			</div>
			<div>
				방 갯수<input type="number" min="1" name="roomCount" id="roomCount"
					value="${vo.roomCount }"> 방 이용가능 인원 수<input type="number"
					min="1" name="roomUsingPeople" id="roomUsingPeople"
					value="${vo.roomUsingPeople }">
			</div>
			<div id="대실" class="checks etrans">
				<input type="checkbox" id="rent"><label for="rent">대실</label>
				마감시간 <input type="number" min="1" max="24"
					name="roomRent_Closingtime" id="roomRent_Closingtime"
					value="${vo.roomRent_Closingtime }"> 이용시간 <input
					type="number" min="1" max="24" name="roomRent_Usetime"
					id="roomRent_Usetime" value="${vo.roomRent_Usetime }"> 가격<input
					type="number" min="1" name="roomRent" id="roomRent"
					value="${vo.roomRent }">원
			</div>
			<div id="숙박" class="checks etrans">
				<input type="checkbox" id="lodge"><label for="lodge">숙박</label>
				입실시간<input type="number" min="1" max="24" name="roomLodge_Checkin"
					id="roomLodge_Checkin" value="${vo.roomLodge_Checkin }">
				퇴실시간<input type="number" min="1" max="24" name="roomLodge_Checkout"
					id="roomLodge_Checkout" value="${vo.roomLodge_Checkout }">
				가격<input type="number" min="1" name="roomLodge" id="roomLodge"
					value="${vo.roomLodge }">원
			</div>
			<div>
				<input type="button" value="등록" class="button" id="insertRoomBT">
			</div>
			<input type="hidden" value="${vo.roomType }" id="H_roomType">
		</form>
	</div>
	<!-- 푸터 -->
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
</body>
</html>