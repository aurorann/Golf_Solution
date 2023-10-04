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

				<h6 class="mr-2 mt-1 font-weight-semibold float-left ml-2">코스관리 작업 일정표 - 리스트</h6>
				<div class="btn-group float-right mr-2">
					<button type="button" class="btn btn-light" onclick="location.href='/management/course1'">달력</button>
					<button type="button" class="btn btn-light active" onclick="location.href='/management/course2'">리스트</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /page header -->

	<!-- Content area -->
	<div class="content layout-boxed">
		<!-- Basic card -->
		<!-- Basic view -->
		<div class="row">

			<div class="col-lg-7 mr-2">
				<div class="card-body workListContent">
				<!-- 작업 리스트 -->
				</div>
			</div>
			<!-- /basic view -->

		<!-- /basic card -->

		<div class="col-lg-4">
			<div class="card-body">
				<div class="mb-3">
					<h6 class="mb-0 font-weight-bold">
						검색 필터
					</h6>
				</div>
				<div class="col-lg-12 row">
					<div class="col-lg-12">
						<div class="card more-round">
							<!-- Sidebar search -->
							<div class="sidebar-section ">
								<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
									<li class="nav-item-header">코스 위치</li>
									<li class="nav-item pl-3 pr-3 course-location-badge">
										<c:forEach items="${list}" var="holename">
										<a href="#"><span class="badge badge-info searchHoleBt" value="${holename.holeNo}"><c:out value="${holename.holeName}"></c:out></span></a> <!--코스 위치 라벨-->
										</c:forEach>
									</li>
								</ul>

								<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
									<li class="nav-item-header">코스 유형</li>
									<li class="nav-item pl-3 pr-3 course-category-badge">
										<a href="#"><span class="badge badge-success searchCourseTypeBt">Green</span></a><!--코스 유형 라벨-->
										<a href="#"><span class="badge badge-success searchCourseTypeBt">Fairway</span></a>						
									</li>
								</ul>

								<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
									<li class="nav-item-header">작업 분류</li>
									<li class="nav-item pl-3 pr-3 work-class-badge">
										<a href="#"><span class="badge badge-warning searchClassBt">갱신</span></a><!--작업 분류 라벨-->
										<a href="#"><span class="badge badge-warning searchClassBt">예고</span></a>				
										<a href="#"><span class="badge badge-warning searchClassBt">기타</span></a>				
									</li>
								</ul>
						
								<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
									<li class="nav-item-header">작업 종류</li>
									<li class="nav-item pl-3 pr-3 work-category-badge">
										<a href="#"><span class="badge badge-secondary searchTypeBt" data-value="시비">시비</span></a> <!--작업 종류 라벨-->
										<a href="#"><span class="badge badge-secondary searchTypeBt" data-value="시비">시약</span></a>				 					
									</li>
								</ul>
							</div>
							<!-- /sidebar search -->

						</div>
					</div>
				</div>
			</div>
		</div>

		</div>
			

	</div>
	<!-- /content area -->

	


	<!-- Scrollable modal -->
	<div class="" style="position:fixed; bottom:30px; right:30px; z-index:1;">
		<button type="button" class="btn btn-round work" data-toggle="modal" data-target="#modal_scrollable">작업 등록<i class="fas fa-plus mt-2"></i></button>
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<div id="modal_scrollable" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header pb-3">
					<h5 class="modal-title">작업일정 추가</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body py-0">
					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 날짜</label>
						<div class="col-lg-10">
							<div class="input-group">
								<span class="input-group-prepend">
									<span class="input-group-text"><i class="icon-calendar22"></i></span>
								</span>
								<input type="text" class="form-control daterange-time dateInputTime dateInput" value="" style="display:show">
								<input type="text" class="form-control daterange-basic dateInputBasic dateInput"  value="" style="display:none">
								<input type="checkbox" class="allDayWork" name="allDay" style="margin-left: 1rem!important; margin-right: .2rem!important;"/>
							    <label for="allDay" style="margin: auto;">하루종일</label>
							</div>
						</div>
						
					</div>

					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">코스 위치</label>
						<div class="col-lg-10 course-location-badge">
							<c:forEach items="${list}" var="holename">
							<a href="#"><span class="badge badge-info holebt"><c:out value="${holename.holeName}"></c:out></span></a> <!--코스 위치 라벨-->
							</c:forEach>
						</div>
					</div>

					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">코스 종류</label>
						<div class="col-lg-10 course-category-badge">
							<a href="#"><span class="badge badge-success coursetypebt">Green</span></a><!--코스 유형 라벨-->
							<a href="#"><span class="badge badge-success coursetypebt">Fairway</span></a>						
						</div>
					</div>

					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 분류</label>
						<div class="col-lg-10 work-class-badge">
							<a href="#"><span class="badge badge-warning classbt">갱신</span></a><!--작업 분류 라벨-->
							<a href="#"><span class="badge badge-warning classbt">예고</span></a>				
							<a href="#"><span class="badge badge-warning classbt">기타</span></a>							
						</div>
					</div>

					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 종류</label>
						<div class="col-lg-10 work-category-badge">
							<a href="#"><span class="badge badge-secondary typebt" data-value="시비">시비</span></a> <!--작업 종류 라벨-->
							<a href="#"><span class="badge badge-secondary typebt" data-value="시약">시약</span></a>				 											
						</div>
					</div>



					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">브랜드 명</label>
						<div class="col-lg-10">
							<select class="custom-select brandname">
								<!-- 브랜드 선택 -->
								  <option value='' selected>브랜드 선택</option>
							</select>
						</div>
					</div>
					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 이미지</label>
						<div class="col-lg-10">
							<input type="file" class="form-control h-auto img">
						</div>
					</div>
					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 메모</label>
						<div class="col-lg-10">
							<textarea rows="1" cols="3" class="form-control comment" placeholder="작업 내용을 입력해 주세요."></textarea>
						</div>
					</div>
					<div class="form-group">
	        			<div class="col-form-label col-lg-10 selectItem">
	        				<span class="badge badge-info selectHole"></span> <!--코스 위치 라벨-->
	        				<span class="badge badge-success selectCourse"></span> <!--코스 유형 라벨-->
	        				<span class="badge badge-warning selectClass"></span> <!--작업 분류 라벨-->
	        				<span class="badge badge-secondary selectType"></span> <!--작업 종류 라벨-->
	        			</div>
	        			<div class="inputText"></div>
					</div>
				</div>

				<div class="modal-footer pt-3">
					<button type="button" class="btn btn-link insertClose" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary workInsert">작업 등록</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /scrollable modal -->

	<!-- Update Scrollable modal -->
	<div id="update_modal_scrollable" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header pb-3">
					<h5 class="modal-title">작업일정 수정</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body py-0">
					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 날짜</label>
						<div class="col-lg-10">
							<div class="input-group">
								<span class="input-group-prepend">
									<span class="input-group-text"><i class="icon-calendar22"></i></span>
								</span>
								<input type="text" class="form-control daterange-time dateInputTime dateInput" value="" style="display:show">
								<input type="text" class="form-control daterange-basic dateInputBasic dateInput"  value="" style="display:none">
								<input type="checkbox" class="allDayWork" name="allDay" style="margin-left: 1rem!important; margin-right: .2rem!important;"/>
							    <label for="allDay" style="margin: auto;">하루종일</label>
							</div>
						</div>
						
					</div>

					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">코스 위치</label>
						<div class="col-lg-10 course-location-badge">
							<c:forEach items="${list}" var="holename">
							<a href="#"><span class="badge badge-info holebt"><c:out value="${holename.holeName}"></c:out></span></a> <!--코스 위치 라벨-->
							</c:forEach>
						</div>
					</div>

					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">코스 종류</label>
						<div class="col-lg-10 course-category-badge">
							<a href="#"><span class="badge badge-success coursetypebt">Green</span></a><!--코스 유형 라벨-->
							<a href="#"><span class="badge badge-success coursetypebt">Fairway</span></a>						
						</div>
					</div>

					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 분류</label>
						<div class="col-lg-10 work-class-badge">
							<a href="#"><span class="badge badge-warning classbt">갱신</span></a><!--작업 분류 라벨-->
							<a href="#"><span class="badge badge-warning classbt">예고</span></a>				
							<a href="#"><span class="badge badge-warning classbt">기타</span></a>							
						</div>
					</div>

					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 종류</label>
						<div class="col-lg-10 work-category-badge">
							<a href="#"><span class="badge badge-secondary typebt" data-value="시비">시비</span></a> <!--작업 종류 라벨-->
							<a href="#"><span class="badge badge-secondary typebt" data-value="시약">시약</span></a>				 											
						</div>
					</div>



					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">브랜드 명</label>
						<div class="col-lg-10">
							<select class="custom-select brandname">
								<!-- 브랜드 선택 -->
								  <option value='' selected>브랜드 선택</option>
							</select>
						</div>
					</div>
					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 이미지</label>
						<div class="col-lg-10">
							<input type="file" class="form-control h-auto img">
						</div>
					</div>
					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 메모</label>
						<div class="col-lg-10">
							<textarea rows="1" cols="3" class="form-control comment" placeholder="작업 내용을 입력해 주세요."></textarea>
						</div>
					</div>
					<div class="form-group">
	        			<div class="col-form-label col-lg-10 selectItem">
	        				<span class="badge badge-info selectHole"></span> <!--코스 위치 라벨-->
	        				<span class="badge badge-success selectCourse"></span> <!--코스 유형 라벨-->
	        				<span class="badge badge-warning selectClass"></span> <!--작업 분류 라벨-->
	        				<span class="badge badge-secondary selectType"></span> <!--작업 종류 라벨-->
	        			</div>
	        			<div class="inputText"></div>
					</div>
				</div>

				<div class="modal-footer pt-3">
					<button type="button" class="btn btn-link insertClose" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary workUpdate">작업 등록</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Update scrollable modal -->

				

