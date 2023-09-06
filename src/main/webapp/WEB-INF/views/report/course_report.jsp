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

				<div class="float-right">
					<button type="button" class="btn sidebar-control sidebar-right-toggle">
						<i class="fas fa-align-justify"></i>
					</button>
				</div>

				<div class="float-right mr-2">
					<div class="input-group">
						<span class="input-group-prepend"> <span class="input-group-text"><i class="icon-calendar22"></i></span>
						</span> <input type="text" class="form-control daterange-basic" value="01/01/2015 - 01/31/2015">
						<button type="button" class="ml-2 btn btn-primary">검색</button>
						<div class="btn-group ml-4">
							<button type="button" class="btn btn-light">
								<i class="icon-arrow-left12"></i>
							</button>
							<button type="button" class="btn btn-light">
								<i class="icon-arrow-right13"></i>
							</button>
						</div>
						<button type="button" class="ml-2 btn btn-teal">오늘</button>

					</div>


				</div>

			</div>
		</div>
	</div>
	<!-- /page header -->


	<!-- Content area -->
	<div class="content">
		<!-- Basic card -->
		<div class="card">
			<div class="card-header">
				<h5 class="card-title">
					Hole 2
					<div class="btn-group ml-3">
						<button type="button" class="btn btn-light">생육</button>
						<button type="button" class="btn btn-light">열</button>
						<button type="button" class="btn btn-light">습도</button>
					</div>
					<small class="mr-2 mt-1 font-weight-bold float-right">Update : 2023.08.16 11:12</small>
				</h5>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-lg-3">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11124.634462768941!2d127.8932198328219!3d35.58989843099262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356fa1a0b8e4ab75%3A0x6cb5878cba1e3d20!2z7YG065-965SUIOqxsOywvQ!5e1!3m2!1sko!2skr!4v1693789715832!5m2!1sko!2skr"
							width="100%" height="350" style="border: 0;" allowfullscreen="" loading="lazy"
							referrerpolicy="no-referrer-when-downgrade"></iframe>
					</div>

					<div class="col-lg-9">
						<div class="row">
							<!--NDVI-->
							<div class="col-lg-4">
								<div class="card border-top-success rounded-top-0">
									<div class="card-header">
										<h6 class="card-title font-weight-bold">NDVI</h6>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-lg-6">
												<div class="row">
													<div class="col-lg-12 text-center">
														<span class="text-secondary">2023.8.15</span>
														<h2 class="mb-0 font-weight-semibold">0.221</h2>
														<div class="font-size-sm text-muted">현재</div>
													</div>

												</div>
											</div>
											<div class="col-lg-6">
												<div class="row">
													<div class="col-lg-12 text-center">
														<span class="text-secondary">2023.8.16</span>
														<h2 class="mb-0 font-weight-semibold">0.221</h2>
														<div class="font-size-sm text-muted">현재</div>
													</div>
												</div>
											</div>
											<div class="mt-2 mb-0 col-lg-12 text-center">
												<div class="">
													전날보다 <strong>-2.17<small class="weather-unit">%</small></strong> <i class="text-danger icon-arrow-down132"></i>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--NDVI end-->

							<!--토양수분-->
							<div class="col-lg-4">
								<div class="card border-top-success rounded-top-0">
									<div class="card-header">
										<h6 class="card-title font-weight-bold">토양수분</h6>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-lg-6">
												<div class="row">
													<div class="col-lg-12 text-center">
														<span class="text-secondary">2023.8.15</span>
														<h2 class="mb-0 font-weight-semibold">0.221</h2>
														<div class="font-size-sm text-muted">현재</div>
													</div>

												</div>
											</div>
											<div class="col-lg-6">
												<div class="row">
													<div class="col-lg-12 text-center">
														<span class="text-secondary">2023.8.16</span>
														<h2 class="mb-0 font-weight-semibold">0.7906</h2>
														<div class="font-size-sm text-muted">현재</div>
													</div>
												</div>
											</div>
											<div class="mt-2 mb-0 col-lg-12 text-center">
												<div class="">
													전날보다 <strong>+2.17<small class="weather-unit">%</small></strong> <i class="text-primary icon-arrow-up13"></i>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--토양수분 end-->

							<!--토양온도-->
							<div class="col-lg-4">
								<div class="card border-top-success rounded-top-0">
									<div class="card-header">
										<h6 class="card-title font-weight-bold">토양온도</h6>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-lg-6">
												<div class="row">
													<div class="col-lg-12 text-center">
														<span class="text-secondary">2023.8.15</span>
														<h2 class="mb-0 font-weight-semibold">0.221</h2>
														<div class="font-size-sm text-muted">현재</div>
													</div>

												</div>
											</div>
											<div class="col-lg-6">
												<div class="row">
													<div class="col-lg-12 text-center">
														<span class="text-secondary">2023.8.16</span>
														<h2 class="mb-0 font-weight-semibold">0.221</h2>
														<div class="font-size-sm text-muted">현재</div>
													</div>
												</div>
											</div>
											<div class="mt-2 mb-0 col-lg-12 text-center">
												<div class="">
													전날보다 <strong>-2.17<small class="weather-unit">%</small></strong> <i class="text-danger icon-arrow-down132"></i>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--토양온도 end-->

							<!--기온-->
							<div class="col-lg-4">
								<div class="card border-top-success rounded-top-0">
									<div class="card-header">
										<h6 class="card-title font-weight-bold">기온</h6>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-lg-6">
												<div class="row">
													<div class="col-lg-12 text-center">
														<span class="text-secondary">2023.8.15</span>
														<h2 class="mb-0 font-weight-semibold">12.5</h2>
														<div class="font-size-sm text-muted">현재</div>
													</div>

												</div>
											</div>
											<div class="col-lg-6">
												<div class="row">
													<div class="col-lg-12 text-center">
														<span class="text-secondary">2023.8.16</span>
														<h2 class="mb-0 font-weight-semibold">14.2</h2>
														<div class="font-size-sm text-muted">현재</div>
													</div>
												</div>
											</div>
											<div class="mt-2 mb-0 col-lg-12 text-center">
												<div class="">
													전날보다 <strong>+2.17<small class="weather-unit">%</small></strong> <i class="text-primary icon-arrow-up13"></i>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--기온 end-->

							<!--습도-->
							<div class="col-lg-4">
								<div class="card border-top-success rounded-top-0">
									<div class="card-header">
										<h6 class="card-title font-weight-bold">습도</h6>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-lg-6">
												<div class="row">
													<div class="col-lg-12 text-center">
														<span class="text-secondary">2023.8.15</span>
														<h2 class="mb-0 font-weight-semibold">0.221</h2>
														<div class="font-size-sm text-muted">현재</div>
													</div>

												</div>
											</div>
											<div class="col-lg-6">
												<div class="row">
													<div class="col-lg-12 text-center">
														<span class="text-secondary">2023.8.16</span>
														<h2 class="mb-0 font-weight-semibold">0.221</h2>
														<div class="font-size-sm text-muted">현재</div>
													</div>
												</div>
											</div>
											<div class="mt-2 mb-0 col-lg-12 text-center">
												<div class="">
													전날보다 <strong>-2.17<small class="weather-unit">%</small></strong> <i class="text-danger icon-arrow-down132"></i>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--습도 end-->

							<!--PH-->
							<div class="col-lg-4">
								<div class="card border-top-success rounded-top-0">
									<div class="card-header">
										<h6 class="card-title font-weight-bold">PH</h6>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-lg-6">
												<div class="row">
													<div class="col-lg-12 text-center">
														<span class="text-secondary">2023.8.15</span>
														<h2 class="mb-0 font-weight-semibold">0.221</h2>
														<div class="font-size-sm text-muted">현재</div>
													</div>

												</div>
											</div>
											<div class="col-lg-6">
												<div class="row">
													<div class="col-lg-12 text-center">
														<span class="text-secondary">2023.8.16</span>
														<h2 class="mb-0 font-weight-semibold">0.221</h2>
														<div class="font-size-sm text-muted">현재</div>
													</div>
												</div>
											</div>
											<div class="mt-2 mb-0 col-lg-12 text-center">
												<div class="">
													전날보다 <strong>-2.17<small class="weather-unit">%</small></strong> <i class="text-danger icon-arrow-down132"></i>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--PH end-->



						</div>
					</div>

					<div class="col-lg-12">
						<div class="card-header">
							<h6 class="card-title font-weight-bold">차트 보기</h6>
						</div>

						<div class="chart-container">
							<div class="chart has-fixed-height" id="line_multiple" style="height: 440px;"></div>
						</div>
					</div>




				</div>


			</div>
		</div>

	</div>



</div>
<!-- /main content -->