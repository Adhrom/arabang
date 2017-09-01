<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/searchBang/css/common/btstyle.css">
<link rel="stylesheet" href="/searchBang/css/owner/owner_mypage.css?ver=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#insertQnABT').click(function() {
			if($('#subject').val() == ""){
				alert("제목을 적어주세요");
				return false
			}
			if($('#content').val() == ""){
				alert("내용을 적어주세요");
				return false
			}
			document.insertQnA.action = "QnAInsert.owner";
			document.insertQnA.submit();
		});
	});
	function visibleDIV(idMyDiv){
	     var objDiv = document.getElementById(idMyDiv);
	     if(objDiv.style.display=="block"){ objDiv.style.display = "none"; }
	      else{ objDiv.style.display = "block"; }
	}
</script>
<title>1:1문의</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content">
	<h1 id="owner-mypage-title1">&nbsp;1 : 1 문의</h1>
		<div id="question-mark">?</div>
		<h4 id="owner-mypage-title2">궁금하신 내용을 관리자에게 직접 물어보세요</h4>
		<br />
		<hr class="hr-style" />
		<br />
		<form method="post" name="insertQnA">
			<div id="insertQnA" style="width: 700px; margin: 0 auto">
				<input type="text" id="subject" name="subject" placeholder="제목"
					style="width: 85%; padding: 5px 0px 5px 10px; border-radius: 3px;">
				<button id="insertQnABT" class="button">문의하기</button>
				<br />
				<textarea rows="15" cols="94" name="content" placeholder="문의내용"
					style="padding: 10px; border-radius: 3px;"></textarea>
			</div>
		</form>
		<div
			style="border-bottom: 2px solid #00a699; width: 700px; margin: 30px auto;"></div>
		<div id="resultQnA" style="width: 700px; margin: 0 auto">
			<c:forEach var="row" items="${list }" varStatus="number" begin="0"
				end="${size }" step="1">
				<div>
					<span style="font-weight: bold; color: black;">${row.subject }</span>
					<c:if test="${row.reply eq null }">
						<span>답변을 기다리는중...</span>
					</c:if>
					<c:if test="${row.reply ne null }">
						<span>답변완료!</span>
					</c:if>
					<a onclick="visibleDIV(${number.count-1})"><img id="arrow"
						src="/searchBang/img/owner/arrow.png" width="25" height="25"
						style="position: relative; top: 5px; transform: rotate(180deg);"></a>
				</div>
				<hr />
				<div id="${number.count-1 }" style="display: none; margin: 10px;">${row.content }<br /><br/>${row.reply }</div>
			</c:forEach>
		</div>
	</div>
	<!-- 푸터 -->
	<footer>
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</footer>
</body>
</html>