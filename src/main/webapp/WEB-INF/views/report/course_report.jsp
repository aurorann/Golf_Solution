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
				<div class="btn-group mr-2">
					<button type="button" class="holebt btn btn-light active" value="01" data-lat="" data-lon="" data-holename="Hole 1">H1</button>
					<button type="button" class="holebt btn btn-light" value="02" data-lat="" data-lon="" data-holename="Hole 2">H2</button>
					<button type="button" class="holebt btn btn-light" value="03" data-lat="" data-lon="" data-holename="Hole 3">H3</button>
					<button type="button" class="holebt btn btn-light" value="04" data-lat="" data-lon="" data-holename="Hole 4">H4</button>
					<button type="button" class="holebt btn btn-light" value="05" data-lat="" data-lon="" data-holename="Hole 5">H5</button>
					<button type="button" class="holebt btn btn-light" value="06" data-lat="" data-lon="" data-holename="Hole 6">H6</button>
					<button type="button" class="holebt btn btn-light" value="07" data-lat="" data-lon="" data-holename="Hole 7">H7</button>
					<button type="button" class="holebt btn btn-light" value="06" data-lat="" data-lon="" data-holename="Hole 8">H8</button>
					<button type="button" class="holebt btn btn-light" value="07" data-lat="" data-lon="" data-holename="Hole 9">H9</button>
				</div>

				<div class="btn-group mr-2">
					<button type="button" class="categorybt btn btn-light active" value="FAIRWAY">Fairway</button>
					<button type="button" class="categorybt btn btn-light" value="GREEN">Green</button>
				</div>

				<div class="float-right">
					<button type="button" class="btn sidebar-control sidebar-right-toggle">
						<i class="fas fa-align-justify"></i>
					</button>
				</div>

                 <div class="float-right mr-2">
                     <div class="input-group">
                         <span class="input-group-prepend">
                             <span class="input-group-text"><i class="icon-calendar22"></i></span>
                         </span>
                         <input type="date" class="form-control currentDate" id="currentDate"> 
                         <button type="button" class="ml-2 btn btn-primary searchDate">검색</button>
                         <div class="btn-group ml-4">
                             <button type="button" class="btn btn-light beforeday"><i class="icon-arrow-left12"></i></button>
                             <button type="button" class="btn btn-light nextday"><i class="icon-arrow-right13"></i></button>
                         </div>
                         <button type="button" class="ml-2 btn btn-teal today">오늘</button>
                     </div>
                 </div>

			</div>
		</div>
	</div>
	<!-- /page header -->

	<!-- Content area -->
	<div class="content contentdata">

	</div>
	
</div>
<!-- /main content -->


<div class="sidebar sidebar-light sidebar-right sidebar-expand-lg sidebar-collapsed">


	<!-- Sidebar content -->
	<div class="sidebar-content">

		<!-- Header -->
		<div class="sidebar-section sidebar-section-body d-flex align-items-center">
			<h5 class="mb-0 font-weight-bold">데이터 검색</h5>
		</div>
		<!-- /header -->


		<!-- Sidebar search -->
		<div class="sidebar-section">
			<ul class="nav nav-sidebar" data-nav-type="accordion">
				<li class="nav-item-header">코스</li>
				<li class="nav-item text-center pl-2 pr-2">
					<div class="form-group row">
					    <div class="col-lg-12">
					        <select class="custom-select">
					            <option value="0">전체코스</option>
								<c:forEach items="${list}" var="holename">
					            	<option value="${holename.holeNo}"><c:out value="${holename.holeName}"></c:out></option>
					            </c:forEach>
					        </select>
					    </div>
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
						<input type="text" class="form-control daterange-basic search-daterange" value=""> 
					</div>
				</li>
			</ul>

			<ul class="nav nav-sidebar my-2" >
				<li class="nav-item pl-3 pr-3">
					<button type="button" class="btn btn-primary btn-block search">검색하기<i class="icon-search4 ml-2"></i></button>
				</li>
			</ul>

			<div class="table-responsive table-scrollable pl-2 pr-2">
			    <table class="table searchresult" id="searchresult">
			        <thead>
			            <tr>
			                <th class="table-info">날짜</th>
			                <th class="table-info">센서명</th>
			                <th class="table-info">코스</th>
			                <th class="table-info">온도</th>
			                <th class="table-info">습도</th>
			                <th class="table-info">토양온도</th>
			                <th class="table-info">토양수분</th>
			            </tr>
			        </thead>
			        <tbody>
			
			        </tbody>
			    </table>
			</div>
				
			<button type="button" class="mt-2 ml-2 btn btn-secondary csvdownload">파일 저장</button>
			
		</div>
		<!-- /sidebar search -->

	</div>
	<!-- /sidebar content -->

