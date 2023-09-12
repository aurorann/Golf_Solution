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
					<button type="button" class="btn btn-light" onclick="location.href='management_robot1.html'">MAP</button>
					<button type="button" class="btn btn-light active" onclick="location.href='management_robot2.html'">GRID</button>
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
		<div class="card">
                  <div class="card-header">
                      <h5 class="card-title">로봇 관리 리스트</h5>
                  </div>

                  <div class="table-responsive table-scrollable">
                      <table class="table">
                          <thead>
                              <tr>
                                  <th>로봇명</th>
                                  <th>구분</th>
                                  <th>이벤트</th>
                                  <th>최근 동작 시간</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td>캐디 1</td>
                                  <td>샌싱 캐디(토양 측정)</td>
                                  <td>37.211,128.412 데이터 측정중에 있습니다.</td>
                                  <td>2023-08-14 16:54</td>
                              </tr>
                              <tr>
                                  <td>캐디 2</td>
                                  <td>캐디(NDVI 측정)</td>
                                  <td>37.211,128.412 데이터 측정중에 있습니다.</td>
                                  <td>2023-08-14 16:54</td>
                              </tr>
                              <tr>
                                  <td>캐디 1</td>
                                  <td>캐디(NDVI 측정)</td>
                                  <td>활성화 되었습니다.</td>
                                  <td>2023-08-14 16:54</td>
                              </tr>
                              <tr>
                                  <td>캐디 1</td>
                                  <td>캐디(NDVI 측정)</td>
                                  <td>활성화 되었습니다.</td>
                                  <td>2023-08-14 16:54</td>
                              </tr>
                              <tr>
                                  <td>캐디 1</td>
                                  <td>캐디(NDVI 측정)</td>
                                  <td>활성화 되었습니다.</td>
                                  <td>2023-08-14 16:54</td>
                              </tr>
                              <tr>
                                  <td>캐디 1</td>
                                  <td>캐디(NDVI 측정)</td>
                                  <td>활성화 되었습니다.</td>
                                  <td>2023-08-14 16:54</td>
                              </tr>
                              <tr>
                                  <td>캐디 1</td>
                                  <td>캐디(NDVI 측정)</td>
                                  <td>활성화 되었습니다.</td>
                                  <td>2023-08-14 16:54</td>
                              </tr>
                              <tr>
                                  <td>캐디 1</td>
                                  <td>캐디(NDVI 측정)</td>
                                  <td>활성화 되었습니다.</td>
                                  <td>2023-08-14 16:54</td>
                              </tr>
                              <tr>
                                  <td>캐디 1</td>
                                  <td>캐디(NDVI 측정)</td>
                                  <td>활성화 되었습니다.</td>
                                  <td>2023-08-14 16:54</td>
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