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
								<input type="text" class="form-control daterange-basic" value=""> 
								
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
							<textarea rows="3" cols="3" class="form-control comment" placeholder="작업 내용을 입력해 주세요."></textarea>
						</div>
					</div>
				</div>

				<div class="modal-footer pt-3">
					<button type="button" class="btn btn-link" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary workreport">작업 등록</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /scrollable modal -->

</div>
<!-- /main content -->


<script>


<!-- twentytwenty -->
	$(function(){
		$(".twentytwenty-container[data-orientation!='vertical']").twentytwenty({default_offset_pct: 0.5});
		$(".twentytwenty-container[data-orientation='vertical']").twentytwenty({default_offset_pct: 0.5, orientation: 'vertical'});
	});
<!-- twentytwenty end -->

	
	//작업등록 버튼 클릭시 리셋
	$(".work").click(function() {
		$(".coursetypebt").removeClass("active");			
		$(".holebt").removeClass("active");			
		$(".classbt").removeClass("active");			
		$(".typebt").removeClass("active");
		$('.daterange-basic').val('');
		$('.img').val('');
		$('.comment').val('');
		//$('.brandname').val('default');
	});
	
	//코스 위치 active 클래스 추가
	$(".holebt").click(function() {
	    $(this).toggleClass("active");
	});
	
	
	//코스종류 active 클래스 추가
	$(".coursetypebt").click(function() {
		$(".coursetypebt").removeClass("active");			
		$(this).addClass("active");			
	});
	
	
	//작업분류 active 클래스 추가
	$(".classbt").click(function() {
	    $(this).toggleClass("active");
	});

			
	//작업종류 active 클래스 추가
	$(".typebt").click(function() {
	    var worktype = $(this).data('value');
	    //var worktype2 = $('.typebt.active').text(); 안되는 이유?
	    //console.log(worktype2)
		getbrand(worktype);
		$(".typebt").removeClass("active");			
		$(this).addClass("active");			
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
			brand += `<option value="opt1">\${data[i].brand_Name}</option>`;
        }
    	// HTML 요소 선택 및 결과 삽입
		let dataElement = document.querySelector('.brandname');
		dataElement.innerHTML = brand;
	}//updatebrand() end
	
	
	
	$(".workreport").click(function() {
		var dateRange = $('.daterange-basic').val(); // 작업날짜 
		var dates = dateRange.split(' - '); // 작업날짜 - 빼기
		var workstart = dates[0]; // 작업시작날짜
		var workend = dates[1]; // 작업종료날짜
		var hole = $('.holebt.active').text(); //holename
		var course = $('.coursetypebt.active').text(); // 코스종류
		var workclass = $('.classbt.active').text(); // 작업분류
		var worktype = $('.typebt.active').text(); // 작업종류
		var oriImgName = $('.img').val(); //작업 이미지
		var comment = $('.comment').val(); //작업 이미지
		//alert(hole);
		let token = $("input[name='_csrf']").val();
		let header = "X-CSRF-TOKEN";

		
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
	        },
		    error: function(jqXHR, textStatus, errorThrown) {
		        alert(jqXHR.status);
		        alert(jqXHR.statusText);
		        alert(jqXHR.responseText);
		        alert(jqXHR.readyState);
		    }
	    });//ajax end
		
		
		
	});
	

	


</script>







