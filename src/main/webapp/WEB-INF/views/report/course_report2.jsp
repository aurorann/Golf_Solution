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
					<button type="button" class="holebt btn btn-light" value="0">전체</button>
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

				<div class="float-right mr-2">
					<div class="input-group">
						<span class="input-group-prepend"> <span class="input-group-text"><i class="icon-calendar22"></i></span>
						</span> <input type="text" class="form-control daterange-basic" value="">
						<button type="button" class="ml-2 btn btn-primary">검색</button>
						<div class="btn-group ml-4">
							<button type="button" class="btn btn-light">
								<i class="icon-arrow-left12"></i>
							</button>
							<button type="button" class="btn btn-light">
								<i class="icon-arrow-right13"></i>
							</button>
						</div>
						<button type="button" class="ml-2 btn btn-teal">오늘</button>

					</div>


				</div>

			</div>
		</div>
	</div>
	<!-- /page header -->


	<!-- Content area -->
	<div class="content">
		<!-- Basic card -->
		<div class="card">
			<div class="card-header">
				<h5 class="card-title holename">
					<!-- HOLE 이름 -->
					<div class="btn-group ml-3">
						<button type="button" class="btn btn-light">생육</button>
						<button type="button" class="btn btn-light">열</button>
						<button type="button" class="btn btn-light">습도</button>
					</div>
					<small class="mr-2 mt-1 font-weight-bold float-right">Update : 2023.08.16 11:12</small>
				</h5>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-lg-3">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11124.634462768941!2d127.8932198328219!3d35.58989843099262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356fa1a0b8e4ab75%3A0x6cb5878cba1e3d20!2z7YG065-965SUIOqxsOywvQ!5e1!3m2!1sko!2skr!4v1693789715832!5m2!1sko!2skr"
							width="100%" height="350" style="border: 0;" allowfullscreen="" loading="lazy"
							referrerpolicy="no-referrer-when-downgrade"></iframe>
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
                                                        <span class="text-secondary ndvi_yesterday_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold ndvi_yesterday"></h2>
                                                        <div class="font-size-sm text-muted">전날</div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-lg-12 text-center p-0">
                                                        <span class="text-secondary ndvi_today_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold ndvi_today"></h2>
                                                        <div class="font-size-sm text-muted">현재</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-2 mb-0 col-lg-12 text-center">
                                                <div class="">전날보다 <strong class="ndvi_data"><small class="weather-unit">%</small></strong>
                                                    <i class="textarrowcolor_ndvi text-danger icon-arrow-up13"></i>
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
                                                        <span class="text-secondary smo_yesterday_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold smo_yesterday"></h2>
                                                        <div class="font-size-sm text-muted">전날</div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-lg-12 text-center p-0">
                                                        <span class="text-secondary smo_today_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold smo_yesterday"></h2>
                                                        <div class="font-size-sm text-muted">현재</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-2 mb-0 col-lg-12 text-center">
                                                <div class="">전날보다 <strong class="smo_data"><small class="weather-unit">%</small></strong>
                                                    <i class="textarrowcolor_smo text-primary icon-arrow-up13"></i>
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
                                                        <span class="text-secondary stp_yesterday_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold stp_yesterday"></h2>
                                                        <div class="font-size-sm text-muted">전날</div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-lg-12 text-center p-0">
                                                        <span class="text-secondary stp_today_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold stp_today"></h2>
                                                        <div class="font-size-sm text-muted">현재</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-2 mb-0 col-lg-12 text-center">
                                                <div class="">전날보다 <strong class="stp_data"><small class="weather-unit">%</small></strong>
                                                    <i class="textarrowcolor_stp text-danger icon-arrow-down132"></i>
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
                                                        <span class="text-secondary sec_yesterday_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold sec_yesterday"></h2>
                                                        <div class="font-size-sm text-muted">전날</div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-lg-12 text-center p-0">
                                                        <span class="text-secondary sec_today_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold sec_today"></h2>
                                                        <div class="font-size-sm text-muted">현재</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-2 mb-0 col-lg-12 text-center">
                                                <div class="">전날보다 <strong class="sec_data"><small class="weather-unit">%</small></strong>
                                                    <i class="textarrowcolor_sec text-danger icon-arrow-down132"></i>
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
                                                        <span class="text-secondary temp_yesterday_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold temp_yesterday"></h2>
                                                        <div class="font-size-sm text-muted">전날</div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-lg-12 text-center p-0">
                                                        <span class="text-secondary temp_today_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold temp_today"></h2>
                                                        <div class="font-size-sm text-muted">현재</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-2 mb-0 col-lg-12 text-center">
                                                <div class="">전날보다 <strong><small class="weather-unit">%</small></strong>
                                                    <i class="textarrowcolor_temp text-primary icon-arrow-up13"></i>
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
                                                        <span class="text-secondary rain_yesterday_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold rain_yesterday"></h2>
                                                        <div class="font-size-sm text-muted">전날</div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-lg-12 text-center p-0">
                                                        <span class="text-secondary rain_today_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold rain_today"></h2>
                                                        <div class="font-size-sm text-muted">현재</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-2 mb-0 col-lg-12 text-center">
                                                <div class="">전날보다 <strong class="rain_data"></small></strong>
                                                    <i class="textarrowcolor_rain text-primary icon-arrow-up13"></i>
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
                                                        <span class="text-secondary wd_yesterday_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold wd_yesterday"></h2>
                                                        <div class="font-size-sm text-muted">전날</div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mb-4">
                                                <div class="row">
                                                    <div class="col-lg-12 text-center p-0">
                                                        <span class="text-secondary wd_today_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold wd_today"></h2>
                                                        <div class="font-size-sm text-muted">현재</div>
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
                                                        <span class="text-secondary ws_yesterday_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold ws_yesterday"></h2>
                                                        <div class="font-size-sm text-muted">전날</div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-lg-12 text-center p-0">
                                                        <span class="text-secondary ws_today_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold ws_today"></h2>
                                                        <div class="font-size-sm text-muted">현재</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-2 mb-0 col-lg-12 text-center">
                                                <div class="">전날보다 <strong class="ws_data"><small class="weather-unit">%</small></strong>
                                                    <i class="textarrowcolor_ws text-primary icon-arrow-up13"></i>
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
                                                        <span class="text-secondary humi_yesterday_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold humi_yesterday"></h2>
                                                        <div class="font-size-sm text-muted">전날</div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-lg-12 text-center p-0">
                                                        <span class="text-secondary humi_today_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold humi_today"></h2>
                                                        <div class="font-size-sm text-muted">현재</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-2 mb-0 col-lg-12 text-center">
                                                <div class="">전날보다 <strong class="humi_data"><small class="weather-unit">%</small></strong>
                                                    <i class="textarrowcolor_humi text-danger icon-arrow-down132"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--습도 end-->

                            <!--미세먼지-->
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
                                                        <span class="text-secondary solar_yesterday_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold solar_yesterday"></h2>
                                                        <div class="font-size-sm text-muted">전날</div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-lg-12 text-center p-0">
                                                        <span class="text-secondary solar_today_data"></span>
                                                        <h2 class="mb-0 font-weight-semibold solar_today_data"></h2>
                                                        <div class="font-size-sm text-muted">현재</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-2 mb-0 col-lg-12 text-center">
                                                <div class="">전날보다 <strong class="solar_data"></strong>
                                                    <i class="textarrowcolor_solar text-danger icon-arrow-down132"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--미세먼지 end-->

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

	</div>



