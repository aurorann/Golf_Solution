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
				
				<div class="btn-group mr-2 float-left btn-group-toggle col-lg-12" data-toggle="buttons" style="width: 211px;">
					<label class="btn btn-light active">
						<input type="radio" name="options" id="option1" autocomplete="off" value="전체" checked="checked">
						전체
					</label>

					<label class="btn btn-light">
						<input type="radio" name="options" id="option2" autocomplete="off" value="동작중">
						동작중
					</label>
					
					<label class="btn btn-light">
						<input type="radio" name="options" id="option2" autocomplete="off" value="대기중">
						대기중
					</label>
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
				<!-- 
				<div class="card layer-card">
					<div class="card-header card-header-round header-elements-inline">
						<h6 class="card-title">
							<a class="text-body collapsed" data-toggle="collapse" href="#layer-card-chart" aria-expanded="false">
								<span class="badge badge-danger badge-pill mr-1">충전 필요</span>
								<span>센싱 로봇 2</span>
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
	
					<div id="layer-card-chart" class="collapse" >
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
								<span>센싱 로봇 1</span>
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

					<div id="layer-card-chart2" class="collapse" >
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
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					 -->
					
					<c:forEach items="${list}" var="robotInfo" varStatus="status">
						<fmt:formatDate value="${robotLogList.lastUpdated}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedDate"/>
							<div class="card layer-card">
								<div class="card-header card-header-round header-elements-inline">
									<h6 class="card-title">
										<a class="text-body collapsed" data-toggle="collapse" href="#layer-card-chart${status.index + 1}" aria-expanded="false">
											<c:choose>
												<c:when test="${robotInfo.robotState == '충전 필요'}">
													<span class="badge badge-danger badge-pill mr-1">충전 필요</span>
												</c:when>
												<c:when test="${robotInfo.robotState == '대기중'}">
													<span class="badge badge-warning badge-pill mr-1">대기중</span>
												</c:when>
												<c:otherwise>
													<span class="badge badge-success badge-pill mr-1">활동중</span>
												</c:otherwise>
											</c:choose>
											<span><c:out value="${robotInfo.robotName}"></c:out></span>
											<span><c:out value="${robotInfo.robotState}"></c:out></span>
										</a>
									</h6>
			
									<div class="header-elements">
										<div class="list-icons">
											<a class="list-icons-item" data-action="remove"></a>
										</div>
									</div>
								</div>
			
								<div id="layer-card-chart${status.index + 1}" class="collapse" >
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
													<c:set var="count" value="0"/>
														<c:forEach items="${log}" var="logList" varStatus="status">
															 <c:if test="${robotInfo.robotName == logList.robotName and count lt 10}">
																<tr>
																	<td class="p-0">${logList.robotLog.tm}</td>
																	<td class="p-0">${logList.robotLog.eventComment}</td>
																</tr>
															<c:set var="count" value="${count + 1}"/>
														</c:if>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
					</c:forEach>
	
					
	
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
					<tbody class="sideRobotList">
						<c:forEach items="${list}" var="robotInfo">
							<fmt:formatDate value="${robotInfo.lastUpdated}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedDate"/>
								<tr>
									<td class="pl-1 pr-1"><c:out value="${robotInfo.robotName}"></c:out></td>
									<td class="pl-1 pr-1"><c:out value="${robotInfo.robotState}"></c:out></td>
									<td class="pl-1 pr-1"><c:out value="${formattedDate}"></c:out></td>
								</tr>
						</c:forEach>
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

	let robotMap = {};
	
	let map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(37.0455041, 127.3907905),
	    zoom: 18
	});

	map.setMapTypeId('satellite'); 

    naver.maps.Event.addListener(map, 'click', function(e) {
    	let coord = e.coord;
    	let lat = coord.lat();
    	let lng = coord.lng();

        console.log('클릭한 위치의 좌표는 ' + lat + ', ' + lng + ' 입니다.');
    });

    let CustomOverlay = function(options) {
        this._element = $(options.content);

        this.setPosition(options.position);
        this.setMap(options.map || null);
    };

    CustomOverlay.prototype = new naver.maps.OverlayView();
    CustomOverlay.prototype.constructor = CustomOverlay;

    CustomOverlay.prototype.setPosition = function(position) {
        this._position = position;
        this.draw();
    };

    CustomOverlay.prototype.getPosition = function() {
        return this._position;
    };

    CustomOverlay.prototype.onAdd = function() {
    	let overlayLayer = this.getPanes().overlayLayer;

        this._element.appendTo(overlayLayer);
    };

    CustomOverlay.prototype.draw = function() {
        if (!this.getMap()) {
            return;
        }

        let projection = this.getProjection(),
            position = this.getPosition(),
            pixelPosition = projection.fromCoordToOffset(position);

        this._element.css('left', pixelPosition.x);
        this._element.css('top', pixelPosition.y);
    };

    CustomOverlay.prototype.onRemove = function() {
    	let overlayLayer = this.getPanes().overlayLayer;

        this._element.remove();
        this._element.off();
    };

	function drawInfoWindow(robotName,state){

		let active = "";
		
		if(state=="동작중"){
			active = "robot-active"
		}
		
		let template = 
			`<div class="card border-pink bg-white text-center p-2 \${active}" style="width:156px;">
					<a href="#" class="text-body">
					</a><div class="media m-0"><a href="#" class="text-body">
						</a><div class="mr-3"><a href="#" class="text-body">
							</a><a href="#">
								<span href="#" class="btn bg-transparent border-pink text-pink rounded-pill border-2 btn-icon"><i class="fas fa-robot"></i>
								</span>
								<span class="ml-1 font-weight-bold text-dark">\${robotName}</span>
							</a>
						</div>
					</div>
			</div>`

		return template;
	}

	let contentString = [
		drawInfoWindow("센싱 로봇1","")
    ].join('');

	let position = new naver.maps.LatLng(37.046257, 127.390777);

	let customOverlay = new CustomOverlay({
        content: contentString,
        position: position,
        map: map
    });

	let contentString2 = [
		drawInfoWindow("센싱 로봇2","동작중")
    ].join('');

	let position2 = new naver.maps.LatLng(37.045675, 127.391759);

	let customOverlay2 = new CustomOverlay({
        content: contentString2,
        position: position2,
        map: map
    });
})







</script>