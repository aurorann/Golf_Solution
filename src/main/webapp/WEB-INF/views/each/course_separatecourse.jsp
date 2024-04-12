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
				<h6 class="mr-2 mt-1 font-weight-semibold float-left ml-2">정렬</h6>
				<div class="btn-group mr-2">
					<button type="button" class="btn btn-light listSort" value="">관리순위</button>
					<button type="button" class="btn btn-light listSort active" value="ASC">오름차순</button>
					<button type="button" class="btn btn-light listSort" value="DESC">내림차순</button>
				</div>
				<div class="btn-group mr-2">
					<button type="button" class="categoryBt btn btn-light active" value="FAIRWAY">Fairway</button>
					<button type="button" class="categoryBt btn btn-light" value="GREEN">Green</button>
				</div>
				<h6 class="mr-2 mt-1 font-weight-bold float-right" id="currentDate"></h6>
				
			</div>
		</div>
	</div>
	<!-- /page header -->


	<!-- Content area -->
	<div class="content" style="visibility: visible;">
		<!-- Basic card -->
		<div class="row data">
			<!-- 
			list1 : ndvi
			list2 : hole
			list3 : soil
			 -->
			<c:forEach items="${mainData.list1}" var="hole" varStatus="status">
			
			
			<div class="col-lg-3">
				<div class="card imageZone">
					<div class="card-header bg-white text-dark header-elements-inline">
						<h6 class="card-title font-weight-semibold">${mainData.list2[status.index].holeName}</h6>
						<div>
							<span class="badge badge-success badge-pill ndviData" tooltip="NDVI"><i class="fas fa-seedling mr-2"></i>${mainData.list1[status.index].sensorInfoList[0].ndviDataList[0].ndvi}</span>
							<span class="badge badge-success badge-pill smoData" tooltip="토양수분"><i class="fas fa-tint mr-2"></i>${mainData.list3[status.index].robotInfoList[0].soilDataList[0].smo}<small class="weather-unit">%</small></span>
							<span class="badge badge-success badge-pill stpData" tooltip="토양온도"><i class="fas fa-thermometer-half mr-2"></i>${mainData.list3[status.index].robotInfoList[0].soilDataList[0].stp}<small class="weather-unit">ºC</small></span>
						</div>
					</div>
	
					<div class="card-body pb-0">
						<!--이미지-->
						<div class="col-xl-12 col-md-12 col-sm-12 p-0 mb-3 imageZone2">
							<div id="map${status.index}" style="height:236px"></div>
						</div>
						<div class="col-xl-12 col-md-12 col-sm-12 p-0 mb-3 imageZone3">
							<div class="twentytwenty-wrapper twentytwenty-horizontal">
								<div class="twentytwenty-container">
									<img src="/resources/assets/img/ndvi-1.png" class="ndvi-img twentytwenty-before">
									<img src="/resources/assets/img/ndvi-1.png" class="ndvi-img twentytwenty-after" id="img${status.index}">
								</div>
							</div>
						</div>
						<!--이미지 end-->
						<div class="btn-group btn-group-toggle mr-2 layerType" data-toggle="buttons">
							<label class="btn btn-light active grow" onclick="change(event)" data-layertype="NDVI"  data-holeno="${mainData.list2[status.index].holeNo}" style="padding:.3rem .5rem">
								<input type="radio" name="layerType${status.index}" id="option1" autocomplete="off" checked>
								NDVI
							</label>
							<label class="btn btn-light temp" onclick="change(event)" data-layertype="TEMP"  data-holeno="${mainData.list2[status.index].holeNo}" style="padding:.3rem .5rem">
								<input type="radio" name="layerType${status.index}" autocomplete="off">
								토양온도
							</label>
							<label class="btn btn-light moisture" onclick="change(event)" data-layertype="HUMI"  data-holeno="${mainData.list2[status.index].holeNo}" style="padding:.3rem .5rem">
								<input type="radio" name="layerType${status.index}" autocomplete="off" >
								토양수분
							</label>
						</div>
	
						<span class="btn-group mr-2" data-toggle="buttons">
							<button type="button" class="btn btn-light ndvi" onclick="change(event)" style="padding:.3rem .5rem">NDVI 비교</button>
						</span>
	
						<span class="float-right">
							<button type="button" class="btn btn-primary-100 border-primary text-primary detailReport" value="${mainData.list1[status.index].holeNo}" style="padding:.3rem .5rem">상세정보</button>
						</span>
	
						<!--Chart card-->
						<div class="card mt-2 mb-0 card-collapsed" style="border:0; box-shadow:none;">	
							<div class="collapse">
								<div class="card-chart">
									<div id="layer-card-chart" class="collapse show" style="">
										<div class="card-body chart-card scrolled">
											<div class="chart-container">
												<div class="ndviChart"></div>
												<div class="tempChart"></div>
												<div class="humiChart"></div>
												<div class="wsChart"></div>
												<div class="lightChart"></div>
												<div class="rainChart"></div>
												<div class="solarChart"></div>
												<div class="smoChart"></div>
												<div class="secChart"></div>
												<div class="stpChart"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="list-icons">
								<a class="list-icons-item chart-close" data-action="collapse" onclick="spread(event)"></a>
							</div>
	
						
						</div>
						<!--Chart card end-->
	
					
					</div>
				</div>
			</div>
			
			</c:forEach>
		</div>
		<!-- /basic card -->
	</div>
	<!-- /content area -->
