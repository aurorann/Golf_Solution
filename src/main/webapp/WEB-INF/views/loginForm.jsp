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

	<!-- Page content -->
	<div class="page-content all-bg">

		<!-- Main content -->
		<div class="content-wrapper">

			<!-- Inner content -->
			<div class="content-inner">

				<!-- Content area -->
				<div class="content d-flex justify-content-center align-items-center">

					<!-- Login form -->
					<form class="login-form" action="/login" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="card mb-0">
							<div class="card-body">
                                <div class="position-relative text-center">
                                    <img src="/resources/assets/img/golf_logo2.png" width="200" class="" alt="Logo">
                                </div>
								<div class="text-center mb-3">
									<h5 class="mt-2 mb-2">골프 코스관리 솔루션</h5>
									<span class="d-block text-muted">아이디와 비밀번호를 입력하세요.</span>
								</div>

								<div class="form-group form-group-feedback form-group-feedback-left">
									<input type="text" class="form-control" placeholder="아이디" name="userId" required="required">
									<div class="form-control-feedback">
										<i class="icon-user text-muted"></i>
									</div>
								</div>

								<div class="form-group form-group-feedback form-group-feedback-left">
									<input type="password" class="form-control" placeholder="비밀번호" name="password" required="required">
									<div class="form-control-feedback">
										<i class="icon-lock2 text-muted"></i>
									</div>
								</div>

								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block">로그인</button>
								</div>
							</div>
						</div>
					</form>
					<!-- /login form -->

				</div>
				<!-- /content area -->



			</div>
			<!-- /inner content -->

		</div>
		<!-- /main content -->

	</div>
	<!-- /page content -->


</body>




</html>