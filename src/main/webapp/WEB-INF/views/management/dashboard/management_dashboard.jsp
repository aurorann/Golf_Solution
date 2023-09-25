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
	
			<div class="page-title">
				<ul class="nav nav-tabs nav-tabs-solid border-0 m-0 ml-2">
					<li class="nav-item"><a href="#solid-tab1" class="nav-link active" data-toggle="tab">통합 대시보드</a></li>
					<li class="nav-item"><a href="#solid-tab2" class="nav-link" data-toggle="tab">작업 알람 리스트</a></li>
				</ul>
			</div>
	
		</div>
	</div>
	<!-- /page header -->

	<!-- Content area -->
	<div class="content">
		<!-- Basic card -->

		<div class="tab-content">
			<div class="tab-pane fade active show" id="solid-tab1">
				
				<h6 class="mr-2 font-weight-semibold float-left mt-1">구분</h6>
				<div class="btn-group mr-2">
					<button type="button" class="categorybt btn btn-light active" value="FAIRWAY">Fairway</button>
					<button type="button" class="categorybt btn btn-light" value="GREEN">Green</button>
				</div>
				<div class="btn-group float-right mr-2">
					<button type="button" class="btn btn-light listsort" value="">관리순위</button>
					<button type="button" class="btn btn-light listsort active" value="ASC">오름차순</button>
					<button type="button" class="btn btn-light listsort" value="DESC">내림차순</button>
				</div>
				<h6 class="mr-2 font-weight-semibold float-right ml-2 mt-1">정렬</h6>

				<div class="row mt-3 data">

				</div>
				
		

			</div>
			<div class="tab-pane fade" id="solid-tab2">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title">작업 알람 리스트</h5>
					</div>
					<div class="table-responsive table-scrollable">
						<table class="table">
							<thead>
								<tr>
									<th>날짜</th>
									<th>코스명</th>
									<th>코스 구분</th>
									<th>권장 작업</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
								</tr>
								<tr>
									<td>2023-08-14</td>
									<td>Hole3</td>
									<td>Green</td>
									<td>시비 / 잔디깎기 / 관수</td>
								</tr>
								
							</tbody>
						</table>
					</div>

					<div class="mt-3 mb-3 text-center">
						<ul class="pagination pagination-flat align-self-center">
							<li class="page-item"><a href="#" class="page-link">← &nbsp; Prev</a></li>
							<li class="page-item active"><a href="#" class="page-link">1</a></li>
							<li class="page-item"><a href="#" class="page-link">2</a></li>
							<li class="page-item disabled"><a href="#" class="page-link">3</a></li>
							<li class="page-item"><a href="#" class="page-link">4</a></li>
							<li class="page-item"><a href="#" class="page-link">Next &nbsp; →</a></li>
						</ul>
					</div>
					

				</div>
			</div>
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
	var listsort = $(".listsort.active").val();
	getAllData(category, listsort);
    
});

//카테고리 버튼 클릭시 데이터 갱신
$(".categorybt").click(function() {
	datatemplate = "";
	$('.row.mt-3.data').empty();
	var category = $(this).val();
	$(".categorybt").removeClass("active");
	$(this).addClass("active");
	var listsort = $(".listsort.active").val();
	getAllData(category, listsort);
    //console.log(category);
});

//정렬 버튼 클릭스 데이터 갱신
$(".listsort").click(function() {
	datatemplate = "";
	$('.row.mt-3.data').empty();
	var listsort = $(this).val();
	$(".listsort").removeClass("active");
	$(this).addClass("active");
	var category = $(".categorybt.active").val();
	getAllData(category, listsort);
});

