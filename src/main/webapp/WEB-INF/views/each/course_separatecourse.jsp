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
					<button type="button" class="btn btn-light">관리순위</button>
					<button type="button" class="btn btn-light active">오름차순</button>
					<button type="button" class="btn btn-light">내림차순</button>
				</div>
				<div class="btn-group mr-2">
					<button type="button" class="categorybt btn btn-light active" value="FAIRWAY">Fairway</button>
					<button type="button" class="categorybt btn btn-light" value="GREEN">Green</button>
				</div>
				<h6 class="mr-2 mt-1 font-weight-bold float-right">Update : 2023.08.16 11:12</h6>
				
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
   getAllData(category);
   
	// 상세정보 버튼 클릭 이벤트 핸들러
	 $('body').on('click', '.detailreport', function() {
		// 버튼의 value 값
		var value = $(this).val();
	
		// /report/course_report 페이지로 이동합니다.
		location.href = '/report/course_report?value=' + encodeURIComponent(value);
		
	});
});


$(".categorybt").click(function() {
	datatemplate = "";
	$('.row.data').empty();
	var category = $(this).val();
	$(".categorybt").removeClass("active");
	$(this).addClass("active");
	getAllData(category);
    console.log(category);
});


function getAllData(category){
	$.ajax({
		url: '/each/course_separatecourse_ajax',
		type:'GET',
        data: {category: category},
		dataType: "json",
		success: function(data){
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
	    complete : function(){
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
			
			
			for(let i=0;i<holeCount;i++){
				var map = new naver.maps.Map('map'+i, {
				    center: new naver.maps.LatLng(35.59619903564453, 127.90499877929688),
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
						<h6 class="card-title font-weight-semibold">\${data.list2[i].hole_Name}</h6>
						<div>
							<i class="fas fa-seedling mr-2"></i> 
							<span class="badge badge-success badge-pill"><i class="fas fa-camera mr-2"></i>\${parseFloat(data.list1[i].sensorInfoList[0].ndviDataList[0].ndvi).toFixed(2)}</span>
							<span class="badge badge-warning badge-pill"><i class="fas fa-tint mr-2"></i>\${parseFloat(data.list3[i].robotInfoList[0].soilDataList[0].smo).toFixed(2)}<small class="weather-unit">%</small></span>
							<span class="badge badge-pink badge-pill"><i class="fas fa-thermometer-half mr-2"></i>\${parseFloat(data.list3[i].robotInfoList[0].soilDataList[0].stp).toFixed(2)}<small class="weather-unit">ºC</small></span>
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
						<div class="btn-group mr-2">
							<button type="button" class="btn btn-light active grow" onclick="change(event)">생육</button>
							<button type="button" class="btn btn-light temp" onclick="change(event)">열</button>
							<button type="button" class="btn btn-light moisture" onclick="change(event)">습도</button>
						</div>
	
						<span class="btn-group mr-2">
							<button type="button" class="btn btn-light ndvi" onclick="change(event)">NDVI 비교</button>
						</span>
	
						<span class="float-right">
							<button type="button" class="btn btn-primary-100 border-primary text-primary detailreport" value="\${data.list1[i].hole_No}">상세정보</button>
						</span>
	
						<!--Chart card-->
						<div class="card mt-2 mb-0 card-collapsed" id = "chartstart" style="border:0; box-shadow:none;">	
							<div class="collapse">
								<div class="card-chart">
									<div id="layer-card-chart" class="collapse show" style="">
										<div class="card-body chart-card scrolled">
											<div class="chart-container">
												<div class="chart has-fixed-height" id="line_multiple2" style="height: 440px; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;" _echarts_instance_="ec_1694754372287">
													<div style="position: relative; width: 150px; height: 440px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
														<canvas data-zr-dom-id="zr_0" width="187" height="550" style="position: absolute; left: 0px; top: 0px; width: 150px; height: 440px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
													</div>
													<div style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(0, 0, 0, 0.75); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 13px / 20px &quot;Noto Sans KR&quot;; padding: 10px 15px; left: 278px; top: 131px; pointer-events: none;">
														Jan<br>
														<span class="badge badge-mark mr-2" style="border-color: #f17a52"></span>Limitless: 63 sales<br><span class="badge badge-mark mr-2" style="border-color: #03A9F4"></span>Londinium: 60 sales
													</div>
												</div>
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


</script>
















