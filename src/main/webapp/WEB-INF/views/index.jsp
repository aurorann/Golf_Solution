<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en" class="layout-static">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>골프 코스관리 솔루션 웹</title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="/resources/assets/css/icomoon/styles.min.css" rel="stylesheet" type="text/css">
	<link href="/resources/assets/css/fontawsome/styles.min.css" rel="stylesheet" type="text/css">
	<link href="/resources/assets/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="/resources/assets/css/add.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
	<!-- /core JS files -->
		
	<!-- Theme JS files -->
	<script src="/resources/assets/js/moment.min.js"></script>
	<script src="/resources/assets/js/daterangepicker.js"></script>
	<script src="/resources/assets/js/picker.js"></script>
	<script src="/resources/assets/js/picker.date.js"></script>
	<script src="/resources/assets/js/picker.time.js"></script>
	<script src="/resources/assets/js/legacy.js"></script>
	<script src="/resources/assets/js/jgrowl.min.js"></script>


	<!-- Theme JS files -->
	<script src="/resources/assets/js/app.js"></script>
	<script src="/resources/assets/js/picker_date.js"></script>
	<script src="/resources/assets/js/echarts.min.js"></script>
	<script src="/resources/assets/js/lines_multiple.js"></script>
	<!-- /theme JS files -->
</head>

