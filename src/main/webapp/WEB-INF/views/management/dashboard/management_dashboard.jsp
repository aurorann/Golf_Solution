<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="userInfo"/>
</sec:authorize>

<!-- Main content -->
<div class="content-wrapper">

	<!-- Page header -->
	<div class="page-header page-header-light">
		<div class="page-header-content d-sm-flex">
			<div class="page-title">
				<div class="btn-group mr-2 float-left col-lg-12" data-toggle="buttons" id="tabs">
					<a class="nav-link btn btn-light tabBt active" data-id="solid-tab1" >통합 대시보드</a>
					<a class="nav-link btn btn-light tabBt" data-id="solid-tab2" >작업 알람 리스트</a>
				</div>
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
				<div class="row mb-2">
					<div class="col-2">
						<select class="custom-select searchType">
							<option value="date">날짜</option>
							<option value="holeNo">코스명</option>
							<option value="course">코스 구분</option>
							<option value="type">권장작업</option>
							<option value="class">작업명</option>
				        </select>
					</div>
					<div class="col-3 searchInput searchDate">
						<div class="input-group">
							<span class="input-group-prepend">
								<span class="input-group-text"><i class="icon-calendar22"></i></span>
							</span>
							<input type="text" class="form-control daterange-basic search-daterange" value=""> 
						</div>
					</div>
					<div class="col-3 searchInput searchText" hidden>
						<div class="input-group">
							<input type="text" class="form-control search-text" value=""> 
						</div>
					</div>
					<div class="col-3 searchInput searchCourse" hidden>
						<div class="input-group">
							<select class="custom-select selectCourse">
								<option value="green">Green</option>
								<option value="fairway">Fairway</option>
					        </select>
						</div>
					</div>
					<div class="col-3 searchInput searchHole" hidden>
						<div class="input-group">
							<select class="custom-select selectHole">
					            <option value="0">전체코스</option>
								<c:forEach items="${list}" var="holename">
					            	<option value="${holename.holeNo}"><c:out value="${holename.holeName}"></c:out></option>
					            </c:forEach>
					        </select>
						</div>
					</div>
					<div class="col-1">
						<button type="button" class="btn btn-primary btn-block searchBt pb-2 pt-2">검색</button>
					</div>
				</div>
				
				<div class="card">
					<div class="card-header notiCount">
						<h5 class="card-title">작업 알람 리스트</h5>
						<span class="completeCnt listCount"></span>
					</div>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>번호</th>
									<th>작성일</th>
									<th>작업기한</th>
									<th>작업제목</th>
									<th>코스명</th>
									<th>코스 구분</th>
									<th>권장 작업</th>
									<th>작업명</th>
									<sec:authorize access="hasRole('ROLE_ADMIN')">
									<th>작업자</th>
									</sec:authorize>
									<sec:authorize access="!hasRole('ROLE_ADMIN')">
									<th>지시자</th>
									</sec:authorize>
									<th>작업 상태</th>
									<sec:authorize access="hasRole('ROLE_ADMIN')">
									<th>삭제</th>
									</sec:authorize>
								</tr>
							</thead>
							<tbody id="logList">
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>		
							</tbody>
						</table>
					</div>

					<div class="mt-3 mb-3 text-center">
						<ul class="pagination pagination-flat align-self-center" id="pager">
							<li class="page-item active" onclick="getLogList(1, currentSearchType, currentSearchText)"><a href="#" class="page-link">1</a></li>
							<li class="page-item" onclick="getLogList(2, currentSearchType, currentSearchText)"><a href="#" class="page-link">2</a></li>
							<li class="page-item" onclick="getLogList(3, currentSearchType, currentSearchText)"><a href="#" class="page-link">3</a></li>
							<li class="page-item" onclick="getLogList(4, currentSearchType, currentSearchText)"><a href="#" class="page-link">4</a></li>
							<li class="page-item" onclick="getLogList(5, currentSearchType, currentSearchText)"><a href="#" class="page-link">5</a></li>
						</ul>
					</div>

				</div>
				
				<!-- Scrollable modal -->
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<div class="" style="position:fixed; bottom:30px; right:30px; z-index:1;">
					<button type="button" class="btn btn-round work" data-toggle="modal" data-target="#modal_scrollable">작업예약<br>등록<br><i class="fas fa-plus mt-2"></i></button>
				</div>
				</sec:authorize>
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div id="modal_scrollable" class="modal fade" tabindex="-1">
					<div class="modal-dialog modal-dialog-scrollable">
						<div class="modal-content">
							<div class="modal-header pb-3">
								<h5 class="modal-title" id="modalTitle">작업일정 추가</h5>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
			
							<div class="modal-body py-0">
								<input type="hidden" name="notiNo" id="notiNo" value="">
								
								<div class="form-group row mt-3">
									<label class="col-form-label col-lg-2">작업 제목</label>
									<div class="col-lg-10">
										<div class="input-group">
											<input type="textbox" class="form-control notiTitle" value="" style="display:show">
										</div>
									</div>
								</div>
								
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
									<label class="col-form-label col-lg-2">작업자</label>
									<div class="col-lg-10">
										<select class="custom-select workerName">
											<!-- 작업자 선택 -->
											<option value='' selected>작업자 선택</option>
											<c:forEach items="${getWorkerList}" var="worker">
											<option value='${worker.userNo}' selected>${worker.userName}</option>
											</c:forEach>
										</select>
									</div>
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
		</div>

		<!-- /basic card -->


	</div>
	<!-- /content area -->
	


