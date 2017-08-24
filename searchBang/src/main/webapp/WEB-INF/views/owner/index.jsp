<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="/searchBang/css/owner/index.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<title>main페이지 중간 메인페이지 구성</title>
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
	<jsp:include page="topmenu.jsp" flush="false"></jsp:include>
	<div class="cd-main-content" style="width: 1000px; margin: 0 auto;">
		<div id="s_banner_wrap">
			<div>
				<img src="/searchBang/img/owner/main.jpg" alt="알아방으로 알아봐!">
				<div class="s_baner_button">

					<div class="img-title">
						<h2 class="img-title-text-1">알아방으로 알아봐!</h2>
					</div>
					<div class="img-title2">
						<h5 class="img-title-text-2">저희 '알아방'은 언제나 사장님의 초고의 파트너로서 최고의
							지원을 아끼지 않겠습니다.</h5>
					</div>
					<div class="img-title2">
						<h5 class="img-title-text-2">항상 사장님의 말씀에 귀기울이며 나아가도록 노력하겠습니다.</h5>
					</div>

					<ul class="s_baner_button_ul">
						<li class="s_baner_button_li"><a href="#"><span
								class="bullhorn"></span><br /> <span class="bullhorn-txt">알아방
									가이드</span></a></li>
						<li class="s_baner_button_li"><a href="#"><span
								class="lightbulb"></span><br /> <span class="lightbulb-txt">알아방
									QnA</span></a></li>
						<li class="s_baner_button_li"><a href="#"><span
								class="comments"></span><br /> <span class="comments-txt">알아방
									가이드</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<section class="bottom-section">
			<aside class="left-side">
				<h3>알아방 공지사항</h3>
				<hr class="under-line1">

				<div>${vo.notice}</div>
				<hr class="under-line2">

				<div>${vo.notice}</div>
				<hr class="under-line2">

				<div>${vo.notice}</div>
				<hr class="under-line2">

				<div>${vo.notice}</div>
				<hr class="under-line2">

				<div>${vo.notice}</div>
				<hr class="under-line2">
				<input class="notice-more-button" type="button" value="더보기">
			</aside>
			<aside class="right-side">
				<div class="right-side-fix">
					<div class="right-side-slide">
						<ul class="bxslider">
							<li class="banner_01"><img
								src="/searchBang/img/owner/ceoimage480p.jpg" width=720
								height=300 alt="사장님용 광고 슬라이드"></li>
							<li class="banner_02"><img
								src="/searchBang/img/owner/main.jpg" width=720
								height=300 alt="사장님용 광고 슬라이드"></li>
						</ul>
					</div>
				</div>
			</aside>
		</section>
	</div>
	<footer>
		<jsp:include page="footer.jsp" flush="false" />
	</footer>
</body>
</html>