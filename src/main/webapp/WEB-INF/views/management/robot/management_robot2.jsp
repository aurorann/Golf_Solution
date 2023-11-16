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
				<h6 class="mr-2 mt-1 font-weight-semibold float-left ml-2">로봇 관리 - 뷰어</h6>
				<div class="btn-group mr-2">
					<button type="button" class="btn btn-light" onclick="location.href='/management/robot1'">MAP</button>
					<button type="button" class="btn btn-light active" onclick="location.href='/management/robot2'">GRID</button>
				</div>

				<div class="float-right">
					<button type="button" class="btn sidebar-control sidebar-right-toggle">
						<i class="fas fa-align-justify"></i>
					</button>
				</div>

				<div class="btn-group mr-2 float-left">
					<button type="button" class="btn btn-light active">전체</button>
					<button type="button" class="btn btn-light">동작중</button>
					<button type="button" class="btn btn-light">대기중</button>
				</div>
				<h6 class="ml-3 mr-2 mt-1 font-weight-bold float-left">로봇</h6>	

			</div>
		</div>
	</div>
	<!-- /page header -->


	<!-- Content area -->
	<div class="content">
		<div class="row searchLog" style="margin-left: 0; margin-right: 0; margin-bottom: 20px">
			<select class="custom-select col-lg-1 mr-2 searchType">
				<option value="robotName">로봇명</option>
				<option value="logType">구분</option>
				<option value="logEvent">이벤트</option>
			</select>
			<input type="text" class="col-lg-2 mr-2 searchText">
			<button type="button" class="ml-2 btn btn-primary searchLogBt">검색</button>
		</div>
		<!-- Basic card -->
		<div class="card">
			<div class="card-header">
			    <h5 class="card-title">로봇 관리 리스트</h5>
			</div>
			
			<div class="table-responsive">
			    <table class="table">
			        <thead>
			            <tr>
			                <th>로봇명</th>
			                <th>구분</th>
			                <th>이벤트</th>
			                <th>최근 동작 시간</th>
			            </tr>
			        </thead>
			        <tbody id="logList">
			            
			        </tbody>
			    </table>
			</div>
			
			<div class="mt-3 mb-3 text-center">
			    <ul class="pagination pagination-flat align-self-center" id="pager">
			        <li class="page-item"><a href="#" class="page-link">← &nbsp; Prev</a></li>
			        <li class="page-item active"><a href="#" class="page-link">1</a></li>
			        <li class="page-item"><a href="#" class="page-link">2</a></li>
			        <li class="page-item disabled"><a href="#" class="page-link">3</a></li>
			        <li class="page-item"><a href="#" class="page-link">4</a></li>
			        <li class="page-item"><a href="#" class="page-link">Next &nbsp; →</a></li>
			    </ul>
			</div>

		</div>
		<!-- /basic card -->

	</div>
	<!-- /content area -->



</div>
<!-- /main content -->

<div class="sidebar sidebar-light sidebar-right sidebar-expand-lg sidebar-collapsed">
	<!-- Sidebar content -->
	<div class="sidebar-content">

		<!-- Header -->
		<div class="sidebar-section sidebar-section-body d-flex align-items-center">
			<h5 class="mb-0 font-weight-bold">로봇 리스트</h5>
			<div class="ml-auto">
				<button type="button" class="btn btn-outline-light text-body border-transparent btn-icon rounded-pill btn-sm sidebar-control sidebar-right-toggle d-none d-lg-inline-flex">
					<i class="icon-transmission"></i>
				</button>

				<button type="button" class="btn btn-outline-light text-body border-transparent btn-icon rounded-pill btn-sm sidebar-mobile-right-toggle d-lg-none">
					<i class="icon-cross2"></i>
				</button>
			</div>
		</div>
		<!-- Header -->

		<!-- Sidebar search -->
		<div class="sidebar-section ">
			<div class="table-responsive table-scrollable">
				<table class="table text-center">
					<thead>
						<tr>
							<th class="table-info pl-1 pr-1 pt-1 pb-1">로봇명</th>
							<th class="table-info pl-1 pr-1 pt-1 pb-1">동작현황</th>
							<th class="table-info pl-1 pr-1 pt-1 pb-1">동작시간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="pl-1 pr-1">센싱1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">센싱1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">센싱1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">센싱1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">센싱1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">센싱1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">센싱1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">센싱1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">센싱1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
						<tr>
							<td class="pl-1 pr-1">센싱1</td>
							<td class="pl-1 pr-1">작동중</td>
							<td class="pl-1 pr-1">2023-10-23 14:11</td>
						</tr>
					
					</tbody>
				</table>
			</div>
		</div>
		<!-- /sidebar search -->

	</div>
	<!-- /sidebar content -->

</div>

<script>



function nvl(data){
	if(!data || data=='null'){
		return "";
	}else{
		return data;
	}
}



var currentSearchType = null;
var currentSearchText = null;

getLogList = function(curPage, searchType, searchText){
	if(!curPage){curPage=1}
	
	var url = "${pageContext.request.contextPath}/management/getLogList";
	var data = "curPage="+curPage;
	
	
	if(searchType && searchText){
		url = "${pageContext.request.contextPath}/management/logSearchList";
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
			console.log(result);
			
			var list = result.list;
			
			var table = ''
			$.each(list,function(index,item){
				
				table+=`<tr>`
				table+=`<td>\${nvl(item.robotName)}</td>`
				table+=`<td>\${nvl(item.robotLog.eventType)}</td>`
				table+=`<td>\${nvl(item.robotLog.eventComment)}</td>`
				table+=`<td>\${nvl(item.robotLog.tm).substring(0, 16)}</td>`
				table+= `</tr>`
			})
			
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
				$('#logList').html('<tr><td colspan="12" style="text-align: center;">데이터가 없습니다.</td></tr>');
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

//회원검색 버튼 클릭
$(document).on("click",".searchLogBt", function(){
	var searchType = $(".searchLog .searchType option:selected").val();
	var searchText = $(".searchLog .searchText").val();
	
    currentSearchType = searchType;
    currentSearchText = searchText;

    getLogList(1, searchType, searchText)
});

getLogList(1)


</script>

<style>
<!--
#pager{
	justify-content: center;
	border-top: 1px solid #ddd;
    padding-top: 10px;
}
-->
</style>