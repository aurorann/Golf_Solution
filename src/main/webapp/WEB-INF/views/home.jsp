<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!-- Main content -->
<div class="content-wrapper">

	<!-- Page header -->
	<div class="page-header page-header-light">
		<div class="page-header-content d-sm-flex">
			<div class="page-title" style="width: 100%;">
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
						<i class="fas fa-seedling"></i>
						<!--생육-->
					</button>
					<button type="button" class="btn btn-light">
						<i class="fab fa-hotjar"></i>
						<!--열-->
					</button>
					<button type="button" class="btn btn-light">
						<i class="fas fa-tint"></i>
						<!--습도-->
					</button>
					<button type="button" class="btn btn-light">
						<i class="fas fa-times"></i>
						<!--없음-->
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

			<div class="position-absolute" style="right: 0; top: 10px;">

				<div class="btn-group mr-2">
					<!--영재수정-->
					<button type="button" class="btn btn-light active" style="font-size: 11px; border-radius: 15px 0 0 15px;">NDVI</button>
					<button type="button" class="btn btn-light" style="font-size: 11px;">토양정보</button>
					<button type="button" class="btn btn-light" style="font-size: 11px;">기상정보</button>
					<button type="button" class="btn btn-light" style="font-size: 11px; border-radius: 0 15px 15px 0">없음</button>
				</div>

			</div>


			<div class="collapsible-sortable position-absolute" style="left: 10px; top: 10px;">
				<div class="card layer-card border-info">
					<div class="card-header bg-info text-white">
						<h6 class="card-title">
							<span class="text-white collapsed">Update : 2023.08.16 11:12 </span>
						</h6>
					</div>

				</div>

				<div class="card layer-card">
					<div class="card-header header-elements-inline">
						<h6 class="card-title">
							<a class="text-body collapsed" aria-expanded="false"> <span class="badge badge-danger badge-pill mr-2">Hole
									7</span> <span>Green</span> <span> 토양온도 <i class="icon-arrow-up7"></i>
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
							<a class="text-body collapsed" aria-expanded="false"> <span class="badge badge-danger badge-pill mr-2">Hole
									2</span> <span>Fairway</span> <span> 토양수분 <i class="icon-arrow-down7"></i>
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
							<a class="text-body collapsed" data-toggle="collapse" href="#layer-card-chart" aria-expanded="false"> <span>차트정보
									보기</span> <span class="badge badge-success badge-pill">Hole 1</span>
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
					</div> <!--기상정보 8종-->
					<div class="text-center weather-wrap pl-2 pr-2 pb-2">
						<div class="float-left weather-box mr-3">
							<h4 class="mb-0 font-weight-semibold">
								-13.6<small class="weather-unit">ºC</small>
							</h4>
							<div class="font-size-sm text-muted">기온</div>
						</div>
						<div class="float-left weather-box mr-3">
							<h4 class="mb-0 font-weight-semibold">
								13<small class="weather-unit">mm</small>
							</h4>
							<div class="font-size-sm text-muted">강수량</div>
						</div>
						<div class="float-left weather-box mr-3">
							<h4 class="mb-0 font-weight-semibold">북북서</h4>
							<div class="font-size-sm text-muted">풍향</div>
						</div>
						<div class="float-left weather-box">
							<h4 class="mb-0 font-weight-semibold">
								0.6<small class="weather-unit">m/s</small>
							</h4>
							<div class="font-size-sm text-muted">풍속</div>
						</div>
					</div>
					<div class="text-center weather-wrap pl-2 pr-2">
						<div class="float-left weather-box mr-3">
							<h4 class="mb-0 font-weight-semibold">
								45<small class="weather-unit">%</small>
							</h4>
							<div class="font-size-sm text-muted">습도</div>
						</div>
						<div class="float-left weather-box mr-3">
							<h4 class="mb-0 font-weight-semibold">
								6.7<span class="ml-2 badge badge-success badge-pill">양호</span>
							</h4>
							<div class="font-size-sm text-muted">미세먼지</div>
						</div>
						<div class="float-left weather-box mr-3">
							<h4 class="mb-0 font-weight-semibold">
								4.7<span class="ml-2 badge badge-success badge-pill">양호</span>
							</h4>
							<div class="font-size-sm text-muted">초미세먼지</div>
						</div>
						<div class="float-left weather-box">
							<h4 class="mb-0 font-weight-semibold">
								423.1<small class="weather-unit">ppm</small>
							</h4>
							<div class="font-size-sm text-muted">이산화탄소</div>
						</div>
					</div>
				</a>
			</div>

			<div class="course4 position-absolute card border-warning text-center">
				<a href="#" class="text-body pb-1">
					<div class="card-header bg-warning text-white pt-1 pb-1">
						<h6 class="card-title font-weight-semibold">Hole 4</h6>
					</div> <!--토양정보 3종-->
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



			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11124.634462768941!2d127.8932198328219!3d35.58989843099262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356fa1a0b8e4ab75%3A0x6cb5878cba1e3d20!2z7YG065-965SUIOqxsOywvQ!5e1!3m2!1sko!2skr!4v1693789715832!5m2!1sko!2skr"
				width="100%" height="750" style="border: 0;" allowfullscreen="" loading="lazy"
				referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
		<!-- /basic card -->


	</div>
	<!-- /content area -->



</div>
<!-- /main content -->