</div>
<!-- /main content -->

<script>


let holeCount = 0;
let mapList = {};
let overlayList = {};

$(document).ready(function() {
    // 페이지가 로드될 때 getAllData 함수 호출
	var category = $(".categoryBt.active").val();
	var listSort = $(".listSort.active").val();
	var body = $('.page-content');
	body.css('overflow', 'hidden');
	getAllData(category, listSort);
	getChartData(category, listSort)
	body.css('overflow', '');
});


$(".categoryBt").click(function() {
	datatemplate = "";
	//$('.row.data').empty();
	var category = $(this).val();
	$(".categoryBt").removeClass("active");
	$(this).addClass("active");
	var listSort = $(".listSort.active").val();
	var body = $('.page-content');
	body.css('overflow', 'hidden');

	getAllData(category, listSort);
	getChartData(category, listSort)

	// 변경 작업 수행
	body.css('overflow', '');
});

$(".listSort").click(function() {
	datatemplate = "";
	//$('.row.data').empty();
	var listSort = $(this).val();
	$(".listSort").removeClass("active");
	$(this).addClass("active");
	var category = $(".categoryBt.active").val();
	var body = $('.page-content');
	body.css('overflow', 'hidden');
	getAllData(category, listSort);
    console.log(category, listSort);
    getChartData(category, listSort)
    body.css('overflow', '');
});


