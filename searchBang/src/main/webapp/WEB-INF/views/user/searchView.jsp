<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main View Test Page</title>


<link rel="stylesheet" href="/searchBang/css/user/searchViewSt.css" />
</head>
<body>
	<jsp:include page="userTop.jsp" flush="false"></jsp:include>
	<div id="search">
		<jsp:include page="search.jsp" flush="false"></jsp:include>
	</div>
	<aside id="left">
		<jsp:include page="left-search-list.jsp" />
	</aside>
	<section id="main-view">
		<jsp:include page="right-search-commit.jsp" />
	</section>

</body>
</html>