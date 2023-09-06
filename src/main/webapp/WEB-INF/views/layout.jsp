<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
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

	<tiles:insertAttribute name="header"/>


	<!-- Page content -->
	<div class="page-content">

		<!-- Main sidebar -->
		<tiles:insertAttribute name="sidebar"/>
		<!-- /main sidebar -->


		<!-- Main content -->
		<tiles:insertAttribute name="contents"/>
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
								<input type="text" class="form-control daterange-basic" value="01/01/2015 - 01/31/2015"> 
								
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
	
	<script>
	$(document).ready(function(){               
	    $.datepicker.setDefaults({
	    closeText: "닫기",
	    currentText: "오늘",
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    weekHeader: "주",
	    yearSuffix: '년'
	    });    
	 });
	</script>

</body>
</html>