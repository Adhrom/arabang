<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<style type="text/css">
#mainlogo {
	position: relative;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
}
</style>
<title>Welcome ARABANG</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<img src= "/searchBang/img/admin/index.png" id= "mainlogo" />
</body>
</html>