<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>http://www.blueb.co.kr</title>
        <script src="js/user/jquery-1.4.3.min.js"></script>
        <script src="js/user/galleria.js"></script>
        <script src="js/user/galleria.classic.js"></script>
        <style>
            
            .content{color:#eee;font:14px/1.4 "helvetica neue", arial,sans-serif;width:auto;}
            #galleria{margin:10px;width:520px;height:430px;}
        </style>
    </head>
<body>
<div class="content">
	
	<div id="galleria">
		<c:if test="${vo.accomimg1 != 'null'}">
		<img alt="이미지 정보" src="${vo.accomimg1}">
		</c:if>
		<c:if test="${vo.accomimg2 != 'null'}">
		<img alt="이미지 정보" src="${vo.accomimg2}">
		</c:if>
		<c:if test="${vo.accomimg3 != 'null'}">
		<img alt="이미지 정보" src="${vo.accomimg3}">
		</c:if>
		<c:if test="${vo.accomimg4 != 'null'}">
		<img alt="이미지 정보" src="${vo.accomimg4}">
		</c:if>
		<c:if test="${vo.accomimg5 != 'null'}">
		<img alt="이미지 정보" src="${vo.accomimg5}">
		</c:if>
		<c:if test="${vo.accomimg6 != 'null'}">
		<img alt="이미지 정보" src="${vo.accomimg6}">
		</c:if>
		<c:if test="${vo.accomimg7 != 'null'}">
		<img alt="이미지 정보" src="${vo.accomimg7}">
		</c:if>
		<c:if test="${vo.accomimg8 != 'null'}">
		<img alt="이미지 정보" src="${vo.accomimg8}">
		</c:if>
		<c:if test="${vo.accomimg9 != 'null'}">
		<img alt="이미지 정보" src="${vo.accomimg9}">
		</c:if>

		
	</div>
</div>

<script>
$('#galleria').galleria();
</script>

</body>
</html>