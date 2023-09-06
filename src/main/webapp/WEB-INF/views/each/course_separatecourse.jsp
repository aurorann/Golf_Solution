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
				<h6 class="mr-2 mt-1 font-weight-semibold float-left ml-2">정렬</h6>
				<div class="btn-group mr-2">
					<button type="button" class="btn btn-light">관리순위</button>
					<button type="button" class="btn btn-light active">오름차순</button>
					<button type="button" class="btn btn-light">내림차순</button>
				</div>

				<h6 class="mr-2 mt-1 font-weight-bold float-right">Update : 2023.08.16 11:12</h6>

			</div>
		</div>
	</div>
	<!-- /page header -->


	<!-- Content area -->
	<div class="content">
		<!-- Basic card -->
		<div class="row">

			<!--개별 코스 카드 1-->
			<div class="col-lg-3">
				<div class="card">
					<div class="card-header bg-danger text-white header-elements-inline">
						<h6 class="card-title font-weight-semibold">Hole 1</h6>
						<div>
							<i class="fas fa-seedling mr-2"></i> <span class="badge badge-success badge-pill"><i
								class="fas fa-camera mr-2"></i>0.66</span> <span class="badge badge-warning badge-pill"><i
								class="fas fa-tint mr-2"></i>36.8<small class="weather-unit">%</small></span> <span class="badge badge-pink badge-pill"><i
								class="fas fa-thermometer-half mr-2"></i>25.5<small class="weather-unit">ºC</small></span>
						</div>
					</div>

					<div class="card-body pb-0">
						<!--NDVI 비교-->
						<div class="col-xl-12 col-md-12 col-sm-12 p-0 mb-3">
							<div class="twentytwenty-wrapper twentytwenty-horizontal">
								<div class="twentytwenty-container">
									<img src="/resources/assets/img/ndvi-1.png" class="ndvi-img twentytwenty-before"> <img src="/resources/assets/img/ndvi-1.png"
										class="ndvi-img twentytwenty-after">
								</div>
							</div>
						</div>
						<!--NDVI 비교 end-->

						<div class="btn-group mr-2">
							<button type="button" class="btn btn-light">생육</button>
							<button type="button" class="btn btn-light">열</button>
							<button type="button" class="btn btn-light">습도</button>
						</div>
						<span>
							<button type="button" class="btn btn-light active">NDVI 비교</button>
						</span> <span class="float-right">
							<button type="button" class="btn btn-primary-100 border-primary text-primary">상세정보</button>
						</span>

						<!--Chart card-->
						<div class="card mt-2 mb-0 card-collapsed" style="border: 0; box-shadow: none;">
							<div class="collapse">
								<div class="card-chart">
									<div id="layer-card-chart" class="collapse show" style="">
										<div class="card-body chart-card scrolled">
											<div class="chart-container">
												<div class="chart has-fixed-height" id="line_multiple" style="height: 440px;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="list-icons">
								<a class="list-icons-item chart-close" data-action="collapse"></a>
							</div>

						</div>
						<!--Chart card end-->

					</div>
				</div>
			</div>
			<!--개별 코스 카드 1 end-->

			<!--개별 코스 카드 2-->
			<div class="col-lg-3">
				<div class="card">
					<div class="card-header bg-info text-white header-elements-inline">
						<h6 class="card-title font-weight-semibold">Hole 2</h6>
						<div>
							<i class="fas fa-seedling mr-2"></i> <span class="badge badge-success badge-pill"><i
								class="fas fa-camera mr-2"></i>0.66</span> <span class="badge badge-warning badge-pill"><i
								class="fas fa-tint mr-2"></i>36.8<small class="weather-unit">%</small></span> <span class="badge badge-pink badge-pill"><i
								class="fas fa-thermometer-half mr-2"></i>25.5<small class="weather-unit">ºC</small></span>
						</div>
					</div>

					<div class="card-body pb-0">

						<!--생육 지도-->
						<div class="col-xl-12 col-md-12 col-sm-12 p-0 mb-3">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11124.634462768941!2d127.8932198328219!3d35.58989843099262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356fa1a0b8e4ab75%3A0x6cb5878cba1e3d20!2z7YG065-965SUIOqxsOywvQ!5e1!3m2!1sko!2skr!4v1693789715832!5m2!1sko!2skr"
								width="100%" height="233" style="border: 0;" allowfullscreen="" loading="lazy"
								referrerpolicy="no-referrer-when-downgrade"></iframe>
						</div>
						<!--생육 지도 end-->

						<div class="btn-group mr-2">
							<button type="button" class="btn btn-light active">생육</button>
							<button type="button" class="btn btn-light">열</button>
							<button type="button" class="btn btn-light">습도</button>
						</div>
						<span>
							<button type="button" class="btn btn-light">NDVI 비교</button>
						</span> <span class="float-right">
							<button type="button" class="btn btn-primary-100 border-primary text-primary">상세정보</button>
						</span>


						<!--Chart card-->
						<div class="card mt-2 mb-0 card-collapsed" style="border: 0; box-shadow: none;">
							<div class="collapse">
								<div class="card-chart">
									<div id="layer-card-chart" class="collapse show">
										<div class="card-body chart-card scrolled">
											<div class="chart-container">
												<div class="chart has-fixed-height" id="line_multiple2" style="height: 440px;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="list-icons">
								<a class="list-icons-item chart-close" data-action="collapse"></a>
							</div>

						</div>
						<!--Chart card end-->

					</div>
				</div>
			</div>
			<!--개별 코스 카드 2 end-->

			<!--개별 코스 카드 3-->
			<div class="col-lg-3">
				<div class="card">
					<div class="card-header bg-info text-white header-elements-inline">
						<h6 class="card-title font-weight-semibold">Hole 3</h6>
						<div>
							<i class="fas fa-seedling mr-2"></i> <span class="badge badge-success badge-pill"><i
								class="fas fa-camera mr-2"></i>0.66</span> <span class="badge badge-warning badge-pill"><i
								class="fas fa-tint mr-2"></i>36.8<small class="weather-unit">%</small></span> <span class="badge badge-pink badge-pill"><i
								class="fas fa-thermometer-half mr-2"></i>25.5<small class="weather-unit">ºC</small></span>
						</div>
					</div>

					<div class="card-body pb-0">

						<!--생육 지도-->
						<div class="col-xl-12 col-md-12 col-sm-12 p-0 mb-3">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11124.634462768941!2d127.8932198328219!3d35.58989843099262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356fa1a0b8e4ab75%3A0x6cb5878cba1e3d20!2z7YG065-965SUIOqxsOywvQ!5e1!3m2!1sko!2skr!4v1693789715832!5m2!1sko!2skr"
								width="100%" height="233" style="border: 0;" allowfullscreen="" loading="lazy"
								referrerpolicy="no-referrer-when-downgrade"></iframe>
						</div>
						<!--생육 지도 end-->

						<div class="btn-group mr-2">
							<button type="button" class="btn btn-light active">생육</button>
							<button type="button" class="btn btn-light">열</button>
							<button type="button" class="btn btn-light">습도</button>
						</div>
						<span>
							<button type="button" class="btn btn-light">NDVI 비교</button>
						</span> <span class="float-right">
							<button type="button" class="btn btn-primary-100 border-primary text-primary">상세정보</button>
						</span>

						<!--Chart card-->
						<div class="card mt-2 mb-0 card-collapsed" style="border: 0; box-shadow: none;">
							<div class="collapse">
								<div class="card-chart">
									<div id="layer-card-chart" class="collapse show">
										<div class="card-body chart-card scrolled">
											<div class="chart-container">
												<div class="chart has-fixed-height">차트 영역</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="list-icons">
								<a class="list-icons-item chart-close" data-action="collapse"></a>
							</div>

						</div>
						<!--Chart card end-->
					</div>
				</div>
			</div>
			<!--개별 코스 카드 3 end-->

			<!--개별 코스 카드 4-->
			<div class="col-lg-3">
				<div class="card">
					<div class="card-header bg-info text-white header-elements-inline">
						<h6 class="card-title font-weight-semibold">Hole 4</h6>
						<div>
							<i class="fas fa-seedling mr-2"></i> <span class="badge badge-success badge-pill"><i
								class="fas fa-camera mr-2"></i>0.66</span> <span class="badge badge-warning badge-pill"><i
								class="fas fa-tint mr-2"></i>36.8<small class="weather-unit">%</small></span> <span class="badge badge-pink badge-pill"><i
								class="fas fa-thermometer-half mr-2"></i>25.5<small class="weather-unit">ºC</small></span>
						</div>
					</div>

					<div class="card-body pb-0">

						<!--생육 지도-->
						<div class="col-xl-12 col-md-12 col-sm-12 p-0 mb-3">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11124.634462768941!2d127.8932198328219!3d35.58989843099262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356fa1a0b8e4ab75%3A0x6cb5878cba1e3d20!2z7YG065-965SUIOqxsOywvQ!5e1!3m2!1sko!2skr!4v1693789715832!5m2!1sko!2skr"
								width="100%" height="233" style="border: 0;" allowfullscreen="" loading="lazy"
								referrerpolicy="no-referrer-when-downgrade"></iframe>
						</div>
						<!--생육 지도 end-->

						<div class="btn-group mr-2">
							<button type="button" class="btn btn-light active">생육</button>
							<button type="button" class="btn btn-light">열</button>
							<button type="button" class="btn btn-light">습도</button>
						</div>
						<span>
							<button type="button" class="btn btn-light">NDVI 비교</button>
						</span> <span class="float-right">
							<button type="button" class="btn btn-primary-100 border-primary text-primary">상세정보</button>
						</span>

						<!--Chart card-->
						<div class="card mt-2 mb-0 card-collapsed" style="border: 0; box-shadow: none;">
							<div class="collapse">
								<div class="card-chart">
									<div id="layer-card-chart" class="collapse show">
										<div class="card-body chart-card scrolled">
											<div class="chart-container">
												<div class="chart has-fixed-height">차트 영역</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="list-icons">
								<a class="list-icons-item chart-close" data-action="collapse"></a>
							</div>

						</div>
						<!--Chart card end-->
					</div>
				</div>
			</div>
			<!--개별 코스 카드 4 end-->

			<!--개별 코스 카드 5-->
			<div class="col-lg-3">
				<div class="card">
					<div class="card-header bg-info text-white header-elements-inline">
						<h6 class="card-title font-weight-semibold">Hole 5</h6>
						<div>
							<i class="fas fa-seedling mr-2"></i> <span class="badge badge-success badge-pill"><i
								class="fas fa-camera mr-2"></i>0.66</span> <span class="badge badge-warning badge-pill"><i
								class="fas fa-tint mr-2"></i>36.8<small class="weather-unit">%</small></span> <span class="badge badge-pink badge-pill"><i
								class="fas fa-thermometer-half mr-2"></i>25.5<small class="weather-unit">ºC</small></span>
						</div>
					</div>

					<div class="card-body pb-0">

						<!--생육 지도-->
						<div class="col-xl-12 col-md-12 col-sm-12 p-0 mb-3">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11124.634462768941!2d127.8932198328219!3d35.58989843099262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356fa1a0b8e4ab75%3A0x6cb5878cba1e3d20!2z7YG065-965SUIOqxsOywvQ!5e1!3m2!1sko!2skr!4v1693789715832!5m2!1sko!2skr"
								width="100%" height="233" style="border: 0;" allowfullscreen="" loading="lazy"
								referrerpolicy="no-referrer-when-downgrade"></iframe>
						</div>
						<!--생육 지도 end-->

						<div class="btn-group mr-2">
							<button type="button" class="btn btn-light active">생육</button>
							<button type="button" class="btn btn-light">열</button>
							<button type="button" class="btn btn-light">습도</button>
						</div>
						<span>
							<button type="button" class="btn btn-light">NDVI 비교</button>
						</span> <span class="float-right">
							<button type="button" class="btn btn-primary-100 border-primary text-primary">상세정보</button>
						</span>

						<!--Chart card-->
						<div class="card mt-2 mb-0 card-collapsed" style="border: 0; box-shadow: none;">
							<div class="collapse">
								<div class="card-chart">
									<div id="layer-card-chart" class="collapse show">
										<div class="card-body chart-card scrolled">
											<div class="chart-container">
												<div class="chart has-fixed-height">차트 영역</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="list-icons">
								<a class="list-icons-item chart-close" data-action="collapse"></a>
							</div>

						</div>
						<!--Chart card end-->
					</div>
				</div>
			</div>
			<!--개별 코스 카드 5 end-->

			<!--개별 코스 카드 6-->
			<div class="col-lg-3">
				<div class="card">
					<div class="card-header bg-info text-white header-elements-inline">
						<h6 class="card-title font-weight-semibold">Hole 6</h6>
						<div>
							<i class="fas fa-seedling mr-2"></i> <span class="badge badge-success badge-pill"><i
								class="fas fa-camera mr-2"></i>0.66</span> <span class="badge badge-warning badge-pill"><i
								class="fas fa-tint mr-2"></i>36.8<small class="weather-unit">%</small></span> <span class="badge badge-pink badge-pill"><i
								class="fas fa-thermometer-half mr-2"></i>25.5<small class="weather-unit">ºC</small></span>
						</div>
					</div>

					<div class="card-body pb-0">

						<!--생육 지도-->
						<div class="col-xl-12 col-md-12 col-sm-12 p-0 mb-3">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11124.634462768941!2d127.8932198328219!3d35.58989843099262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356fa1a0b8e4ab75%3A0x6cb5878cba1e3d20!2z7YG065-965SUIOqxsOywvQ!5e1!3m2!1sko!2skr!4v1693789715832!5m2!1sko!2skr"
								width="100%" height="233" style="border: 0;" allowfullscreen="" loading="lazy"
								referrerpolicy="no-referrer-when-downgrade"></iframe>
						</div>
						<!--생육 지도 end-->

						<div class="btn-group mr-2">
							<button type="button" class="btn btn-light active">생육</button>
							<button type="button" class="btn btn-light">열</button>
							<button type="button" class="btn btn-light">습도</button>
						</div>
						<span>
							<button type="button" class="btn btn-light">NDVI 비교</button>
						</span> <span class="float-right">
							<button type="button" class="btn btn-primary-100 border-primary text-primary">상세정보</button>
						</span>

						<!--Chart card-->
						<div class="card mt-2 mb-0 card-collapsed" style="border: 0; box-shadow: none;">
							<div class="collapse">
								<div class="card-chart">
									<div id="layer-card-chart" class="collapse show">
										<div class="card-body chart-card scrolled">
											<div class="chart-container">
												<div class="chart has-fixed-height">차트 영역</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="list-icons">
								<a class="list-icons-item chart-close" data-action="collapse"></a>
							</div>

						</div>
						<!--Chart card end-->
					</div>
				</div>
			</div>
			<!--개별 코스 카드 6 end-->

			<!--개별 코스 카드 7-->
			<div class="col-lg-3">
				<div class="card">
					<div class="card-header bg-danger text-white header-elements-inline">
						<h6 class="card-title font-weight-semibold">Hole 7</h6>
						<div>
							<i class="fas fa-seedling mr-2"></i> <span class="badge badge-success badge-pill"><i
								class="fas fa-camera mr-2"></i>0.66</span> <span class="badge badge-warning badge-pill"><i
								class="fas fa-tint mr-2"></i>36.8<small class="weather-unit">%</small></span> <span class="badge badge-pink badge-pill"><i
								class="fas fa-thermometer-half mr-2"></i>25.5<small class="weather-unit">ºC</small></span>
						</div>
					</div>

					<div class="card-body pb-0">

						<!--생육 지도-->
						<div class="col-xl-12 col-md-12 col-sm-12 p-0 mb-3">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11124.634462768941!2d127.8932198328219!3d35.58989843099262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356fa1a0b8e4ab75%3A0x6cb5878cba1e3d20!2z7YG065-965SUIOqxsOywvQ!5e1!3m2!1sko!2skr!4v1693789715832!5m2!1sko!2skr"
								width="100%" height="233" style="border: 0;" allowfullscreen="" loading="lazy"
								referrerpolicy="no-referrer-when-downgrade"></iframe>
						</div>
						<!--생육 지도 end-->

						<div class="btn-group mr-2">
							<button type="button" class="btn btn-light active">생육</button>
							<button type="button" class="btn btn-light">열</button>
							<button type="button" class="btn btn-light">습도</button>
						</div>
						<span>
							<button type="button" class="btn btn-light">NDVI 비교</button>
						</span> <span class="float-right">
							<button type="button" class="btn btn-primary-100 border-primary text-primary">상세정보</button>
						</span>

						<!--Chart card-->
						<div class="card mt-2 mb-0 card-collapsed" style="border: 0; box-shadow: none;">
							<div class="collapse">
								<div class="card-chart">
									<div id="layer-card-chart" class="collapse show">
										<div class="card-body chart-card scrolled">
											<div class="chart-container">
												<div class="chart has-fixed-height">차트 영역</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="list-icons">
								<a class="list-icons-item chart-close" data-action="collapse"></a>
							</div>

						</div>
						<!--Chart card end-->
					</div>
				</div>
			</div>
			<!--개별 코스 카드 7 end-->

			<!--개별 코스 카드 8-->
			<div class="col-lg-3">
				<div class="card">
					<div class="card-header bg-info text-white header-elements-inline">
						<h6 class="card-title font-weight-semibold">Hole 8</h6>
						<div>
							<i class="fas fa-seedling mr-2"></i> <span class="badge badge-success badge-pill"><i
								class="fas fa-camera mr-2"></i>0.66</span> <span class="badge badge-warning badge-pill"><i
								class="fas fa-tint mr-2"></i>36.8<small class="weather-unit">%</small></span> <span class="badge badge-pink badge-pill"><i
								class="fas fa-thermometer-half mr-2"></i>25.5<small class="weather-unit">ºC</small></span>
						</div>
					</div>

					<div class="card-body pb-0">

						<!--생육 지도-->
						<div class="col-xl-12 col-md-12 col-sm-12 p-0 mb-3">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11124.634462768941!2d127.8932198328219!3d35.58989843099262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356fa1a0b8e4ab75%3A0x6cb5878cba1e3d20!2z7YG065-965SUIOqxsOywvQ!5e1!3m2!1sko!2skr!4v1693789715832!5m2!1sko!2skr"
								width="100%" height="233" style="border: 0;" allowfullscreen="" loading="lazy"
								referrerpolicy="no-referrer-when-downgrade"></iframe>
						</div>
						<!--생육 지도 end-->

						<div class="btn-group mr-2">
							<button type="button" class="btn btn-light active">생육</button>
							<button type="button" class="btn btn-light">열</button>
							<button type="button" class="btn btn-light">습도</button>
						</div>
						<span>
							<button type="button" class="btn btn-light">NDVI 비교</button>
						</span> <span class="float-right">
							<button type="button" class="btn btn-primary-100 border-primary text-primary">상세정보</button>
						</span>

						<!--Chart card-->
						<div class="card mt-2 mb-0 card-collapsed" style="border: 0; box-shadow: none;">
							<div class="collapse">
								<div class="card-chart">
									<div id="layer-card-chart" class="collapse show">
										<div class="card-body chart-card scrolled">
											<div class="chart-container">
												<div class="chart has-fixed-height">차트 영역</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="list-icons">
								<a class="list-icons-item chart-close" data-action="collapse"></a>
							</div>

						</div>
						<!--Chart card end-->
					</div>
				</div>
			</div>
			<!--개별 코스 카드 8 end-->


		</div>

		<!-- /basic card -->


	</div>
	<!-- /content area -->

</div>
<!-- /main content -->