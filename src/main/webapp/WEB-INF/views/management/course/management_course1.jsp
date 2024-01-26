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
				<h6 class="mr-2 mt-1 font-weight-semibold float-left ml-2">코스관리 작업 일정표 - 달력</h6>
				<div class="btn-group float-right mr-2">
					<button type="button" class="btn btn-light active" onclick="location.href='/management/course1'">달력</button>
					<button type="button" class="btn btn-light" onclick="location.href='/management/course2'">리스트</button>
				</div>

				
			</div>

		</div>
	</div>
	<!-- /page header -->


	<!-- Content area -->
	<div class="content">
		<!-- Basic card -->
              <!-- Basic view -->
			<div class="card">						
				<div class="card-body">
					<div class="fullcalendar-event-colors"></div>
				</div>
			</div>
			<!-- /basic view -->
		<!-- /basic card -->
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
							<c:forEach items="${list}" var="holeInfo">
							<label class="badge badge-info">${holeInfo.holeName}<input class="holeBt" type="checkbox" name="holeBt" value="${holeInfo.holeNo}"></label>
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
							<textarea rows="3" cols="3" class="form-control comment" placeholder="작업 내용을 입력해 주세요."></textarea>
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
		let clone = $(this).parent().clone();
		clone.addClass('mr-1')
	    $(this).parent().addClass("active");

		$("."+target+"Select").append(clone);
	}//if end
});

$(document).on('click',".holeBtSelect label,.courseTypeBtSelect label,.classBtSelect label,.typeBtSelect label",function() {
	let value = $(this).find('input').val();
	$(this).closest('.modal-body').find('input[value="'+value+'"]').click();
	//$(this).remove();
})


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
        	var searchHole = $("input[name='searchHoleBt']:checked").map(function(){return $(this).val();}).get();
        	var searchCourseType = $("input[name='searchCourseTypeBt']:checked").map(function(){return $(this).val();}).get();
        	var searchClass = $("input[name='searchClassBt']:checked").map(function(){return $(this).val();}).get();
        	var searchType = $("input[name='searchTypeBt']:checked").map(function(){return $(this).val();}).get();
        	var searchDate = $("#searchDate").val();
        	
        	workSelectList(searchHole, searchCourseType, searchClass, searchType,searchDate);
        },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end


	
});//workreport.click function
	


//배열 색상 정의
var colors = ['#d662a2', '#2cbacc', '#257e4a', '#ff9f89'];

//전역 변수로 선언
var eventColors = [];

function workAllList(){
  $.ajax({
      url: '/management/workReportAllList',
      method: 'GET',
      success: function(data) {
        console.log(data);
        // data를 반복하여 eventColors 배열에 추가합니다.
        for(let i = 0; i < data.length; i++) {
            console.log(data[i])
	        eventColors.push({
	           title: 'Hole ' + data[i].workHole + '  ' + data[i].workCourse + '  ' + data[i].workClass + '  ' + data[i].workType,
	           start: data[i].workStart,//.replace(" ","T"),
	           end: data[i].workEnd,//.replace(" ","T"),
	           color: colors[i % colors.length],
	           workNo : data[i].workNo,
	        });
        }
        // AJAX 호출이 성공하면 FullCalendar를 초기화합니다.
        FullCalendarStyling.init();
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert(jqXHR.status);
        alert(jqXHR.statusText);
        alert(jqXHR.responseText);
        alert(jqXHR.readyState);
      }
  });
}

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
	let workTime = `\${data[0].workStart.substring(0,16)}` + ' ~ ' + `\${data[0].workEnd.substring(0,16)}`;

	if(data[0].workStart.substring(11,16)=="00:00" && data[0].workEnd.substring(11,16)=='00:00'){
		$('.allDayWork').click();
		workTime = data[0].workStart.substring(0,11) + ' ~ ' + data[0].workEnd.substring(0,11)
	}
	
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

const FullCalendarStyling = function() {
    // Setup module components

    // External events
    const _componentFullCalendarStyling = function() {
        if (typeof FullCalendar == 'undefined') {
            console.warn('Warning - Fullcalendar files are not loaded.');
            return;
        }

        // Define element
        const calendarEventColorsElement = document.querySelector('.fullcalendar-event-colors');

        // Initialize
        if(calendarEventColorsElement) {
            const calendarEventColorsInit = new FullCalendar.Calendar(calendarEventColorsElement, {
            	locale: 'ko',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    //right: 'dayGridMonth,dayGridWeek,dayGridDay',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                navLinks: true, // can click day/week names to navigate views
                businessHours: true, // display business hours
                editable: false,
                selectable: false,
                eventStartEditable : false,
                direction: document.dir == 'rtl' ? 'rtl' : 'ltr',
                events: eventColors,
                height: 850,
                defaultDate: '2023-10-01',
                displayEventTime : true,
	       	    eventClick: function(info) {
	       	      let workNo = info.event._def.extendedProps.workNo
	       	   	  workReportUpdateList(workNo)
	       	   	  $('#modal_scrollable').modal('show');
		       	  //console.log('이벤트클릭')
	       	      return false;
	       	  	}
            });

            // Init
            calendarEventColorsInit.render();
			calendarEventColorsInit.gotoDate('2023-10-01');
        }

    };

    // Return objects assigned to module

    return {
        init: function() {
            _componentFullCalendarStyling();
        }
    }
}();

$(document).ready(function() {
    // 페이지가 로드될 때 workAllList 함수 호출
	workAllList();

	if('${param.workType}'!='' && '${param.holeNo}'!='' && '${param.courseType}' !=''){
		$('#modal_scrollable').modal('show');
		$('#modal_scrollable .holeBt[value="${param.holeNo}"]').click()
		$('#modal_scrollable .courseTypeBt[value="${param.courseType}"]').click()
		$('#modal_scrollable .typeBt[value="${param.workType}"]').click()
	}
});

</script>
<style>
label input[type="checkbox"]{
	display: none;
}
label.badge {
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