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

$(document).ready(function() {
    // 페이지가 로드될 때 getAllData 함수 호출
   var category = $(".categorybt.active").val();
   getAllData(category);
});

$(".categorybt").click(function() {
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
		//dataType: "json",
		success: function(data){
            console.log(data);
            console.log(data.list1.length);
            updatedata(data);
    		
		},
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    },
	    complete : function(){
	    	$(".twentytwenty-container[data-orientation!='vertical']").twentytwenty({default_offset_pct: 0.5});
			$(".twentytwenty-container[data-orientation='vertical']").twentytwenty({default_offset_pct: 0.5, orientation: 'vertical'});

			
			var newSliderPct = 0.7; // adjust this value to your needs
			$(".twentytwenty-container").each(function(){
			  var container = $(this);
			  container[0].sliderPct = newSliderPct;
			});
			// Trigger the resize event
			$(window).trigger("resize.twentytwenty");
			//$().adjustSlider()
	    }
		
	})//ajax end
}//getAllData() end

let datatemplate = "";

function updatedata(data){
	for(var i=0; i<data.list1.length; i++){
		datatemplate += `
						<div class="col-lg-3">
							<div class="card">
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
									<!--NDVI 비교-->
									<div class="col-xl-12 col-md-12 col-sm-12 p-0 mb-3">
										<div class="twentytwenty-wrapper twentytwenty-horizontal">
											<div class="twentytwenty-container" style="height:200px;">
												<img src="/resources/assets/img/ndvi-1.png" style="height:200px;" class="ndvi-img twentytwenty-before">
												<img src="/resources/assets/img/ndvi-1.png" style="height:200px;" class="ndvi-img twentytwenty-after">
											</div>
										</div>
									</div>
									<!--NDVI 비교 end-->
			
									<div class="btn-group mr-2">
										<button type="button" class="btn btn-light">생육</button>
										<button type="button" class="btn btn-light">열</button>
										<button type="button" class="btn btn-light">습도</button>
									</div>
									<span>
										<button type="button" class="btn btn-light active">NDVI 비교</button>
									</span>
			
									<span class="float-right">
										<button type="button" class="btn btn-primary-100 border-primary text-primary">상세정보</button>
									</span>
			
									<!--Chart card-->
									<div class="card mt-2 mb-0 card-collapsed" style="border:0; box-shadow:none;">	
										<div class="collapse">
											<div class="card-chart">
												<div id="layer-card-chart" class="collapse show" style="">
													<div class="card-body chart-card scrolled">
														<div class="chart-container">
															<div class="chart has-fixed-height" id="line_multiple" style="height: 440px;"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
			
										<div class="list-icons">
											<a class="list-icons-item chart-close" data-action="collapse"></a>
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

</script>
















