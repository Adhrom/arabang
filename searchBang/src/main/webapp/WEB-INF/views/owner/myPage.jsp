<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Owner Test</title>
<style>
.switch {
	position: relative;
	margin: 20px auto;
	height: 26px;
	width: 120px;
	background: rgba(0, 0, 0, 0.25);
	border-radius: 3px;
	-webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3), 0 1px
		rgba(255, 255, 255, 0.1);
	box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3), 0 1px
		rgba(255, 255, 255, 0.1);
}

.switch-label {
	position: relative;
	z-index: 2;
	float: left;
	width: 58px;
	line-height: 26px;
	font-size: 11px;
	color: rgba(255, 255, 255, 0.35);
	text-align: center;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.45);
	cursor: pointer;
}

.switch-label:active {
	font-weight: bold;
}

.switch-label-off {
	padding-left: 2px;
}

.switch-label-on {
	padding-right: 2px;
}

.switch-input {
	display: none;
}

.switch-input:checked+.switch-label {
	font-weight: bold;
	color: rgba(0, 0, 0, 0.65);
	text-shadow: 0 1px rgba(255, 255, 255, 0.25);
	-webkit-transition: 0.15s ease-out;
	-moz-transition: 0.15s ease-out;
	-o-transition: 0.15s ease-out;
	transition: 0.15s ease-out;
}

.switch-input:checked+.switch-label-on ~ .switch-selection {
	left: 60px;
}

