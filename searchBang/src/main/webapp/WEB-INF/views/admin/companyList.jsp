<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/searchBang/css/admin/tablestyle.css">
<link rel="stylesheet" href="//cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<!-- Paging Datatables -->
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
	<script src="/searchBang/js/common/jquery.datatables.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#admintable').dataTable({
		"info": false,
		"scrollY": 353,// 게시판 height 세로길이고정
		"order": [[ 0, "desc" ]], //마지막 등록한 글이 위로가게 내림차순 정렬
		"lengthMenu": [ 10, 25, 50], //기본 Data 10개 25개 50개 "All" 모두
		"oLanguage": {
			"sLoadingRecords": "데이터를 불러오는 중입니다.",
			"sProcessing": "데이터를 처리중 입니다.",
			"sEmptyTables": "데이터가 없습니다.",
			"sSearch": "<span>검색</span> _INPUT_",//검색
			"sZeroRecords": "검색 결과가 없습니다.",
			"sLengthMenu" : "<span>페이지 갯수</span> _MENU_"
		}

		});

	});
</script>

<title>Company List</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 800px; margin: 0 auto;">
		<h1>CompanyList</h1>
		<hr />
		<br />
		<form name="approve" method="post">
			<input type="hidden" name="ownerEmail" id="hiddenOwnerEmail">
			<table id="admintable">
				<thead>
				<tr class="admintr">
					<th class="adminth" style="border-right: 2px solid white;">EMAIL</th>
					<th class="adminth" style="border-right: 2px solid white;">이름</th>
					<th class="adminth" style="border-right: 2px solid white;">전화번호</th>
					<th>&nbsp;</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="row" items="${list }">
					<tr class="adminList">
						<td class="admintd">${row.ownerEmail}</td>
						<td class="admintd">${row.ownerName}</td>
						<td class="admintd">${row.ownerPhone}</td>
						<td class="admintd">상세보기</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>