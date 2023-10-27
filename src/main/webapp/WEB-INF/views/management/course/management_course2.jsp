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
										<label class="badge badge-info">${holename.holeName}<input class="searchHoleBt" type="checkbox" name="searchHoleBt" value="${holename.holeNo}"></label>
										</c:forEach>
									</li>
								</ul>

								<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
									<li class="nav-item-header">코스 유형</li>
									<li class="nav-item pl-3 pr-3 course-category-badge">
										<label class="badge badge-success">Green<input class="searchCourseTypeBt" type="checkbox" name="searchCourseTypeBt" value="Green"></label>
										<label class="badge badge-success">Fairway<input class="searchCourseTypeBt" type="checkbox" name="searchCourseTypeBt" value="Fairway"></label>			
									</li>
								</ul>

								<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
									<li class="nav-item-header">작업 분류</li>
									<li class="nav-item pl-3 pr-3 work-class-badge">
										<label class="badge badge-warning">갱신<input class="searchClassBt" type="checkbox" name="searchClassBt" value="갱신"></label>
										<label class="badge badge-warning">예고<input class="searchClassBt" type="checkbox" name="searchClassBt" value="예고"></label>
										<label class="badge badge-warning">기타<input class="searchClassBt" type="checkbox" name="searchClassBt" value="기타"></label>
									</li>
								</ul>
						
								<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
									<li class="nav-item-header">작업 종류</li>
									<li class="nav-item pl-3 pr-3 work-category-badge">
										<label class="badge badge-secondary">시비<input class="searchTypeBt" type="checkbox" name="searchTypeBt" value="시비"></label>
										<label class="badge badge-secondary">시약<input class="searchTypeBt" type="checkbox" name="searchTypeBt" value="시약"></label>					
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
					<h5 class="modal-title" id="modalTitle">작업일정 추가</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body py-0">
					<input type="hidden" name="workNo" id="workNo" value="">
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
							<label class="badge badge-info">${holename.holeName}<input class="holeBt" type="checkbox" name="holeBt" value="${holename.holeNo}"></label>
							</c:forEach>
						</div>
					</div>

					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">코스 종류</label>
						<div class="col-lg-10 course-category-badge">
							<label class="badge badge-success">Green<input class="courseTypeBt" type="checkbox" name="courseTypeBt" value="Green"></label>
							<label class="badge badge-success">Fairway<input class="courseTypeBt" type="checkbox" name="courseTypeBt" value="Fairway"></label>					
						</div>
					</div>

					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 분류</label>
						<div class="col-lg-10 work-class-badge">
							<label class="badge badge-warning">갱신<input class="classBt" type="checkbox" name="classBt" value="갱신"></label>
							<label class="badge badge-warning">예고<input class="classBt" type="checkbox" name="classBt" value="예고"></label>
							<label class="badge badge-warning">기타<input class="classBt" type="checkbox" name="classBt" value="기타"></label>				
						</div>
					</div>

					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 종류</label>
						<div class="col-lg-10 work-category-badge">
							<label class="badge badge-secondary">시비<input class="typeBt" type="checkbox" name="typeBt" value="시비"></label>
							<label class="badge badge-secondary">시약<input class="typeBt" type="checkbox" name="typeBt" value="시약"></label>				 											
						</div>
					</div>

					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">브랜드 명</label>
						<div class="col-lg-10">
							<select class="custom-select brandName">
								<!-- 브랜드 선택 -->
								  <option value='' selected>브랜드 선택</option>
							</select>
						</div>
					</div>
					
					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 이미지</label>
						<div class="col-lg-10">
							<input type="file" class="form-control h-auto img" multiple="multiple">
						</div>
						<label class="col-form-label col-lg-2"></label>
						<input type="hidden" id="removeImgList" name="removeImgList" value="">
						<div class="col-lg-10" id="imgList">
						
						</div>
					</div>
					<div class="form-group row mt-3">
						<label class="col-form-label col-lg-2">작업 메모</label>
						<div class="col-lg-10">
							<textarea rows="1" cols="3" class="form-control comment" placeholder="작업 내용을 입력해 주세요."></textarea>
						</div>
					</div>
					<div class="form-group">
	        			<div class="col-form-label col-lg-12 selectItem">
	        				<span class="holeBtSelect"></span> <!--코스 위치 라벨-->
	        				<span class="courseTypeBtSelect"></span> <!--코스 유형 라벨-->
	        				<span class="classBtSelect"></span> <!--작업 분류 라벨-->
	        				<span class="typeBtSelect"></span> <!--작업 종류 라벨-->
	        			</div>
	        			<div class="inputText"></div>
					</div>
				</div>

				<div class="modal-footer pt-3">
					<button type="button" class="btn btn-link insertClose" data-dismiss="modal">닫기</button>
					<button type="button" id="insertUpdateBtn" class="btn btn-primary">작업 등록</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /scrollable modal -->

				