<body>

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
			<a href="index.html" class="d-inline-block">
				<img src="/resources/assets/img/golf_logo.png" class="d-none d-sm-block" alt="Logo">
				<img src="/resources/assets/img/golf_logo.png" class="d-sm-none" alt="Logo">
			</a>
		</div>

		<div class="collapse navbar-collapse order-2 order-lg-1" id="navbar-mobile">
			<ul class="nav navbar-nav">
				<li class="nav-item">
					<a href="#" class="navbar-nav-link active">
						COURSE
					</a>
				</li>
				<li class="nav-item">
					<a href="#" class="navbar-nav-link">
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
					<img src="/resources/assets/img/user.png" class="rounded-pill mr-lg-2" height="34" alt="">
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


	<!-- Page content -->
	<div class="page-content">

		<!-- Main sidebar -->
		<div class="sidebar sidebar-light sidebar-expand-lg sidebar-main-resized">
		
			<!-- Sidebar content -->
			<div class="sidebar-content sidebar-small">

				<!-- User menu
				<div class="sidebar-section sidebar-user my-1">
					<div class="sidebar-section-body">
						<div class="media">

							<div class="media-body">
								<div class="font-weight-bold">CLUB D 거창</div>
								<div class="font-size-sm line-height-sm opacity-50">
									경상남도 거창군 신원면 감악산로 398
								</div>
							</div>

							<div class="ml-3 align-self-center">
								<button type="button" class="btn btn-outline-light-100 text-dark border-transparent btn-icon rounded-pill btn-sm sidebar-control sidebar-main-resize d-none d-lg-inline-flex">
									<i class="icon-transmission"></i>
								</button>

								<button type="button" class="btn btn-outline-light-100 text-dark border-transparent btn-icon rounded-pill btn-sm sidebar-mobile-main-toggle d-lg-none">
									<i class="icon-cross2"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				user menu -->


				<!-- Main navigation -->
				<div class="sidebar-section">
					<ul class="nav nav-sidebar" data-nav-type="accordion">

						<!-- Main -->
						<!-- <li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">Main</div> <i class="icon-menu" title="Main"></i></li> -->
						<li class="nav-item p-0">
							<a href="course_allcourse.html" class="nav-link active">
								<i class="fas fa-map"></i>
								<span>
									전체 코스
								</span>
							</a>
							<a href="course_separatecourse.html" class="nav-link">
								<i class="fas fa-golf-ball"></i>
								<span>
									개별 코스
								</span>
							</a>
							<a href="course_report.html" class="nav-link">
								<i class="fas fa-chart-bar"></i>
								<span>
									리포트
								</span>
							</a>
						</li>
						<!-- /main -->
					</ul>
				</div>
				<!-- /main navigation -->

			</div>
			<!-- /sidebar content -->
			
		</div>
		<!-- /main sidebar -->


		<!-- Main content -->
		<div class="content-wrapper">

			<!-- Page header -->
			<div class="page-header page-header-light">
				<div class="page-header-content d-sm-flex">
					<div class="page-title" style="width:100%;">
						<h6 class="mr-2 mt-1 font-weight-semibold float-left ml-2">Course</h6>
						<div class="btn-group mr-2">
							<button type="button" class="btn btn-light active">전체</button>
							<button type="button" class="btn btn-light">H1</button>
							<button type="button" class="btn btn-light">H2</button>
							<button type="button" class="btn btn-light">H3</button>
							<button type="button" class="btn btn-light">H4</button>
							<button type="button" class="btn btn-light">H5</button>
							<button type="button" class="btn btn-light">H6</button>
							<button type="button" class="btn btn-light">H7</button>
						</div>

						<div class="btn-group mr-2">
							<button type="button" class="btn btn-light active">Fairway</button>
							<button type="button" class="btn btn-light">Green</button>
						</div>
		
						<div class="btn-group mr-2 float-right">
							<button type="button" class="btn btn-light active">
								<i class="fas fa-seedling"></i> <!--생육-->
							</button>
							<button type="button" class="btn btn-light">
								<i class="fab fa-hotjar"></i> <!--열-->
							</button>
							<button type="button" class="btn btn-light">
								<i class="fas fa-tint"></i> <!--습도-->
							</button>
							<button type="button" class="btn btn-light">
								<i class="fas fa-times"></i> <!--없음-->
							</button>
						</div>
						<h6 class="mr-2 mt-1 font-weight-bold float-right">Layer</h6>
						
					</div>
				</div>
			</div>
			<!-- /page header -->


			<!-- Content area -->
			<div class="content">
				<!-- Basic card -->
				<div class="content-wrap position-relative">

					<div class="position-absolute" style="right:0; top:10px;">

						<div class="btn-group mr-2" >
						<!--영재수정-->
							<button type="button" class="btn btn-light active" style="font-size:11px;border-radius:15px 0 0 15px;">NDVI</button>
							<button type="button" class="btn btn-light" style="font-size:11px;">토양정보</button>
							<button type="button" class="btn btn-light" style="font-size:11px;">기상정보</button>
							<button type="button" class="btn btn-light" style="font-size:11px;border-radius:0 15px 15px 0">없음</button>
						</div>

					</div>
					

					<div class="collapsible-sortable position-absolute" style="left:10px; top:10px;">
						<div class="card layer-card border-info">
							<div class="card-header bg-info text-white">
								<h6 class="card-title">
									<span class="text-white collapsed">Update  : 2023.08.16 11:12

									</span>
								</h6>
							</div>

						</div>

						<div class="card layer-card">
							<div class="card-header header-elements-inline">
								<h6 class="card-title">
									<a class="text-body collapsed" aria-expanded="false">
										<span class="badge badge-danger badge-pill mr-2">Hole 7</span>
										<span>Green</span>
										<span>
											토양온도
											<i class="icon-arrow-up7"></i>
										</span>
									</a>
								</h6>

								<div class="header-elements">
									<div class="list-icons">
										<a class="list-icons-item" data-action="remove"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card layer-card">
							<div class="card-header header-elements-inline">
								<h6 class="card-title">
									<a class="text-body collapsed" aria-expanded="false">
										<span class="badge badge-danger badge-pill mr-2">Hole 2</span>
										<span>Fairway</span>
										<span>
											토양수분
											<i class="icon-arrow-down7"></i>
										</span>
									</a>
								</h6>

								<div class="header-elements">
									<div class="list-icons">
										<a class="list-icons-item" data-action="remove"></a>
									</div>
								</div>
							</div>
						</div>
						
						<div class="card layer-card">
							<div class="card-header header-elements-inline">
								<h6 class="card-title">
									<a class="text-body collapsed" data-toggle="collapse" href="#layer-card-chart" aria-expanded="false">
										<span>차트정보 보기</span>
										<span class="badge badge-success badge-pill">Hole 1</span>
									</a>
								</h6>

								<div class="header-elements">
									<div class="list-icons">
										<a class="list-icons-item" data-action="remove"></a>
									</div>
								</div>
							</div>

							<div id="layer-card-chart" class="collapse show" style="">
								<div class="card-body chart-card scrolled">
									<div class="chart-container">
										<div class="chart has-fixed-height" id="line_multiple" style="height: 440px;"></div>
									</div>
								</div>
							</div>
						</div>

					</div>
						
						<div class="course1 position-absolute card bg-success-100 border-success text-center">
							<a href="#" class="text-body pb-1">
								<div class="card-header bg-success text-white pt-1 pb-1">
									<h6 class="card-title font-weight-semibold">Hole 1</h6>
								</div>

								<div class="card-body pt-2 pb-2">
									<div class="float-left mr-5">
										<span class="badge badge-success badge-pill">양호</span>
										<h2 class="mb-0 font-weight-semibold">0.221</h2>
										<div class="font-size-sm text-muted">현재</div>
									</div>
									<div class="float-left">
										<span class="badge badge-success badge-pill">양호</span>
										<h2 class="mb-0 font-weight-semibold">0.280</h2>
										<div class="font-size-sm text-muted">예측</div>
									</div>
								</div>
							</a>
						</div>

						<div class="course2 position-absolute card border-success text-center">
							<a href="#" class="text-body pb-1">
								<div class="card-header bg-success text-white pt-1 pb-1">
									<h6 class="card-title font-weight-semibold">Hole 2</h6>
								</div>

								<div class="card-body pt-2 pb-2">
									<div class="float-left mr-5">
										<span class="badge badge-success badge-pill">양호</span>
										<h2 class="mb-0 font-weight-semibold">0.221</h2>
										<div class="font-size-sm text-muted">현재</div>
									</div>
									<div class="float-left">
										<span class="badge badge-success badge-pill">양호</span>
										<h2 class="mb-0 font-weight-semibold">0.280</h2>
										<div class="font-size-sm text-muted">예측</div>
									</div>
								</div>
							</a>
						</div>

						
						<div class="course3 position-absolute card border-primary text-center pb-1">
							<a href="#" class="text-body">
								<div class="card-header bg-primary text-white pt-1 pb-1">
									<h6 class="card-title font-weight-semibold">Hole 3</h6>
								</div>
								<!--기상정보 8종-->
								<div class="text-center weather-wrap pl-2 pr-2 pb-2">
									<div class="float-left weather-box mr-3">
										<h4 class="mb-0 font-weight-semibold">-13.6<small class="weather-unit">ºC</small></h4>
										<div class="font-size-sm text-muted">기온</div>
									</div>
									<div class="float-left weather-box mr-3">
										<h4 class="mb-0 font-weight-semibold">13<small class="weather-unit">mm</small></h4>
										<div class="font-size-sm text-muted">강수량</div>
									</div>
									<div class="float-left weather-box mr-3">
										<h4 class="mb-0 font-weight-semibold">북북서</h4>
										<div class="font-size-sm text-muted">풍향</div>
									</div>
									<div class="float-left weather-box">
										<h4 class="mb-0 font-weight-semibold">0.6<small class="weather-unit">m/s</small></h4>
										<div class="font-size-sm text-muted">풍속</div>
									</div>
								</div>
								<div class="text-center weather-wrap pl-2 pr-2">
									<div class="float-left weather-box mr-3">
										<h4 class="mb-0 font-weight-semibold">45<small class="weather-unit">%</small></h4>
										<div class="font-size-sm text-muted">습도</div>
									</div>
									<div class="float-left weather-box mr-3">
										<h4 class="mb-0 font-weight-semibold">6.7<span class="ml-2 badge badge-success badge-pill">양호</span></h4>
										<div class="font-size-sm text-muted">미세먼지</div>
									</div>
									<div class="float-left weather-box mr-3">
										<h4 class="mb-0 font-weight-semibold">4.7<span class="ml-2 badge badge-success badge-pill">양호</span></h4>
										<div class="font-size-sm text-muted">초미세먼지</div>
									</div>
									<div class="float-left weather-box">
										<h4 class="mb-0 font-weight-semibold">423.1<small class="weather-unit">ppm</small></h4>
										<div class="font-size-sm text-muted">이산화탄소</div>
									</div>
								</div>
							</a>
						</div>

						<div class="course4 position-absolute card border-warning text-center">
							<a href="#" class="text-body pb-1">
								<div class="card-header bg-warning text-white pt-1 pb-1">
									<h6 class="card-title font-weight-semibold">Hole 4</h6>
								</div>
								<!--토양정보 3종-->
								<div class="card-body pt-1 pb-2">
									<div class="float-left mr-3">
										<h2 class="mb-0 font-weight-semibold">9.7%</h2>
										<div class="font-size-sm text-muted">토양 수분</div>
									</div>
									<div class="float-left mr-3">
										<h2 class="mb-0 font-weight-semibold">0.221</h2>
										<div class="font-size-sm text-muted">토양 온도</div>
									</div>
									<div class="float-left">
										<h2 class="mb-0 font-weight-semibold">0.280</h2>
										<div class="font-size-sm text-muted">PH</div>
									</div>
								</div>
							</a>
						</div>



						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11124.634462768941!2d127.8932198328219!3d35.58989843099262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356fa1a0b8e4ab75%3A0x6cb5878cba1e3d20!2z7YG065-965SUIOqxsOywvQ!5e1!3m2!1sko!2skr!4v1693789715832!5m2!1sko!2skr" width="100%" height="750" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
				<!-- /basic card -->


			</div>
			<!-- /content area -->



		</div>
		<!-- /main content -->

		<div class="sidebar sidebar-light sidebar-right sidebar-expand-lg">

			<!-- Expand button -->
			<button type="button" class="btn btn-sidebar-expand sidebar-control sidebar-right-toggle">
				<i class="mt-3 pt-1 fas fa-align-justify"></i>
			</button>
			<!-- /expand button -->


			<!-- Sidebar content -->
			<div class="sidebar-content">

				<!-- Header -->
				<div class="sidebar-section sidebar-section-body d-flex align-items-center">
					<h5 class="mb-0 font-weight-bold">검색</h5>
					<div class="ml-auto">
						<button type="button" class="btn btn-outline-light text-body border-transparent btn-icon rounded-pill btn-sm sidebar-control sidebar-right-toggle d-none d-lg-inline-flex">
							<i class="icon-transmission"></i>
						</button>

						<button type="button" class="btn btn-outline-light text-body border-transparent btn-icon rounded-pill btn-sm sidebar-mobile-right-toggle d-lg-none">
							<i class="icon-cross2"></i>
						</button>
					</div>
				</div>
				<!-- /header -->


				<!-- Sidebar search -->
				<div class="sidebar-section">
					<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
						<li class="nav-item-header">설정</li>
						<li class="nav-item text-center pl-2 pr-2">
							<div class="btn-group btn-group-toggle col-lg-12" data-toggle="buttons">
								<label class="btn btn-light active">
									<input type="radio" name="options" id="option1" autocomplete="off" checked="">
									전체
								</label>

								<label class="btn btn-light">
									<input type="radio" name="options" id="option2" autocomplete="off">
									개별
								</label>
							</div>
						</li>
					</ul>


					<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
						<li class="nav-item-header">기간</li>
						<li class="nav-item pl-3 pr-3">
							<!--달력 플러그인-->
							<div class="input-group">
								<span class="input-group-prepend">
									<span class="input-group-text"><i class="icon-calendar22"></i></span>
								</span>
								<input type="text" class="form-control daterange-basic" value="09/01/2023 - 09/30/2023"> 
								
							</div>
						</li>
						
					</ul>

					<ul class="nav nav-sidebar my-2" >
						<li class="nav-item pl-3 pr-3">
							<button type="button" class="btn btn-primary btn-block">검색하기<i class="icon-search4 ml-2"></i></button>
						</li>
					</ul>

					
				</div>
				<!-- /sidebar search -->

			</div>
			<!-- /sidebar content -->

		</div>

	</div>
	<!-- /page content -->

</body>
</html>