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
			<div class="page-title" style="width:100%;">
				<h6 class="mr-2 mt-1 font-weight-semibold float-left ml-2">로봇 관리 - 뷰어</h6>
				<div class="btn-group mr-2">
					<button type="button" class="btn btn-light active" onclick="location.href='management_robot1.html'">MAP</button>
					<button type="button" class="btn btn-light" onclick="location.href='management_robot2.html'">GRID</button>
				</div>
	
				<div class="float-right">
					<button type="button" class="btn sidebar-control sidebar-right-toggle">
						<i class="fas fa-align-justify"></i>
					</button>
				</div>
	
				<div class="btn-group mr-2 float-left">
					<button type="button" class="btn btn-light active">전체</button>
					<button type="button" class="btn btn-light">동작중</button>
					<button type="button" class="btn btn-light">대기중</button>
				</div>
				<h6 class="ml-3 mr-2 mt-1 font-weight-bold float-left">로봇</h6>	
	
			</div>
		</div>
	</div>
	<!-- /page header -->
	
	
	<!-- Content area -->
	<div class="content">
		<!-- Basic card -->
		<div class="content-wrap position-relative">
	
			<div class="collapsible-sortable position-absolute" style="left:10px; top:10px;">
				<div class="card layer-card-large">
					<div class="card-header card-header-round header-elements-inline">
						<h6 class="card-title">
							<a class="text-body collapsed" aria-expanded="false">
								<span class="badge badge-danger badge-pill mr-2">Hole 1</span>
								<span>캐디 1</span>
							</a>
						</h6>
	
						<div class="header-elements">
							<div class="list-icons">
								<a class="list-icons-item" data-action="remove"></a>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-4">
								<div class="card">
									<img src="assets/img/ndvi-1.png">
									<h6 class="text-center font-weight-semibold mt-1">Sector 1</h6>
									<span class="badge badge-primary badge-pill ml-3 mr-3 mb-2">Stable</span>
								</div>
	
							</div>
							<div class="col-lg-4">
								<div class="card">
									<img src="assets/img/ndvi-1.png">
									<h6 class="text-center font-weight-semibold mt-1">Sector 1</h6>
									<span class="badge badge-primary badge-pill ml-3 mr-3 mb-2">Stable</span>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="card">
									<img src="assets/img/ndvi-1.png">
									<h6 class="text-center font-weight-semibold mt-1">Sector 1</h6>
									<span class="badge badge-primary badge-pill ml-3 mr-3 mb-2">Stable</span>
								</div>
							</div>
						</div>
	
						<div class="card-title">
							<span class="font-weight-semibold">AI 판단</span>
							<p>1. 08/22 비료 투여 완료<br>
							2. 그린마스터 01이/가 오늘 14시에 현장점검 일정이 있습니다.<br>
							3. Sector 1의 적정 함수율이 08/23 14시까지 유지됩니다.</p>
						</div>
	
						<div class="row">
							<div class="col-lg-6">
								<div class="card">
									차트
								</div>
							</div>
							<div class="col-lg-6">
								<div class="card">
									이미지
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
				
				<div class="robot1 position-absolute card border-pink bg-white text-center p-2">
					<a href="#" class="text-body">
						<div class="media m-0">
							<div class="mr-3">
								<a href="#">
									<span href="#" class="btn bg-transparent border-pink text-pink rounded-pill border-2 btn-icon"><i class="fas fa-robot"></i>
									</span>
									<span class="ml-1 font-weight-bold text-dark">캐디 로봇 1</span>
								</a>
							</div>
						</div>
					</a>
				</div>
	
				<div class="robot2 robot-active position-absolute card border-pink bg-white text-center p-2">
					<a href="#" class="text-body">
						<div class="media m-0">
							<div class="mr-3">
								<a href="#">
									<span href="#" class="btn bg-transparent border-pink text-pink rounded-pill border-2 btn-icon"><i class="fas fa-robot"></i>
									</span>
									<span class="ml-1 font-weight-bold text-dark">캐디 로봇 2</span>
								</a>
							</div>
						</div>
					</a>
				</div>
	
				<div class="collapsible-sortable position-absolute" style="right:10px; top:10px;">
	
					<div class="card layer-card">
						<div class="card-header card-header-round header-elements-inline">
							<h6 class="card-title">
								<a class="text-body collapsed" data-toggle="collapse" href="#layer-card-chart" aria-expanded="false">
									<span class="badge badge-danger badge-pill mr-1">충전 필요</span>
									<span>캐디 로봇 2</span>
									<span>
										배터리가 부족합니다
									</span>
								</a>
							</h6>
	
							<div class="header-elements">
								<div class="list-icons">
									<a class="list-icons-item" data-action="remove"></a>
								</div>
							</div>
						</div>
	
						<div id="layer-card-chart" class="collapse" style="">
							<div class="card-body chart-card scrolled pl-1 pr-1">
								<div class="table-responsive">
									<table class="table text-center">
										<thead>
											<tr>
												<th class="table-info pt-1 pb-1">날짜</th>
												<th class="table-info pt-1 pb-1">활동</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">배터리가 부족합니다.</td>
											</tr>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
	
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
											<tr>
												<td class="p-0">2023-06-26 18:02:18</td>
												<td class="p-0">이동중 입니다.</td>
											</tr>
	
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
	
				</div>
	
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11124.634462768941!2d127.8932198328219!3d35.58989843099262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356fa1a0b8e4ab75%3A0x6cb5878cba1e3d20!2z7YG065-965SUIOqxsOywvQ!5e1!3m2!1sko!2skr!4v1693789715832!5m2!1sko!2skr" width="100%" height="750" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
		<!-- /basic card -->
	
	
	</div>
	<!-- /content area -->
	
	
	
	</div>
	<!-- /main content -->
	
	<div class="sidebar sidebar-light sidebar-right sidebar-expand-lg sidebar-collapsed">
		<!-- Sidebar content -->
	<div class="sidebar-content">
	
		<!-- Header -->
		<div class="sidebar-section sidebar-section-body d-flex align-items-center">
			<h5 class="mb-0 font-weight-bold">로봇 리스트</h5>
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
		<div class="sidebar-section ">
			<div class="table-responsive table-scrollable">
				<table class="table text-center">
					<thead>
						<tr>
							<th class="table-info pl-1 pr-1 pt-1 pb-1">로봇명</th>
							<th class="table-info pl-1 pr-1 pt-1 pb-1">동작현황</th>
							<th class="table-info pl-1 pr-1 pt-1 pb-1">동작시간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="pl-1 pr-1">캐디1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">캐디1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">캐디1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">캐디1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">캐디1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">캐디1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">캐디1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">캐디1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">캐디1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">캐디1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
					
					</tbody>
				</table>
			</div>
		</div>
		<!-- /sidebar search -->
	
	</div>
	<!-- /sidebar content -->
	
	</div>

</div>
<!-- /main content -->