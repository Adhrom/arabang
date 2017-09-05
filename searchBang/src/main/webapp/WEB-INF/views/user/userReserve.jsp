<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/searchBang/css/user/userReserve.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="userTop.jsp" flush="false"></jsp:include>
   <div id="userReserve">
   <jsp:include page="userInfoTab.jsp" flush="false"></jsp:include>

      <div id="myRoomList">
         <span>총</span><span>곳</span>


         <div class="tb_area">
            <table class="list_tbl" id="listTb">
               <colgroup>
                  <col width="35%">
                  <col width="20%">
                  <col width="25%">
                  <col width="15%">
                  <col width="5%">
               </colgroup>
               <thead>
                  <tr>
                     <th colspan="2">내용</th>
                     <th>지역</th>
                     <th>연락처</th>
                     <th></th>

                  </tr>
               </thead>
               <tbody>
                  <tr>

                     <td >이미지</td>
                     <td id="companyName" >업체 이름 호텔</td>
                     <td>경기도 수원시 팔달구 6215 나길 ㅇㅇ모텔</td>
                     <td >035-521-6515</td>
                     <td><button id="remove"><img src="Remove.png"></button></td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>

   </div>
   
</body>
</html>