.switch-selection {
	display: block;
	position: absolute;
	z-index: 1;
	top: 2px;
	left: 2px;
	width: 58px;
	height: 22px;
	background: #00a699;
	border-radius: 3px;
	background-image: -webkit-linear-gradient(top, #00a699, #00a699);
	background-image: -moz-linear-gradient(top, #00a699, #00a699);
	background-image: -o-linear-gradient(top, #00a699, #00a699);
	background-image: linear-gradient(to bottom, #00a699, #00a699);
	-webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.5), 0 0 2px
		rgba(0, 0, 0, 0.2);
	box-shadow: inset 0 1px rgba(255, 255, 255, 0.5), 0 0 2px
		rgba(0, 0, 0, 0.2);
	-webkit-transition: left 0.15s ease-out;
	-moz-transition: left 0.15s ease-out;
	-o-transition: left 0.15s ease-out;
	transition: left 0.15s ease-out;
}
</style>
<link rel="stylesheet"
	href="/searchBang/css/owner/owner_style.css?ver=1">
<link rel="stylesheet"
	href="/searchBang/css/owner/owner_mypage.css?ver=1">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script src="/searchBang/js/admin/jquery.popupoverlay.js"></script>
	<!-- paging css -->
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="//cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.css"><!-- 이거 넣으면 datatable 검색과 목록간 밑단 픽셀 간격이 맞춰짐 -->
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	var accom_no2 = "";
	var offId2 = new Object();
	$(document).ready(function() {
		$('#hotdealOnBT').popup({
			transition : 'all 0.3s',
			blur : false,
			escape : false
		});
		$('#ok').click(function() {
			var regExp = /^\d{1,2}$/;
			if (!regExp.test($('#accomHotdeal_DC').val())) {
				alert("할인율은 1-99까지의 숫자만 넣어주세요");
				return false;
			}
			$.ajax({
				data : {
					"accom_no" : accom_no2,
					"accomHotdeal" : "y",
					"accomHotdeal_DC" : $('#accomHotdeal_DC').val()
				},
				url : "hotdeal.owner"
			});
		});
		$('#cancel').click(function() {
			document.getElementById(offId2).checked = true;
		});

		//정보수정 모달팝업
		$('#updateInfo').popup({
			transition : 'all 0.3s'
		});
		$('#back').click(function() {
			$('#updateInfo').popup('hide');
		});
		$('#next').click(function() {
			var regExp = /^\d{2,4}-\d{3,4}-\d{4}$/;
			var ownerName = $('#ownerName').val();
			var ownerEmail = $('#ownerEmail').val();
			var ownerPw = $('#ownerPw').val();
			var ownerRePw = $('#ownerRePw').val();
			if (ownerName == "") {
				$('#ownerNameP').css("color", "red");
				$("#ownerNameP").text("이름을 입력해주세요.");
				$("#ownerName").focus();
				return;
			} else {
				$("#ownerNameP").text("　");
			}
			if (ownerEmail == "") {
				$('#ownerEmailP').css("color", "red");
				$("#ownerEmailP").text("이메일 인증을 해주세요.");
				return;
			} else {
				$("#ownerEmailP").text("　");
			}
			if (ownerPw == "") {
				$('#ownerPwP').css("color", "red");
				$("#ownerPwP").text("비밀번호를 입력해주세요.");
				$("#ownerPw").focus();
				return;
			} else {
				$("#ownerPwP").text("　");
			}
			if (ownerRePw == "") {
				$('#ownerRePwP').css("color", "red");
				$("#ownerRePwP").text("비밀번호를 입력해주세요.");
				$("#ownerRePw").focus();
				return;
			} else {
				$("#ownerRePwP").text("　");
			}
			if (ownerRePw != ownerPw) {
				$('#ownerRePwP').css("color", "red");
				$("#ownerRePwP").text("비밀번호가 다릅니다 확인해주세요.");
				$("#ownerRePw").focus();
				return;
			} else {
				$("#ownerRePwP").text("　");
			}
			if (!regExp.test($('#ownerPhone').val())) {
				$("#ownerPhoneP").css("color", "red");
				$("#ownerPhoneP").text("잘못된 전화번호 입니다 '-'를 포함한 숫자만 입력해주세요.");
				$("#ownerPhone").focus();
				return;
			} else {
				$("#ownerPhoneP").text("　");
			}

			document.regOwner.action = "updateOwner.owner";
			document.regOwner.submit();
		});
	});

	function ownerD(ownerEmail) {
		if (confirm("삭제하시겠습니까?") == true) {
			location.href = "deleteOwner.owner?ownerEmail=" + ownerEmail;
		} else {
			return;
		}
	}

	//핫딜
	function hotdealOn(accom_no, offId) {
		accom_no2 = accom_no;
		offId2 = offId;
		$('#accomHotdeal_DC').val('0');
		$('#hotdealOnBT').popup('show');
	}
	function hotdealOff(accom_no) {
		$.ajax({
			data : {
				"accom_no" : accom_no,
				"accomHotdeal" : "n"
			},
			url : "hotdeal.owner"
		});
	}
</script>
<!-- paging -->
<script type="text/javascript">
	$(function() {
		$('#ownertable').dataTable({
		"scrollY": 335,
		"order": [[ 0, "desc" ]], //마지막 등록한 글이 위로가게 내림차순 정렬
		"bLengthChange": false, //페이지 등록글 갯수 메뉴 삭제
		"pageLength": 4,//페이지 등록글 갯수 4개로 고정
		"oLanguage": {
			"sLoadingRecords": "데이터를 불러오는 중입니다.",
			"sProcessing": "데이터를 처리중 입니다.",
			"sEmptyTables": "데이터가 없습니다.",
			"sSearch": "<span>검색</span> _INPUT_",//검색
			"sZeroRecords": "검색 결과가 없습니다.",
			"sLengthMenu" : "<span>페이징 갯수</span> _MENU_"
		}

		});

	});

</script>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 1000px; margin: 50px auto;">
		<h1 id="owner-mypage-title1">마이 페이지</h1>
		<div id="question-mark">?</div>
		<h4 id="owner-mypage-title2">사장님, 매니저, 관리자 등 직원들의 정보 확인/관리가
			가능합니다.</h4>
		<br />
		<hr class="hr-style" />
		<br />
		<h3 style="color: black; font-weight: bold;">내 정보 관리</h3>

		<form action="#">
			<div class="owner-config">
				<a class="btn updateInfo_open">정보수정<span class="icon icon-gear"></span></a>
			</div>
		</form>

		<div class="owner-photo">
			<div class="owner-photo-get">
				<div class="icon prof"></div>
			</div>
		</div>

		<hr class="owner-view">

		<div class="owner-view-id">
			<div class="owner-view-title">아이디</div>
			<div class="owner-view-value">${vo.ownerEmail}</div>
		</div>

		<div class="owner-view-name">
			<div class="owner-view-title">이름</div>
			<div class="owner-view-value">${vo.ownerName}</div>
		</div>
		<div class="owner-view-business">
			<div class="owner-view-title">숙소 개수</div>
			<div class="owner-view-value">${size }</div>
		</div>

		<div class="owner-list-box">내숙소 리스트</div>
		<div
			style="margin-top: 20px; width: 1000px; margin-left: auto; margin-right: auto;">
			<table id="ownertable" class="list-box-bar-company-list">
			<thead>
				<tr class="owner-list-box-bar">
					<td class="table-rank">등급</td>
					<td class="table-company">숙소명</td>
					<td class="table-address">주소</td>
					<td class="table-tel">숙소전화번호</td>
					<td class="table-hotdeal">핫딜 on/off</td>
					<td class="table-view">보기</td>
				</tr>
					</thead>

				<tbody>
					<c:forEach items="${list }" var="row" varStatus="number" begin="0"
						step="1">
						<tr>
							<td class="table-rank"></td>
							<td class="table-company">${row.accomName }</td>
							<td class="table-address">${row.accomAddress }/
								${row.accomAddress2 }</td>
							<td class="table-tel">${row.accomPhone }</td>
							<td class="table-hotdeal">
								<div class="switch">
									<c:choose>
										<c:when test="${row.accomHotdeal eq 'y' }">
											<input type="radio" class="switch-input"
												name="view${number.count }" value="n"
												id="off${number.count }"
												onclick="hotdealOff('${row.accom_no}' )">
											<label for="off${number.count }"
												class="switch-label switch-label-off">OFF</label>
											<input type="radio" class="switch-input"
												name="view${number.count }" value="y"
												id="on${number.count }"
												onclick="hotdealOn('${row.accom_no}' , 'off${number.count }')"
												checked>
											<label for="on${number.count }"
												class="switch-label switch-label-on">ON</label>
											<span class="switch-selection"></span>
										</c:when>
										<c:otherwise>
											<input type="radio" class="switch-input"
												name="view${number.count }" value="n"
												id="off${number.count }"
												onclick="hotdealOff('${row.accom_no}' )" checked>
											<label for="off${number.count }"
												class="switch-label switch-label-off">OFF</label>
											<input type="radio" class="switch-input"
												name="view${number.count }" value="y"
												id="on${number.count }"
												onclick="hotdealOn('${row.accom_no}' , 'off${number.count }')">
											<label for="on${number.count }"
												class="switch-label switch-label-on">ON</label>
											<span class="switch-selection"></span>
										</c:otherwise>
									</c:choose>
								</div>
							</td>
							<td class="table-view2"><a href="/searchBang/ownerManagement.owner?accom_no=${row.accom_no }" class="list-view-btn">
									<img src="/searchBang/img/owner/magnifier.png" width="20"
									height="20">
							</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
		</div>
	</div>
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
	<!-- 모달팝업 -->
	<div id="hotdealOnBT" style="background-color: white; padding: 30px; border: 1px solid #00a699; border-radius: 3px;">
		<form method="post" name="hotdealOnForm">
			<table style="width: 300px;">
				<tr height="50px">
					<td style="font-size: 30px; font-weight: bold;">할인율</td>
				</tr>
				<tr height="50px">
					<td colspan="2"><input type="number" min="1" max="99" step="1"
						id="accomHotdeal_DC" style="width: 100%; height: 30px; font-size: 18px; border-radius: 3px; border: 1px solid #00a699;"></td>
				</tr>
				<tr height="50px">
					<td width="50%"><button class="hotdealOnBT_close button" id="cancel" style="width: 95%">취소</button></td>
					<td width="50%"><button class="hotdealOnBT_close button" id="ok" style="width: 95%">확인</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="updateInfo"
		style="width: 600px; background-color: white; padding: 50px; border: 3px solid #00a699; border-radius: 5px;">
		<form name="regOwner" method="post">
			<table>
				<tr>
					<td colspan="3" class="label">&nbsp;&nbsp;이름</td>
				</tr>
				<tr>
					<td colspan="3"><input type="text" class="frmdate"
						id="ownerName" name="ownerName" value="${vo.ownerName }"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="3" id="ownerNameP" class="label">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3" class="label">&nbsp;&nbsp;이메일</td>
				</tr>
				<tr>
					<td colspan="3"><input type="email" class="frmdate"
						id="ownerEmail" name="ownerEmail" readonly="readonly"
						value="${vo.ownerEmail }"></td>
				</tr>
				<tr>
					<td colspan="3" id="ownerEmailP" class="label">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3" class="label">&nbsp;&nbsp;비밀번호</td>
				</tr>
				<tr>
					<td colspan="3"><input type="password" class="frmdate"
						id="ownerPw" name="ownerPw"></td>
				</tr>
				<tr>
					<td colspan="3" id="ownerPwP" class="label">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3" class="label">&nbsp;&nbsp;비밀번호 확인</td>
				</tr>
				<tr>
					<td colspan="3"><input type="password" class="frmdate"
						id="ownerRePw" name="ownerRePw"></td>
				</tr>
				<tr>
					<td colspan="3" id="ownerRePwP" class="label">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3" class="label">&nbsp;&nbsp;업체 대표 번호</td>
				</tr>
				<tr>
					<td colspan="3"><input type="text" class="frmdate"
						name="ownerPhone" id="ownerPhone" value="${vo.ownerPhone }"></td>
				</tr>
				<tr>
					<td colspan="3" id="ownerPhoneP" class="label">&nbsp;</td>
				</tr>
			</table>
			<table>
				<tr>
					<td align="left" width="33%"><button class="button"
							style="width: 95%;" id="back">돌아가기</button></td>
					<td align="right" width="33%"><button class="button"
							type="button" id="next" style="width: 95%;">수정</button>
					<td align="right" width="33%"><button class="cancel"
							type="button" id="delete" onclick="ownerD('${vo.ownerEmail}')"
							style="width: 95%;">탈퇴</button>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>