</div>
<!-- /main content -->

<script>

$(document).ready(function() {
    // 페이지가 로드될 때 workAllList 함수 호출
	workAllList();
});

function searchCheck(){
	if(!$(".searchHoleBt").hasClass("active") && !$(".searchCourseTypeBt").hasClass("active") && !$(".searchClassBt").hasClass("active") && !$(".searchTypeBt").hasClass("active")){
		workAllList();
	}//if end
}


<!-- twentytwenty -->
	$(function(){
		$(".twentytwenty-container[data-orientation!='vertical']").twentytwenty({default_offset_pct: 0.5});
		$(".twentytwenty-container[data-orientation='vertical']").twentytwenty({default_offset_pct: 0.5, orientation: 'vertical'});
	});
<!-- twentytwenty end -->

$('.allDayWork').change(function() {
	
    if(this.checked) {
    	$('.dateInputTime').hide();
    	$('.dateInputBasic').show();
    } else {
    	$('.dateInputTime').show();
    	$('.dateInputBasic').hide();
    }
});


	
//작업등록 버튼 클릭시 리셋
$(".work").click(function() {
	$(".coursetypebt").removeClass("active");			
	$(".holebt").removeClass("active");			
	$(".classbt").removeClass("active");			
	$(".typebt").removeClass("active");
	$('.img').val('');
	$('.comment').val('');
	$('.brandname').val('default');
	$('.selectHole').text('');
	$('.selectCourse').text('');
	$('.selectClass').text('');
	$('.selectType').text('');
});

