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
					<button type="button" class="btn btn-light active">H1</button>
					<button type="button" class="btn btn-light">H2</button>
					<button type="button" class="btn btn-light">H3</button>
					<button type="button" class="btn btn-light">H4</button>
					<button type="button" class="btn btn-light">H5</button>
					<button type="button" class="btn btn-light">H6</button>
					<button type="button" class="btn btn-light">H7</button>
					<button type="button" class="btn btn-light">H8</button>
					<button type="button" class="btn btn-light">H9</button>
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
					<button type="button" class="btn btn-light active" data-layertype="NDVI">
						<i class="fas fa-seedling"></i>
						<!--생육-->
					</button>
					<button type="button" class="btn btn-light" data-layertype="TEMP">
						<i class="fab fa-hotjar"></i>
						<!--열-->
					</button>
					<button type="button" class="btn btn-light" data-layertype="HUMI">
						<i class="fas fa-tint"></i>
						<!--습도-->
					</button>
					<button type="button" class="btn btn-light" data-layertype="NULL">
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
									보기</span> <span class="badge badge-success badge-pill" id="chartHole">Hole 1</span>
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
			
			<div class="image-player-wrapper mt-2">
				<div class="col-lg-12 mb-2">
					<div class="row">
						<div class="col-lg-9 col-sm-12 mt-2">
							<label class="font-weight-bold mr-3">기준시간</label>
							<label class="" id="overlayTime">2023-09-26 16:15:09</label>
						</div>

						<div class="col-lg-3 col-sm-12 p-0 text-right">
							<label class="col-lg-5 col-md-4 col-sm-12">재생 속도</label>
							<select class="custom-select col-lg-6 col-md-6" id="playSpeed">
								<option value="1000">1초</option>
								<option value="5000">5초</option>
								<option value="10000">10초</option>
							</select>
						</div>
					</div>

				</div>
						
				<div class="control-movi-wrap image-control-form-player">
					<div class="btn-wrap col-lg-12 col-md-12 float-left">
						<button class="btn start-btn" data-role="play-slide" title="이전" id="overlayPrev">
							<i class="icon-backward2 icon-2x"></i>
						</button>
						<button class="btn start-btn" data-role="play-slide" title="정지" id="overlayPlay">
							<i class="icon-play3 icon-2x"></i>
						</button>
						<button class="btn start-btn" data-role="play-slide" title="다음" id="overlayNext">
							<i class="icon-forward3 icon-2x"></i>
						</button>
					</div>
					<div class="control-movi-lap">
						<div class="movi-line ui-corner-all ui-slider-horizontal ui-widget ui-widget-content" id="overlayList">
							<!--활성화 시 class='ui-state-on' / 비활성화 시 class='ui-state-default' -->
							<button tabindex="0" class="slider-handle ui-state-default">230928 16:15:17</button>
							<button tabindex="0" class="slider-handle ui-state-default">230928 16:15:18</button>
							<button tabindex="0" class="slider-handle ui-state-on">230928 16:15:19</button>
							<button tabindex="0" class="slider-handle ui-state-default">230928 16:15:20</button>
							<button tabindex="0" class="slider-handle ui-state-default">230928 16:15:21</button>
						</div>
						<div class="movi-bar-wrap" id="moviBarZone">
							<div class="movi-bar"></div>
						</div>
						
					</div>
				</div>

			</div>
		</div>
		<!-- /basic card -->


	</div>
	<!-- /content area -->
	
	<script>
	function findMiddleValue(array) {
	    const result = []; // 결과를 저장할 배열
	    
	    // 배열의 길이가 3 이하인 경우, 모든 값을 결과로 반환
	    if (array.length <= 3) {
	        return array;
	    }
	    
	    const step = Math.floor(array.length / 3); // 간격 계산
	    
	    // 첫 번째 중간값
	    result.push(array[step]);
	    
	    // 두 번째 중간값 (배열의 길이가 충분할 때만)
	    if (array.length > step * 2) {
	        result.push(array[step * 2]);
	    }
	    
	    // 세 번째 중간값 (배열의 길이가 충분할 때만)
	    if (array.length > step * 3) {
	        result.push(array[step * 3]);
	    }

	    return result;
	}

	
	function unifyArrayLengthWithTime(arrays) {
	    let times = [];
	    let resultMap = {};
	    
	    // 모든 시간 값을 가져와서 하나의 배열로 만들기
	    arrays.forEach(array => {
	        array.forEach(item => {
	            times.push(item.tm);
	        });
	    });

	    // 중복 제거 및 시간순으로 정렬
	    times = Array.from(new Set(times)).sort();

	    // 시간대에 따라 적절한 위치에 null 삽입
	    const list = arrays.map(array => {
	        let newArray = [];
	        times.forEach(time => {
	            const found = array.find(item => item.tm === time);
	            newArray.push(found || null);
	        });
	        //resultMap["times"] = times;
	        //resultMap["list"] = newArray;
	        return newArray;
	    });

	    return {
	        times,
	        list
	    };
	}

	// 예시 데이터
	const arrays = [
	    [{tm:'2023-10-04 10:00:00'},{tm:'2023-10-04 11:00:00'},{tm:'2023-10-04 12:00:00'}],
	    [{tm:'2023-10-04 10:00:00'},{tm:'2023-10-04 13:00:00'},{tm:'2023-10-04 14:00:00'}],
	    [{tm:'2023-10-04 13:00:00'},{tm:'2023-10-04 14:00:00'}]
	];

	console.log(unifyArrayLengthWithTime(arrays));

	function getWdText(wdir){
		//16방
		wdirk = "";
		
		wdir = wdir*1;
		
		if (0 <= wdir && wdir <= 11.25){
			wdirk = "북";
		}else if (11.25 < wdir && wdir <= 33.75){
			wdirk = "북북동";
		}else if (33.75 < wdir && wdir <= 56.25){ 
			wdirk = "북동";
		}else if (56.25 < wdir && wdir <= 78.75){ 
			wdirk = "동북동";
		}else if (78.75 < wdir && wdir <= 101.25){ 
			wdirk = "동";
		}else if (101.25 < wdir && wdir <= 123.75){ 
			wdirk = "동남동";
		}else if (123.75 < wdir && wdir <= 146.25){ 
			wdirk = "남동";
		}else if (146.25 < wdir && wdir <= 168.75){ 
			wdirk = "남남동";
		}else if (168.75 < wdir && wdir <= 191.25){ 
			wdirk = "남";
		}else if (191.25 < wdir && wdir <= 213.75){ 
			wdirk = "남남서";
		}else if (213.75 < wdir && wdir <= 236.25){ 
			wdirk = "남서";
		}else if (236.25 < wdir && wdir <= 258.75){ 
			wdirk = "서남서";
		}else if (258.75 < wdir && wdir <= 281.25){ 
			wdirk = "서";
		}else if (281.25 < wdir && wdir <= 303.75){ 
			wdirk = "서북서";
		}else if (303.75 < wdir && wdir <= 326.25){ 
			wdirk = "북서";
		}else if (326.25 < wdir && wdir <= 348.75){ 
			wdirk = "북북서";
		}else if (348.75 < wdir){ 
			wdirk = "북";
		}else{
			wdirk = '-';
		}

		return wdirk;

	}
	
	$(function(){

		let chartList = [];
		let markerList = new Array(); // 마커 정보를 담는 배열
		let infoWindowMap = {}; // 정보창을 담아두는 맵
		let infoDataMap = {}; // 데이터를 담아두는 맵
		let overLayList = new Array(); // 그라운드 오버레이 배열
		let overLayAllList = {};//그라운드 오버레이 전체 저장용 맵
		let customOverlayList = [];//전체용 커스텀 오버레이 배열
		let nowHole = "H1";
		let nowCourse = "Fairway";
		let nowDataType = "ndvi";
		let nowLayerType = "ndvi";
		let playState = false;
		let playTimer;
		let playIdx = 0;
		let playSpeed = 1000;

		var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(37.0455041, 127.3907905),
		    zoom: 17
		});

		map.setMapTypeId('satellite'); 
	    naver.maps.Event.addListener(map, 'click', function(e) {
	        var coord = e.coord;
	        var lat = coord.lat();
	        var lng = coord.lng();

	        console.log('클릭한 위치의 좌표는 ' + lat + ', ' + lng + ' 입니다.');
	    });

	    var CustomOverlay = function(options) {
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
	        var overlayLayer = this.getPanes().overlayLayer;

	        this._element.appendTo(overlayLayer);
	    };

	    CustomOverlay.prototype.draw = function() {
	        if (!this.getMap()) {
	            return;
	        }

	        var projection = this.getProjection(),
	            position = this.getPosition(),
	            pixelPosition = projection.fromCoordToOffset(position);

	        this._element.css('left', pixelPosition.x);
	        this._element.css('top', pixelPosition.y);
	    };

	    CustomOverlay.prototype.onRemove = function() {
	        var overlayLayer = this.getPanes().overlayLayer;

	        this._element.remove();
	        this._element.off();
	    };
		

		function createMarker(lat,lon){
			
			var position = new naver.maps.LatLng(lat, lon);
			var data = getCurrentData(nowHole,nowCourse)
			let hole = nowHole;

		    /* 정보창 */
			var infoWindow = new naver.maps.InfoWindow({
			    content: `<div></div>`,
			    disableAnchor:true,
			    borderWidth:0
			});
						
			var marker = new naver.maps.Marker({
			    map: map,
			    position: position,
			    icon: {
			        //content: contentString,
			        url: "/resources/assets/img/pin.png",
			        size: new naver.maps.Size(30, 44),
			        origin: new naver.maps.Point(0, 0),
			        anchor: new naver.maps.Point(25, 26)
			    }
			});

			infoWindowMap[`${nowHole}\${nowCourse}`] = infoWindow
			infoDataMap[`${nowHole}\${nowCourse}`] = data;
			
			markerList.push(marker)
			
			naver.maps.Event.addListener(marker, "click", function(e) {
				if(infoWindow.getMap()){
					infoWindow.close();
				}else{
					let infoHtml = drawInfoWindow(nowDataType,hole,data);
					infoWindow.setContent(infoHtml)
					infoWindow.open(map, marker);
				}
			});

			naver.maps.Event.trigger(marker,"click")
			//marker.click();

		}

		function createGroundOverlay(startLat,startLon,endLat,endLon,path,tm,idx,mode,moviWidth){
		    var bounds = new naver.maps.LatLngBounds(
	            new naver.maps.LatLng(startLat, startLon),
	            new naver.maps.LatLng(endLat, endLon)
	        );

		    var groundOverlay = new naver.maps.GroundOverlay(
		    	path,
	    	    bounds,
	    	    {
	    	        opacity: 0.5,
	    	        clickable: false
	    	    }
	    	);

		    overLayList.push(groundOverlay)
	    	groundOverlay.setMap(map);

	    	$('#moviBarZone').append(`<div class="movi-bar" style="width:\${moviWidth}%" data-idx="\${idx}" title="\${tm}"></div>`)

		    if(mode=='hide'){

		    }else{
		    	$('#overlayList').append(`<button class="slider-handle ui-state-default overlayBtn" data-idx="\${idx}">\${tm}</button>`)
		    }
	    	//$('#overlayList').append(`<button class="overlayBtn" data-idx="\${idx}">\${tm}</button>`)
		}

		function createGroundTimeAll(times){

			var movieWidth = 100/times.length;
			var layerCnt = times.length;

			var layerList = [0];
			var array = Array.from({length: layerCnt}, (_, index) => index);
			layerList = layerList.concat(findMiddleValue(array));
			layerList.push(layerCnt-1)
			
			for(let i=0;i<times.length;i++){
				var tm = times[i];
				overLayAllList[tm] = [];
				if(layerList.indexOf(i)!=-1){
					$('#overlayList').append(`<button class="slider-handle ui-state-default overlayBtn" data-tm="\${tm}">\${tm}</button>`)
				}
				
				$('#moviBarZone').append(`<div class="movi-bar" style="width:\${movieWidth}%" data-tm="\${tm}" title="\${tm}"></div>`)
				
				//$('#overlayList').append(`<button class="overlayBtn" data-tm="\${tm}">\${tm}</button>`)
			}
		}

		function createGroundOverlayAll(list,startLat,startLon,endLat,endLon){

			for(var i=0;i<list.length;i++){
				for(var j=0;j<list[i].length;j++){

					if(list[i][j]==null){
						continue;
					}

					//startLat,startLon,endLat,endLon
					
				    var bounds = new naver.maps.LatLngBounds(
			            new naver.maps.LatLng(startLat[list[i][j].holeNo], startLon[list[i][j].holeNo]),
			            new naver.maps.LatLng(endLat[list[i][j].holeNo], endLon[list[i][j].holeNo])
			        );


				    var groundOverlay = new naver.maps.GroundOverlay(
				    	list[i][j].layerPath,
			    	    bounds,
			    	    {
			    	        opacity: 0.5,
			    	        clickable: false
			    	    }
			    	);

				    overLayAllList[list[i][j].tm].push(groundOverlay)
				    overLayList.push(groundOverlay)

				    //groundOverlay.setMap(map)

				}
			}

			//alert(overLayList.length)

	    	//groundOverlay.setMap(map);
		}

		function clearMarker(){

			for(var i=0;i<markerList.length;i++){
				markerList[i].setMap(null);
			}

			markerList = []
		}

		function clearInfoWindow(){

			Object.values(infoWindowMap).forEach(value => {
			   value.close();
			});

			infoWindowMap = {};
		}

		function clearCustomOverlay(){
			for(var i=0;i<customOverlayList.length;i++){
				customOverlayList[i].setMap(null);
			}

			customOverlayList = []
		}

		function clearGroundOverlay(){
			
			for(var i=0;i<overLayList.length;i++){
				overLayList[i].setMap(null)
			}

			overLayList = [];
			overLayAllList = {};

			$('#overlayList').empty();
			//$('#overlayList').html(`<button id="overlayPlay"> 재생 </button>`)

			clearInterval(playTimer)
			playState = false;
		}

		function hideGroundOverlay(){
			for(var i=0;i<overLayList.length;i++){
				overLayList[i].setMap(null)
			}
		}

		function showGroundOverlay(idx){
			if(idx!=-1){
				overLayList[idx].setMap(map);
				$("#overlayList .overlayBtn").removeClass('ui-state-on')
				$("#overlayList [data-idx='"+idx+"']").addClass('ui-state-on')
			}
		}

		function showGroundOverlayAll(tm){

			let targetList = overLayAllList[tm];

			$("#overlayList .overlayBtn").removeClass('ui-state-on')
			$("#overlayList [data-tm='"+tm+"']").addClass('ui-state-on')
			
			for(var i=0;i<targetList.length;i++){
				targetList[i].setMap(map);
			}
		}

		function playOverlay(){
			if(playState==true){
				clearInterval(playTimer)
				playState = false;
				$('#overlayPlay').addClass('start-btn')
				$('#overlayPlay').removeClass('pause-btn')
				$('#overlayPlay').attr('title','재생')
				$('#overlayPlay').html(`<i class="icon-play3 icon-2x"></i>`)
			}else{
				playTimer = setInterval(function() {
					hideGroundOverlay()
					//showGroundOverlay(playIdx%overLayList.length)
					$('#moviBarZone .movi-bar:eq('+playIdx%$('.movi-bar').length+')').click();
					playIdx++;
				}, playSpeed);
				playState = true;
				$('#overlayPlay').addClass('pause-btn')
				$('#overlayPlay').removeClass('start-btn')
				$('#overlayPlay').attr('title','정지')
				$('#overlayPlay').html(`<i class="icon-pause icon-2x"></i>`)
			}
		}
		
		function drawInfoWindow(type,holeNo,data){

			let template = ""

			switch(type){
			case "NDVI":
				data = data.ndvi;
				console.log(data.ndvi);
				template = `<div class="course1 position-absolute card bg-success-100 border-success text-center" style="width:225px;">
								<div class="text-body pb-1">
									<div class="card-header bg-success text-white pt-1 pb-1" style="border-top-left-radius: 17px;border-top-right-radius: 17px;">
										<h6 class="card-title font-weight-semibold">Hole \${holeNo}</h6>
									</div>
					
									<div class="card-body pt-2 pb-2">
										<div class="float-left mr-5">
											<span class="badge badge-success badge-pill">양호</span>
											<h2 class="mb-0 font-weight-semibold">\${data.ndvi.toFixed(3)}</h2>
											<div class="font-size-sm text-muted">현재</div>
										</div>
										<div class="float-left">
											<span class="badge badge-success badge-pill">양호</span>
											<h2 class="mb-0 font-weight-semibold">\${data.ndvi.toFixed(3)}</h2>
											<div class="font-size-sm text-muted">예측</div>
										</div>
									</div>
								</div>
							</div>`
					break;
			case "기상정보":
				data = data.weather;
				template = `<div class="course3 position-absolute card border-primary text-center pb-1" style="width:270px;">
								<div class="text-body">
									<div class="card-header bg-primary text-white pt-1 pb-1" style="border-top-left-radius: 17px;border-top-right-radius: 17px;">
										<h6 class="card-title font-weight-semibold">Hole \${holeNo}</h6>
									</div> <!--기상정보 8종-->
									<div class="text-center weather-wrap pl-2 pr-2 pb-2">
										<div class="float-left weather-box">
											<h4 class="mb-0 font-weight-semibold">
											`+data.temp+`<small class="weather-unit">ºC</small>
											</h4>
											<div class="font-size-sm text-muted">기온</div>
										</div>
										<div class="float-left weather-box">
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
										<div class="float-left weather-box">
											<h4 class="mb-0 font-weight-semibold">
											\${data.humi}<small class="weather-unit">%</small>
											</h4>
											<div class="font-size-sm text-muted">습도</div>
										</div>
										<div class="float-left weather-box">
											<h4 class="mb-0 font-weight-semibold">
											\${data.solar}<small class="weather-unit">kWh</small>
											</h4>
											<div class="font-size-sm text-muted">일사</div>
										</div>
											<div class="float-left weather-box">
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
				data = data.soil;
				template = `<div class="course4 position-absolute card border-warning text-center" style="width:260px;">
									<div class="text-body pb-1">
									<div class="card-header bg-warning text-white pt-1 pb-1" style="border-top-left-radius: 17px;border-top-right-radius: 17px;">
										<h6 class="card-title font-weight-semibold">Hole \${holeNo}</h6>
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

		function getDataKrName(type){
			if(type=="ndvi"){
				return "NDVI"
			}

			if(type=="smo"){
				return "토양습도";
			}
			if(type=="sec"){
				return "토양양분";
			}
			if(type=="stp"){
				return "토양온도";
			}

			if(type=="temp"){
				return "온도";
			}
			if(type=="humi"){
				return "습도";
			}
			if(type=="ws"){
				return "풍속";
			}
			if(type=="light"){
				return "광량";
			}
			if(type=="rain"){
				return "강수량";
			}
			if(type=="solar"){
				return "일사량";
			}
		}

		function getDataTypeList(type){
			if(type=="NDVI"){
				return ["ndvi"];
			}
			if(type=="토양정보"){
				return ["smo","sec","stp"];
			}

			if(type=="기상정보"){
				return ["temp","humi","ws","light","rain","solar"];
			}
		}

		function setChartLayer(dataTypeList){
			$('#chartZone').empty();
			
			for(var i=0;i<dataTypeList.length;i++){
				$('#chartZone').append("<div id='"+dataTypeList[i]+"Chart'></div>");
			}

			//console.log($('#chartZone').html())
		}

		function getChartType(type){
			var bar = ["smo","humi","rain"]

			if(bar.indexOf(type)!=-1){
				return "column"
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

		function drawChart(type,chartData){
			
			var unit = getUnit(type);
			var chartType = getChartType(type);


			var obj = {};
			obj.name = getDataKrName(type);
			obj.data = [];
			
					
			for(var i=0;i<chartData.length;i++){
				obj.data.push([chartData[i].tm*1,chartData[i][type]*1])
				if(chartData[i][type]==null){
					return;
				}
			}


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
			            day: '%y-%m-%d<br>%H:%M'
			        }
				},
				labels : {
					autoRotation: false,
			        style: {
			            whiteSpace: 'normal'  // 줄 바꿈 허용
			        }
					//autoRotationLimit : 5
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
				series : [obj]
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

			chartList.push(chart)
		}

		function getHoleInfo(holeNo,courseType){

			let retData = null;

			let param = {
				holeNo : "0"+holeNo.substring(1,holeNo.length),
				courseType : courseType.toUpperCase()
			}
			
			$.ajax({
				url : "/all/getHoleInfo",
				data : param,
				async : false,
				success : function(result){
					retData = result;
				}
			})

			return retData;
		}

		function getCurrentData(holeNo,courseType){

			let retData = null;

			let param = {
				holeNo : "0"+holeNo.substring(1,holeNo.length),
				courseType : courseType.toUpperCase()
			}

			
			$.ajax({
				url : "/all/getCurrentData",
				data : param,
				async : false,
				success : function(result){
					retData = result;
				}
			})

			return retData;
		}

		function getLayerData(holeNo,courseType){
			let retData = null;

			let searchDate = $('#searchDate').val();

			let param = {
				holeNo : "0"+holeNo.substring(1,holeNo.length),
				courseType : courseType.toUpperCase(),
				layerType : nowLayerType,
				startDate : searchDate.split('~')[0].trim(),
				endDate : searchDate.split('~')[1].trim()
			}
			
			$.ajax({
				url : "/all/getLayerData",
				data : param,
				async : false,
				success : function(result){
					retData = result;
				}
			})

			return retData;
		}

		function getChartData(holeNo,courseType,type){

			let retData = null;

			if(type=="NDVI"){
				type = "ndvi"
			}

			if(type=="기상정보"){
				type ="weather"
			}

			if(type=="토양정보"){
				type ="soil"
			}

			let searchDate = $('#searchDate').val();

			let param = {
				holeNo : "0"+holeNo.substring(1,holeNo.length),
				courseType : courseType.toUpperCase(),
				type : type,
				startDate : searchDate.split('~')[0].trim(),
				endDate : searchDate.split('~')[1].trim()
			}
			
			$.ajax({
				url : "/all/getChartData",
				data : param,
				async : false,
				success : function(result){
					retData = result;
				}
			})

			return retData;
		}

		function getAllData(courseType){
			let retData = null;

			let searchDate = $('#searchDate').val();

			let param = {
				courseType : courseType.toUpperCase(),
				startDate : searchDate.split('~')[0].trim(),
				endDate : searchDate.split('~')[1].trim(),
				layerType : nowLayerType
			}

			$.ajax({
				url : "/all/getAllData",
				data : param,
				async : false,
				success : function(result){
					retData = result;
				}
			})

			return retData;
		}

		$('#holeList button,#courseType button,#dataType button').on('click',function(){
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

			if(hole=="전체"){
				hole = "0"
			}

			if(course==""){
				course = now
			}

			if(dataType==""){
				dataType = now
			}
			
			nowHole = hole;
			nowCourse = course;
			nowDataType = dataType

			//전체 오버레이 초기화
			clearCustomOverlay();
			//전체 마커 초기화
			clearMarker()
			clearInfoWindow()
			
			//시간축 초기화
			$('#moviBarZone').empty();
			playState = true;
			playOverlay()
			
			//재생위치 초기화
			playIdx = 0;

			if(hole!="0"){

				//개별검색			
				var holeInfo = getHoleInfo(hole,course)
				var moveTo = new naver.maps.LatLng(holeInfo.lat, holeInfo.lon);
				if(map){
					map.panTo(moveTo)
				}
	
				
				createMarker(holeInfo.lat,holeInfo.lon)
				$('#chartHole').html("Hole "+nowHole);
	
	
				var chartData = getChartData(hole,course,nowDataType);
				var dataTypeList = getDataTypeList(nowDataType);
	
				setChartLayer(dataTypeList);
	
				
				for(var i=0;i<dataTypeList.length;i++){
					drawChart(dataTypeList[i],chartData);
				}
	
				clearGroundOverlay();
				//alert(layerType)
				if(nowLayerType=="NULL"){
					return;
				}
	
				var result = getLayerData(nowHole,nowCourse)
				var layerCnt = result.length;

				if(layerCnt==0){
					$('.image-player-wrapper').hide()
				}else{
					$('.image-player-wrapper').show()
				}
				
				var layerList = [0];
				
				var showRepeat = 1;
				var moviWidth = 20;

				let array = Array.from({length: layerCnt}, (_, index) => index);
				layerList = layerList.concat(findMiddleValue(array));
				layerList.push(layerCnt-1)
								
				moviWidth = 100/layerCnt;
				
				if(result.length>5){
					showRepeat = Math.round(result.length/5);
				}
	
				$.each(result,function(index,item){
					let mode = 'show';
					/*if(index%showRepeat==0){
						mode = 'hide'
					}*/
					if(layerList.indexOf(index)==-1){
						mode = 'hide'
					}

					createGroundOverlay(item.startLat,item.startLon,item.endLat,item.endLon,item.layerPath,item.tm,index,mode,moviWidth)
				})
				
	
				hideGroundOverlay()
				showGroundOverlay(result.length-1)
			}else{
				
				//전체검색
				var result = getAllData(nowCourse);
				var layerDataList = result.layerDataList;
				var soilDataList = result.soilDataList;
				var ndviDataList = result.ndviDataList;
				var weatherDataList = result.weatherDataList;
				var layerParam = [];
				var startLat = {};
				var endLat = {};
				var startLon = {};
				var endLon = {};

				for(var i=0;i<layerDataList.length;i++){
					startLat[layerDataList[i].holeNo] = layerDataList[i].startLat
					endLat[layerDataList[i].holeNo] = layerDataList[i].endLat
					startLon[layerDataList[i].holeNo] = layerDataList[i].startLon
					endLon[layerDataList[i].holeNo] = layerDataList[i].endLon
					layerParam.push(layerDataList[i].layerDataList)
				}
				
				var res = unifyArrayLengthWithTime(layerParam);

				if(res.times.length==0){
					$('.image-player-wrapper').hide()
				}else{
					$('.image-player-wrapper').show()
				}

				clearGroundOverlay();
				createGroundTimeAll(res.times)
				createGroundOverlayAll(res.list,startLat,startLon,endLat,endLon)
				
				if(nowDataType=="토양정보"){
					for(var i=0;i<soilDataList.length;i++){
						var data = soilDataList[i].soilDataList[soilDataList[i].soilDataList.length-1]
						data.soil = data;
						//console.log(data)
						var contentString = [
							drawInfoWindow("토양정보",data.holeNo,data)
					    ].join('');
			
					    var position = new naver.maps.LatLng(data.lat, data.lon);
			
					    var customOverlay = new CustomOverlay({
					        content: contentString,
					        position: position,
					        map: map
					    });

					    customOverlayList.push(customOverlay)
					}
				}

				if(nowDataType=="NDVI"){
					for(var i=0;i<ndviDataList.length;i++){
						var data = {};
						var data2 = ndviDataList[i].sensorInfoList[0].ndviDataList[ndviDataList[i].sensorInfoList[0].ndviDataList.length-1]
						data.ndvi = data2;
						//console.log(data)
						var contentString = [
							drawInfoWindow("NDVI",ndviDataList[i].sensorInfoList[0].holeNo,data)
					    ].join('');
		
					    //console.log(drawInfoWindow("기상정보",data2.holeNo,data))
			
					    var position = new naver.maps.LatLng(ndviDataList[i].sensorInfoList[0].lat, ndviDataList[i].sensorInfoList[0].lon);
			
					    var customOverlay = new CustomOverlay({
					        content: contentString,
					        position: position,
					        map: map
					    });

					    customOverlayList.push(customOverlay)
					}
				}
				if(nowDataType=="기상정보"){
					for(var i=0;i<weatherDataList.length;i++){
						var data = {};
						var data2 = weatherDataList[i].sensorInfoList[0].weatherDataList[weatherDataList[i].sensorInfoList[0].weatherDataList.length-1]
						data.weather = data2;
						//console.log(data)
						var contentString = [
							drawInfoWindow("기상정보",weatherDataList[i].sensorInfoList[0].holeNo,data)
					    ].join('');
	
					    //console.log(drawInfoWindow("기상정보",data2.holeNo,data))
			
					    var position = new naver.maps.LatLng(weatherDataList[i].sensorInfoList[0].lat, weatherDataList[i].sensorInfoList[0].lon);
			
					    var customOverlay = new CustomOverlay({
					        content: contentString,
					        position: position,
					        map: map
					    });

					    customOverlayList.push(customOverlay)
					}
				}
			}
		})
		
		
		$('#layerType button').on('click',function(){
			
			$(this).parent().find('button').removeClass('active')
			var layerType = $(this).data('layertype');
			
			nowLayerType = layerType;

			//시간축 초기화
			$('#moviBarZone').empty();
			playState = true;
			playOverlay()
			
			//재생위치 초기화
			playIdx = 0;
			
			if(nowHole!="0"){
				/*
				clearGroundOverlay();
				if(layerType=="NULL"){
					return;
				}
	
				var result = getLayerData(nowHole,nowCourse)
				var showRepeat = 1;
				if(result.length>5){
					showRepeat = Math.round(result.length/5);
				}

	
				$.each(result,function(index,item){
					let mode = 'show';
					if(index%showRepeat==0){
						mode = 'hide'
					}
				})
	
				hideGroundOverlay()
				showGroundOverlay(result.length-1)

				//개별검색			
				var holeInfo = getHoleInfo(hole,course)
				var moveTo = new naver.maps.LatLng(holeInfo.lat, holeInfo.lon);
				if(map){
					map.panTo(moveTo)
				}
	
				
				createMarker(holeInfo.lat,holeInfo.lon)
				$('#chartHole').html("Hole "+nowHole);
	
	
				var chartData = getChartData(hole,course,nowDataType);
				var dataTypeList = getDataTypeList(nowDataType);
	
				setChartLayer(dataTypeList);
	
				
				for(var i=0;i<dataTypeList.length;i++){
					drawChart(dataTypeList[i],chartData);
				}*/

				clearGroundOverlay();
				if(nowLayerType=="NULL"){
					return;
				}
	
				var result = getLayerData(nowHole,nowCourse)
				var layerCnt = result.length;

				if(layerCnt==0){
					$('.image-player-wrapper').hide()
				}else{
					$('.image-player-wrapper').show()
				}
				
				var layerList = [0];
				
				var showRepeat = 1;
				var moviWidth = 20;

				let array = Array.from({length: layerCnt}, (_, index) => index);
				layerList = layerList.concat(findMiddleValue(array));
				layerList.push(layerCnt-1)
								
				moviWidth = 100/layerCnt;
				
				if(result.length>5){
					showRepeat = Math.round(result.length/5);
				}
	
				$.each(result,function(index,item){
					let mode = 'show';
					if(layerList.indexOf(index)==-1){
						mode = 'hide'
					}

					createGroundOverlay(item.startLat,item.startLon,item.endLat,item.endLon,item.layerPath,item.tm,index,mode,moviWidth)
				})
				
	
				hideGroundOverlay()
				showGroundOverlay(result.length-1)
			}else{
				
				//전체검색
				var result = getAllData(nowCourse);
				var layerDataList = result.layerDataList;
				var soilDataList = result.soilDataList;
				var ndviDataList = result.ndviDataList;
				var weatherDataList = result.weatherDataList;
				var layerParam = [];
				var startLat = {};
				var endLat = {};
				var startLon = {};
				var endLon = {};

				for(var i=0;i<layerDataList.length;i++){
					startLat[layerDataList[i].holeNo] = layerDataList[i].startLat
					endLat[layerDataList[i].holeNo] = layerDataList[i].endLat
					startLon[layerDataList[i].holeNo] = layerDataList[i].startLon
					endLon[layerDataList[i].holeNo] = layerDataList[i].endLon
					layerParam.push(layerDataList[i].layerDataList)
				}
				
				var res = unifyArrayLengthWithTime(layerParam);

				if(res.times.length==0){
					$('.image-player-wrapper').hide()
				}else{
					$('.image-player-wrapper').show()
				}

				clearGroundOverlay();
				createGroundTimeAll(res.times)
				createGroundOverlayAll(res.list,startLat,startLon,endLat,endLon)
			}
		})
		
		$('#searchBtn').on('click',function(){

			var chartData = getChartData(nowHole,nowCourse,nowDataType);
			var dataTypeList = getDataTypeList(nowDataType);

			setChartLayer(dataTypeList);

			for(var i=0;i<dataTypeList.length;i++){
				drawChart(dataTypeList[i],chartData);
			}

			clearGroundOverlay();
			//alert(layerType)
			if(nowLayerType=="NULL"){
				return;
			}

			var result = getLayerData(nowHole,nowCourse)

			var showRepeat = 1;
			if(result.length>5){
				showRepeat = Math.round(result.length/5);
				//alert(result.length+","+showRepeat)
			}


			$.each(result,function(index,item){
				let mode = 'show';
				if(index%showRepeat==0){
					mode = 'hide'
				}
				createGroundOverlay(item.startLat,item.startLon,item.endLat,item.endLon,item.layerPath,item.tm,index,mode)
			})
			/*
			$.each(result,function(index,item){
				createGroundOverlay(item.startLat,item.startLon,item.endLat,item.endLon,item.layerPath,item.tm,index)
			})*/

			hideGroundOverlay()
			showGroundOverlay(result.length-1)
		})
		
		$('#holeList button:eq(1)').click();
		//$('#layerType button:eq(0)').click();
		
		$(document).on('click','#overlayPlay',function(){
			console.log("재생")
			playOverlay();
		})
		
		$(document).on('click','.overlayBtn',function(){
			var idx = $(this).data('idx')
			var tm = $(this).data('tm')
			
			let movieBar = $('#moviBarZone').find('[data-idx="'+idx+'"]')
			hideGroundOverlay()
			if(!tm){
				showGroundOverlay(idx)
			}else{
				showGroundOverlayAll(tm)
				movieBar = $('#moviBarZone').find('[data-tm="'+tm+'"]')
			}

			let now = $(movieBar).index('.movi-bar')
			playIdx = now;

			for(let i=0;i<=now;i++){
				$('.movi-bar:eq('+i+')').removeClass('movi-wait')
			}
			
			for(let i=now+1;i<$('.movi-bar').length;i++){
				$('.movi-bar:eq('+i+')').addClass('movi-wait')
			}
		})
		
		$(document).on('click','#moviBarZone .movi-bar',function(){
			let now = $(this).index('.movi-bar');

			playIdx = now;

			for(let i=0;i<=now;i++){
				$('.movi-bar:eq('+i+')').removeClass('movi-wait')
			}
			
			for(let i=now+1;i<$('.movi-bar').length;i++){
				$('.movi-bar:eq('+i+')').addClass('movi-wait')
			}

			let idx = $(this).data('idx');
			let tm = $(this).data('tm')

			hideGroundOverlay()
			
			if(!tm){
				showGroundOverlay(idx)
			}else{
				showGroundOverlayAll(tm)
			}
			
		})
		
		$(document).on('change','#playSpeed',function(){
			playSpeed = $(this).val()*1;

			//만약 이미 재생중이면 재실행
			if(playState==true){
				clearInterval(playTimer)
				playTimer = setInterval(function() {
					hideGroundOverlay()
					$('#moviBarZone .movi-bar:eq('+playIdx%$('.movi-bar').length+')').click();
					playIdx++;
				}, playSpeed);
			}
		})
		
		$(document).on('click','#overlayPrev',function(){
			var now = $('.movi-wait:eq(0)').index('.movi-bar')-2;
			$('#moviBarZone .movi-bar:eq('+now+')').click();
		})
		
		$(document).on('click','#overlayNext',function(){
			var now = $('.movi-wait:eq(0)').index('.movi-bar');
			$('#moviBarZone .movi-bar:eq('+now+')').click();
		})
	    
		createMarker(35.5913518, 127.9020725);
		


	})
	</script>
	<style>
		.position-absolute{
			z-index: 2;
		}
		.overlayBtn{
			
		}
		.nowOver{
			background-color: cornflowerblue;
			color: white;
		}
		#chartZone > div{
			height: 175px;
		}
		#chartZone > #ndviChart{
			height: 300px;
		}
		
		.movi-bar{
			display: inline-block;
			float: left;
			cursor: pointer;
			border-right: 1px solid white;
		}
		
		.movi-wait{
			background-color : #ddd !important;
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
		</div>
		<!-- /header -->


		<!-- Sidebar search -->
		<div class="sidebar-section ">
			<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
				<li class="nav-item-header">설정</li>
				<li class="nav-item text-center pl-2 pr-2">
					<div class="btn-group btn-group-toggle col-lg-12" data-toggle="buttons">
						<label class="btn btn-light active">
							<input type="radio" name="options" id="option1" autocomplete="off" value="all">
							전체
						</label>

						<label class="btn btn-light">
							<input type="radio" name="options" id="option2" autocomplete="off" value="each">
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
						<input type="text" class="form-control daterange-basic" value="01/01/2015 - 01/31/2015" id="searchDate"> 
						
					</div>
				</li>
				
			</ul>

			<ul class="nav nav-sidebar my-2">
				<li class="nav-item pl-3 pr-3">
					<button type="button" class="btn btn-primary btn-block" id="searchBtn">검색하기<i class="icon-search4 ml-2"></i></button>
				</li>
			</ul>

			
		</div>
		<!-- /sidebar search -->

	</div>
	<!-- /sidebar content -->

</div>