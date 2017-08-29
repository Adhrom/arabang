<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#insertReplyBT').click(function() {
			if ($('#reply').val() == "") {
				alert("답변내용을 채워주세요");
				return false;
			}
			document.insertReply.action = "insertReply.admin";
			document.insertReply.submit();
		});
	});
	function visibleDIV(idMyDiv){
	     var objDiv = document.getElementById(idMyDiv);
	     if(objDiv.style.display=="block"){ objDiv.style.display = "none"; }
	      else{ objDiv.style.display = "block"; }
	}
</script>
<title>QnA reply</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 800px; margin: 0 auto;">
		<h1>QnA reply</h1>
		<hr />
		<br />
		<div>
			<form method="post" name="insertReply">
				<c:if test="${size eq 0 }">
					등록된 문의가 없습니다
				</c:if>
				<c:forEach var="row" items="${list }" varStatus="number" begin="0"
					end="${size }" step="1">
				<span style="font-weight: bold; color: black;">문의자</span>${row.ownerEmail }&nbsp;&nbsp;<span style="font-weight: bold; color: black;">제목</span>${row.subject }<a
						onclick="visibleDIV(${number.count-1})"><img id="arrow"
						src="/searchBang/img/owner/arrow.png" width="25" height="25"
						style="position: relative; top: 5px; transform: rotate(180deg);"></a>
					<hr/>
					<div id="${number.count-1 }" style="display: none; margin: 10px;">
						${row.content }<br/><br/>
						<textarea rows="7" cols="50" name="reply"></textarea>
						<br /> <input type="button" id="insertReplyBT" value="답변하기" class="button">
						<input type="hidden" value="${row.qna_no }" name="qna_no">
					</div>
				</c:forEach>
			</form>
		</div>
	</div>
</body>
</html>