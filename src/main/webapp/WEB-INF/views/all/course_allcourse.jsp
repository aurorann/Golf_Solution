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
				<div class="btn-group mr-2" data-toggle="buttons" id="holeList">
					<button type="button" class="btn btn-light active">전체</button>
					<button type="button" class="btn btn-light">H1</button>
					<button type="button" class="btn btn-light">H2</button>
					<button type="button" class="btn btn-light">H3</button>
					<button type="button" class="btn btn-light">H4</button>
					<button type="button" class="btn btn-light">H5</button>
					<button type="button" class="btn btn-light">H6</button>
					<button type="button" class="btn btn-light">H7</button>
				</div>

				<div class="btn-group mr-2" data-toggle="buttons" id="courseType">
					<button type="button" class="btn btn-light active">Fairway</button>
					<button type="button" class="btn btn-light">Green</button>
				</div>
				
				<div class="float-right">
					<button type="button" class="btn sidebar-control sidebar-right-toggle">
						<i class="fas fa-align-justify"></i>
					</button>
				</div>

				<div class="btn-group mr-2 float-right" data-toggle="buttons" id="layerType">
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

				<div class="btn-group mr-2" data-toggle="buttons" id="dataType">
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
							<div class="chart-container" id="chartZone">
								<div class="chart has-fixed-height" id="line_multiple" style="height: 440px;"></div>
							</div>
						</div>
					</div>
				</div>

			</div>



			<div id="map" style="height: 750px;width: 100%">
			
			</div>
		</div>
		<!-- /basic card -->


	</div>
	<!-- /content area -->
	
	<script>
	$(function(){

		let chartList = [];
		let markerList = new Array(); // 마커 정보를 담는 배열
		let infoWindowList = new Array(); // 정보창을 담는 배열
		let nowHole;
		let nowCourse;
		let nowDataType;

		function getWdText($wdir){
			//16방
			$wdirk = "";
			
			$wdir = $wdir*1;
			
			if (0 <= $wdir && $wdir <= 11.25){
				$wdirk = "북";
			}else if (11.25 < $wdir && $wdir <= 33.75){
				$wdirk = "북북동";
			}else if (33.75 < $wdir && $wdir <= 56.25){ 
				$wdirk = "북동";
			}else if (56.25 < $wdir && $wdir <= 78.75){ 
				$wdirk = "동북동";
			}else if (78.75 < $wdir && $wdir <= 101.25){ 
				$wdirk = "동";
			}else if (101.25 < $wdir && $wdir <= 123.75){ 
				$wdirk = "동남동";
			}else if (123.75 < $wdir && $wdir <= 146.25){ 
				$wdirk = "남동";
			}else if (146.25 < $wdir && $wdir <= 168.75){ 
				$wdirk = "남남동";
			}else if (168.75 < $wdir && $wdir <= 191.25){ 
				$wdirk = "남";
			}else if (191.25 < $wdir && $wdir <= 213.75){ 
				$wdirk = "남남서";
			}else if (213.75 < $wdir && $wdir <= 236.25){ 
				$wdirk = "남서";
			}else if (236.25 < $wdir && $wdir <= 258.75){ 
				$wdirk = "서남서";
			}else if (258.75 < $wdir && $wdir <= 281.25){ 
				$wdirk = "서";
			}else if (281.25 < $wdir && $wdir <= 303.75){ 
				$wdirk = "서북서";
			}else if (303.75 < $wdir && $wdir <= 326.25){ 
				$wdirk = "북서";
			}else if (326.25 < $wdir && $wdir <= 348.75){ 
				$wdirk = "북북서";
			}else if (348.75 < $wdir){ 
				$wdirk = "북";
			}else{
				$wdirk = '-';
			}

			return $wdirk;

		}

		function createMarker(lat,lon,markerId){
			
			var position = new naver.maps.LatLng(lat, lon);

		    /* 정보창 */
			var infoWindow = new naver.maps.InfoWindow({
			    content: `<div id='\${markerId}'></div>`
			});
						
			var marker = new naver.maps.Marker({
			    map: map,
			    position: position,
			    icon: {
			        //content: contentString,
			        url: "http://15.165.143.75/growth/img/pin3.png",
			        size: new naver.maps.Size(42, 42),
			        origin: new naver.maps.Point(0, 0),
			        anchor: new naver.maps.Point(25, 26)
			    }
			});

			console.log(markerId)
			
			naver.maps.Event.addListener(marker, "click", function(e) {
				if(infoWindow.getMap()){
					infoWindow.close();
				}else{
					infoWindow.setContent(drawInfoWindow(nowDataType));
					infoWindow.open(map, marker);
				}
			});

		}


		function drawInfoWindow(type,holeNo){

			let template = ""

			var data = {
				sec : 0.1,
				stp : 0.1,
				smo : 99.2,
			    ndvi2 : 0.6,
			    temp : 20,
			    rain : 10,
			    ws : 5,
			    wd : 10,
			    humi : 60,
			    solar : 10,
			}

			console.log(data)

			switch(type){
			case "NDVI":
				template = `<div class="course1 position-absolute card bg-success-100 border-success text-center" style="width:225px;">
								<div class="text-body pb-1">
									<div class="card-header bg-success text-white pt-1 pb-1">
										<h6 class="card-title font-weight-semibold">Hole 1</h6>
									</div>
					
									<div class="card-body pt-2 pb-2">
										<div class="float-left mr-5">
											<span class="badge badge-success badge-pill">양호</span>
											<h2 class="mb-0 font-weight-semibold">\${data.ndvi}</h2>
											<div class="font-size-sm text-muted">현재</div>
										</div>
										<div class="float-left">
											<span class="badge badge-success badge-pill">양호</span>
											<h2 class="mb-0 font-weight-semibold">\${data.ndvi2}</h2>
											<div class="font-size-sm text-muted">예측</div>
										</div>
									</div>
								</div>
							</div>`
					break;
			case "기상정보":
				template = `<div class="course3 position-absolute card border-primary text-center pb-1" style="width:330px;">
								<div class="text-body">
									<div class="card-header bg-primary text-white pt-1 pb-1">
										<h6 class="card-title font-weight-semibold">Hole 3</h6>
									</div> <!--기상정보 8종-->
									<div class="text-center weather-wrap pl-2 pr-2 pb-2">
										<div class="float-left weather-box mr-3">
											<h4 class="mb-0 font-weight-semibold">
											`+data.temp+`<small class="weather-unit">ºC</small>
											</h4>
											<div class="font-size-sm text-muted">기온</div>
										</div>
										<div class="float-left weather-box mr-3">
											<h4 class="mb-0 font-weight-semibold">\${getWdText(data.wd)}</h4>
											<div class="font-size-sm text-muted">풍향</div>
										</div>
										<div class="float-left weather-box">
											<h4 class="mb-0 font-weight-semibold">
											\${data.ws}<small class="weather-unit">m/s</small>
											</h4>
											<div class="font-size-sm text-muted">풍속</div>
										</div>
									</div>
									<div class="text-center weather-wrap pl-2 pr-2">
										<div class="float-left weather-box mr-3">
											<h4 class="mb-0 font-weight-semibold">
											\${data.humi}<small class="weather-unit">%</small>
											</h4>
											<div class="font-size-sm text-muted">습도</div>
										</div>
										<div class="float-left weather-box mr-3">
											<h4 class="mb-0 font-weight-semibold">
											\${data.solar}<small class="weather-unit">kWh</small>
											</h4>
											<div class="font-size-sm text-muted">일사</div>
										</div>
											<div class="float-left weather-box mr-3">
											<h4 class="mb-0 font-weight-semibold">
											\${data.rain}<small class="weather-unit">mm</small>
											</h4>
											<div class="font-size-sm text-muted">강수량</div>
										</div>
									</div>
								</div>
							</div>`
					break;
			case '토양정보' : 
					template = `<div class="course4 position-absolute card border-warning text-center" style="width:260px;">
										<div class="text-body pb-1">
										<div class="card-header bg-warning text-white pt-1 pb-1">
											<h6 class="card-title font-weight-semibold">Hole 4</h6>
										</div> <!--토양정보 3종-->
										<div class="card-body pt-1 pb-2">
											<div class="float-left mr-3">
												<h2 class="mb-0 font-weight-semibold">\${data.smo}<small class="weather-unit">%</small></h2>
												<div class="font-size-sm text-muted">토양 수분</div>
											</div>
											<div class="float-left mr-3">
												<h2 class="mb-0 font-weight-semibold">\${data.stp}<small class="weather-unit">ºC</small></h2>
												<div class="font-size-sm text-muted">토양 온도</div>
											</div>
											<div class="float-left">
												<h2 class="mb-0 font-weight-semibold">\${data.sec}</h2>
												<div class="font-size-sm text-muted">토양 양분</div>
											</div>
										</div>
									</div>
								</div>`
						break;
			}

			return template;
		}

		function getDataTypeList(type){
			if(type=="NDVI"){
				return ["ndvi"];
			}
			if(type=="토양정보"){
				return ["smo","sec","stp"];
			}

			if(type=="기상정보"){
				return ["temp","rain","ws","humi","pm10","pm25","co2"];
			}
		}

		function setChartLayer(type){
			$('#chartZone').empty();

			console.log(type)

			if(type=="NDVI"){
				$('#chartZone').append("<div id='ndviChart'></div>");
			}

			if(type=="토양정보"){
				$('#chartZone').append("<div id='smoChart'></div>");
				$('#chartZone').append("<div id='secChart'></div>");
				$('#chartZone').append("<div id='stpChart'></div>");
			}

			if(type=="기상정보"){
				$('#chartZone').append("<div id='tempChart'></div>");
				$('#chartZone').append("<div id='rainChart'></div>");
				$('#chartZone').append("<div id='wsChart'></div>");
				$('#chartZone').append("<div id='humiChart'></div>");
				$('#chartZone').append("<div id='pm10Chart'></div>");
				$('#chartZone').append("<div id='pm25Chart'></div>");
				$('#chartZone').append("<div id='co2Chart'></div>");
			}

			//console.log($('#chartZone').html())
		}

		function getChartType(type){
			var bar = ["smo","humi"]

			if(bar.indexOf(type)!=-1){
				return "bar"
			}else{
				return "spline"
			}
		}

		function getUnit(type){

			var unit = "";
			
			if(type=='smo'){
				unit = "%VWC"
			}else if(type=='stp' || type=='temp'){
				unit = "℃"
			}else if(type=='sec'){
				unit = "dS/m"
			}else if(type=='pm25' || type=='pm10'){
				unit = "㎍/m³"
			}else if(type=='humi'){
				unit = "%"
			}else if(type=="rain"){
				unit = "mm"
			}else if(type=="co2"){
				unit = "ppm"
			}

			return unit;
		}

		function drawChart(type,dataList){
			
			var unit = getUnit(type);
			var chartType = getChartType(type);
		

			var options = {
				chart : {
					renderTo : type+"Chart",
					zoomType : 'x',
					type :chartType
				},
				credits : false,
			    time: {
			    	timezoneOffset: -9 * 60
			    },
				title : {
					text : ''
				},
				subtitle : {
					text : ''
				},
			    exporting: {
			        enabled: false
			    },
				xAxis : {
					type : 'datetime',
			        dateTimeLabelFormats: {
			            day: '%Y-%m-%d %H:%M'
			        }
				},
				labels : {
					autoRotationLimit : 5
				},
				yAxis : {
					min: 0,
					labels : {
						format : '{value}'+unit,
						style : {
							color : Highcharts.getOptions().colors[3]
						}
					},
					title : {
						text : false,
						style : {
							color : Highcharts.getOptions().colors[3]
						}
					}
				},
				tooltip : {
					shared : true,
					useHTML : true,
					xDateFormat : '%Y-%m-%d %H:%M',
					headerFormat : '<small>{point.key}</small><table>',
					pointFormat : '<tr><td style="color: {series.color}">{series.name}: </td>'
							+ '<td style="text-align: right"><b>{point.y}'+unit+'</b></td></tr>',
					footerFormat : '</table>',
					valueDecimals : 1
				},
				legend : {
					layout : 'vertical',
					align : 'right',
					x : 10,
					verticalAlign : 'top',
					y : 10,
					floating : true,
					backgroundColor : (Highcharts.theme && Highcharts.theme.legendBackgroundColor)
							|| '#FFFFFF'
				},
				series : dataList
			};
			
			/*
			if(type=='smo'){
				
				warnSMO = 10;
				
				if(dataList[0].sensorNo=='0001' || dataList[0].sensorNo=='0002'){
					warnSMO = 12;
				}else if(dataList[0].sensorNo=='0011' || dataList[0].sensorNo=='0012' || dataList[0].sensorNo=='0013'){
					warnSMO = 20;
				}else{
					warnSMO = 10;
				}
				
				options.yAxis.plotLines = [{ // mark the weekend
		            color: 'red',
		            width: 3,
		            value: warnSMO,
		            dashStyle: 'dot',
		            label: {
		            	text : '<span style="color:red;padding-bottom:2px;">경보기준치('+warnSMO+'%)</span>'
		            }
		        }]
			}else if(type=='sec'){
				options.yAxis.plotLines = [{ // mark the weekend
		            color: 'red',
		            width: 3,
		            value: 0.4,
		            dashStyle: 'dot',
		            label: {
		            	text : '<span style="color:red;padding-bottom:2px;">경보기준치</span>'
		            }
		        },{ // mark the weekend
		            color: 'red',
		            width: 3,
		            value: 5,
		            dashStyle: 'dot',
		            label: {
		            	text : '<span style="color:red;padding-bottom:2px;">경보기준치</span>'
		            }
		        }]
				options.yAxis.max = 2;
			}
			*/
			chart = new Highcharts.Chart(options);

			chartList.add(chart)
		}

		function getCurrentData(holeNo,courseType,type){
			
			let param = {
				holeNo : holeNo,
				courseType : courseType,
				type : type
			}

			
			$.ajax({
				url : "/all/getCurrentData",
				data : param,
				success : function(result){
					console.log(result)
				}
			})
		}

		function getChartData(holeNo,courseType,type){
			let param = {
				holeNo : holeNo,
				courseType : courseType,
				type : type
			}
			
			$.ajax({
				url : "/all/getChartData",
				data : param,
				success : function(result){
					console.log(result)
				}
			})
		}

		$('#holeList button,#courseType button,#dataType button,#layerType button').on('click',function(){
			//alert($(this).text());
			$(this).parent().find('button').removeClass('active')
			//$(this).addClass('active')
			
			let now = $(this).text();
			
			let hole = $('#holeList button.active').text();
			let course = $('#courseType button.active').text();
			let dataType = $('#dataType button.active').text();
			//var layer = $('#layerType button.active').text();
			if(hole==""){
				hole = now
			}

			if(course==""){
				course = now
			}

			if(dataType==""){
				dataType = now
			}

			console.log(hole)
			console.log(course)
			console.log(dataType)
			//console.log(layer)
			
			nowHole = hole;
			nowCourse = course;
			nowDataType = dataType
			
			getCurrentData(hole,course);

			setChartLayer(dataType);
		})

		var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(35.59619903564453, 127.90499877929688),
		    zoom: 18
		});

		map.setMapTypeId('satellite'); 
	    naver.maps.Event.addListener(map, 'click', function(e) {
	        var coord = e.coord;
	        var lat = coord.lat();
	        var lng = coord.lng();

	        console.log('클릭한 위치의 좌표는 ' + lat + ', ' + lng + ' 입니다.');
	    });
		createMarker(35.5913518, 127.9020725,"ndvi");

	    var bounds = new naver.maps.LatLngBounds(
            new naver.maps.LatLng(35.5923333, 127.9004793),
            new naver.maps.LatLng(35.5903572, 127.9035745)
        );

	    var groundOverlay = new naver.maps.GroundOverlay(
    	    "/resources/assets/img/1.png",
    	    bounds,
    	    {
    	        opacity: 0.5,
    	        clickable: false
    	    }
    	);

    	groundOverlay.setMap(map);
	})
	</script>
	<style>
		.position-absolute{
			z-index: 2;
		}
	</style>
