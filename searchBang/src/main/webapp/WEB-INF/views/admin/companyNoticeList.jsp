<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/searchBang/css/admin/tablestyle.css">
<link rel="stylesheet" href="//cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.css"><!-- 이거 넣으면 datatable 검색과 목록간 밑단 픽셀 간격이 맞춰짐 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#admintable').dataTable({
	"scrollY": 353,// 게시판 height 세로길이고정
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
<title>Company Notice List</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 800px; margin: 0 auto;">
		<h1>Company Notice List</h1>
		<hr />
		<br />
		<form name="conmpanyNoticeList" method="post" action="#">
			<table id="admintable">
			<thead>
				<tr class="admintr">
					<th class="adminth " style="border-right: 2px solid white;"
						width="100px;">NO.</th>
					<th class="adminth ">제목</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="row" items="${noticeList }">
					<tr>
						<td class="admintd">${row.notice_no }</td>
						<td class="admintd"><a
							href="noticeRead.admin?notice_no=${row.notice_no }">${row.subject}</a></td>
					</tr>
				</c:forEach>
				</tbody>
				<tr style="border-top: 2px solid #00a699;">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</form>
			<p style="text-align: center;">
				<a href="noticeWrite.admin?notice=company"><button class="button">글쓰기</button></a>
			</p>
	</div>
</body>
</html>