function getAllData(category, listSort){
	
	//$('.content').css('visibility','hidden')
	
	$.ajax({
		url: '/each/course_separatecourse_ajax',
		type:'GET',
        data: {category: category, listsort: listSort},
		dataType: "json",
		async: false,
		success: function(data, textStatus, jqXHR){
            console.log(data);
            console.log(data.list1.length);
            //updateData(data);
            updateDataV2(data)
            holeCount = data.list1.length
		},
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    },
	    complete : function(jqXHR, textStatus){
// 	    	$(".twentytwenty-container[data-orientation!='vertical']").twentytwenty({default_offset_pct: 0.5});
// 			$(".twentytwenty-container[data-orientation='vertical']").twentytwenty({default_offset_pct: 0.5, orientation: 'vertical'});

			/*
			var newSliderPct = 0.7; // adjust this value to your needs
			$(".twentytwenty-container").each(function(){
			  var container = $(this);
			  container[0].sliderPct = newSliderPct;
			});
			// Trigger the resize event
			$(window).trigger("resize.twentytwenty");
			//$().adjustSlider()
			*/
			let responseData = jqXHR.responseJSON;
			console.log(responseData)
			let list = responseData.list2;
			
			for(let i=0;i<holeCount;i++){
				var map = new naver.maps.Map('map'+i, {
				    center: new naver.maps.LatLng(list[i].lat, list[i].lon),
				    zoom: 17
				});
				map.setMapTypeId('satellite'); 
				mapList[list[i].holeNo] = map;

				const imgNode = document.getElementById("img"+i);

				imgNode.onload = function () {
				  console.log("image load complete");
				  $("#img"+i).closest(".twentytwenty-container[data-orientation!='vertical']").twentytwenty({default_offset_pct: 0.5});
				  $("#img"+i).closest(".twentytwenty-container[data-orientation='vertical']").twentytwenty({default_offset_pct: 0.5, orientation: 'vertical'});
				  //$("#img"+i).closest(".imageZone3").hide();
				  if(i==8){
					  setTimeout(() => $(".imageZone3").hide(), 100);
					  setTimeout(() =>$('.content').css('visibility','visible'),200);
					  setTimeout(() => $('.layerType>label:nth-child(1)').click(),150);
					  //setTimeout(() => window.scrollTo(0,0),200);
				  }
				};
			}

			//$(".imageZone3").hide()
			$('.content').css('visibility','visible')
			$('.layerType>label:nth-child(1)').click()
	    }
		
	})//ajax end
}//getAllData() end

let datatemplate = "";

function updateData(data){
	for(var i=0; i<data.list1.length; i++){
		datatemplate += `
			<div class="col-lg-3">
				<div class="card imageZone">
					<div class="card-header bg-white text-dark header-elements-inline">
						<h6 class="card-title font-weight-semibold">\${data.list2[i].holeName}</h6>
						<div>
							<i class="fas fa-seedling mr-2"></i> 
							<span class="badge badge-success badge-pill" tooltip="NDVI"><i class="fas fa-seedling mr-2"></i>\${parseFloat(data.list1[i].sensorInfoList[0].ndviDataList[0].ndvi).toFixed(2)}</span>
							<span class="badge badge-success badge-pill" tooltip="토양온도"><i class="fas fa-tint mr-2"></i>\${parseFloat(data.list3[i].robotInfoList[0].soilDataList[0].smo).toFixed(2)}<small class="weather-unit">%</small></span>
							<span class="badge badge-success badge-pill" tooltip="토양수분"><i class="fas fa-thermometer-half mr-2"></i>\${parseFloat(data.list3[i].robotInfoList[0].soilDataList[0].stp).toFixed(2)}<small class="weather-unit">ºC</small></span>
						</div>
					</div>
	
					<div class="card-body pb-0">
						<!--이미지-->
						<div class="col-xl-12 col-md-12 col-sm-12 p-0 mb-3 imageZone2">
							<div id="map\${i}" style="height:236px"></div>
						</div>
						<div class="col-xl-12 col-md-12 col-sm-12 p-0 mb-3 imageZone3">
							<div class="twentytwenty-wrapper twentytwenty-horizontal">
								<div class="twentytwenty-container">
									<img src="/resources/assets/img/ndvi-1.png" class="ndvi-img twentytwenty-before">
									<img src="/resources/assets/img/ndvi-1.png" class="ndvi-img twentytwenty-after" id="img\${i}">
								</div>
							</div>
						</div>
						<!--이미지 end-->
						<div class="btn-group btn-group-toggle mr-2 layerType" data-toggle="buttons">
							<label class="btn btn-light active grow" onclick="change(event)" data-layertype="NDVI"  data-holeno="\${data.list2[i].holeNo}">
								<input type="radio" name="layerType\${i}" id="option1" autocomplete="off" checked>
								NDVI
							</label>
							<label class="btn btn-light temp" onclick="change(event)" data-layertype="TEMP"  data-holeno="\${data.list2[i].holeNo}">
								<input type="radio" name="layerType\${i}" autocomplete="off">
								토양온도
							</label>
							<label class="btn btn-light moisture" onclick="change(event)" data-layertype="HUMI"  data-holeno="\${data.list2[i].holeNo}">
								<input type="radio" name="layerType\${i}" autocomplete="off" >
								토양수분
							</label>
						</div>
	
						<span class="btn-group mr-2" data-toggle="buttons">
							<button type="button" class="btn btn-light ndvi" onclick="change(event)">NDVI 비교</button>
						</span>
	
						<span class="float-right">
							<button type="button" class="btn btn-primary-100 border-primary text-primary detailReport" value="\${data.list1[i].holeNo}">상세정보</button>
						</span>
	
						<!--Chart card-->
						<div class="card mt-2 mb-0 card-collapsed" style="border:0; box-shadow:none;">	
							<div class="collapse">
								<div class="card-chart">
									<div id="layer-card-chart" class="collapse show" style="">
										<div class="card-body chart-card scrolled">
											<div class="chart-container">
												<div class="ndviChart"></div>
												<div class="tempChart"></div>
												<div class="humiChart"></div>
												<div class="wsChart"></div>
												<div class="lightChart"></div>
												<div class="rainChart"></div>
												<div class="solarChart"></div>
												<div class="smoChart"></div>
												<div class="secChart"></div>
												<div class="stpChart"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="list-icons">
								<a class="list-icons-item chart-close" data-action="collapse" onclick="spread(event)" id="fffff"></a>
							</div>
	
						
						</div>
						<!--Chart card end-->
	
					
					</div>
				</div>
			</div>
	    `;
	}//for end
	let dataElement = document.querySelector('.row.data');
	dataElement.innerHTML = datatemplate;
	
	
}//updateData() end