//코스 위치 active 클래스 추가
$(".holebt").click(function() {
	//클릭시 이미 active 클래스면 active 제거
	if($(this).hasClass("active")){
		$(".holebt").removeClass("active");
		$('.selectHole').text('');
	}else{
		$(".holebt").removeClass("active");			
	    $(this).addClass("active");
		$(".selectHole").text($(this).addClass("active").text());
	}//if end
});

//코스 위치2 active 클래스 추가
$(".searchHoleBt").click(function() {
	//클릭시 이미 active 클래스면 active 제거
	if($(this).hasClass("active")){
		$(".searchHoleBt").removeClass("active");		
	}else{
		$(".searchHoleBt").removeClass("active");			
	    $(this).addClass("active");
	}//if end
	
	var searchHole = $(".searchHoleBt.active").attr('value');
	console.log("active추가"+searchHole)
	workSelectList(searchHole, $(".searchCourseTypeBt.active").text(), $(".searchClassBt.active").text(), $(".searchTypeBt.active").text());
	searchCheck();
});


//코스종류 active 클래스 추가
$(".coursetypebt").click(function() {
	//클릭시 이미 active 클래스면 active 제거
	if($(this).hasClass("active")){
		$(".coursetypebt").removeClass("active");
		$('.selectCourse').text('');
	}else{
		$(".coursetypebt").removeClass("active");			
	    $(this).addClass("active");
		$(".selectCourse").text($(this).addClass("active").text());
	}//if end
});