</div>
<!-- /main content -->


<script>
	$(document).ready(function() {
	    var holeName = $(".holebt.active").data("holename");
	    $(".card-title.holename").prepend(holeName);
	    
	    // 페이지가 로드될 때 getData 함수 호출
	    var hole = $(".holebt.active").val();
	    var category = $(".categorybt.active").val();
	    getData(hole, category);
	});
	
	$(".holebt").click(function() {
	    var holeName = $(this).data("holename");
	    $(".card-title.holename").contents().first().remove(); // 기존 값을 제거
	    $(".card-title.holename").prepend(holeName);
	    
	    var hole = $(this).val();
	    $(".holebt").removeClass("active");
	    $(this).addClass("active");
	    getData(hole, $(".categorybt.active").val());
	});
	
	$(".categorybt").click(function() {
	    var category = $(this).val();
	    $(".categorybt").removeClass("active");
	    $(this).addClass("active");
	    getData($(".holebt.active").val(), category);
	});
	
	
	function getData(hole, category){
	    $.ajax({
	        url: '/report/course_report_ajax',
	        type: 'GET',
	        data: {hole: hole, category: category},
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
		//NDVI 데이터
	    var ndvi_today_data = data.list2[0].ndviData.tm.substring(0, 10);
	    var ndvi_yesterday_data = data.list2[1].ndviData.tm.substring(0, 10);
	    
	    $(".text-secondary.ndvi_yesterday_data").text(ndvi_yesterday_data);
	    $(".text-secondary.ndvi_today_data").text(ndvi_today_data);
	    
	    
	    var ndvi_today = Number(data.list2[0].ndviData.ndvi.toFixed(3));
	    var ndvi_yesterday = Number(data.list2[1].ndviData.ndvi.toFixed(3));
	    
	    $(".mb-0.font-weight-semibold.ndvi_yesterday").text(ndvi_yesterday);
	    $(".mb-0.font-weight-semibold.ndvi_today").text(ndvi_today);
	    
	    
	    difference(ndvi_today, ndvi_yesterday, ".ndvi_data", ".textarrowcolor_ndvi");

	    
		//토양수분 데이터
	    var smo_today_data = data.list3[0].soilData.tm.substring(0, 10);
	    var smo_yesterday_data = data.list3[1].soilData.tm.substring(0, 10);
	    
	    $(".text-secondary.smo_yesterday_data").text(smo_yesterday_data);
	    $(".text-secondary.smo_today_data").text(smo_today_data);
	    
	    
	    var smo_today = Number(data.list3[0].soilData.smo.toFixed(3));
	    var smo_yesterday = Number(data.list3[1].soilData.smo.toFixed(3));
	    
	    $(".mb-0.font-weight-semibold.smo_yesterday").text(smo_yesterday);
	    $(".mb-0.font-weight-semibold.smo_today").text(smo_today);
	    
	    
	    difference(smo_today, smo_yesterday, ".smo_data", ".textarrowcolor_smo");


	    
		//토양온도 데이터
	    var stp_today_data = data.list3[0].soilData.tm.substring(0, 10);
	    //stp_today_data = stp_today_data.replace(/-/g, '.');
	    var stp_yesterday_data = data.list3[1].soilData.tm.substring(0, 10);
	    //stp_today_data = stp_today_data.replace(/-/g, '.');
	    
	    $(".text-secondary.stp_yesterday_data").text(stp_yesterday_data);
	    $(".text-secondary.stp_today_data").text(stp_today_data);
	    
	    
	    var stp_today = Number(data.list3[0].soilData.stp.toFixed(3));
	    var stp_yesterday = Number(data.list3[1].soilData.stp.toFixed(3));
	    
	    $(".mb-0.font-weight-semibold.stp_yesterday").text(stp_yesterday);
	    $(".mb-0.font-weight-semibold.stp_today").text(stp_today);
		    
	    difference(stp_today, stp_yesterday, ".stp_data", ".textarrowcolor_stp");


	    
		//토양양분 데이터
	    var sec_today_data = data.list3[0].soilData.tm.substring(0, 10);
	    var sec_yesterday_data = data.list3[1].soilData.tm.substring(0, 10);
	    
	    $(".text-secondary.sec_yesterday_data").text(sec_yesterday_data);
	    $(".text-secondary.sec_today_data").text(sec_today_data);
	    
	    
	    var sec_today = Number(data.list3[0].soilData.sec.toFixed(3));
	    var sec_yesterday = Number(data.list3[1].soilData.sec.toFixed(3));
	    
	    $(".mb-0.font-weight-semibold.sec_yesterday").text(sec_yesterday);
	    $(".mb-0.font-weight-semibold.sec_today").text(sec_today);
	    	    
	    difference(sec_today, sec_yesterday, ".sec_data", ".textarrowcolor_sec");

	    
	    
	    //기온 데이터
	    var temp_today_data = data.list1[0].weatherData.tm.substring(0, 10);
	    var temp_yesterday_data = data.list1[1].weatherData.tm.substring(0, 10);
	    
	    $(".text-secondary.temp_yesterday_data").text(temp_yesterday_data);
	    $(".text-secondary.temp_today_data").text(temp_today_data);
	    
	    var temp_today = data.list1[0].weatherData.temp;
	    var temp_yesterday = data.list1[1].weatherData.temp;
	    
	    $(".mb-0.font-weight-semibold.temp_yesterday").text(temp_yesterday);
	    $(".mb-0.font-weight-semibold.temp_today").text(temp_today);

	    difference(temp_today, temp_yesterday, ".temp_data", ".textarrowcolor_temp");
	    
	    
	    //풍향 데이터
	    var wd_today_data = data.list1[0].weatherData.tm.substring(0, 10);
	    var wd_yesterday_data = data.list1[1].weatherData.tm.substring(0, 10);
	    
	    $(".text-secondary.wd_yesterday_data").text(wd_yesterday_data);
	    $(".text-secondary.wd_today_data").text(wd_today_data);
	    
	    var wd_today = data.list1[0].weatherData.wd;
	    var wd_yesterday = data.list1[1].weatherData.wd;
	    
	    $(".mb-0.font-weight-semibold.wd_yesterday").text(wd_yesterday);
	    $(".mb-0.font-weight-semibold.wd_today").text(wd_today);
	    
	    
	    //풍속 데이터
	    var ws_today_data = data.list1[0].weatherData.tm.substring(0, 10);
	    var ws_yesterday_data = data.list1[1].weatherData.tm.substring(0, 10);
	    
	    $(".text-secondary.ws_yesterday_data").text(ws_yesterday_data);
	    $(".text-secondary.ws_today_data").text(ws_today_data);
	    
	    var ws_today = data.list1[0].weatherData.ws;
	    var ws_yesterday = data.list1[1].weatherData.ws;
	    
	    $(".mb-0.font-weight-semibold.ws_yesterday").text(ws_yesterday);
	    $(".mb-0.font-weight-semibold.ws_today").text(ws_today);

	    difference(ws_today, ws_yesterday, ".ws_data", ".textarrowcolor_ws");
	    
	    
	    
	    //습도 데이터
	    var humi_today_data = data.list1[0].weatherData.tm.substring(0, 10);
	    var humi_yesterday_data = data.list1[1].weatherData.tm.substring(0, 10);
	    
	    $(".text-secondary.humi_yesterday_data").text(humi_yesterday_data);
	    $(".text-secondary.humi_today_data").text(humi_today_data);
	    
	    var humi_today = data.list1[0].weatherData.humi;
	    var humi_yesterday = data.list1[1].weatherData.humi;
	    
	    $(".mb-0.font-weight-semibold.humi_yesterday").text(humi_yesterday);
	    $(".mb-0.font-weight-semibold.humi_today").text(humi_today);

	    difference(humi_today, humi_yesterday, ".humi_data", ".textarrowcolor_humi");
	    
	    
	    
	    //강수량 데이터
	    var rain_today_data = data.list1[0].weatherData.tm.substring(0, 10);
	    var rain_yesterday_data = data.list1[1].weatherData.tm.substring(0, 10);
	    
	    $(".text-secondary.rain_yesterday_data").text(rain_yesterday_data);
	    $(".text-secondary.rain_today_data").text(rain_today_data);
	    
	    var rain_today = data.list1[0].weatherData.rain;
	    var rain_yesterday = data.list1[1].weatherData.rain;
	    
	    $(".mb-0.font-weight-semibold.rain_yesterday").text(rain_yesterday);
	    $(".mb-0.font-weight-semibold.rain_today").text(rain_today);

	    difference(rain_today, rain_yesterday, ".rain_data", ".textarrowcolor_rain");
	    
	    
	    //일조 데이터
	    var solar_today_data = data.list1[0].weatherData.tm.substring(0, 10);
	    var solar_yesterday_data = data.list1[1].weatherData.tm.substring(0, 10);
	    
	    $(".text-secondary.solar_yesterday_data").text(solar_yesterday_data);
	    $(".text-secondary.solar_today_data").text(solar_today_data);
	    
	    var solar_today = data.list1[0].weatherData.solar;
	    var solar_yesterday = data.list1[1].weatherData.solar;
	    
	    $(".mb-0.font-weight-semibold.solar_yesterday").text(solar_yesterday);
	    $(".mb-0.font-weight-semibold.solar_today").text(solar_today);

	    difference(solar_today, solar_yesterday, ".solar_data", ".textarrowcolor_solar");
	    
	    

	
	
	
	}
	
	
	
	function difference(today, yesterday, element, arrowElement) {
	    var difference = today - yesterday;
	    $(element).text(difference.toFixed(2));

	    if (difference > 0) {
	        $(arrowElement).removeClass("icon-arrow-down132 text-danger").addClass("icon-arrow-up13 text-primary");
	    } else if (difference < 0) {
	        $(arrowElement).removeClass("icon-arrow-up13 text-primary").addClass("icon-arrow-down132 text-danger");
	    }
	}
	
	



</script>