function updateDataV2(data){
	for(var i=0; i<data.list1.length; i++){
		$('.imageZone:eq('+i+') .card-title').html(data.list2[i].holeName)
		$('.imageZone:eq('+i+') .ndviData').html(`<i class="fas fa-seedling mr-2"></i>`+parseFloat(data.list1[i].sensorInfoList[0].ndviDataList[0].ndvi).toFixed(2))
		$('.imageZone:eq('+i+') .smoData').html(`<i class="fas fa-tint mr-2"></i>`+parseFloat(data.list3[i].robotInfoList[0].soilDataList[0].smo).toFixed(2))
		$('.imageZone:eq('+i+') .stpData').html(`<i class="fas fa-thermometer-half mr-2"></i>`+parseFloat(data.list3[i].robotInfoList[0].soilDataList[0].stp).toFixed(2))
		$('.imageZone:eq('+i+') label').data('holeno',data.list1[i].holeNo);
	}

	//window.scrollTo({left:0, top:0})
}

function getChartData(category,listSort){

	for(let i=0;i<chartList.length;i++){
		$(chartList[i][0]).empty()
	}

	chartList = [];

	$.ajax({
		url : "/each/getChartDataList",
		data : {category:category, listsort:listSort},
		success : function(result){
			//console.log(result)
			let ndviDataList = result.ndviDataList;
			let soilDataList = result.soilDataList;
			let weatherDataList = result.weatherDataList;
			
			for(var i=0;i<ndviDataList.length;i++){

				var dataList = ndviDataList[i].sensorInfoList[0].ndviDataList;
				
				drawChart("ndvi",".ndviChart:eq("+i+")",dataList)
			}

			for(var i=0;i<weatherDataList.length;i++){

				var dataList = weatherDataList[i].sensorInfoList[0].weatherDataList;
				
				drawChart("temp",".tempChart:eq("+i+")",dataList)
				drawChart("humi",".humiChart:eq("+i+")",dataList)
				drawChart("ws",".wsChart:eq("+i+")",dataList)
				drawChart("light",".lightChart:eq("+i+")",dataList)
				drawChart("rain",".rainChart:eq("+i+")",dataList)
				drawChart("solar",".solarChart:eq("+i+")",dataList)

			}

			for(var i=0;i<soilDataList.length;i++){

				var dataList = soilDataList[i].soilDataList;
				
				drawChart("smo",".smoChart:eq("+i+")",dataList)
				drawChart("sec",".secChart:eq("+i+")",dataList)
				drawChart("stp",".stpChart:eq("+i+")",dataList)
			}

		}
	})
}

