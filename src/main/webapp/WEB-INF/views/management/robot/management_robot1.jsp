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
					<button type="button" class="btn btn-light active" onclick="location.href='/management/robot1'">MAP</button>
					<button type="button" class="btn btn-light" onclick="location.href='/management/robot2'">GRID</button>
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
	
			<div class="collapsible-sortable position-absolute" style="left:10px; top:10px;">
	
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
	
					<div class="card layer-card">
						<div class="card-header card-header-round header-elements-inline">
							<h6 class="card-title">
								<a class="text-body collapsed" data-toggle="collapse" href="#layer-card-chart2" aria-expanded="false">
									<span class="badge badge-success badge-pill mr-1">활동중</span>
									<span>캐디 로봇 1</span>
									<span>
										활동 중입니다.
									</span>
								</a>
							</h6>
	
							<div class="header-elements">
								<div class="list-icons">
									<a class="list-icons-item" data-action="remove"></a>
								</div>
							</div>
						</div>
	
						<div id="layer-card-chart2" class="collapse" style="">
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
	
				
	
				<div id="map" style="width: 100%;height: 750px;"></div>
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

<style>
	.position-absolute{
		z-index: 2;
	}
</style>
	
<script type="text/javascript">
$(function(){
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(35.591352, 127.902073),
	    zoom: 18
	});

	map.setMapTypeId('satellite'); 
})
</script>