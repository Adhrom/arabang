<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="/searchBang/css/owner/index.css?ver=2">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<title>ARA에 오신걸 환영합니다</title>
<script>
	$(document).ready(function() {
		var slider = $('.bxslider').bxSlider({
			auto : true,
			mode : 'fade'
		});
		// 클릭시 멈춤 현상 해결 //
		$(document).on('click', '.bx-next, .bx-prev', function() {
			slider.stopAuto();
			slider.startAuto();
			slider.stopAuto();
			slider.startAuto();
		});
		$(document).on('mouseover', '.bx-pager, #bx-pager1', function() {
			slider.stopAuto();
			slider.startAuto();
			slider.stopAuto();
			slider.startAuto();
			slider.stopAuto();
			slider.startAuto();
		});
	});
</script>
</head>
<body>
<div id="ownerIndex">
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content">
		<div id="s_banner_wrap">
			<div style="background-image: url('/searchBang/img/owner/main.jpg'); height: 392px;">
				<div id="s_banner_wrap_text">
					<ul>
						<li id="arabang-ment">알아방으로 알아봐!</li>
					</ul>
					<ul>
					<li id="arabang-smallment">저희 '알아방'은 언제나 사장님의 최고의 파트너로서 최고의 지원을 아끼지 않겠습니다</li>
					<li id="arabang-smallment">항상 사장님의 말씀에 귀기울이며 나아가는 알아방이 되겠습니다.</li>
					</ul>
				</div>
				<div id="s_baner_button">
					<ul>
						<li class="s_baner_button_li"><a href="ownerGuide.owner">
						<span class="bullhorn"></span><br /> <span class="bullhorn-txt">알아방 가이드</span></a></li>
						<li class="s_baner_button_li"><a href="#"><span class="lightbulb"></span><br />
						<span class="lightbulb-txt">알아방 QnA</span></a></li>
						<li class="s_baner_button_li"><a href="QnA.owner">
						<span class="comments"></span><br /> <span class="comments-txt">알아방1:1문의</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<section class="bottom-section">
			<aside class="left-side">
				<div style="padding: 30px 0px 40px 0px;">
					<p style="font-size: 25px; font-weight: bold; color: black;">알아방
						공지사항</p>
					<div
						style="border-bottom: 3px solid #00a699; width: 90px; margin: 0 auto; padding-bottom: 5px;"></div>
				</div>
				<table style="width: 90%; margin: 0 auto;">
					<c:forEach items="${list }" varStatus="number" step="1" begin="1"
						end="5" var="row">
						<tr style="border-bottom: 1px solid #989898; height: 30px;">
							<td
								style="text-align: left; vertical-align: middle; padding-left: 10px;"><a
								href="noticeRead.owner?notice_no=${row.notice_no }">${row.subject }</a></td>
						<tr>
					</c:forEach>
				</table>
				<div style="width: 90px; margin: 0 auto; padding: 15px 0px;">
					<a href="noticeList.owner"><button class="button">더보기</button></a>
				</div>
			</aside>
			<aside class="right-side">
				<div class="right-side-fix">
					<div class="right-side-slide">
						<ul class="bxslider">
							<li class="banner_01"><img
								src="/searchBang/img/owner/ceoimage480p.jpg" width=720
								height=321 alt="사장님용 광고 슬라이드"></li>
							<li class="banner_02"><img
								src="/searchBang/img/owner/main.jpg" width=720 height=321
								alt="사장님용 광고 슬라이드"></li>
						</ul>
					</div>
				</div>
			</aside>
		</section>
	</div>
	</div>
	<footer>
		<jsp:include page="footer.jsp" flush="false" />
	</footer>
</body>
</html>