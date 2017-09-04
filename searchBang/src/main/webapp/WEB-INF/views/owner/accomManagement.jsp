<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/searchBang/css/owner/owner_mypage.css?ver=1">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
	function accomU(accom_no) {
		location.href="addedAccom.owner?accom_no="+accom_no;
	}
	function accomD(accom_no) {
		if (confirm("삭제하시겠습니까?") == true) {
			location.href="deleteAccom.owner?accom_no="+accom_no;
		} else {
			return;
		}
	}
</script>
<style type="text/css">
</style>
<!-- paging Datatables -->
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="/searchBang/js/common/jquery.datatables.min.js"></script>

<!-- paging -->
<script type="text/javascript">
	$(function() {
		$('#admintable').dataTable({
		"info": false,
		"scrollY": 360,	//세로고정
		"order": [[ 0, "desc" ]], //마지막 등록한 글이 위로가게 내림차순 정렬
		"lengthMenu": [ 10, 25, 50], //기본 Data 10개 25개 50개 "All" 모두
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
<title>숙소 관리</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content">
		<h1 id="owner-mypage-title1">&nbsp;숙소 관리</h1>
		<div id="question-mark">?</div>
		<h4 id="owner-mypage-title2">숙소에 대한 정보확인 및 등록,수정,삭제를 할 수 있습니다.</h4>
		<br />
		<hr class="hr-style" />
		<a href="addedAccom.owner" style="position: relative; left: 900px; top: -55px;"><button class="button">등록</button></a>
		<br />
		<c:if test="${size eq 0}">
			등록된 숙소가 없습니다 숙소를 등록해 주세요
		</c:if>
		<c:forEach items="${list }" var="row">
			<table>
				<tr>
					<td rowspan="4" style="vertical-align: bottom;"><a href="roomManagement.owner?accom_no=${row.accom_no }"><img src="${row.accomimg1 }" height="250" width="350px"></a></td>
					<td style="height: 50px; vertical-align: middle; padding-left: 10px; font-size: 1.6em; font-weight: bold;">${row.accomName }</td>
				</tr>
				<tr>
					<td style="height: 50px; vertical-align: middle; padding-left: 10px;" >${row.accomAddress}&nbsp;${row.accomAddress2}</td>
				</tr>
				<tr>
					<td style="height: 50px; vertical-align: middle; padding-left: 10px;">${row.accomPhone }</td>
				</tr>
				<tr>
					<td style="height: 50px; vertical-align: middle; padding-left: 5px;"><button type="button" onclick="accomU('${row.accom_no}')"
							class="button">수정</button>
						<button type="button" onclick="accomD('${row.accom_no}')"
							class="button">삭제</button>
						<a href="roomManagement.owner?accom_no=${row.accom_no }"><button class="button">방보기</button></a>
					</td>
				</tr>
			</table>
			<br/>
		</c:forEach>
	</div>
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
</body>
</html>