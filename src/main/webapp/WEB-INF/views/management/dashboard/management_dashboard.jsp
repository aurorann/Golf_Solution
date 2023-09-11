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
	
			<div class="page-title">
				<ul class="nav nav-tabs nav-tabs-solid border-0 m-0 ml-2">
					<li class="nav-item"><a href="#solid-tab1" class="nav-link active" data-toggle="tab">통합 대시보드</a></li>
					<li class="nav-item"><a href="#solid-tab2" class="nav-link" data-toggle="tab">작업 알람 리스트</a></li>
				</ul>
			</div>
	
		</div>
	</div>
	<!-- /page header -->


	<!-- Content area -->
	<div class="content">
		<!-- Basic card -->

		<div class="tab-content">
			<div class="tab-pane fade active show" id="solid-tab1">
				
				<h6 class="mr-2 font-weight-semibold float-left mt-1">구분</h6>
				<div class="btn-group mr-2">
					<button type="button" class="btn btn-light active">Fairway</button>
					<button type="button" class="btn btn-light">Green</button>
				</div>
				<div class="btn-group float-right mr-2">
					<button type="button" class="btn btn-light">관리순위</button>
					<button type="button" class="btn btn-light active">오름차순</button>
					<button type="button" class="btn btn-light">내림차순</button>
				</div>
				<h6 class="mr-2 font-weight-semibold float-right ml-2 mt-1">정렬</h6>

				<div class="row mt-3">
					<div class="col-lg-3">
						<div class="card">
							<div class="card-header mb-2">
								<h6 class="card-title font-weight-bold">Hole 1
								<span class="float-right badge badge-success badge-pill">양호</span>
								</h6>
							</div>
							
							<div class="card-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="card bg-success-100 border-success">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-success">NDVI</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-primary-100 border-primary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-primary">토양수분</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-danger-100 border-danger">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-danger">토양온도</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-warning-100 border-warning">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-warning">기온</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-secondary-100 border-secondary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-secondary">풍속</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-purple-100 border-purple">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-purple">PH</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-3">
						<div class="card">
							<div class="card-header mb-2">
								<h6 class="card-title font-weight-bold">Hole 2
								<span class="float-right badge badge-danger badge-pill">점검 요망</span>
								</h6>
							</div>
							
							<div class="card-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="card bg-success-100 border-success">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-success">NDVI</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-primary-100 border-primary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-primary">토양수분</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-danger badge-pill">위험</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-danger-100 border-danger">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-danger">토양온도</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-warning-100 border-warning">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-warning">기온</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-secondary-100 border-secondary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-secondary">풍속</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-purple-100 border-purple">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-purple">PH</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-3">
						<div class="card">
							<div class="card-header mb-2">
								<h6 class="card-title font-weight-bold">Hole 3
								<span class="float-right badge badge-success badge-pill">양호</span>
								</h6>
							</div>
							
							<div class="card-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="card bg-success-100 border-success">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-success">NDVI</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-primary-100 border-primary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-primary">토양수분</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-danger-100 border-danger">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-danger">토양온도</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-warning-100 border-warning">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-warning">기온</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-secondary-100 border-secondary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-secondary">풍속</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-purple-100 border-purple">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-purple">PH</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-3">
						<div class="card">
							<div class="card-header mb-2">
								<h6 class="card-title font-weight-bold">Hole 4
								<span class="float-right badge badge-success badge-pill">양호</span>
								</h6>
							</div>
							
							<div class="card-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="card bg-success-100 border-success">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-success">NDVI</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-primary-100 border-primary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-primary">토양수분</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-danger-100 border-danger">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-danger">토양온도</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-warning-100 border-warning">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-warning">기온</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-secondary-100 border-secondary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-secondary">풍속</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-purple-100 border-purple">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-purple">PH</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-3">
						<div class="card">
							<div class="card-header mb-2">
								<h6 class="card-title font-weight-bold">Hole 5
								<span class="float-right badge badge-success badge-pill">양호</span>
								</h6>
							</div>
							
							<div class="card-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="card bg-success-100 border-success">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-success">NDVI</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-primary-100 border-primary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-primary">토양수분</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-danger-100 border-danger">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-danger">토양온도</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-warning-100 border-warning">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-warning">기온</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-secondary-100 border-secondary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-secondary">풍속</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-purple-100 border-purple">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-purple">PH</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-3">
						<div class="card">
							<div class="card-header mb-2">
								<h6 class="card-title font-weight-bold">Hole 6
								<span class="float-right badge badge-success badge-pill">양호</span>
								</h6>
							</div>
							
							<div class="card-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="card bg-success-100 border-success">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-success">NDVI</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-primary-100 border-primary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-primary">토양수분</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-danger-100 border-danger">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-danger">토양온도</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-warning-100 border-warning">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-warning">기온</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-secondary-100 border-secondary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-secondary">풍속</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-purple-100 border-purple">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-purple">PH</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-3">
						<div class="card">
							<div class="card-header mb-2">
								<h6 class="card-title font-weight-bold">Hole 7
								<span class="float-right badge badge-success badge-pill">양호</span>
								</h6>
							</div>
							
							<div class="card-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="card bg-success-100 border-success">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-success">NDVI</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-primary-100 border-primary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-primary">토양수분</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-danger-100 border-danger">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-danger">토양온도</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-warning-100 border-warning">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-warning">기온</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-secondary-100 border-secondary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-secondary">풍속</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-purple-100 border-purple">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-purple">PH</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-3">
						<div class="card">
							<div class="card-header mb-2">
								<h6 class="card-title font-weight-bold">Hole 8
								<span class="float-right badge badge-success badge-pill">양호</span>
								</h6>
							</div>
							
							<div class="card-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="card bg-success-100 border-success">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-success">NDVI</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-primary-100 border-primary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-primary">토양수분</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-danger-100 border-danger">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-danger">토양온도</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-warning-100 border-warning">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-warning">기온</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-secondary-100 border-secondary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-secondary">풍속</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-purple-100 border-purple">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-purple">PH</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-3">
						<div class="card">
							<div class="card-header mb-2">
								<h6 class="card-title font-weight-bold">Hole 9
								<span class="float-right badge badge-success badge-pill">양호</span>
								</h6>
							</div>
							
							<div class="card-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="card bg-success-100 border-success">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-success">NDVI</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-primary-100 border-primary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-primary">토양수분</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-danger-100 border-danger">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-danger">토양온도</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-warning-100 border-warning">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-warning">기온</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-secondary-100 border-secondary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-secondary">풍속</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-purple-100 border-purple">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-purple">PH</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-3">
						<div class="card">
							<div class="card-header mb-2">
								<h6 class="card-title font-weight-bold">Hole 10
								<span class="float-right badge badge-success badge-pill">양호</span>
								</h6>
							</div>
							
							<div class="card-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="card bg-success-100 border-success">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-success">NDVI</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-primary-100 border-primary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-primary">토양수분</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-danger-100 border-danger">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-danger">토양온도</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-warning-100 border-warning">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-warning">기온</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-secondary-100 border-secondary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-secondary">풍속</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-purple-100 border-purple">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-purple">PH</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-3">
						<div class="card">
							<div class="card-header mb-2">
								<h6 class="card-title font-weight-bold">Hole 11
								<span class="float-right badge badge-success badge-pill">양호</span>
								</h6>
							</div>
							
							<div class="card-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="card bg-success-100 border-success">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-success">NDVI</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-primary-100 border-primary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-primary">토양수분</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-danger-100 border-danger">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-danger">토양온도</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-warning-100 border-warning">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-warning">기온</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-secondary-100 border-secondary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-secondary">풍속</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-purple-100 border-purple">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-purple">PH</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-3">
						<div class="card">
							<div class="card-header mb-2">
								<h6 class="card-title font-weight-bold">Hole 12
								<span class="float-right badge badge-success badge-pill">양호</span>
								</h6>
							</div>
							
							<div class="card-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="card bg-success-100 border-success">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-success">NDVI</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-primary-100 border-primary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-primary">토양수분</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-danger-100 border-danger">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-danger">토양온도</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-warning-100 border-warning">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-warning">기온</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-secondary-100 border-secondary">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-secondary">풍속</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="card bg-purple-100 border-purple">
											<div class="card-header">
												<h6 class="card-title font-weight-semibold text-purple">PH</h6>
											</div>
											<div class="card-body pl-2 pr-2 pb-2">
												<span class="font-weight-bold">0.7615</span>
												<span class="float-right badge badge-success badge-pill">양호</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
					
				</div>
				
		

			</div>
			<div class="tab-pane fade" id="solid-tab2">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title">작업 알람 리스트</h5>
					</div>
					<div class="table-responsive table-scrollable">
						<table class="table">
							<thead>
								<tr>
									<th>날짜</th>
									<th>코스명</th>
									<th>코스 구분</th>
									<th>권장 작업</th>
									<th>작업 여부</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
									<td>미작업</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
									<td>미작업</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
									<td>완료</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
									<td>완료</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
									<td>완료</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
									<td>완료</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
									<td>완료</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
									<td>완료</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
									<td>완료</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
									<td>완료</td>
								</tr>
								
							</tbody>
						</table>
					</div>

					<div class="mt-3 mb-3 text-center">
						<ul class="pagination pagination-flat align-self-center">
							<li class="page-item"><a href="#" class="page-link">← &nbsp; Prev</a></li>
							<li class="page-item active"><a href="#" class="page-link">1</a></li>
							<li class="page-item"><a href="#" class="page-link">2</a></li>
							<li class="page-item disabled"><a href="#" class="page-link">3</a></li>
							<li class="page-item"><a href="#" class="page-link">4</a></li>
							<li class="page-item"><a href="#" class="page-link">Next &nbsp; →</a></li>
						</ul>
					</div>
					

				</div>
			</div>
		</div>

		<!-- /basic card -->


	</div>
	<!-- /content area -->

</div>
<!-- /main content -->