</div>
<!-- /main content -->

<script>

$(function(){

function searchCheck(){

    var hole = $("input[name='holeBt']:checked").map(function(){return $(this).val();}).get();// $('.holeBt.active').text(); //holename    
    var course = $("input[name='courseTypeBt']:checked").map(function(){return $(this).val();}).get();// $('.courseTypeBt.active').text(); // 코스종류
    var workClass = $("input[name='classBt']:checked").map(function(){return $(this).val();}).get();// $('.classBt.active').text(); // 작업분류
    var workType = $("input[name='typeBt']:checked").map(function(){return $(this).val();}).get();// $('.typeBt.active').text(); // 작업종류
	
	if(hole.length == 0 && course.length == 0 && workClass.length == 0 && workType.length == 0){
		workAllList();
	}//if end
}

function resetModal(){
	$(".courseTypeBt").parent().removeClass("active");			
	$(".holeBt").parent().removeClass("active");			
	$(".classBt").parent().removeClass("active");			
	$(".typeBt").parent().removeClass("active");

	$("#modal_scrollable input[type='checkbox']").prop('checked',false)
	
	$('.img').val('');
	$('.comment').val('');
	$('.brandName').val('default');
	$('.holeBtSelect').empty();
	$('.courseTypeBtSelect').empty();
	$('.classBtSelect').empty();
	$('.typeBtSelect').empty();

	$('#removeImgList').val('');

	$('#imgList').empty();
}

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
	$("#modalTitle").text('작업일정 추가')
	$("#insertUpdateBtn").text("작업 등록")
	$("#insertUpdateBtn").removeClass("workUpdate")
	$("#insertUpdateBtn").addClass("workInsert")
	resetModal()
});

//코스 위치2 active 클래스 추가
$(document).on('click','.searchHoleBt,.searchCourseTypeBt,.searchClassBt,.searchTypeBt',function() {
	console.log($(this).parent().hasClass("active"))
	//클릭시 이미 active 클래스면 active 제거
	
	if($(this).parent().hasClass("active")){
		$(this).parent().removeClass("active");		
	}else{
	    $(this).parent().addClass("active");
	}//if end
	
	var searchHole = $("input[name='searchHoleBt']:checked").map(function(){return $(this).val();}).get();
	var searchCourseType = $("input[name='searchCourseTypeBt']:checked").map(function(){return $(this).val();}).get();
	var searchClass = $("input[name='searchClassBt']:checked").map(function(){return $(this).val();}).get();
	var searchType = $("input[name='searchTypeBt']:checked").map(function(){return $(this).val();}).get();
	
	workSelectList(searchHole, searchCourseType, searchClass, searchType);
	//searchCheck();
});


//코스종류 active 클래스 추가
$(document).on('click','.holeBt,.courseTypeBt,.classBt,.typeBt',function() {
	//클릭시 이미 active 클래스면 active 제거
	console.log('호출')
	
	let target = $(this).attr('class');
	let value = $(this).val();

	console.log(target)
	console.log(value)
	
	if($(this).parent().hasClass("active")){
		$(this).parent().removeClass("active");
		$("."+target+"Select").find('input[value="'+value+'"]').parent().remove();
	}else{
	    $(this).parent().addClass("active");
		$("."+target+"Select").append($(this).parent().clone());
	}//if end
});

$(document).on('click',".holeBtSelect label,.courseTypeBtSelect label,.classBtSelect label,.typeBtSelect label",function() {
	let value = $(this).find('input').val();
	$(this).closest('.modal-body').find('input[value="'+value+'"]').click();
	//$(this).remove();
})