var chartList = [];

function getTimeStamp(dateString){
	// Date 객체 생성
	let dateObject = new Date(dateString + " UTC"); // UTC 기준으로 Date 객체 생성

	// 유닉스 타임스탬프로 변환 (초 단위)
	let unixTimestamp = Math.floor(dateObject.getTime() / 1);

	return unixTimestamp;
}

function drawChart(type,target,chartData){
	
	var unit = getUnit(type);
	var chartType = getChartType(type);

	if(type=='solar'){
		console.log(chartData)
	}
	var obj = {};
	obj.name = getDataKrName(type);
	obj.data = [];
	obj.color = getChartColor(type)
	
			
	for(var i=0;i<chartData.length;i++){
		obj.data.push([getTimeStamp(chartData[i].tm)*1,chartData[i][type]*1])
		if(chartData[i][type]==null){
			return;
		}
	}

	if(type=='solar'){
		console.log(obj)
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
	        },
	        labels: {
	            format: '{value:%y-%m-%d<br>%H:%M}'
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
			max : getChartMax(type),
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
			y : 0,
			floating : true,
			backgroundColor : (Highcharts.theme && Highcharts.theme.legendBackgroundColor)
					|| '#FFFFFF'
		},
		series : [obj]
	};

	chart = $(target).highcharts(options);

	chartList.push(chart)
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

//데이터 종류에 따른 차트 범위 최고값을 구한다.
function getChartMax(type){

	var max = "";
	
	if(type=='ndvi'){
		max = 1
	}else if(type=='stp' || type=='temp'){
		max = 40
	}else if(type=='sec'){
		max = 1
	}else if(type=='pm25' || type=='pm10'){
		max = 200
	}else if(type=='humi'){
		max = 100
	}else if(type=="rain"){
		max = 20
	}else if(type=="co2"){
		max = 1000
	}else{
		max = null
	}

	return max;
}

//데이터 종류에 따른 차트 선 색상을 구한다.
function getChartColor(type){

	var color = "";
	
	if(type=='ndvi'){
		color = "#40A940"
	}else if(type=='stp' || type=='temp'){
		color = "#FF0000"
	}else if(type=='sec'){
		color = '#DB631F'
	}else if(type=='pm25' || type=='pm10'){
		color = '#f8f9fa'
	}else if(type=='humi'){
		color = '#00BFFF	'
	}else if(type=="rain"){
		color = '#228be6'
	}else if(type=="co2"){
		color = '#212529'
	}else if(type=='smo'){
		color = "#1E90FF"
	}else if(type=="ws"){
		color = "#20B2AA"
	}else if(type=="solar"){
		color = "#FF8200"
	}else{
		color = "green"
	}

	return color;
}

