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
<script src="/searchBang/js/admin/modernizr.js"></script>
<script src="/searchBang/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	function getUrlParams() {
		var params = {};
		window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) {
			params[key] = value;
		});
		return params;
	}
	$(document).ready(function() {
		var notice = getUrlParams();
		if (notice.notice == "customer") {
			$('#noticeType').val(notice.notice);
		}
		if (notice.notice == "company") {
			$('#noticeType').val(notice.notice);
		}
	});
	var ckeditor_config = {
			resize_enabled : false, // 에디터 크기를 조절하지 않음
			enterMode : CKEDITOR.ENTER_BR , // 엔터키를 <br> 로 적용함.
			shiftEnterMode : CKEDITOR.ENTER_P , // 쉬프트 + 엔터를 <p> 로 적용함.
			toolbarCanCollapse : true ,
			removePlugins : "elementspath", // DOM 출력하지 않음
			filebrowserUploadUrl: '/bbs/file_upload', // 파일 업로드를 처리 할 경로 설정.

			// 에디터에 사용할 기능들 정의
			toolbar : [
				[ 'Source', '-' , 'NewPage', 'Preview' ],
				[ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ],
				[ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript'],
				[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ],
				'/',
				[ 'Styles', 'Format', 'Font', 'FontSize' ],
				[ 'TextColor', 'BGColor' ],
				[ 'Image', 'Flash', 'Table' , 'SpecialChar' , 'Link', 'Unlink']
			]
	};

	var editor = null;
	jQuery(function() {
		// ckeditor 적용
		editor = CKEDITOR.replace( "content" , ckeditor_config );
	});

	$(document).ready(function() {
		$('#save').click(function() {
			editor.updateElement();
			document.frm.action = "insertNotice.admin"
			document.frm.submit();
		});
		$('#modify').click(function() {
			editor.updateElement();
			document.frm.action = "noticeUpdate.admin"
			document.frm.submit();
		});
		$('#cancel').click(function() {
			history.go(-1);
		});
	});
</script>
<title>Notice Write</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 800px; margin: 0 auto;">
		<!-- put your content here -->
		<h1>Notice Write</h1>
		<hr />
		<br />
		<form id="frm" name="frm" method="post">
			<table style="width: 800px;">
				<tr>
					<td><strong>Subject</strong>&nbsp;</td>
					<td><c:choose>
							<c:when test="${noticeVO == null }">
								<input type="text" id="subject" name="subject"
									style="width: 600px" />
								<br />
							</c:when>
							<c:otherwise>
								<input type="text" id="subject" name="subject"
									style="width: 600px" value="${noticeVO.subject }" />
								<br />
							</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="30" cols="30" id="content"
							name="content" style="width: 790px; height: 600px;">${noticeVO.content }</textarea></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><c:choose>
							<c:when test="${noticeVO == null }">
								<input type="button" id="save" value="등록" class="button">
							</c:when>
							<c:otherwise>
								<input type="button" id="modify" value="수정" class="button">
							</c:otherwise>
						</c:choose>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="cancel"
						value="취소" class="button"></td>
				</tr>
			</table>
			<c:choose>
				<c:when test="${noticeVO==null }">
					<input type="hidden" name="noticeType" id="noticeType">
				</c:when>
				<c:otherwise>
					<input type="hidden" name="noticeType"
						value="${noticeVO.noticeType }" />
					<input type="hidden" name="notice_no"
						value="${noticeVO.notice_no }" />
				</c:otherwise>
			</c:choose>
		</form>
	</div>
</body>
</html>