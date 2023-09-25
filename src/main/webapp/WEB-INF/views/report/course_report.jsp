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
					<button type="button" class="holebt btn btn-light active" value="1" data-lat="" data-lon="" data-holename="Hole 1">H1</button>
					<button type="button" class="holebt btn btn-light" value="2" data-lat="" data-lon="" data-holename="Hole 2">H2</button>
					<button type="button" class="holebt btn btn-light" value="3" data-lat="" data-lon="" data-holename="Hole 3">H3</button>
					<button type="button" class="holebt btn btn-light" value="4" data-lat="" data-lon="" data-holename="Hole 4">H4</button>
					<button type="button" class="holebt btn btn-light" value="5" data-lat="" data-lon="" data-holename="Hole 5">H5</button>
					<button type="button" class="holebt btn btn-light" value="6" data-lat="" data-lon="" data-holename="Hole 6">H6</button>
					<button type="button" class="holebt btn btn-light" value="7" data-lat="" data-lon="" data-holename="Hole 7">H7</button>
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
			    <table class="table searchresult">
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
		    }
	    });//ajax end
	}//getData end
	
	function updatePage(data) {
		
		if(!data || data.list1.length == 0 || data.list2.length == 0 || data.list3.length == 0 || data.list1.length == 1 || data.list2.length == 1 || data.list3.length == 1){
		    let content = "";
		    
		    content += `
						<!-- Basic card -->
						<div class="card">
							<div class="card-header">
								<h5 class="card-title holename">
									\${data.list4[0].hole_Name}
									<div class="btn-group ml-3">
										<button type="button" class="btn btn-light">생육</button>
										<button type="button" class="btn btn-light">열</button>
										<button type="button" class="btn btn-light">습도</button>
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
											<h6 class="card-title font-weight-bold">차트 보기</h6>
										</div>
				
										<div class="chart-container">
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
				    center: new naver.maps.LatLng(35.591352, 127.902073),
				    zoom: 17
				});

				map.setMapTypeId('satellite'); 
		}else{
			
		    let content = "";
		    
		    content += `
						<!-- Basic card -->
						<div class="card">
							<div class="card-header">
								<h5 class="card-title holename">
									\${data.list4[0].hole_Name}
									<div class="btn-group ml-3">
										<button type="button" class="btn btn-light">생육</button>
										<button type="button" class="btn btn-light">열</button>
										<button type="button" class="btn btn-light">습도</button>
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
											<h6 class="card-title font-weight-bold">차트 보기</h6>
										</div>
				
										<div class="chart-container">
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
		                <td>\${data.list1[i].sensorInfo.sensor_Name}</td>
		                <td>\${data.list1[i].sensorInfo.course_Type}</td>
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
		saveCSV('data.csv')
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