function getDataKrName(type){
	if(type=="ndvi"){
		return "NDVI"
	}

	if(type=="smo"){
		return "토양습도";
	}
	if(type=="sec"){
		return "EC";
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


// 상세정보 버튼 클릭 이벤트 핸들러
$('body').on('click', '.detailReport', function() {
	// 버튼의 value 값
	var value = $(this).val();

	// /report/course_report 페이지로 이동합니다.
	location.href = '/report/course_report?value=' + encodeURIComponent(value);
	
});


function change(event){

	var targets = event.target;
	
    if($(targets).hasClass('ndvi')){
    	$(targets).closest('.imageZone').find('.layerType label').removeClass('active')
    	$(targets).closest('.imageZone').find('.imageZone2').hide();
    	$(targets).closest('.imageZone').find('.imageZone3').show();
    	$(targets).closest('.imageZone').find(".twentytwenty-container[data-orientation!='vertical']").twentytwenty({default_offset_pct: 0.5});
    	$(targets).closest('.imageZone').find(".twentytwenty-container[data-orientation='vertical']").twentytwenty({default_offset_pct: 0.5, orientation: 'vertical'});
    }else if($(targets).hasClass('grow') || $(targets).hasClass('temp') || $(targets).hasClass('moisture')){
    	$(targets).closest('.imageZone').find('.ndvi').removeClass('active')
    	$(targets).closest('.imageZone').find('.imageZone2').show();
    	$(targets).closest('.imageZone').find('.imageZone3').hide();
    }
	
}//change end




function spread(event){

	//event.stopPagination();
	
	return;
	
	let id = "";
	let targets = event.target;	
    var card = $(targets).closest('.card');
    if (card.hasClass('card-collapsed')) {
        // 카드가 축소된 경우, 클래스 제거 후 내용 표시 
        card.removeClass('card-collapsed');
        card.find('.collapse').collapse('show');
        console.log('show')
    } else {
        // 그렇지 않은 경우, 클래스를 추가하고 내용을 숨깁니다.
        card.addClass('card-collapsed');
        card.find('.collapse').collapse('hide');
        console.log('hide')
    }
	
}//spread end



$('.chart-close').click(function() {//버튼 클릭
	var name = $(this).val();
	console.log(name)
    var card = $(this).closest('.chartname');
    if (card.hasClass('card-collapsed')) {
        // 카드가 축소된 경우, 클래스 제거 후 내용 표시 
        card.removeClass('card-collapsed');
        card.find('.collapse').collapse('show');
    } else {
        // 그렇지 않은 경우, 클래스를 추가하고 내용을 숨깁니다.
        card.addClass('card-collapsed');
        card.find('.collapse').collapse('hide');
    }
});


//현재 날짜 yyyy-mm-dd hh:mm으로 표출
function formatDate(date) {
	  var yyyy = date.getFullYear();
	  var mm = String(date.getMonth() + 1).padStart(2, '0'); // Months are 0-based, so we add 1
	  var dd = String(date.getDate()).padStart(2, '0');
	  var hh = String(date.getHours()).padStart(2, '0');
	  var min = String(date.getMinutes()).padStart(2, '0');

	  return 'Update : ' + yyyy + '-' + mm + '-' + dd + ' ' + hh + ':' + min;
	}
	
document.getElementById("currentDate").innerHTML = formatDate(new Date());


function getLayerData(hole, category,nowLayerType){

	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);

	var dateString = year + '-' + month  + '-' + day;
	
	let retData = null;

	let param = {
		holeNo : hole,
		courseType : category,
		layerType : nowLayerType,
		startDate : dateString,
		endDate : dateString
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


function createGroundOverlay(startLat,startLon,endLat,endLon,path,tm,idx,targetMap,holeNo){
    var bounds = new naver.maps.LatLngBounds(
        new naver.maps.LatLng(startLat, startLon),
        new naver.maps.LatLng(endLat, endLon)
    );

    var groundOverlay = new naver.maps.GroundOverlay(
    	path,
	    bounds,
	    {
	        opacity: 1,
	        clickable: false
	    }
	);

	if(overlayList[holeNo]){
		overlayList[holeNo].setMap(null)
	}

    overlayList[holeNo] = groundOverlay
	groundOverlay.setMap(targetMap);

	console.log(holeNo)
	console.log(targetMap)
	//console.log()
}

var nowLayerType = "ndvi";

$(document).on('click','.layerType label',function(){
	console.log('asdf')
	var layerType = $(this).data('layertype');
	var holeNo = $(this).data('holeno');
	
	nowLayerType = layerType;

	var result = getLayerData(holeNo,$(".categoryBt.active").val(),layerType)
	
	$.each(result,function(index,item){
		if(index==result.length-1){
			createGroundOverlay(item.startLat,item.startLon,item.endLat,item.endLon,item.layerPath,item.tm,index,mapList[holeNo],holeNo)
		}
	})
})

</script>
<style>
.chart-container>div{
	height: 150px;
}
</style>