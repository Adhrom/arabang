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
<script>
	function adminD(admin_Id) {
		if (confirm("삭제하시겠습니까?") == true) {
			$("#hiddenformId").val(admin_Id);
			document.delAdmin.submit();
		} else {
			return;
		}
	}
	$(document).ready(function() {
		//모달팝업
		$('#addAdmin').popup({
			transition : 'all 0.3s'
		});
		// 등록
		$('#btnReg').click(function() {
			var regId = $("#regId").val();
			var regPw = $("#regPw").val();
			var reregPw = $("#reregPw").val();
			if (regId == "") {
				$("#regIdP").text("아이디를 입력하세요.");
				$("#regId").focus();
				return;
			}
			if (regPw == "") {
				$("#regPwP").text("비밀번호를 입력하세요.");
				$("#regPw").focus();
				return;
			}
			if (reregPw == "") {
				$("#reregPwP").text("비밀번호를 입력하세요.");
				$("#reregPw").focus();
				return;
			}
			if (reregPw != regPw) {
				$("#reregPwP").text("비밀번호가 다릅니다.");
				$("#reregPw").focus();
				return;
			}
			// 폼 내부의 데이터를 전송할 주소
			document.regAdmin.action = "regAdmin.admin"
			// 제출
			document.regAdmin.submit();
		});
		//관리자등록 검사
		$("#regId").keyup(function() {
			var idcheck = /^[a-z]+[a-z0-9]{5,19}$/g;
			if (!idcheck.test($("#regId").val())) {
				$("#regIdP").text("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
				return;
			} else{
				$("#regIdP").text("좋은 아이디네요!");
				return;
			}
		})
	});
</script>
<style type="text/css">
.inputarea {
	width: 100%;
	border-radius: 4px;
	border: 2px solid #989898;
	color: #989898;
	padding: 5px;
}

#innerdiv {
	border: 2px solid #00a699;
	border-radius: 4px;
	background: white;
	padding: 30px 50px 50px 50px;
}
</style>
<title>Admin Management</title>
</head>
<body>
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 800px; margin: 0 auto;">
		<h1>Admin Management</h1>
		<hr />
		<br />
		<form name="delAdmin" method="post" action="delAdmin.admin">
			<input type="hidden" name="adminId" id="hiddenformId">
			<table>
				<tr>
					<td>ID</td>
					<td>PW</td>
				</tr>
				<c:forEach var="row" items="${list }">
					<tr>
						<td>${row.adminId}</td>
						<td>${row.adminPw}</td>
						<td><c:if test="${row.adminId != 'master' }">
								<c:if test="${row.adminId != sessionScope.loginId}">
									<button type="button" onclick="adminD('${row.adminId}')"
										class="button">삭제</button>
								</c:if>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<br /> <a class="initialism addAdmin_open btn btn-success"><button
				class="button">등록</button></a>
	</div>
	<!-- 모달팝업 -->
	<div id="addAdmin">
		<div id="innerdiv">
			<h1>REG ADMIN</h1>
			<form name="regAdmin" method="post">
				<table style="width: 300px; border: 1px;">
					<tr>
						<td colspan="2"><input name="adminId" id="regId"
							class="inputarea" placeholder="ID" maxlength="20"><br />
							<p id="regIdP">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" name="adminPw"
							id="regPw" placeholder="PASSWORD" class="inputarea"
							maxlength="20"><br />
							<p id="regPwP">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" name="reregPw"
							id="reregPw" placeholder="REPASSWORD" class="inputarea"
							maxlength="20"><br />
							<p id="reregPwP">&nbsp;</p></td>
					</tr>
					<tr>
						<td width="150px" align="left">
							<button type="button" id="btnReg" class="button"
								style="width: 95%;">REG</button>
						</td>
						<td align="right">
							<button type="button" class="button addAdmin_close"
								style="width: 95%;">CANCEL</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>