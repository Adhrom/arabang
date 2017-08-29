<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#returnList').click(function() {
			history.go(-1);
		});
		$('#noticeModify').click(function() {
			document.notice.action = "noticeWrite.admin"
			document.notice.submit();
		});
		$('#noticeDel').click(function() {
			document.notice.action = "noticeDel.admin"
			document.notice.submit();
		});
	});
</script>
<title>Notice Read</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 800px; margin: 0 auto;">
		<h1>Notice Read</h1>
		<hr />
		<br />
		<form name="notice" method="post">
			<input type="hidden" value="${noticeVO.notice_no }" name="notice_no">
			<input type="hidden" value="${noticeVO.subject }" name="subject">
			<input type="hidden" value="${noticeVO.content }" name="content">
			<input type="hidden" value="${noticeVO.noticeType }"
				name="noticeType">
			<table style="width: 700px; margin: 0 auto;">
				<tbody>
					<tr height="50px;" style="border-bottom: 2px solid #989898;">
						<td
							style="color: black; font-size: 30px; font-weight: bold; padding: 20px 10px;">${noticeVO.subject }</td>
					</tr>
					<tr style="border-bottom: 2px solid #989898;">
						<td style="padding: 20px 30px;">${noticeVO.content }</td>
					</tr>
					<tr>
						<td align="right" style="padding: 10px;"><input type="button"
							value="수정" id="noticeModify" class="button"> <input
							type="button" value="삭제" id="noticeDel" class="button">
						<button class="button" id="returnList">리스트</button></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>