</div>


<script>
		
	//전역 변수 선언
	var selectDateStr, selectDate, beforeDateStr, beforeDate;
	var nowLayerType = "ndvi";
	var chartList = [];
	var overLayList = [];
	
	$(document).ready(function() {
	    // URL의 쿼리 문자열에서 value 값 가져오기
	    var urlParams = new URLSearchParams(window.location.search);
	    var value = urlParams.get('value');
	
	    updateDates(0);
	    console.log("페이지 로딩시 기준 : " + selectDate);
	    console.log("페이지 로딩시 전날 : " + beforeDate);
	
	    //페이지 다이렉트 진입시와 개별코스에서 상세정보로 진입할때의 데이터 값 접근
	    if(value != null){
	    	$(".holebt").removeClass("active");
	        $('.holebt[value="' + value + '"]').addClass('active');
	        var category = $(".categorybt.active").val();
	        getData(value, category, selectDate, beforeDate);
	    }else{
	        var hole = $(".holebt.active").val();
	        var category = $(".categorybt.active").val();
	        getData(hole, category, selectDate, beforeDate);
	    }

	});
	
	//날짜 셋팅
	function updateDates(days){
	    //1.날짜 INPUT의 날짜를 가져온다.
	    selectDateStr = $('.currentDate').val();//날짜는 String
	    selectDate = new Date(selectDateStr);//날짜를 data로 변형
	    selectDate.setDate(selectDate.getDate() + days);
	    selectDateStr = selectDate.toISOString().split('T')[0]; //기준날짜-1일을 String으로 저장. selectDate 변수에 저장
	    selectDate = selectDateStr.concat(' 23:59:59')
	    $('.currentDate').val(selectDateStr) // currentDate의 값을 다시 정의한다
	
	    beforeDate = new Date(selectDateStr);
	    beforeDate.setDate(beforeDate.getDate() - 1);
	    beforeDateStr = beforeDate.toISOString().split('T')[0]; //String으로 저장. beforeDate 변수에 저장
	    beforeDate = beforeDateStr.concat(' 00:00:00')
	
	    console.log("기준 : " + selectDate);
	    console.log("전날 : " + beforeDate);
	}
	
	var todayStr = new Date().toISOString().substring(0, 10);
	
	//2-1.뒤버튼 클릭시 기준날짜를 1일 빼기
	$(".beforeday").click(function(){
	    updateDates(-1);
        var hole = $(".holebt.active").val();
        var category = $(".categorybt.active").val();
        getData(hole, category, selectDate, beforeDate);	
	})
	
	//2-2.앞버튼 클릭시 기준날짜를 1일 더하기
	$(".nextday").click(function(){
	    updateDates(1);
	    
		if(selectDateStr > todayStr){
			alert("해당 날짜에 데이터가 없습니다");
			$('.currentDate').val(todayStr)
		}else{
	        var hole = $(".holebt.active").val();
	        var category = $(".categorybt.active").val();
	        getData(hole, category, selectDate, beforeDate);	
		}//if end
	})
	
	//2-3.오늘버튼 클릭시 기준날짜를 오늘로
	$(".today").click(function(){
	    selectDateStr = new Date().toISOString().substring(0, 10);//날짜는 String
	    //alert(selectDateStr)
	    selectDate = new Date(selectDateStr);//날짜를 data로 변형
	    selectDate.setDate(selectDate.getDate());
	    selectDateStr = selectDate.toISOString().split('T')[0]; //기준날짜-1일을 String으로 저장. selectDate 변수에 저장
	    selectDate = selectDateStr.concat(' 23:59:59')
	    $('.currentDate').val(selectDateStr) // currentDate의 값을 다시 정의한다
	
	    beforeDate = new Date(selectDateStr);
	    beforeDate.setDate(beforeDate.getDate() - 1);
	    beforeDateStr = beforeDate.toISOString().split('T')[0]; //String으로 저장. beforeDate 변수에 저장
	    beforeDate = beforeDateStr.concat(' 00:00:00')
	    
	    console.log("기준 : " + selectDate);
	    console.log("전날 : " + beforeDate);
	    
	    
        var hole = $(".holebt.active").val();
        var category = $(".categorybt.active").val();
        getData(hole, category, selectDate, beforeDate);	
	})
	
	//3.검색버튼을 클릭시켜 데이터를 갱신한다.
	$(".searchDate").click(function(){
		updateDates(0);
		
		if(selectDateStr > todayStr){
			alert("더 이상의 데이터는 없습니다");
			$('.currentDate').val(todayStr)
		}else{
	        var hole = $(".holebt.active").val();
	        var category = $(".categorybt.active").val();
	        //alert("기준 : " + selectDate + " 전날 : " + beforeDate)
	        getData(hole, category, selectDate, beforeDate);		
		}//if end
	})


	
	$(".holebt").click(function() {
	    var hole = $(this).val();
	    $(".holebt").removeClass("active");
	    $(this).addClass("active");
	    getData(hole, $(".categorybt.active").val(), selectDate, beforeDate);
	});
	
	$(".categorybt").click(function() {
	    var category = $(this).val();
	    $(".categorybt").removeClass("active");
	    $(this).addClass("active");
	    getData($(".holebt.active").val(), category, selectDate, beforeDate);
	});

	$(document).on('click','#layerType label',function(){
		var layerType = $(this).data('layertype');
		
		nowLayerType = layerType;

		clearGroundOverlay();

    	var result = getLayerData($(".holebt.active").val(),$(".categorybt.active").val(),selectDate,beforeDate,layerType)

		$.each(result,function(index,item){
			if(index==result.length-1){
				createGroundOverlay(item.startLat,item.startLon,item.endLat,item.endLon,item.layerPath,item.tm,index)
			}
		})
	})
	
	
	function getData(hole, category, selectDate, beforeDate){
	    $.ajax({
	        url: '/report/course_report_ajax',
	        type: 'GET',
	        data: {hole: hole, category: category, selectDate: selectDate, beforeDate: beforeDate},
	        dataType: "json",
	        success: function(data) {
	            updatePage(data);
	            console.log(data);
	            //console.log(data.list1);
	            //console.log(data.list1[0].weatherData.temp);
	        },
		    error: function(jqXHR, textStatus, errorThrown) {
		        alert(jqXHR.status);
		        alert(jqXHR.statusText);
		        alert(jqXHR.responseText);
		        alert(jqXHR.readyState);
		    },
		    complete : function(){
		    	updateChart(hole,category,selectDate,beforeDate)
		    	var result = getLayerData(hole,category,selectDate,beforeDate,"NDVI")

				$.each(result,function(index,item){
					if(index==result.length-1){
						createGroundOverlay(item.startLat,item.startLon,item.endLat,item.endLon,item.layerPath,item.tm,index)
					}
				})
			}
	    });//ajax end
	}//getData end

    let currentPair = 0;
    const pairs = [
        ['#ndviChart', '#tempChart'],
        ['#humiChart', '#wsChart'],
        ['#lightChart', '#rainChart'],
        ['#solarChart', '#smoChart'],
        ['#secChart', '#stpChart']
    ];

	function updateChart(hole, category, selectDate, beforeDate){

		$('#chartZone').empty();
		
		type = "NDVI"
		
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
			holeNo : hole,
			courseType : category,
			type : type,
			startDate : beforeDate,
			endDate : selectDate
		}

		var dataTypeList = getDataTypeList("NDVI");
		setChartLayer(dataTypeList)
		$.ajax({
			url : "/all/getChartData",
			data : param,
			async : false,
			success : function(chartData){
				for(var i=0;i<dataTypeList.length;i++){
					drawChart(dataTypeList[i],chartData);
				}
			}
		})

		param.type ="weather"
		var dataTypeList = getDataTypeList("기상정보");
		setChartLayer(dataTypeList)
		$.ajax({
			url : "/all/getChartData",
			data : param,
			async : false,
			success : function(chartData){
				for(var i=0;i<dataTypeList.length;i++){
					drawChart(dataTypeList[i],chartData);
				}
			}
		})

		param.type ="soil"
		var dataTypeList = getDataTypeList("토양정보");
		setChartLayer(dataTypeList)
		$.ajax({
			url : "/all/getChartData",
			data : param,
			async : false,
			success : function(chartData){
				for(var i=0;i<dataTypeList.length;i++){
					drawChart(dataTypeList[i],chartData);
				}
			}
		})

		for(var i=2;i<10;i++){
			$('#chartZone>div:eq('+i+')').hide()
		}

		currentPair = 0;
	}

	$(document).on('click','#prevChart',function(){
        $(pairs[currentPair].join(', ')).toggle();
        currentPair = (currentPair - 1) % pairs.length;
        $(pairs[currentPair].join(', ')).toggle();
	})
	
	$(document).on('click','#nextChart',function(){
        $(pairs[currentPair].join(', ')).toggle();
        currentPair = (currentPair + 1) % pairs.length;
        $(pairs[currentPair].join(', ')).toggle();
	})
	
	function updatePage(data) {
		
		if(!data || data.list1.length == 0 || data.list2.length == 0 || data.list3.length == 0 || data.list1.length == 1 || data.list2.length == 1 || data.list3.length == 1){
		    let content = "";
		    
		    content += `
						<!-- Basic card -->
						<div class="card">
							<div class="card-header">
								<h5 class="card-title holename">
									\${data.list4[0].holeName}
									<div class="btn-group btn-group-toggle ml-3" data-toggle="buttons" id="layerType">
										<label class="btn btn-light active" data-layertype="NDVI">
											<input type="radio" name="layerType${i}" autocomplete="off" >
											생육
										</label>
										<label class="btn btn-light" data-layertype="TEMP">
											<input type="radio" name="layerType${i}" autocomplete="off" >
											열
										</label>
										<label class="btn btn-light" data-layertype="HUMI">
											<input type="radio" name="layerType${i}" autocomplete="off" >
											습도
										</label>
									</div>
									<small class="mr-2 mt-1 font-weight-bold float-right">Update : ` + formatDate(new Date()) + `</small>
								</h5>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-3">
										<div id="map" style="height: 350px;"></div>
									</div>
				
				                    <div class="col-lg-9">
				                        <div class="row">
				                            <!--NDVI-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">NDVI</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + beforeDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + selectDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="ndvi_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_ndvi"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--NDVI end-->
				
				                            <!--토양수분-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">토양수분</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
			                                                        <span class="text-secondary">` + beforeDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + selectDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="smo_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_smo"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--토양수분 end-->
				
				                            <!--토양온도-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">토양온도</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + beforeDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + selectDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="stp_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_stp"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--토양온도 end-->
				
				                            <!--토양양분-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">토양양분</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + beforeDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + selectDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="sec_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_sec"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--토양양분 end-->
				
				                            <!--기온-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">기온</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + beforeDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + selectDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="temp_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_temp"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--기온 end-->
				
				                            <!--강수량-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">강수량</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + beforeDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + selectDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="rain_data"></small></strong>
				                                                    <i class="textarrowcolor_rain"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--강수량 end-->
				
				                            <!--풍향-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">풍향</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + beforeDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6 mb-4">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + selectDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--풍향 end-->
				
				                            <!--풍속-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">풍속</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + beforeDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + selectDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="ws_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_ws"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--풍속 end-->
				
				                            <!--습도-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">습도</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + beforeDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + selectDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="humi_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_humi"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--습도 end-->
				
				                            <!--일조-->
				                            <div class="col-lg-6">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">일조</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + beforeDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">` + selectDateStr + `</span>
				                                                        <h2 class="mb-0 font-weight-semibold">-</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="solar_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_solar"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--일조 end-->
				
				                        </div>
				                    </div>
				
				
									<div class="col-lg-12">
										<div class="card-header">
											<h6 class="card-title font-weight-bold">차트 보기
											<div class="btn-group ml-4">
			                                    <button type="button" class="btn btn-light" id="prevChart"><i class="icon-arrow-left12"></i></button>
			                                    <button type="button" class="btn btn-light" id="nextChart"><i class="icon-arrow-right13"></i></button>
			                                </div>
											</h6>
										</div>
				
										<div class="chart-container row" id="chartZone">
											<div class="chart has-fixed-height" id="line_multiple" style="height: 440px;"></div>
										</div>
									</div>
				
								</div>
				
				
							</div>
						</div>
						`

				let dataElement = document.querySelector('.contentdata');
				dataElement.innerHTML = content;

				map = new naver.maps.Map('map', {
				    center: new naver.maps.LatLng(37.0455041, 127.3907905),
				    zoom: 15
				});

				map.setMapTypeId('satellite'); 
		}else{
			
		    let content = "";
		    
		    content += `
						<!-- Basic card -->
						<div class="card">
							<div class="card-header">
								<h5 class="card-title holename">
									\${data.list4[0].holeName}
									<div class="btn-group ml-3" data-toggle="buttons" id="layerType">
										<button type="button" class="btn btn-light" data-layertype="NDVI">생육</button>
										<button type="button" class="btn btn-light" data-layertype="TEMP">열</button>
										<button type="button" class="btn btn-light" data-layertype="HUMI">습도</button>
									</div>
									<small class="mr-2 mt-1 font-weight-bold float-right">Update : ` + formatDate(new Date()) + `</small>
								</h5>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-3">
										<div id="map" style="height: 350px;"></div>
									</div>
				
				                    <div class="col-lg-9">
				                        <div class="row">
				                            <!--NDVI-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">NDVI</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list2[1].ndviData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${Number(data.list2[1].ndviData.ndvi.toFixed(3))}</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list2[0].ndviData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${Number(data.list2[0].ndviData.ndvi.toFixed(3))}</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="ndvi_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_ndvi"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--NDVI end-->
				
				                            <!--토양수분-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">토양수분</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list3[1].soilData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${Number(data.list3[1].soilData.smo.toFixed(3))}</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list3[0].soilData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${Number(data.list3[0].soilData.smo.toFixed(3))}</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="smo_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_smo"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--토양수분 end-->
				
				                            <!--토양온도-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">토양온도</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list3[1].soilData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${Number(data.list3[1].soilData.stp.toFixed(3))}</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list3[0].soilData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${Number(data.list3[0].soilData.stp.toFixed(3))}</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="stp_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_stp"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--토양온도 end-->
				
				                            <!--토양양분-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">토양양분</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list3[1].soilData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${Number(data.list3[1].soilData.sec.toFixed(3))}</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list3[0].soilData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${Number(data.list3[0].soilData.sec.toFixed(3))}</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="sec_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_sec"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--토양양분 end-->
				
				                            <!--기온-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">기온</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list1[1].weatherData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${data.list1[1].weatherData.temp}</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list1[0].weatherData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${data.list1[0].weatherData.temp}</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="temp_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_temp"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--기온 end-->
				
				                            <!--강수량-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">강수량</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list1[1].weatherData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${data.list1[1].weatherData.rain}</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list1[0].weatherData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${data.list1[0].weatherData.rain}</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="rain_data"></small></strong>
				                                                    <i class="textarrowcolor_rain"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--강수량 end-->
				
				                            <!--풍향-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">풍향</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list1[1].weatherData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${data.list1[1].weatherData.wd}</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6 mb-4">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list1[0].weatherData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${data.list1[0].weatherData.wd}</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--풍향 end-->
				
				                            <!--풍속-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">풍속</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list1[1].weatherData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${data.list1[1].weatherData.ws}</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list1[0].weatherData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${data.list1[0].weatherData.ws}</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="ws_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_ws"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--풍속 end-->
				
				                            <!--습도-->
				                            <div class="col-lg-2">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">습도</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list1[1].weatherData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${data.list1[1].weatherData.humi}</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list1[0].weatherData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${data.list1[0].weatherData.humi}</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="humi_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_humi"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--습도 end-->
				
				                            <!--일조-->
				                            <div class="col-lg-6">
				                                <div class="card border-top-success rounded-top-0">
				                                    <div class="card-header">
				                                        <h6 class="card-title font-weight-bold">일조</h6>
				                                    </div>
				                                    <div class="card-body">
				                                        <div class="row">
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list1[1].weatherData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${data.list1[1].weatherData.solar}</h2>
				                                                        <div class="font-size-sm text-muted">전날</div>
				                                                    </div>
				                                                    
				                                                </div>
				                                            </div>
				                                            <div class="col-lg-6">
				                                                <div class="row">
				                                                    <div class="col-lg-12 text-center p-0">
				                                                        <span class="text-secondary">\${data.list1[0].weatherData.tm.substring(0, 10)}</span>
				                                                        <h2 class="mb-0 font-weight-semibold">\${data.list1[0].weatherData.solar}</h2>
				                                                        <div class="font-size-sm text-muted">기준</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                            <div class="mt-2 mb-0 col-lg-12 text-center">
				                                                <div class="">전날보다 <strong class="solar_data"><small class="weather-unit">%</small></strong>
				                                                    <i class="textarrowcolor_solar"></i>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <!--일조 end-->
				
				                        </div>
				                    </div>
				
				
									<div class="col-lg-12">
										<div class="card-header">
											<h6 class="card-title font-weight-bold">차트 보기
											<div class="btn-group ml-4">
			                                    <button type="button" class="btn btn-light" id="prevChart"><i class="icon-arrow-left12"></i></button>
			                                    <button type="button" class="btn btn-light" id="nextChart"><i class="icon-arrow-right13"></i></button>
			                                </div>
											</h6>
										</div>
				
										<div class="chart-container row" id="chartZone">
											<div class="chart has-fixed-height" id="line_multiple" style="height: 420px;"></div>
										</div>
									</div>
				
								</div>
				
				
							</div>
						</div>
						`

				let dataElement = document.querySelector('.contentdata');
				dataElement.innerHTML = content;

				map = new naver.maps.Map('map', {
				    center: new naver.maps.LatLng(35.591352, 127.902073),
				    zoom: 17
				});

				map.setMapTypeId('satellite'); 
				
				//NDVI 데이터
				var ndvi_today = Number(data.list2[0].ndviData.ndvi.toFixed(3));
				var ndvi_yesterday = Number(data.list2[1].ndviData.ndvi.toFixed(3));
				
				difference(ndvi_today, ndvi_yesterday, ".ndvi_data", ".textarrowcolor_ndvi");
				
				   
				//토양수분 데이터
				var smo_today = Number(data.list3[0].soilData.smo.toFixed(3));
				var smo_yesterday = Number(data.list3[1].soilData.smo.toFixed(3));
				   
				difference(smo_today, smo_yesterday, ".smo_data", ".textarrowcolor_smo");
				
				   
				//토양온도 데이터
				var stp_today = Number(data.list3[0].soilData.stp.toFixed(3));
				var stp_yesterday = Number(data.list3[1].soilData.stp.toFixed(3));
				    
				difference(stp_today, stp_yesterday, ".stp_data", ".textarrowcolor_stp");
				
				   
				//토양양분 데이터
				var sec_today = Number(data.list3[0].soilData.sec.toFixed(3));
				var sec_yesterday = Number(data.list3[1].soilData.sec.toFixed(3));
					    
				difference(sec_today, sec_yesterday, ".sec_data", ".textarrowcolor_sec");
				
				
				//기온 데이터
				var temp_today = data.list1[0].weatherData.temp;
				var temp_yesterday = data.list1[1].weatherData.temp;
				
				difference(temp_today, temp_yesterday, ".temp_data", ".textarrowcolor_temp");
				
				
				//풍속 데이터
				var ws_today = data.list1[0].weatherData.ws;
				var ws_yesterday = data.list1[1].weatherData.ws;
				
				difference(ws_today, ws_yesterday, ".ws_data", ".textarrowcolor_ws");
				
				
				//습도 데이터
				var humi_today = data.list1[0].weatherData.humi;
				var humi_yesterday = data.list1[1].weatherData.humi;
				
				difference(humi_today, humi_yesterday, ".humi_data", ".textarrowcolor_humi");
				
				
				//강수량 데이터
				var rain_today = data.list1[0].weatherData.rain;
				var rain_yesterday = data.list1[1].weatherData.rain;
				
				difference(rain_today, rain_yesterday, ".rain_data", ".textarrowcolor_rain");
				
				
				//일조 데이터
				var solar_today = data.list1[0].weatherData.solar;
				var solar_yesterday = data.list1[1].weatherData.solar;
				
				difference(solar_today, solar_yesterday, ".solar_data", ".textarrowcolor_solar");

						
		}//if end
	

    	console.log(data)
		/*
		var chartData = getChartData(hole,course,nowDataType);
		var dataTypeList = getDataTypeList(nowDataType);

		setChartLayer(dataTypeList);

		
		for(var i=0;i<dataTypeList.length;i++){
			drawChart(dataTypeList[i],chartData);
		}*/
	}

	function getLayerData(hole, category, selectDate, beforeDate,nowLayerType){
		let retData = null;

		let param = {
			holeNo : hole,
			courseType : category,
			layerType : nowLayerType,
			startDate : beforeDate,
			endDate : selectDate
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

	function clearGroundOverlay(){
		
		for(var i=0;i<overLayList.length;i++){
			overLayList[i].setMap(null)
		}

		overLayList = [];
	}

	function showGroundOverlay(idx){
		overLayList[idx].setMap(map);
		$("#overlayList .overlayBtn").removeClass('nowOver')
		$("#overlayList [data-idx='"+idx+"']").addClass('nowOver')
	}

	function createGroundOverlay(startLat,startLon,endLat,endLon,path,tm,idx){
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

	function setChartLayer(dataTypeList){
		//$('#chartZone').empty();
		
		for(var i=0;i<dataTypeList.length;i++){
			$('#chartZone').append("<div class='col-lg-6' id='"+dataTypeList[i]+"Chart'></div>");
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

		console.log(chartData)

		var obj = {};
		obj.name = getDataKrName(type);
		obj.data = [];
		
				
		for(var i=0;i<chartData.length;i++){
			obj.data.push([chartData[i].tm*1,chartData[i][type]*1])
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
				x : 0,
				verticalAlign : 'top',
				y : 10,
				floating : true,
				backgroundColor : (Highcharts.theme && Highcharts.theme.legendBackgroundColor)
						|| '#FFFFFF'
			},
			series : [obj]
		};

		chart = new Highcharts.Chart(options);

		chartList.push(chart)
	}
	
	function difference(today, yesterday, element, arrowElement) {
	    var difference = today - yesterday;
	    $(element).text(difference.toFixed(2));
	    //console.log($(arrowElement).length)
	    if (difference > 0) {
	        $(arrowElement).removeClass("icon-arrow-down132 text-danger").addClass("icon-arrow-up13 text-primary");
	    } else if (difference < 0) {
	        $(arrowElement).removeClass("icon-arrow-up13 text-primary").addClass("icon-arrow-down132 text-danger");
	    }
	}
	
	
	
	$(".search").click(function() {
	
		var holeNo = $('.custom-select').val(); // 선택된 옵션의 value 값
		var dataRange = $('.search-daterange').val().split(' ~ '); // 작업날짜 - 빼기
		console.log(dataRange);
		var workStart = dataRange[0].concat(' 00:00:00'); // 작업시작날짜
		console.log(workStart)
		var workEnd = dataRange[1].concat(' 23:59:59'); // 작업종료날짜
		console.log(workEnd)

		
		if(holeNo==0){
			$.ajax({
		        url: '/report/course_report_allsearch_ajax',
		        type: 'GET',
		        data: {workStart: workStart, workEnd: workEnd},
		        dataType: "json",
		        success: function(data) {
		            console.log(data);
		            searchResult(data);
		        },
			    error: function(jqXHR, textStatus, errorThrown) {
			        alert(jqXHR.status);
			        alert(jqXHR.statusText);
			        alert(jqXHR.responseText);
			        alert(jqXHR.readyState);
			    }
		    });//ajax end
		}else{
			$.ajax({
		        url: '/report/course_report_search_ajax',
		        type: 'GET',
		        data: {holeNo: holeNo, workStart: workStart, workEnd: workEnd},
		        dataType: "json",
		        success: function(data) {
		            console.log(data);
		            searchResult(data);
		        },
			    error: function(jqXHR, textStatus, errorThrown) {
			        alert(jqXHR.status);
			        alert(jqXHR.statusText);
			        alert(jqXHR.responseText);
			        alert(jqXHR.readyState);
			    }
		    });//ajax end
		}//if() end

	});
	
    //검색 결과 테이블 추가
	function searchResult(data){
		let result = "";
		//alert(Object.keys(data).length)
		//alert(data.list1.length)
		//console.log(typeof data)
		if(!data|| data.list1.length == 0 || data.list2.length == 0){
			result += `
	            <tr>
	                <td colspan="7" style="text-align: center;">해당 데이터가 없습니다</td>
	            </tr>
	        `
		}else{
			for(var i=0; i<data.list2.length; i++){
				result += `
		            <tr>
		                <td>\${data.list1[i].weatherData.tm}</td>
		                <td>\${data.list1[i].sensorInfo.sensorName}</td>
		                <td>\${data.list1[i].sensorInfo.courseType}</td>
		                <td>\${data.list1[i].weatherData.temp}</td>
		                <td>\${data.list1[i].weatherData.humi}</td>
		                <td>\${data.list2[i].soilData.stp}</td>
		                <td>\${data.list2[i].soilData.smo}</td>
		            </tr>
		        `
		    }//for() end
		}//if() end
		let dataElement = document.querySelector('.searchresult tbody');
		dataElement.innerHTML = result;
	}
    
    
	$(".csvdownload").click(function() {
		//saveCSV('data.csv')
		saveCSV2()
	    return false;
	})
    
    
    
	//CSV 생성 함수
	function saveCSV(fileName){
		let csv = '';
		let rows = document.querySelectorAll("tbody tr"); 
	
		for (var i = 0; i < rows.length; i++) {
			let cells = rows[i].querySelectorAll("td");
			let row = [];
			cells.forEach(function(cell){
				row.push(cell.textContent);
			});
	
			csv += row.join(',') + (i != rows.length-1 ? '\n':''); 
		}
	
		let csvFile = new Blob([csv], {type: "text/csv"}); 
		let downLink = document.createElement('a');
		downLink.href = window.URL.createObjectURL(csvFile); 
		downLink.download = fileName; 
		downLink.click();
	}

	function saveCSV2() {
	    let table = document.getElementById('searchresult');
	    let csv = [];
	    
	    for(let row of table.rows) {
	        let rowData = [];
	        for(let cell of row.cells) {
	            // 셀의 데이터를 가져와서 콤마(,)와 쌍따옴표(")로 감싸줍니다.
	        	rowData.push(`"\${(cell.innerText || "").replace(/"/g, '""')}"`);
	        }
	        csv.push(rowData.join(','));
	    }
	    
	    // CSV 형식으로 변환
	    let csvString = csv.join('\n');

	    // UTF-8 BOM 추가
	    let BOM = "\uFEFF";
	    csvString = BOM + csvString;
	    
	    // 다운로드 링크 생성
	    let blob = new Blob([csvString], { type: 'text/csv' });
	    let url = URL.createObjectURL(blob);
	    
	    let a = document.createElement('a');
	    a.href = url;
	    a.download = 'table.csv';
	    a.click();
	    
	    URL.revokeObjectURL(url);
	}
    
    
    
	//달력 오늘날짜 설정
    document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
    
	//현재 날짜 yyyy-mm-dd hh:mm으로 표출
    function formatDate(date) {
   	  var yyyy = date.getFullYear();
   	  var mm = String(date.getMonth() + 1).padStart(2, '0'); // Months are 0-based, so we add 1
   	  var dd = String(date.getDate()).padStart(2, '0');
   	  var hh = String(date.getHours()).padStart(2, '0');
   	  var min = String(date.getMinutes()).padStart(2, '0');

   	  return yyyy + '-' + mm + '-' + dd + ' ' + hh + ':' + min;
   	}
	



</script>
<style>
<!--
#chartZone > div{
	height: 330px;
}
-->
</style>