//코스종류2 active 클래스 추가
$(".searchCourseTypeBt").click(function() {
	//클릭시 이미 active 클래스면 active 제거
	if($(this).hasClass("active")){
		$(".searchCourseTypeBt").removeClass("active");			
	}else{
		$(".searchCourseTypeBt").removeClass("active");			
	    $(this).addClass("active");
	}//if end
	var searchCourseType = $(".searchCourseTypeBt.active").text();
	console.log("active추가"+searchCourseType)
	workSelectList($(".searchHoleBt.active").attr('value'), searchCourseType, $(".searchClassBt.active").text(), $(".searchTypeBt.active").text());
	searchCheck();
});


//작업분류 active 클래스 추가
$(".classbt").click(function() {
	//클릭시 이미 active 클래스면 active 제거
	if($(this).hasClass("active")){
		$(".classbt").removeClass("active");
		$('.selectClass').text('');
	}else{
		$(".classbt").removeClass("active");			
	    $(this).addClass("active");
		$(".selectClass").text($(this).addClass("active").text());
	}//if end
});

//작업분류2 active 클래스 추가
$(".searchClassBt").click(function() {
	//클릭시 이미 active 클래스면 active 제거
	if($(this).hasClass("active")){
		$(".searchClassBt").removeClass("active");			
	}else{
		$(".searchClassBt").removeClass("active");			
	    $(this).addClass("active");
	}//if end
	var searchClass = $(".searchClassBt.active").text();
	console.log("active추가"+searchClass)
	workSelectList($(".searchHoleBt.active").attr('value'), $(".searchCourseTypeBt.active").text(), searchClass, $(".searchTypeBt.active").text());
	searchCheck();
});

//작업종류2 active 클래스 추가
$(".searchTypeBt").click(function() {
	//클릭시 이미 active 클래스면 active 제거
	if($(this).hasClass("active")){
		$(".searchTypeBt").removeClass("active");			
	}else{
		$(".searchTypeBt").removeClass("active");			
	    $(this).addClass("active");
	}//if end
	var searchType = $(".searchTypeBt.active").text();
	console.log("active추가"+searchType)
	workSelectList($(".searchHoleBt.active").attr('value'), $(".searchCourseTypeBt.active").text(), $(".searchClassBt.active").text(), searchType);
	searchCheck();
});

		
//작업종류 active 클래스 추가
$(".typebt").click(function() {
	//클릭시 이미 active 클래스면 active 제거
	if($(this).hasClass("active")){
		$(".typebt").removeClass("active");
		$('.selectType').text('');
	}else{
	    var worktype = $(this).data('value');
		getbrand(worktype);
		$(".typebt").removeClass("active");			
	    $(this).addClass("active");
		$(".selectType").text($(this).addClass("active").text());
	}//if end
});


