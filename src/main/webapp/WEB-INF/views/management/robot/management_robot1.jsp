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
						<input type="radio" name="options" id="allRobot" autocomplete="off" value="전체" checked="checked">
						<!--
						<input type="radio" name="options" id="option1" autocomplete="off" value="전체" checked="checked">
						-->
						전체
					</label>

					<label class="btn btn-light">
						<input type="radio" name="options" id="workRobot" autocomplete="off" value="동작중">
						동작중
					</label>
					
					<label class="btn btn-light">
						<input type="radio" name="options" id="waitRobot" autocomplete="off" value="대기중">
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
	
			<div class="collapsible-sortable position-absolute badgeList" style="left:10px; top:10px;">
				<!-- 
				<c:forEach items="${list}" var="robotInfo" varStatus="status">
					<fmt:formatDate value="${robotLogList.lastUpdated}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedDate"/>
						<div class="card layer-card">
						<input type="hidden" class="listRobotName" value="${robotInfo.robotName}">
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
				 -->
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

$(document).ready(function() {
    $(".btn-group-toggle .btn").click(function() {
        // 모든 label에서 'active' 클래스 제거
        $(".btn-group-toggle .btn").removeClass("active");
        // 클릭한 label에 'active' 클래스 추가
        $(this).addClass("active");
    });
    
    robotInfo();

});//ready end


function robotInfo(){
    var badge = '';
	$.ajax({
	    url: '/management/getRobotInfo',
	    method: 'GET',
	    success: function(data) {
	        console.log(data);
	        
            $.each(data,function(index,item){
                badge += badgeList(item);	            
            })//for each end

            $('.badgeList').html(badge);
            logList();
	   },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
	});//ajax end
}//robotInfo() end

function selectRobotInfo(robotName){
	console.log("selectRobotInfo"+robotName);
    var badge = '';
	$.ajax({
	    url: '/management/getRobotInfoSelect',
	    data: { 'robotName': robotName },
	    method: 'GET',
	    success: function(data) {
	        console.log(data);
	        
	        var item = data;
	        
            $.each(data,function(index,item){
                badge += badgeList(item);	            
            })//for each end           

            $('.badgeList').append(badge);
            logList();
	   },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
	});//ajax end
}//robotInfo() end


function badgeList(item){
	console.log(item)
	var badge = '';
	var stateClass = '';
	var stateText = '';
	if (item.robotState == '충전 필요') {
		stateClass = 'badge-danger';
		stateText = '충전 필요';
	} else if (item.robotState == '대기중') {
		stateClass = 'badge-warning';
		stateText = '대기중';
	} else {
		stateClass = 'badge-success';
		stateText = '활동중';
	}
	console.log(item.robotName);
	badge+=`
            <div class="card layer-card" value="\${item.robotName}">
            <input type="hidden" class="listRobotName" value="\${item.robotName}">
                <div class="card-header card-header-round header-elements-inline">
                    <h6 class="card-title">
                        <a class="text-body collapsed" data-toggle="collapse" href="#layer-card-chart\${item.robotNo}" aria-expanded="false">
                            <span class="badge \${stateClass} badge-pill mr-1">\${stateText}</span>
                            <span>\${item.robotName}</span>
                            <span>\${item.robotState}</span>
                        </a>
                    </h6>

                    <div class="header-elements">
                        <div class="list-icons">
                            <a class="list-icons-item" data-action="remove"></a>
                        </div>
                    </div>
                </div>

                <div id="layer-card-chart\${item.robotNo}" class="collapse" >
                    <div class="card-body chart-card scrolled pl-1 pr-1">
                        <div class="table-responsive">
                            <table class="table text-center">
                                <thead>
                                    <tr>
                                        <th class="table-info pt-1 pb-1">날짜</th>
                                        <th class="table-info pt-1 pb-1">활동</th>
                                    </tr>
                                </thead>
                                <tbody class="logList" value="\${item.robotName}">
                                    <!-- 로그 정보를 표시하는 코드를 여기에 추가합니다. -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>                
            `
		return badge;
}//badgeList() end

$(document).on('click', '.list-icons-item[data-action="remove"]', function() {
	$(this).closest('.card.layer-card').remove();
});