</div>
<!-- /main content -->

<script>



function nvl(data){
	if(!data || data=='null'){
		return "";
	}else{
		return data;
	}
}

function postToPage(data) {
    // form 요소 생성
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "/management/course1");

    // 데이터를 form의 input 요소로 변환
    for (var key in data) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", data[key]);
        form.appendChild(hiddenField);
    }

    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "${_csrf.parameterName}");
    hiddenField.setAttribute("value", "${_csrf.token}");
    form.appendChild(hiddenField);

    // form을 body에 추가
    document.body.appendChild(form);

    // form 제출
    form.submit();
}//postToPage() end


//modal 관련
function resetModal(){
	$(".courseTypeBt").parent().removeClass("active");			
	$(".holeBt").parent().removeClass("active");			
	$(".classBt").parent().removeClass("active");			
	$(".typeBt").parent().removeClass("active");

	$("#modal_scrollable input[type='checkbox']").prop('checked',false)
	
	$('.notiTitle').val('');
	$('.comment').val('');
	$('.workerName').val('');
	$('.holeBtSelect').empty();
	$('.courseTypeBtSelect').empty();
	$('.classBtSelect').empty();
	$('.typeBtSelect').empty();
}

//작업등록 버튼 클릭시 modal 리셋
$(".work").click(function() {
	$("#modalTitle").text('작업일정 추가')
	$("#insertUpdateBtn").text("작업일정 등록")
	$("#insertUpdateBtn").removeClass("workUpdate")
	$("#insertUpdateBtn").addClass("workInsert")
	resetModal();
});

	  
    // 페이지가 로드될 때 getAllData 함수 호출
	var category = $(".categorybt.active").val();
	var listsort = $(".listsort.active").val();
	getAllData(category, listsort);

	var currentSearchType = null;
	var currentSearchText = null;
	
	var role = "${userInfo.userGrade}";

	getLogList = function(curPage, searchType, searchText){
		if(!curPage){curPage=1}

		var url = "${pageContext.request.contextPath}/management/getNotiList";
		var data = "curPage="+curPage;
		
		if(searchType && searchText){
			url = "${pageContext.request.contextPath}/management/getSearchNotiList";
			data = {
				searchType: searchType,
				searchText: searchText,
				curPage: curPage
			};
		}
		
		$.ajax({
			url: url,
			data: data,
			success: function(result){
				console.log("dashboard result 불러오기");
				console.log(result);
				console.log("result 불러오기 끝");
				var list = result.list;
				
				var listTotalCnt = list.length;
				var listCompleteCnt = 0;
				
				var table = ''
				$.each(list,function(index,item){
					if(item.notiState == '완료'){
						listCompleteCnt++;
					}
					
					
					if(role == '관리자'){
						table+=`<tr class="notiList notiData" data-notino="\${item.notiNo}" data-holeno="\${item.notiHole}" data-coursetype="\${item.notiCourse}" data-worktype="\${item.notiType}">`
					}else{
						table+=`<tr class="notiList writeWork" data-notino="\${item.notiNo}" data-holeno="\${item.notiHole}" data-coursetype="\${item.notiCourse}" data-worktype="\${item.notiType}">`
					}
					table+=`<td>\${nvl(item.notiNo)}</td>`
					table+=`<td>\${nvl(item.tm)}</td>`
					table+=`<td>\${nvl(item.deadlineStart)}</td>`
					table+=`<td>\${nvl(item.notiTitle)}</td>`
					table+=`<td>Hole \${nvl(item.notiHole)}</td>`
					table+=`<td>\${nvl(item.notiCourse)}</td>`
					table+=`<td>\${nvl(item.notiType)}</td>`
					table+=`<td>\${nvl(item.notiClass)}</td>`
					table+=`<td>\${nvl(item.userList[0].userName)}</td>`
					if(role == '관리자'){
						table+=`<td>\${nvl(item.notiState)}</td>`
						table+=`<td><button type="button" class="btn btn-danger notiDel">삭제</button></td>`
					}else{
						if(item.notiState == '대기'){
							table+=`<td><select class="custom-select cursorNone" onclick=event.stopPropagation()>`
							table+=`<option selected>\${nvl(item.notiState)}</option>`
							table+=`<option>완료</option>`
						}else{
							table+=`<td><select class="custom-select cursorNone" style="background:#E9F5FE;" onclick=event.stopPropagation()>`
							table+=`<option>대기</option>`
							table+=`<option selected>\${nvl(item.notiState)}</option>`
						}

						table+=`</td>`	
					}
					table+= `</tr>`
				})
				
				$(".completeCnt").text("완료 갯수 "+listCompleteCnt+" / "+"전체 갯수 "+listTotalCnt);
				
				$('#logList').html(table);
				
				var pager = result.pager;
				
				var pagerContent = "";
				if(pager.curRange!=1){pagerContent+="<li class='page-item' onclick='getLogList("+(pager.startPage-1)+", currentSearchType, currentSearchText)'><a href='#' class='page-link'><<a></li>"}
				
				for(i=pager.startPage;i<=pager.endPage;i++){
					if(i!=pager.curPage){pagerContent+="<li class='page-item' onclick='getLogList("+i+", currentSearchType, currentSearchText)'><a href='#' class='page-link'>"+i+"</a></li>"}
					if(i==pager.curPage){pagerContent+="<li class='page-item active' onclick='getLogList("+i+", currentSearchType, currentSearchText)'><a href='#' class='page-link'>"+i+"</a></li>"}
				}
				
				if(pager.curRange!=pager.rangeCnt){pagerContent+="<li class='page-item' onclick='getLogList("+(pager.endPage+1)+", currentSearchType, currentSearchText)'><a href='#' class='page-link'>></a></li>"}
				
				if(table!=''){
					$("#pager").html(pagerContent);
				}else{
					$('#logList').html('<tr><td colspan="12">데이터가 없습니다.</td></tr>');
					$("#pager").html('');
				}
			},
			error:function(request,status,error){
			   alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
				
		})
	}

	$(".searchLog .searchText").on("keypress", function(event){
	    if(event.which !== 13) {
	        return;
	    }
	    
	    var searchType = $(".searchLog .searchType option:selected").val();
	    var searchText = $(".searchLog .searchText").val();
	    
	    currentSearchType = searchType;
	    currentSearchText = searchText;
	    
	    getLogList(1, searchType, searchText)
	});

	//noti검색 버튼 클릭
	$(document).on("click keypress", ".searchBt", function() {
		if(event.type === 'keypress' && event.which !== 13) {
	        return;
	    }
	    
		var searchType = $('.searchType option:selected').val();
		var searchText = $('.searchInput:not([hidden]) input').val() || $('.searchInput:not([hidden]) select').val();

		console.log(searchType);
		console.log(searchText);
		
		getLogList(1, searchType, searchText)
	})
	
	getLogList(1)

	
	$(document).on('click','.writeWork',function(){
		var workType = $(this).data('worktype')
		var holeNo = $(this).data('holeno')
		var courseType = $(this).data('coursetype')

		var param = {
			workType : workType,
			holeNo : holeNo,
			courseType : courseType
		}
		
		postToPage(param)
	})
	
	
	$(document).on('click','.notiData',function(){
		var notiNo = $(this).data('notino')
		
		selectNotiWorkData(notiNo);
	})
	
	 var previousValue;//선택값 저장변수
	$(document).on('change', '.cursorNone',function() {
		previousValue = this.value;
        var confirmMessage = confirm("변경하시겠습니까?");
        if (confirmMessage) {
        	var formData = new FormData();
            var notiNo = $(this).closest('tr').data('notino');
            var notiState = $(this).val();
            console.log("notiNo는 "+notiNo);
            console.log("notiState는 "+notiState);
        	formData.append("notiNo", notiNo);
        	formData.append("notiState", notiState);
        	updateNotiState(notiNo, notiState);
        	updateNotiState(formData);
        } else {
        	$(this).val(previousValue);
        }
    });
	 
	//noti 삭제
    $(document).on('click','.notiDel',function(event){
        event.stopPropagation();
        var confirmMessage = confirm("삭제하시겠습니까?");
        if (confirmMessage) {
            var notiNo = $(this).closest('tr').data('notino');
            console.log("noti삭제"+notiNo);
            deleteNoti(notiNo)
            getLogList()
        }
    });
	 
	 

	getLogList(1)


$(document).on('click', ".tabBt", function() {
	$('.tabBt').removeClass('active');
	$('.tab-pane').removeClass('show active');
	
	// 클릭된 요소의 ID와 동일한 ID를 가진 .tab-pane 요소에 'show'와 'active' 클래스 추가
	var tabId = $(this).data('id');
	$('#' + tabId).addClass('show');
	$('#' + tabId).addClass('active');
});


/*
$('#tabs a').click(function(e){
	console.log('aa')
	e.stopPropagation()
	$('#tabs a').removeClass('active')
	$(this).addClass('active')
	console.log($(this).attr('href'))
	$('.tab-pane').removeClass('show')
	$('.tab-pane').removeClass('active')
	$($(this).attr('href')).addClass('show')
	$($(this).attr('href')).addClass('active')
})
*/




function updateNotiState(notiNo, notiState){
	let token = $("input[name='_csrf']").val();
	let header = "X-CSRF-TOKEN";
    $.ajax({
        url: '/management/updateNotiState',
        method: 'POST',
    	data: {notiNo: notiNo, notiState: notiState},
		beforeSend : function(xhr) {  
			xhr.setRequestHeader(header, token);
		},
        success: function(result) {
            alert("수정되었습니다")
            getLogList()
        },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
}//updateNotiState end

function deleteNoti(notiNo){
	let token = $("input[name='_csrf']").val();
	let header = "X-CSRF-TOKEN";
    $.ajax({
        url: '/management/deleteNoti',
        method: 'POST',
    	data: {notiNo: notiNo},
		beforeSend : function(xhr) {  
			xhr.setRequestHeader(header, token);
		},
        success: function(result) {
            alert("삭제되었습니다")
            getLogList()
        },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
}//deleteNoti end





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
		datatemplate += `
						<div class="col-lg-3">
							<div class="card">
								<div class="card-header mb-2">
									<h6 class="card-title font-weight-bold"><a class="detailReport" value="\${data.list1[i].holeNo}">\${data.list1[i].holeName}</a>
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
$('body').on('click', '.detailReport', function() {
    // 버튼의 value 값
    var value = $(this).attr('value');
    //console.log(value);
    
	location.href = '/report/course_report?value=' + encodeURIComponent(value);
});

//코스종류 active 클래스 추가
$(document).on('click','.holeBt,.courseTypeBt,.classBt,.typeBt',function() {
	//클릭시 이미 active 클래스면 active 제거
	
	let target = $(this).attr('class');
	let value = $(this).val();
	
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
    var notiNo = $('#notiNo').val(); //알림 번호
    var notiTitle = $('.notiTitle').val(); //알림 제목
    var dateRange = $('.dateInput:visible').val(); // 작업날짜 
    var dates = dateRange.split(' ~ '); // 작업날짜 ~ 빼기
    var workStart = dates[0]; // 작업시작날짜
    var workEnd = dates[1]; // 작업종료날짜
    var hole = $("input[name='holeBt']:checked").not('.selectItem input[name="holeBt"]:checked').map(function(){return $(this).val();}).get();// $('.holeBt.active').text(); //holename    
    var course = $("input[name='courseTypeBt']:checked").not('.selectItem input[name="courseTypeBt"]:checked').map(function(){return $(this).val();}).get();// $('.courseTypeBt.active').text(); // 코스종류
    var workClass = $("input[name='classBt']:checked").not('.selectItem input[name="classBt"]:checked').map(function(){return $(this).val();}).get();// $('.classBt.active').text(); // 작업분류
    var workType = $("input[name='typeBt']:checked").not('.selectItem input[name="typeBt"]:checked').map(function(){return $(this).val();}).get();// $('.typeBt.active').text(); // 작업종류
    var workerNo = $("select.workerName option:selected").val();

    // formData에 파라미터 추가
    formData.append("notiTitle", notiTitle);
    formData.append("workStart", workStart);
    formData.append("workEnd", workEnd);
    formData.append("hole", hole);
    formData.append("course", course);
    formData.append("workClass", workClass);
    formData.append("workType", workType);
    formData.append("workerNo", workerNo);
    formData.append("notiNo", notiNo);

	let token = $("input[name='_csrf']").val();
	let header = "X-CSRF-TOKEN";

	var requestURI = "/management/dashboardInsertWork"
	if($(this).hasClass('workUpdate')){
		requestURI = "/management/dashboardUpdateWork"
	}
	
    $.ajax({
        url: requestURI,
        method: 'POST',
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
        	
        	//workSelectList(searchHole, searchCourseType, searchClass, searchType,searchDate);
        	getLogList()
        },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
    
});//workreport.click function


//선택 알림작업 조회
function selectNotiWorkData(notiNo){

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	$('#notiNo').val(notiNo)
	
    $.ajax({
        url: '/management/selectNotiWorkData',
        method: 'GET',
        data: {notiNo: notiNo},
        beforeSend : function(xhr){
        	xhr.setRequestHeader(header, token);
        },
        success: function(data) {
        	console.log(data);
        	selectNotiWorkDataModal(data);
        },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
}//workAllList() end

//선택 및 수정 할 작업 모달 보여주기
function selectNotiWorkDataModal(data){

	resetModal();
	
	$("#modalTitle").text('작업일정 수정')
	$("#insertUpdateBtn").text("작업일정 수정")
	$("#insertUpdateBtn").removeClass("workInsert")
	$("#insertUpdateBtn").addClass("workUpdate")
	
	let notiNo = `\${data[0].notiNo}`.split(',');
	let title = `\${data[0].notiTitle}`.split(',');
	let hole = `\${data[0].notiHole}`.split(',');
	let course = `\${data[0].notiCourse}`.split(',');
	let classType = `\${data[0].notiClass}`.split(',');
	let type = `\${data[0].notiType}`.split(',');
	let workerNo = `\${data[0].workerUserNo}`;
	let workTime = `\${data[0].deadlineStart.substring(0,16)}` + ' ~ ' + `\${data[0].deadlineEnd.substring(0,16)}`;

	if(data[0].deadlineStart.substring(11,16)=="00:00" && data[0].deadlineEnd.substring(11,16)=='00:00'){
		$('.allDayWork').click();
		workTime = data[0].deadlineStart.substring(0,11) + ' ~ ' + data[0].deadlineEnd.substring(0,11)
	}
	
	$("#modal_scrollable .notiNo").each(function() {
		$(this).val(notiNo);
	});
	
	$("#modal_scrollable .notiTitle").each(function() {
		$(this).val(title);
	});
	
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
	
	$("#modal_scrollable .workerName").val(workerNo);
	
	$('#modal_scrollable').modal('show');


}//selectNotiWorkDataModal() end

$(document).on("change",".searchType", function(){
    var selectedValue = $(this).val();
    if (selectedValue === 'date') {
        $('.searchText').first().prop('hidden', true);
        $('.searchDate').first().prop('hidden', false);
        $('.searchCourse').first().prop('hidden', true);
        $('.searchHole').first().prop('hidden', true);
    } else if(selectedValue === 'course') {
        $('.searchText').first().prop('hidden', true);
        $('.searchDate').first().prop('hidden', true);
        $('.searchCourse').first().prop('hidden', false);
        $('.searchHole').first().prop('hidden', true);
    } else if(selectedValue === 'holeNo') {
        $('.searchText').first().prop('hidden', true);
        $('.searchDate').first().prop('hidden', true);
        $('.searchCourse').first().prop('hidden', true);
        $('.searchHole').first().prop('hidden', false);
    } else {
        $('.searchText').first().prop('hidden', false);
        $('.searchDate').first().prop('hidden', true);
        $('.searchCourse').first().prop('hidden', true);
        $('.searchHole').first().prop('hidden', true);
    }
});







</script>

<style>
.detailReport,.writeWork, .notiData{
	cursor: pointer;
}

td > select.custom-select {
	cursor: default;
}

td > select.notiDel {
	cursor: default;
}

label input[type="checkbox"]{
	display: none;
}

.notiCount{
    display: flex;
    align-items: center;
}

.card-title {
    margin-right: 10px;
}


<!--
#pager{
	justify-content: center;
	border-top: 1px solid #ddd;
    padding-top: 10px;
}
-->


</style>