//작업종류에 따라 브랜드 보여주기
function getbrand(worktype){
    $.ajax({
        url: '/management/getbrand_ajax',
        type: 'GET',
        data: {worktype: worktype},
        dataType: "json",
        success: function(data) {
            console.log(data);
            updatebrand(data);
        },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
}//getHoleData end


//브랜드 업데이트
function updatebrand(data){
	//사용제품 브랜드 
	let brand = "";
	
       for(var i=0; i<data.length; i++){
		brand += `<option value="opt1">\${data[i].brandName}</option>`;
       }
   	// HTML 요소 선택 및 결과 삽입
	let dataElement = document.querySelector('.brandname');
	dataElement.innerHTML = brand;
}//updatebrand() end



$(".workInsert").click(function() {
	var dateRange = $('.dateInput:visible').val(); // 작업날짜 
	console.log(dateRange);
	var dates = dateRange.split(' ~ '); // 작업날짜 ~ 빼기
	console.log(dates);
	var workstart = dates[0]; // 작업시작날짜
	var workend = dates[1]; // 작업종료날짜
	var hole = $('.holebt.active').text(); //holename
	var course = $('.coursetypebt.active').text(); // 코스종류
	var workclass = $('.classbt.active').text(); // 작업분류
	var worktype = $('.typebt.active').text(); // 작업종류
	var workbrand = $('.brandname option:selected').text(); // 작업브랜드
	var oriImgName = $('.img').val(); //작업 이미지
	var comment = $('.comment').val(); //작업 이미지


	let token = $("input[name='_csrf']").val();
	let header = "X-CSRF-TOKEN";
	
	//이미지 파일 길이
	var fileLength = $('.img').get(0).files.length;
	
	//이미지 첨부 필수. 첨부 안할시 alert창
	if(fileLength == 0){
		alert("이미지를 첨부해 주세요.");
	}else{
	    $.ajax({
	        url: '/management/insertwork_ajax',
	        method: 'POST',
	        data: {
	        	workstart: workstart,
	        	workend: workend,
	        	hole: hole,
	        	course: course,
	        	workclass: workclass,
	        	worktype: worktype,
	        	workbrand: workbrand,
	        	oriImgName: oriImgName,
	        	comment: comment
	        	},
	        //dataType: "json",//(insert 성공하여도 자료형때문에 200에서 자료형에러를 뱉어낸다)
			beforeSend : function(xhr) {  
				xhr.setRequestHeader(header, token);
			},
	        success: function(result) {
	            alert("등록되었습니다")
	            $('#modal_scrollable').modal('hide');  // 모달 창 닫기
	            workAllList();
	        },
		    error: function(jqXHR, textStatus, errorThrown) {
		        alert(jqXHR.status);
		        alert(jqXHR.statusText);
		        alert(jqXHR.responseText);
		        alert(jqXHR.readyState);
		    }
	    });//ajax end
	}//if end


	
});//workreport.click function


//모든작업 조회
function workAllList(){
    $.ajax({
        url: '/management/workReportAllList',
        method: 'GET',
        success: function(data) {
        	console.log(data);
        	workReportAllList(data);
        },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
}//workAllList() end


//선택작업 조회
function workSelectList(searchHole, searchCourseType, searchClass, searchType){
    $.ajax({
        url: '/management/searchWorkReportListAjax',
        method: 'GET',
        data: {searchHole: searchHole, searchCourseType: searchCourseType, searchClass: searchClass, searchType: searchType},
        success: function(data) {
        	console.log(data);
        	searchWorkReportList(data);
        },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
}//workAllList() end


let allWorkList="";


//작업 일정 보여주기
function workReportAllList(data){
	allWorkList="";
	console.log("작업일정 갯수"+data.length)
   	allWorkList += `
              <div class="mb-3">
               <h6 class="mb-0 font-weight-bold">
                   전체 보기
               </h6>
           </div>
           `;
            
	for(var i=0; i<data.length; i++){
		let dateStartTime = `\${data[i].workStart}`.slice(11, 16);
		let dateEndTime = `\${data[i].workEnd}`.slice(11, 16);
		let dateStart = '';
		let dateEnd = '';
		
		//하루종일 날짜와 시간별 날짜 구분하기
		if(`\${data[i].workStart}`.slice(11, 16) == '00:00' && `\${data[i].workEnd}`.slice(11, 16) == '00:00'){
			dateStart = `\${data[i].workStart}`.slice(0, 10);
			dateEnd = `\${data[i].workEnd}`.slice(0, 10);			
		}else{
			dateStart = `\${data[i].workStart}`.slice(0, 16);
			dateEnd = `\${data[i].workEnd}`.slice(0, 16);	
		}
		let dateWorkNo = `\${data[i].workNo}`

		allWorkList += `
			<div class="col-lg-12">
				<div class="card more-round">
					<div class="card-header bg-white">
						<span class="font-weight-semibold float-left ml-1 mr-2 font-weight-bold">\${data[i].userId}</span>
						<div class="list-icons float-right ml-3">
							<div class="dropdown position-static">
								<a href="#" class="list-icons-item" data-toggle="dropdown" aria-expanded="false"><i class="icon-more2 mr-1"></i></a>
								<div class="dropdown-menu dropdown-menu-right" style="">
									<a class="dropdown-item workReportUpdate" data-toggle="modal" data-target="#update_modal_scrollable" value="\${data[i].workNo}">수정</a>
									<a href="#" class="dropdown-item">삭제</a>
								</div>
							</div>
						</div>
						<span class="float-left text-muted">\${data[i].writeAt}</span>
					</div>
					<div class="card-body">
						<h6 class="card-title font-weight-bold">코스 \${data[i].workReportTargetList[0].holeNo} \${data[i].workType} 작업</h6>
						<div class="row">
							<label class="col-form-label font-weight-bold col-lg-2">작업 기간</label>
							<label class="col-form-label col-lg-10">\${dateStart} - \${dateEnd}</label>
						</div>
		
						<div class="row">
							<label class="col-form-label font-weight-bold col-lg-2">작업 내용</label>
							<div class="col-form-label col-lg-10">
								<span class="badge badge-info">Hole \${data[i].workReportTargetList[0].holeNo}</span> <!--코스 위치 라벨-->
								<span class="badge badge-success">\${data[i].workReportTargetList[0].courseType}</span> <!--코스 유형 라벨-->
								<span class="badge badge-warning">\${data[i].workClass}</span> <!--작업 분류 라벨-->
								<span class="badge badge-secondary">\${data[i].workType}</span> <!--작업 종류 라벨-->
							</div>
						</div>
						
						<div class="row">
							<label class="col-form-label font-weight-bold col-lg-2">브랜드명</label>
							<label class="col-form-label col-lg-10">\${data[i].workBrand}</label>
						</div>
						
						<div class="row">
							<label class="col-form-label font-weight-bold col-lg-2">작업 메모</label>
							<label class="col-form-label col-lg-10">\${data[i].workComment}</label>
						</div>
		
						<div class="form-group row mt-2">
							<label class="col-form-label font-weight-bold col-lg-12">작업 이미지</label>
							<div class="row">
								<div class="col-lg-4">
									<div class="card">
										<div class="card-img-actions m-1">
		      									<img class="card-img img-fluid" src="/resources/assets/img/ndvi-1.png" alt="">
		      									<div class="card-img-actions-overlay card-img">
		      										<a href="/resources/assets/img/ndvi-1.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
		      											<i class="icon-plus3"></i>
		      										</a>
		      										<a href="#" class="btn btn-outline-white border-2 btn-icon rounded-pill ml-2">
		      											<i class="icon-link"></i>
		      										</a>
		      									</div>
		      								</div>
		      							</div>
		      						</div>
		
		       					<div class="col-lg-4">
		       						<div class="card">
		       							<div class="card-img-actions m-1">
		       								<img class="card-img img-fluid" src="/resources/assets/img/ndvi-1.png" alt="">
		       								<div class="card-img-actions-overlay card-img">
		       									<a href="/resources/assets/img/ndvi-1.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
		       										<i class="icon-plus3"></i>
		       									</a>
		
		       									<a href="#" class="btn btn-outline-white border-2 btn-icon rounded-pill ml-2">
		       										<i class="icon-link"></i>
		       									</a>
		       								</div>
		       							</div>
		       						</div>
		       					</div>
		
		       					<div class="col-lg-4">
		       						<div class="card">
		       							<div class="card-img-actions m-1">
		       								<img class="card-img img-fluid" src="/resources/assets/img/noimage.png" alt="">
		       								<div class="card-img-actions-overlay card-img">
		       									<a href="/resources/assets/img/noimage.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
		       										<i class="icon-plus3"></i>
		       									</a>
		
		       									<a href="#" class="btn btn-outline-white border-2 btn-icon rounded-pill ml-2">
		       										<i class="icon-link"></i>
		       									</a>
		       								</div>
		       							</div>
		       						</div>
		       					</div>
		
		      						<div class="col-lg-4">
		      							<div class="card">
		      								<div class="card-img-actions m-1">
		      									<img class="card-img img-fluid" src="/resources/assets/img/noimage.png" alt="">
		      									<div class="card-img-actions-overlay card-img">
		      										<a href="/resources/assets/img/noimage.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
		      											<i class="icon-plus3"></i>
		      										</a>
		      										<a href="#" class="btn btn-outline-white border-2 btn-icon rounded-pill ml-2">
		      											<i class="icon-link"></i>
		      										</a>
		      									</div>
		      								</div>
		      							</div>
		      						</div>
		      					</div>
						</div>
					</div>
				</div>
			</div>
           `;
	}//for end
	let dataElement = document.querySelector('.workListContent');
	dataElement.innerHTML = allWorkList;
	
}//workReportAllList() end

 

//검색작업 일정 보여주기
function searchWorkReportList(data){
	allWorkList="";
	console.log("작업일정 갯수 "+data.list.length)
   	allWorkList += `
					<div class="mb-3">
						<h6 class="mb-0 font-weight-bold">
							검색 보기
						</h6>
					</div>
					`;
            
	for(var i=0; i<data.list.length; i++){
		let dateStart = `\${data.list[i].workStart}`.slice(0, 10);
		let dateEnd = `\${data.list[i].workEnd}`.slice(0, 10);
    	allWorkList += `
               <div class="col-lg-12">
               <div class="card more-round">
                   <div class="card-header bg-white">
                       <span class="font-weight-semibold float-left ml-1 mr-2 font-weight-bold">\${data.list[i].userId}</span>
                       <div class="list-icons float-right ml-3">
                           <div class="dropdown position-static">
                               <a href="#" class="list-icons-item" data-toggle="dropdown" aria-expanded="false"><i class="icon-more2 mr-1"></i></a>
                               <div class="dropdown-menu dropdown-menu-right" style="">
                               	<a class="dropdown-item workReportUpdate">수정</a>
                                   <a href="#" class="dropdown-item">삭제</a>
                               </div>
                           </div>
                       </div>
                       <span class="float-left text-muted">\${data.list[i].writeAt}</span>
                   </div>
                   <div class="card-body">
                       <h6 class="card-title font-weight-bold">코스 \${data.list[i].workReportTargetList[0].holeNo} \${data.list[i].workType} 작업</h6>
       		<div class="row">
       			<label class="col-form-label font-weight-bold col-lg-2">작업 기간</label>
       			<label class="col-form-label col-lg-10">\${dateStart} - \${dateEnd}</label>
       		</div>

       		<div class="row">
       			<label class="col-form-label font-weight-bold col-lg-2">작업 내용</label>
       			<div class="col-form-label col-lg-10">
       				<span class="badge badge-info">Hole \${data.list[i].workReportTargetList[0].holeNo}</span> <!--코스 위치 라벨-->
       				<span class="badge badge-success">\${data.list[i].workReportTargetList[0].courseType}</span> <!--코스 유형 라벨-->
       				<span class="badge badge-warning">\${data.list[i].workClass}</span> <!--작업 분류 라벨-->
       				<span class="badge badge-secondary">\${data.list[i].workType}</span> <!--작업 종류 라벨-->
       			</div>
       		</div>

       		<div class="row">
       			<label class="col-form-label font-weight-bold col-lg-2">브랜드명</label>
       			<label class="col-form-label col-lg-10">\${data.list[i].workBrand}</label>
       		</div>

       		<div class="row">
       			<label class="col-form-label font-weight-bold col-lg-2">작업 메모</label>
       			<label class="col-form-label col-lg-10">\${data.list[i].workComment}</label>
       		</div>

       		<div class="form-group row mt-2">
       			<label class="col-form-label font-weight-bold col-lg-12">작업 이미지</label>
       				<div class="row">
       					<div class="col-lg-4">
       						<div class="card">
       							<div class="card-img-actions m-1">
       								<img class="card-img img-fluid" src="/resources/assets/img/ndvi-1.png" alt="">
       								<div class="card-img-actions-overlay card-img">
       									<a href="/resources/assets/img/ndvi-1.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
       										<i class="icon-plus3"></i>
       									</a>

       									<a href="#" class="btn btn-outline-white border-2 btn-icon rounded-pill ml-2">
       										<i class="icon-link"></i>
       									</a>
       								</div>
       							</div>
       						</div>
       					</div>

       					<div class="col-lg-4">
       						<div class="card">
       							<div class="card-img-actions m-1">
       								<img class="card-img img-fluid" src="/resources/assets/img/ndvi-1.png" alt="">
       								<div class="card-img-actions-overlay card-img">
       									<a href="/resources/assets/img/ndvi-1.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
       										<i class="icon-plus3"></i>
       									</a>

       									<a href="#" class="btn btn-outline-white border-2 btn-icon rounded-pill ml-2">
       										<i class="icon-link"></i>
       									</a>
       								</div>
       							</div>
       						</div>
       					</div>

       					<div class="col-lg-4">
       						<div class="card">
       							<div class="card-img-actions m-1">
       								<img class="card-img img-fluid" src="/resources/assets/img/noimage.png" alt="">
       								<div class="card-img-actions-overlay card-img">
       									<a href="/resources/assets/img/noimage.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
       										<i class="icon-plus3"></i>
       									</a>

       									<a href="#" class="btn btn-outline-white border-2 btn-icon rounded-pill ml-2">
       										<i class="icon-link"></i>
       									</a>
       								</div>
       							</div>
       						</div>
       					</div>

       					<div class="col-lg-4">
       						<div class="card">
       							<div class="card-img-actions m-1">
       								<img class="card-img img-fluid" src="/resources/assets/img/noimage.png" alt="">
       								<div class="card-img-actions-overlay card-img">
       									<a href="/resources/assets/img/noimage.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
       										<i class="icon-plus3"></i>
       									</a>

       									<a href="#" class="btn btn-outline-white border-2 btn-icon rounded-pill ml-2">
       										<i class="icon-link"></i>
       									</a>
       								</div>
       							</div>
       						</div>
       					</div>
       				</div>
       			
       		</div>

                   </div>
               </div>
           </div>
           `;
	}//for end
	let dataElement = document.querySelector('.workListContent');
	dataElement.innerHTML = allWorkList;
	
}//workReportAllList() end



//수정 버튼 클릭
/*
$(".workReportUpdate").click(function() {
    alert("수정");
    let workNo = $(this).data('value');
    console.log(workNo);
});*/

$(document).on('click','.workReportUpdate',function(){
    //alert("수정");
    let workNo = $(this).attr('value');
    console.log(workNo);
    workReportUpdateList(workNo);
})

//수정작업 조회
function workReportUpdateList(workNo){
    $.ajax({
        url: '/management/workReportUpdateList',
        method: 'GET',
        data: {workNo: workNo},
        success: function(data) {
        	console.log(data);
        	workReportUpdateListModal(data);
        },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
}//workAllList() end


//수정 할 작업 보여주기
function workReportUpdateListModal(data){
	
	let hole = `\${data[0].workReportTargetList[0].holeNo}`;
	let course = `\${data[0].workReportTargetList[0].courseType}`;
	
	console.log(course);
	
	$("#update_modal_scrollable .searchHoleBt").each(function() {
		if($(this).val() === hole) {
			$(this).addClass("active");
		}
	});
	
	$("#update_modal_scrollable .coursetypebt").each(function() {
		if($(this).text() === course) {
			$(this).addClass("active");
		}
	});

}//workReportUpdateList() end

 
</script>