function getAllData(category, listsort){
    $.ajax({
        url: '/management/dashboardAjax',
        type: 'GET',
        data: {category: category, listsort: listsort},
        dataType: "json",
        success: function(data) {
            console.log(data);
            //console.log(data.list1.length);
            //console.log(data.list1[0].holeName);
            updatedata(data);
        },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
}//getData end

let datatemplate = "";


function updatedata(data){
	for(var i=0; i<data.list1.length; i++){
		//console.log(data.list1[i].holeName);
		//console.log(data.list1[i].courseType);
		datatemplate += `
						<div class="col-lg-3">
							<div class="card">
								<div class="card-header mb-2">
									<h6 class="card-title font-weight-bold"><a class="detailreport" value="\${data.list1[i].hole_No}">\${data.list1[i].hole_Name}</a>
									<span class="float-right badge badge-success badge-pill">양호</span>
									</h6>
								</div>
								
								<div class="card-body">
									<div class="row">
										
										<div class="col-lg-4">
											<div class="card bg-success-100 border-success">
												<div class="card-header">
													<h6 class="card-title font-weight-semibold text-success">NDVI</h6>
												</div>
												<div class="card-body pl-2 pr-2 pb-2">
													<span class="font-weight-bold">\${parseFloat(data.list4[i].sensorInfoList[0].ndviDataList[0].ndvi).toFixed(2)}</span>
													<span class="float-right badge badge-success badge-pill">양호</span>
												</div>
											</div>
										</div>
										
										<div class="col-lg-4">
											<div class="card bg-primary-100 border-primary">
												<div class="card-header">
													<h6 class="card-title font-weight-semibold text-primary">토양수분</h6>
												</div>
												<div class="card-body pl-2 pr-2 pb-2">
													<span class="font-weight-bold">\${parseFloat(data.list3[i].robotInfoList[0].soilDataList[0].smo).toFixed(2)}</span>
													<span class="float-right badge badge-success badge-pill">양호</span>
												</div>
											</div>
										</div>
										
										<div class="col-lg-4">
											<div class="card bg-danger-100 border-danger">
												<div class="card-header">
													<h6 class="card-title font-weight-semibold text-danger">토양온도</h6>
												</div>
												<div class="card-body pl-2 pr-2 pb-2">
													<span class="font-weight-bold">\${parseFloat(data.list3[i].robotInfoList[0].soilDataList[0].stp).toFixed(2)}</span>
													<span class="float-right badge badge-success badge-pill">양호</span>
												</div>
											</div>
										</div>
										
										<div class="col-lg-4">
											<div class="card bg-warning-100 border-warning">
												<div class="card-header">
													<h6 class="card-title font-weight-semibold text-warning">기온</h6>
												</div>
												<div class="card-body pl-2 pr-2 pb-2">
													<span class="font-weight-bold">\${data.list2[i].sensorInfoList[0].weatherDataList[0].temp}</span>
													<span class="float-right badge badge-success badge-pill">양호</span>
												</div>
											</div>
										</div>
										
										<div class="col-lg-4">
											<div class="card bg-secondary-100 border-secondary">
												<div class="card-header">
													<h6 class="card-title font-weight-semibold text-secondary">풍속</h6>
												</div>
												<div class="card-body pl-2 pr-2 pb-2">
													<span class="font-weight-bold">\${data.list2[i].sensorInfoList[0].weatherDataList[0].ws}</span>
													<span class="float-right badge badge-success badge-pill">양호</span>
												</div>
											</div>
										</div>
										
										<div class="col-lg-4">
											<div class="card bg-purple-100 border-purple">
												<div class="card-header">
													<h6 class="card-title font-weight-semibold text-purple">일사</h6>
												</div>
												<div class="card-body pl-2 pr-2 pb-2">
													<span class="font-weight-bold">\${data.list2[i].sensorInfoList[0].weatherDataList[0].solar}</span>
													<span class="float-right badge badge-success badge-pill">양호</span>
												</div>
											</div>
										</div>							

	
									</div>
								</div>
							</div>
						</div>`;
	    }
	// HTML 요소 선택 및 결과 삽입
	let dataElement = document.querySelector('.row.mt-3.data');
	dataElement.innerHTML = datatemplate;

}//updatedata() end

//상세정보 버튼 클릭 이벤트 핸들러
$('body').on('click', '.detailreport', function() {
    // 버튼의 value 값
    var value = $(this).attr('value');
    console.log(value);
    
	location.href = '/report/course_report?value=' + encodeURIComponent(value);
});



</script>