<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main View Test Page</title>


<link rel="stylesheet" href="/searchBang/css/user/searchViewSt.css?ver=1" />
</head>
<body>
<aside id="left">
<jsp:include page="left-search-list.jsp" />
</aside>
<section id="main-view">
<%@include file="right-search-commit.jsp"%>
</section>

</body>
</html>