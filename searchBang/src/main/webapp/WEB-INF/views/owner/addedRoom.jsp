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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<style type="text/css">
.divmargin2{
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
	$(document).ready(function() {
		$('#insertRoomBT').click(function() {
			if(!$('#rent').is(":checked")){
				if(!$('#lodge').is(":checked")){
					alert("대실과 숙박중 하나는 선택을 해주세요");
					return false;
				}
			}
			document.insertRoom.action = "insertRoom.owner";
			document.insertRoom.submit();
		});
	});
</script>
</head>
<body>
	<!-- 헤더 -->

		<jsp:include page="topmenu.jsp" flush="false"></jsp:include>

	<!-- 메인콘텐츠 -->
	<div class="cd-main-content" style="width: 1000px; margin: 0 auto;">
		<h1>MY 룸 관리</h1>
		<hr/>
		<form enctype = "multipart/form-data" name="insertRoom">
			<div id="imgUpload">
				<div id="holder"><br/>파일 업로드 버튼을 눌러 이미지를 추가하세요<br/><br/>맨 첫번째 이미지가 대표이미지로 설정됩니다</div>
				<div class="input_wrap">
						<a href="javascript:" onclick="fileUploadAction();"
							class="button">파일 업로드</a> <input type="file" id="input_imgs"
							multiple accept="image/*" /> <a href="javascript:"
							class="button" hidden="">업로드</a>
				</div>
			</div>
			<div id="roomType" class="checks etrans">
				<input type="radio" name="roomType" value="normalRoom" id="normalRoom"><label for="normalRoom">일반</label>
				<input type="radio" name="roomType" value="normalTwinRoom" id="normalTwinRoom"><label for="normalTwinRoom">일반 트윈룸</label>
				<input type="radio" name="roomType" value="sweetRoom" id="sweetRoom"><label for="sweetRoom">스위트룸</label>
				<input type="radio" name="roomType" value="sweetTwinRoom" id="sweetTwinRoom"><label for="sweetTwinRoom">스위트 트윈룸</label>
				<div class="divmargin2"></div>
				<input type="radio" name="roomType" value="ondol" id="ondol"><label for="ondol">온돌</label>
				<input type="radio" name="roomType" value="specialRoom" id="specialRoom"><label for="specialRoom">특실</label>
				<input type="radio" name="roomType" value="specialTwinRoom" id="specialTwinRoom"><label for="specialTwinRoom">특실 트윈룸</label>
				<input type="radio" name="roomType" value="subspecialRoom" id="subspecialRoom"><label for="subspecialRoom">준특실</label>
			</div>
			<div>
				방 갯수<input type="number" min="1">
				방 이용가능 인원 수<input type="number" min="1">
			</div>
			<div id="대실" class="checks etrans">
				<input type="checkbox" id="rent"><label for="rent">렌트</label>
				마감시간 <input type="number" min="1" max="24" name="roomRent_Closingtime">
				이용시간 <input type="number" min="1" max="24" name="roomRent_Usetime">
				가격<input type="number" min="1" name="roomRent">원
			</div>
			<div id="숙박" class="checks etrans">
				<input type="checkbox" id="lodge"><label for="lodge">숙박</label>
				입실시간<input type="number" min="1" max="24" name="roomLodge_Checkin">
				퇴실시간<input type="number" min="1" max="24" name="roomLodge_Checkout">
				가격<input type="number" min="1" name="roomLodge">원
			</div>
			<div>
				<input type="button" value="등록" class="button" id="insertRoomBT">
			</div>
		</form>
	</div>
	<!-- 푸터 -->
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
</body>
</html>