</div>
<!-- /main content -->

<div class="sidebar sidebar-light sidebar-right sidebar-expand-lg">
			<!-- Sidebar content -->
			<div class="sidebar-content">

				<!-- Header -->
				<div class="sidebar-section sidebar-section-body d-flex align-items-center">
					<h5 class="mb-0 font-weight-bold">검색</h5>
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
					<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
						<li class="nav-item-header">설정</li>
						<li class="nav-item text-center pl-2 pr-2">
							<div class="btn-group btn-group-toggle col-lg-12" data-toggle="buttons">
								<label class="btn btn-light active">
									<input type="radio" name="options" id="option1" autocomplete="off" checked="">
									전체
								</label>

								<label class="btn btn-light">
									<input type="radio" name="options" id="option2" autocomplete="off">
									개별
								</label>
							</div>
						</li>
					</ul>


					<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
						<li class="nav-item-header">기간</li>
						<li class="nav-item pl-3 pr-3">
							<!--달력 플러그인-->
							<div class="input-group">
								<span class="input-group-prepend">
									<span class="input-group-text"><i class="icon-calendar22"></i></span>
								</span>
								<input type="text" class="form-control daterange-basic" value="01/01/2015 - 01/31/2015"> 
								
							</div>
						</li>
						
					</ul>

					<ul class="nav nav-sidebar my-2">
						<li class="nav-item pl-3 pr-3">
							<button type="button" class="btn btn-primary btn-block">검색하기<i class="icon-search4 ml-2"></i></button>
						</li>
					</ul>

					
				</div>
				<!-- /sidebar search -->

			</div>
			<!-- /sidebar content -->

		</div>