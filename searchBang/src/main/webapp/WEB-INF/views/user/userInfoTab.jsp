<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/searchBang/css/user/userInfoTab.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="myRoomMenu">
			<div id="myRoomMenuList"><span>My 숙박</span></div>
			<div id="myRoomMenu_ul">
			<ul>
				<li>포인트 <font color="red">${point }</font><span>P</span></li>
				<li><a href="userReserve.bang">예약내역</a></li>
				<li><a href="verysoonroom.bang">최근 본 숙소</a></li>
				<li><a href="getfavoriteList.bang">찜 리스트</a></li>
				<li><a href="infoAdmin.bang">내 정보 관리</a></li>
			</ul>
			</div>
		</div>

</body>
</html>