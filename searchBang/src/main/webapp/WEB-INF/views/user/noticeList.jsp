<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/searchBang/css/admin/tablestyle.css">
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
<!-- paging css -->
<link rel="stylesheet"
	href="/searchBang/css/common/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<!-- paging -->

<title>Notice List</title>
</head>
<body>
	<header>
		<jsp:include page="userTop.jsp" flush="false"></jsp:include>
	</header>
	<script type="text/javascript">
		$(function() {
			$('#admintable').dataTable({
				"info" : false,
				"scrollY" : 360,
				"order" : [ [ 0, "desc" ] ], //마지막 등록한 글이 위로가게 내림차순 정렬
				"lengthMenu" : [ 10, 25, 50 ], //기본 Data 10개 25개 50개 "All" 모두
				"oLanguage" : {
					"sLoadingRecords" : "데이터를 불러오는 중입니다.",
					"sProcessing" : "데이터를 처리중 입니다.",
					"sEmptyTables" : "데이터가 없습니다.",
					"sSearch" : "<span>검색</span> _INPUT_",//검색
					"sZeroRecords" : "검색 결과가 없습니다.",
					"sLengthMenu" : "<span>페이지 갯수</span> _MENU_"
				}

			});

		});
	</script>

	<div style="width: 1000px; margin: 30px auto;">
		<h1>Notice List</h1>
		<hr />
		<br />
		<table id="admintable">
			<thead>
				<tr class="admintr">
					<th class="adminth " style="border-right: 2px solid white;"
						width="100px;">NO.</th>
					<th class="adminth ">제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list }">
					<tr>
						<td class="admintd">${row.notice_no }</td>
						<td class="admintd"><a
							href="noticeRead.owner?notice_no=${row.notice_no }">${row.subject}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
</body>
</html>