function logList(){
	$.ajax({
	    url: '/management/getLogList2',
	    method: 'GET',
	    success: function(data) {
	        console.log(data);
	        
            $.each(data, function(index, logItem) {
                // 로그 아이템의 로봇 이름과 일치하는 카드를 찾습니다.
                var card = $('.listRobotName[value="' + logItem.robotName + '"]').closest('.card.layer-card');
                if (card.length > 0) {
                    // 카드가 존재하면 로그 리스트에 로그 아이템을 추가합니다.
                    var logList = card.find('.logList');
                    if (logList.children().length < 10) {
                        var logEntry = '<tr><td class="p-0">' + logItem.robotLog.tm + '</td><td class="p-0">' + logItem.robotLog.eventComment + '</td></tr>';
                        logList.append(logEntry);
                    }
                }
            });
	        
	   },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
	});//ajax end
}//rogList() end



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
			active = "robot-active",
			state = "work-robot"
		}else{
			state = "wait-robot"
		}
		
		let template = 
			`<div class="card border-pink bg-white text-center p-2 \${active} \${state}" style="width:156px; cursor:pointer;">
				<input class="robotName" type="hidden" value="\${robotName}">
				<div class="media m-0">
					<div class="mr-3">
						<a href="#">
							<span href="" class="btn bg-transparent border-pink text-pink rounded-pill border-2 btn-icon"><i class="fas fa-robot"></i></span>
							<span class="ml-1 font-weight-bold text-dark">\${robotName}</span>
						</a>
					</div>
				</div>
			</div>`
		
		return template;
	}
	
	let robotList = [];
	let overlays = [];
	
    $.ajax({
        url: '/management/getRobotInfo',
        method: 'GET',
        success: function(data) {
        	console.log(data);
        	console.log("로봇이름"+data[0].robotName);
			$.each(data, function(index, robotInfo) {
				robotList.push({
					robotName: robotInfo.robotName,
					robotState: robotInfo.robotState,
					lat: robotInfo.lat,
					lon: robotInfo.lon
				});
			});
			console.log(robotList);
			
			robotList.forEach(function(robotInfo) {
			    let contentString = [
			        drawInfoWindow(robotInfo.robotName, robotInfo.robotState)
			    ].join('');

			    let position = new naver.maps.LatLng(robotInfo.lat, robotInfo.lon);

			    let customOverlay = new CustomOverlay({
			        content: contentString,
			        position: position,
			        map: map
			    });
			    overlays.push(customOverlay);
			});
			
       },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
    
    
    
    $(document).on("click","#allRobot", function(){
    	$('.wait-robot').show();
    	$('.work-robot').show();
    });

    $(document).on("click","#workRobot", function(){
    	$('.wait-robot').hide();
    	$('.work-robot').show();
    });

    $(document).on("click","#waitRobot", function(){
    	$('.wait-robot').show();
    	$('.work-robot').hide();
    });

    $(document).on("click",".border-pink", function(){
        var robotName = $(this).find('.robotName').val();
        var card = $('.listRobotName[value="' + robotName + '"]').closest('.card.layer-card');
        console.log("로봇이름"+robotName)
        
        if(card.length == 0){
        	selectRobotInfo(robotName);
        }else{
        	card.find('a.text-body').click();
        }

    });
	    
    
    
})//function end





/*
let contentString = [
	drawInfoWindow("로봇1","동작중")
].join('');

let position = new naver.maps.LatLng(37.046257, 127.390777);

let customOverlay = new CustomOverlay({
    content: contentString,
    position: position,
    map: map
});

let contentString2 = [
	drawInfoWindow("로봇2","대기중")
].join('');

let position2 = new naver.maps.LatLng(37.045675, 127.391759);

let customOverlay2 = new CustomOverlay({
    content: contentString2,
    position: position2,
    map: map
});

let contentString3 = [
	drawInfoWindow("캐디로봇1","충전 필요")
].join('');

let position3 = new naver.maps.LatLng(37.044585, 127.385645);

let customOverlay3 = new CustomOverlay({
    content: contentString3,
    position: position3,
    map: map
});

let contentString4 = [
	drawInfoWindow("캐디로봇2","동작중")
].join('');

let position4 = new naver.maps.LatLng(37.046366, 127.387826);

let customOverlay4 = new CustomOverlay({
    content: contentString4,
    position: position4,
    map: map
});
*/






</script>