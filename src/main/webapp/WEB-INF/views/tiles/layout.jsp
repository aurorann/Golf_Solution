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
	<link href="/resources/assets/css/kdh.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
	<!-- /core JS files -->
		
	<!-- Theme JS files -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>
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
	
	<!-- twentytwenty -->
	<script src="/resources/assets/js/jquery.event.move.js"></script>
	<script src="/resources/assets/js/jquery.twentytwenty.js"></script>
	<link href="/resources/assets/css/twentytwenty.css" rel="stylesheet" type="text/css">
	<!-- twentytwenty end -->
	
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=tcdt00u6f1"></script>
	
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/highcharts-more.js"></script>
	<link href="https://code.highcharts.com/css/highcharts.css" rel="stylesheet"/>
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

	</div>
	<!-- /page content -->

	<script>
	$(function(){
		$(".twentytwenty-container[data-orientation!='vertical']").twentytwenty({default_offset_pct: 0.5});
		$(".twentytwenty-container[data-orientation='vertical']").twentytwenty({default_offset_pct: 0.5, orientation: 'vertical'});
	});
	</script>
    
    
</body>
</html>