//작업종류에 따라 브랜드 보여주기
function getBrand(worktype){
    $.ajax({
        url: '/management/getBrand',
        type: 'POST',
        data: {worktype: worktype},
        dataType: "json",
        beforeSend : function(xhr){
        	xhr.setRequestHeader(header, token);
        },
        success: function(data) {
            console.log(data);
            updateBrand(data);
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
function updateBrand(data){
	//사용제품 브랜드 
	let brand = "";
	
       for(var i=0; i<data.length; i++){
		brand += `<option>\${data[i].brandName}</option>`;
       }
   	// HTML 요소 선택 및 결과 삽입
	let dataElement = document.querySelector('.brandName');
	dataElement.innerHTML = brand;
}//updatebrand() end



$(document).on('click','.workInsert,.workUpdate',function() {
    var formData = new FormData();
    var dateRange = $('.dateInput:visible').val(); // 작업날짜 
    var dates = dateRange.split(' ~ '); // 작업날짜 ~ 빼기
    var workStart = dates[0]; // 작업시작날짜
    var workEnd = dates[1]; // 작업종료날짜
    var hole = $("input[name='holeBt']:checked").not('.selectItem input[name="holeBt"]:checked').map(function(){return $(this).val();}).get();// $('.holeBt.active').text(); //holename    
    var course = $("input[name='courseTypeBt']:checked").not('.selectItem input[name="courseTypeBt"]:checked').map(function(){return $(this).val();}).get();// $('.courseTypeBt.active').text(); // 코스종류
    var workClass = $("input[name='classBt']:checked").not('.selectItem input[name="classBt"]:checked').map(function(){return $(this).val();}).get();// $('.classBt.active').text(); // 작업분류
    var workType = $("input[name='typeBt']:checked").not('.selectItem input[name="typeBt"]:checked').map(function(){return $(this).val();}).get();// $('.typeBt.active').text(); // 작업종류
    var workBrand = /*$("input[name='searchHoleBt']:checked").map(function(){return $(this).val();}).get();*/ $('.brandName option:selected').text(); // 작업브랜드
    var comment = $('.comment').val(); //작업 메모

    // formData에 파라미터 추가
    formData.append("workStart", workStart);
    formData.append("workEnd", workEnd);
    formData.append("hole", hole);
    formData.append("course", course);
    formData.append("workClass", workClass);
    formData.append("workType", workType);
    formData.append("workBrand", workBrand);
    formData.append("comment", comment);

    // 파일 추가
    var files = $('.img')[0].files;

    $.each(files, function(i, file) {
        formData.append('files[]', file);
    });


	let token = $("input[name='_csrf']").val();
	let header = "X-CSRF-TOKEN";
	
	//이미지 파일 길이
	var fileLength = $('.img').get(0).files.length;

	var requestURI = "/management/insertWork"
	//$(this).hasClass('workInsert')
	if($(this).hasClass('workUpdate')){
		requestURI = "/management/updateWork"

		var removeImgList = $('#removeImgList').val().substring(1);
		formData.append("removeImgList", removeImgList);
		formData.append("workNo",$('#workNo').val())
	}
	
	//이미지 첨부 필수. 첨부 안할시 alert창
	if(fileLength == 0 && $(this).hasClass('workInsert')){
		alert("이미지를 첨부해 주세요.");
		return;
	}
	
    $.ajax({
        url: requestURI,
        method: 'POST',
        enctype: 'multipart/form-data',
    	data: formData,		
    	processData: false,
    	contentType: false,
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


	
});//workreport.click function


//모든작업 조회
function workAllList(){

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
    $.ajax({
        url: '/management/workReportAllList',
        method: 'GET',
        beforeSend : function(xhr){
        	xhr.setRequestHeader(header, token);
        },
        success: function(data) {
        	console.log(data);
        	workReportAllList(data);
        },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    },
	    complete: function(){
	    	Gallery.init();
		}
    });//ajax end
}//workAllList() end

workAllList()
//선택작업 조회
function workSelectList(searchHole, searchCourseType, searchClass, searchType){

	var param = {
		searchHole: searchHole,
		searchCourseType: searchCourseType,
		searchClass: searchClass,
		searchType: searchType
	}

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
    $.ajax({
        url: '/management/searchWorkReportListAjax',
        method: 'POST',
        data: param,
        beforeSend : function(xhr){
        	xhr.setRequestHeader(header, token);
        },
        success: function(data) {
        	console.log(data);
        	workReportAllList(data.list);
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
		let imgPath = `\${data[i].workReportImageList[0].filePath}`;
		var fileName = imgPath.substring(2);
		console.log(fileName);

		
		//하루종일 날짜와 시간별 날짜 구분하기
		if(`\${data[i].workStart}`.slice(11, 16) == '00:00' && `\${data[i].workEnd}`.slice(11, 16) == '00:00'){
			dateStart = `\${data[i].workStart}`.slice(0, 10);
			dateEnd = `\${data[i].workEnd}`.slice(0, 10);			
		}else{
			dateStart = `\${data[i].workStart}`.slice(0, 16);
			dateEnd = `\${data[i].workEnd}`.slice(0, 16);	
		}
		let dateWorkNo = `\${data[i].workNo}`
		console.log(dateWorkNo);

		var workHoles = (data[i].workHole+"").split(',');
		var workTypes = (data[i].workType+"").split(',');
		var workCourses = (data[i].workCourse+"").split(',');
		var workClasss = (data[i].workClass+"").split(',');
		

		allWorkList += `
			<div class="col-lg-12">
				<div class="card more-round">
					<div class="card-header bg-white">
						<span class="font-weight-semibold float-left ml-1 mr-2 font-weight-bold">\${data[i].userId}</span>
						<div class="list-icons float-right ml-3">
							<div class="dropdown position-static">
								<a href="#" class="list-icons-item" data-toggle="dropdown" aria-expanded="false"><i class="icon-more2 mr-1"></i></a>
								<div class="dropdown-menu dropdown-menu-right" style="">
									<a class="dropdown-item workReportUpdate" data-toggle="modal" data-target="#modal_scrollable" value="\${dateWorkNo}">수정</a>
									<a href="#" class="dropdown-item workReportDelete" value="\${dateWorkNo}">삭제</a>
								</div>
							</div>
						</div>
						<span class="float-left text-muted">\${data[i].writeAt}</span>
					</div>
					<div class="card-body">
						<h6 class="card-title font-weight-bold">코스 \${data[i].workHole} \${data[i].workType} 작업</h6>
						<div class="row">
							<label class="col-form-label font-weight-bold col-lg-2">작업 기간</label>
							<label class="col-form-label col-lg-10">\${dateStart} - \${dateEnd}</label>
						</div>
		
						<div class="row">
							<label class="col-form-label font-weight-bold col-lg-2">작업 내용</label>
							<div class="col-form-label col-lg-10">
		`
		for(var j=0;j<workHoles.length;j++){
			allWorkList +=`<span class="badge badge-info">Hole \${workHoles[j]}</span> <!--코스 위치 라벨-->	`				
		}
		for(var j=0;j<workCourses.length;j++){
			allWorkList +=`<span class="badge badge-success">\${workCourses[j]}</span> <!--코스 위치 라벨-->	`				
		}
		for(var j=0;j<workClasss.length;j++){
			allWorkList +=`<span class="badge badge-warning">\${workClasss[j]}</span> <!--코스 위치 라벨-->	`				
		}
		for(var j=0;j<workTypes.length;j++){
			allWorkList +=`<span class="badge badge-secondary">\${workTypes[j]}</span> <!--코스 위치 라벨-->	`				
		}

		allWorkList +=`
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
							<div class="row col-lg-12">
		`
		if(data[i].workReportImageList){
			for(let j=0;j<data[i].workReportImageList.length;j++){
			if(!data[i].workReportImageList[j].filePath){
				continue;
			}
			let imgP = data[i].workReportImageList[j].filePath.substring(2);
			let oriName = data[i].workReportImageList[j].oriName;
				allWorkList += `
									<div class="col-lg-4">
										<div class="card">
											<div class="card-img-actions m-1">
												<img class="card-img img-fluid" src="\${imgP}" alt="">
												<div class="card-img-actions-overlay card-img">
													<a href="\${imgP}" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery\${i}">
														<i class="icon-plus3"></i>
			      									</a>
			      									<a href="#" class="btn btn-outline-white border-2 btn-icon rounded-pill ml-2 downloadImage" data-filepath="\${imgP}" data-oriname="\${oriName}">
			      										<i class="icon-link"></i>
			      									</a>
			      								</div>
			      							</div>
			      						</div>
			      					</div>
				`
			}
		}
		allWorkList += `
								<!--
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
		      					</div>-->
		      					
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

$(document).on('click','.workReportUpdate',function(){
    //alert("수정");
    
    $("#modalTitle").text('작업일정 수정')
	$("#insertUpdateBtn").text("작업 수정")
	$("#insertUpdateBtn").removeClass("workInsert")
	$("#insertUpdateBtn").addClass("workUpdate")
    
    let workNo = $(this).attr('value');
    workReportUpdateList(workNo);
})


//수정작업 조회
function workReportUpdateList(workNo){

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	$('#workNo').val(workNo)
	
    $.ajax({
        url: '/management/workReportUpdateList',
        method: 'GET',
        data: {workNo: workNo},
        beforeSend : function(xhr){
        	xhr.setRequestHeader(header, token);
        },
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

	resetModal();
	
	let hole = `\${data[0].workHole}`.split(',');
	let course = `\${data[0].workCourse}`.split(',');
	let classType = `\${data[0].workClass}`.split(',');
	let type = `\${data[0].workType}`.split(',');
	let brand = `\${data[0].workBrand}`;
	let workTime = `\${data[0].workStart}` + ' ~ ' + `\${data[0].workEnd}`;

	
	$("#modal_scrollable .dateInput").each(function() {
		$(this).val(workTime);
	});
	
	for(var i=0;i<hole.length;i++){
		$('#modal_scrollable .holeBt[value="'+hole[i]+'"]').click();
	}

	for(var i=0;i<course.length;i++){
		$('#modal_scrollable .courseTypeBt[value="'+course[i]+'"]').click();
	}

	for(var i=0;i<classType.length;i++){
		$('#modal_scrollable .classBt[value="'+classType[i]+'"]').click();
	}

	for(var i=0;i<type.length;i++){
		$('#modal_scrollable .typeBt[value="'+type[i]+'"]').click();
	}

	$('.comment').val(data[0].workComment);

	let imgList = data[0].workReportImageList;
	
	for(var i=0;i<imgList.length;i++){
		var downLoadPath = encodeURI("/management/downloadImage?filePath="+imgList[i].filePath.substring(2)+"&downloadName="+imgList[i].oriName);
		$('#imgList').append(`<a href="\${downLoadPath}">\${imgList[i].oriName}</a>`)
		$('#imgList').append(`<span class="removeImg" data-imgno="\${imgList[i].imgNo}">x</span>`)
	}

}//workReportUpdateList() end



//작업 삭제
$(document).on('click','.workReportDelete',function(){
    //alert("수정");
    let workNo = $(this).attr('value');
    console.log(workNo);
	if (confirm("작업을 삭제하시겠습니까?") == true){    //확인
		deleteCheck(workNo);
	}else{   //취소
		return false;
	}
})

function deleteCheck(workNo){
	
	let token = $("input[name='_csrf']").val();
	let header = "X-CSRF-TOKEN";
	
    $.ajax({
        url: '/management/workReportDelete',
        type: 'POST',
        data: {workNo: workNo},
        success: function(data) {
            console.log(data);
            alert("작업을 삭제하였습니다");
            workAllList();
        },
		beforeSend : function(xhr) {  
			xhr.setRequestHeader(header, token);
		},
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
}//deleteCheck() end


$(document).on('click','.downloadImage',function (e) {

	e.preventDefault();
	
    var filePath = $(this).data('filepath')
    var downloadName = $(this).data('oriname');


	location.href = encodeURI("/management/downloadImage?filePath="+filePath+"&downloadName="+downloadName)

});

$(document).on('click','.removeImg',function(){
	let imgNo = $(this).data('imgno')
	$(this).prev().remove();
	$(this).remove();

	$('#removeImgList').val($('#removeImgList').val()+","+imgNo)
	console.log($('#removeImgList').val())
})

})
</script>
<style>
label input[type="checkbox"]{
	/*display: none;*/
}
label {
	cursor: pointer;
	-webkit-user-select:none;
	-moz-user-select:none;
	-ms-user-select:none;
	user-select:none
}

#imgList a{
    display: inline-block;
    padding: 3px;
    margin-top: 5px;
    margin-right: 5px;
}
#imgList span{
    margin-top: 5px;
    padding: 3px;
    display: inline-block;
    cursor: pointer;
    background: lightgray;
    color: white;
    line-height: 11px;
}
</style>