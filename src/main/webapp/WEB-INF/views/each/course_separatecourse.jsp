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
					<button type="button" class="btn btn-light listsort" value="">관리순위</button>
					<button type="button" class="btn btn-light listsort active" value="ASC">오름차순</button>
					<button type="button" class="btn btn-light listsort" value="DESC">내림차순</button>
				</div>
				<div class="btn-group mr-2">
					<button type="button" class="categorybt btn btn-light active" value="FAIRWAY">Fairway</button>
					<button type="button" class="categorybt btn btn-light" value="GREEN">Green</button>
				</div>
				<h6 class="mr-2 mt-1 font-weight-bold float-right" id="currentDate"></h6>
				
			</div>
		</div>
	</div>
	<!-- /page header -->


	<!-- Content area -->
	<div class="content">
		<!-- Basic card -->
		<div class="row data">

		</div>
		<!-- /basic card -->
	</div>
	<!-- /content area -->
</div>
<!-- /main content -->

<script>


let holeCount = 0;

$(document).ready(function() {
    // 페이지가 로드될 때 getAllData 함수 호출
	var category = $(".categorybt.active").val();
	var listsort = $(".listsort.active").val();
	getAllData(category, listsort);
	getChartData()
});


$(".categorybt").click(function() {
	datatemplate = "";
	$('.row.data').empty();
	var category = $(this).val();
	$(".categorybt").removeClass("active");
	$(this).addClass("active");
	var listsort = $(".listsort.active").val();
	getAllData(category, listsort);
});

$(".listsort").click(function() {
	datatemplate = "";
	$('.row.data').empty();
	var listsort = $(this).val();
	$(".listsort").removeClass("active");
	$(this).addClass("active");
	var category = $(".categorybt.active").val();
	getAllData(category, listsort);
    console.log(category, listsort);
});


function getAllData(category, listsort){
	$.ajax({
		url: '/each/course_separatecourse_ajax',
		type:'GET',
        data: {category: category, listsort: listsort},
		dataType: "json",
		async: false,
		success: function(data, textStatus, jqXHR){
            console.log(data);
            console.log(data.list1.length);
            updatedata(data);
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
				    zoom: 18
				});
				map.setMapTypeId('satellite'); 

				const imgNode = document.getElementById("img"+i);

				imgNode.onload = function () {
				  console.log("image load complete");
				  $("#img"+i).closest(".twentytwenty-container[data-orientation!='vertical']").twentytwenty({default_offset_pct: 0.5});
				  $("#img"+i).closest(".twentytwenty-container[data-orientation='vertical']").twentytwenty({default_offset_pct: 0.5, orientation: 'vertical'});
				  //$("#img"+i).closest(".imageZone3").hide();
				  if(i==17){
					  setTimeout(() => $(".imageZone3").hide(), 100);
				  }
				};
			}


	    }
		
	})//ajax end
}//getAllData() end

let datatemplate = "";

function updatedata(data){
	for(var i=0; i<data.list1.length; i++){
		datatemplate += `
			<div class="col-lg-3">
				<div class="card imageZone">
					<div class="card-header bg-white text-dark header-elements-inline">
						<h6 class="card-title font-weight-semibold">\${data.list2[i].holeName}</h6>
						<div>
							<i class="fas fa-seedling mr-2"></i> 
							<span class="badge badge-success badge-pill"><i class="fas fa-camera mr-2"></i>\${parseFloat(data.list1[i].sensorInfoList[0].ndviDataList[0].ndvi).toFixed(2)}</span>
							<span class="badge badge-success badge-pill"><i class="fas fa-tint mr-2"></i>\${parseFloat(data.list3[i].robotInfoList[0].soilDataList[0].smo).toFixed(2)}<small class="weather-unit">%</small></span>
							<span class="badge badge-success badge-pill"><i class="fas fa-thermometer-half mr-2"></i>\${parseFloat(data.list3[i].robotInfoList[0].soilDataList[0].stp).toFixed(2)}<small class="weather-unit">ºC</small></span>
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
						<div class="btn-group btn-group-toggle mr-2" data-toggle="buttons">
							<label class="btn btn-light active grow" onclick="change(event)">
								<input type="radio" name="layerType\${i}" id="option1" autocomplete="off" checked>
								생육
							</label>
							<label class="btn btn-light temp" onclick="change(event)">
								<input type="radio" name="layerType\${i}" autocomplete="off">
								열
							</label>
							<label class="btn btn-light moisture" onclick="change(event)">
								<input type="radio" name="layerType\${i}" autocomplete="off" >
								습도
							</label>
						</div>
	
						<span class="btn-group mr-2" data-toggle="buttons">
							<button type="button" class="btn btn-light ndvi" onclick="change(event)">NDVI 비교</button>
						</span>
	
						<span class="float-right">
							<button type="button" class="btn btn-primary-100 border-primary text-primary detailreport" value="\${data.list1[i].holeNo}">상세정보</button>
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
	
	
}//updatedata() end

function getChartData(){
	$.ajax({
		url : "/each/getChartDataList",
		success : function(result){
			console.log(result)
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

	console.log(chartData)

	var obj = {};
	obj.name = getDataKrName(type);
	obj.data = [];
	
			
	for(var i=0;i<chartData.length;i++){
		obj.data.push([getTimeStamp(chartData[i].tm)*1,chartData[i][type]*1])
		if(chartData[i][type]==null){
			return;
		}
	}

	console.log(obj)

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


// 상세정보 버튼 클릭 이벤트 핸들러
$('body').on('click', '.detailreport', function() {
	// 버튼의 value 값
	var value = $(this).val();

	// /report/course_report 페이지로 이동합니다.
	location.href = '/report/course_report?value=' + encodeURIComponent(value);
	
});


function change(event){

	var targets = event.target;
	
    if($(targets).hasClass('ndvi')){
    	$(targets).closest('.imageZone').find('.imageZone2').hide();
    	$(targets).closest('.imageZone').find('.imageZone3').show();
    }else if($(targets).hasClass('grow') || $(targets).hasClass('temp') || $(targets).hasClass('moisture')){
    	$(targets).closest('.imageZone').find('.imageZone2').show();
    	$(targets).closest('.imageZone').find('.imageZone3').hide();
    }
	
}//change end




function spread(event){
	
	let id = "";
	let targets = event.target;
	console.log($(targets).closest('.card').attr('id'))
	
    var card = $(targets).closest('.card');
    if (card.hasClass('card-collapsed')) {
        // 카드가 축소된 경우, 클래스 제거 후 내용 표시 
        card.removeClass('card-collapsed');
        card.find('.collapse').collapse('show');
    } else {
        // 그렇지 않은 경우, 클래스를 추가하고 내용을 숨깁니다.
        card.addClass('card-collapsed');
        card.find('.collapse').collapse('hide');
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



</script>
<style>
.chart-container>div{
	height: 150px;
}
</style>