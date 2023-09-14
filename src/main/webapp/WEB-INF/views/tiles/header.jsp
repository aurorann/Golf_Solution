<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!-- Main navbar -->
<div class="navbar navbar-expand-lg navbar-light navbar-static">
	<div class="d-flex flex-1 d-lg-none">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-mobile">
			<i class="icon-paragraph-justify3"></i>
		</button>
		<button class="navbar-toggler sidebar-mobile-main-toggle" type="button">
			<i class="icon-transmission"></i>
		</button>
		<button type="button" class="navbar-toggler sidebar-mobile-main-toggle">
			<i class="icon-transmission"></i>
		</button>
		<button type="button" class="navbar-toggler sidebar-mobile-right-toggle">
			<i class="icon-arrow-right8"></i>
		</button>
	</div>

	<div class="navbar-brand text-center text-lg-left">
		<a href="index.html" class="d-inline-block"> <img src="/resources/assets/img/golf_logo.png"
			class="d-none d-sm-block" alt="Logo"> <img src="/resources/assets/img/golf_logo.png" class="d-sm-none"
			alt="Logo">
		</a>
	</div>

	<div class="collapse navbar-collapse order-2 order-lg-1" id="navbar-mobile">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a href="/home" class="navbar-nav-link">
					COURSE
				</a>
			</li>
			<li class="nav-item">
				<a href="/management/dashboard" class="navbar-nav-link">
					MANAGEMENT
				</a>
			</li>
		</ul>

	</div>

	<ul class="navbar-nav flex-row order-1 order-lg-2 flex-1 flex-lg-0 justify-content-end align-items-center">
		<li class="nav-item">
			<a href="#" class="navbar-nav-link navbar-nav-link-toggler">
				<i class="fas fa-bell"></i>
				<span class="badge badge-warning badge-pill ml-auto ml-lg-0">2</span>
			</a>				
		</li>

		<li class="nav-item nav-item-dropdown-lg dropdown dropdown-user h-100">
			<a href="#" class="navbar-nav-link navbar-nav-link-toggler dropdown-toggle d-inline-flex align-items-center h-100" data-toggle="dropdown">
				<img src="assets/img/user.png" class="rounded-pill mr-lg-2" height="34" alt="">
				<span class="d-none d-lg-inline-block">사용자명</span>
			</a>

			<div class="dropdown-menu dropdown-menu-right">
				<a href="#" class="dropdown-item">내 정보</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item">로그아웃</a>
			</div>
		</li>
	</ul>
</div>
<!-- /main navbar -->

<script>
// $(document).ready(function() {
//     var path = window.location.pathname; // 현재 페이지의 경로
//     $('.nav-item a').each(function() {
//         var href = $(this).attr('href');
//         if (path === href) { // 현재 페이지의 경로와 메뉴 아이템의 href가 일치하면
//             $(this).addClass('active'); // 해당 메뉴 아이템에 'active' 클래스 추가
//         }
//     });
// });
</script>