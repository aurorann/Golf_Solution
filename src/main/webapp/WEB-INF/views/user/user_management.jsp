<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<div class="content-wrapper">

	<!-- Page header -->
	<div class="page-header page-header-light">
		<div class="page-header-content d-sm-flex">
			<div class="page-title" style="width: 100%;">
				<h6 class="mr-2 mt-1 font-weight-semibold float-left ml-2">회원 관리</h6>
			</div>
		</div>
	</div>
	<!-- /page header -->


	<!-- Content area -->
	<div class="content">
		<!-- Basic card -->
		<div class="card">
			<div class="card-header">
				<h5 class="card-title">회원 리스트</h5>
			</div>
			<div class="table-responsive table-scrollable">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>회원 이름</th>
							<th>회원 등급</th>
							<th>소속</th>
							<th>이메일</th>
							<th>연락처</th>
							<th>가입일자</th>
							<th>회원등급 수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="userList">
							<tr>
								<td><c:out value="${userList.userNo}"></c:out></td>
								<td><c:out value="${userList.userName}"></c:out></td>
								<td><c:out value="${userList.userGrade}"></c:out></td>
								<td><c:out value="${userList.userDepartment}"></c:out></td>
								<td><c:out value="${userList.email}"></c:out></td>
								<td><c:out value="${userList.hp}"></c:out></td>
								<td><c:out value="${userList.regiDate}"></c:out></td>
								<td>
									<button class="btn btn-info listUserModify" type="button" data-toggle="modal" data-target="#modal_user" value="${userList.userNo}">수정</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div id="modal_user" class="modal fade userGradeModify" tabindex="-1">
					<div class="modal-dialog modal-dialog-scrollable">
						<div class="modal-content">
							<div class="modal-header pb-3">
								<h5 class="modal-title">회원 등급 수정</h5>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body py-0">
								<div class="row">
									<label class="col-form-label font-weight-bold col-lg-2">회원명</label> <label class="col-form-label col-lg-10 userName"></label>
								</div>

								<div class="row">
									<label class="col-form-label font-weight-bold col-lg-2">소속</label> <label class="col-form-label col-lg-10 userDepartment"></label>
								</div>

								<div class="row">
									<label class="col-form-label font-weight-bold col-lg-2">이메일</label> <label class="col-form-label col-lg-10 email"></label>
								</div>

								<div class="row">
									<label class="col-form-label font-weight-bold col-lg-2">연락처</label> <label class="col-form-label col-lg-10 userPhone"></label>
								</div>

								<div class="row">
									<label class="col-form-label font-weight-bold col-lg-2">가입일자</label> <label class="col-form-label col-lg-10 regiDate"></label>
								</div>
								
								<input type="hidden" class="userNo" value="">

								<div class="row mt-3">
									<label class="col-form-label font-weight-bold col-lg-2">회원 등급</label>
									<div class="col-lg-10">
										<select class="custom-select">
											<option value="opt1">관리자</option>
											<option value="opt2">작업자</option>
											<option value="opt3">승인 대기</option>
										</select>
									</div>
								</div>

								<div class="modal-footer pt-3">
									<button type="button" class="btn btn-link userGradeModifyClose" data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary userModify">회원등급 수정</button>
								</div>
							</div>
						</div>
					</div>
					<!-- /scrollable modal -->

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
			<!-- /basic card -->

			<!--회원 추가 button-->

			<div class="" style="position: fixed; bottom: 30px; right: 30px; z-index: 1;">
				<button type="button" class="btn btn-round" data-toggle="modal" data-target="#modal_scrollable">
					회원 추가<i class="fas fa-plus mt-2"></i>
				</button>
			</div>
			<!--회원 추가 button end-->

			<!--회원 추가 modal-->
			<div id="modal_scrollable" class="modal fade" tabindex="-1">
				<div class="modal-dialog modal-dialog-scrollable">
					<div class="modal-content">
						<div class="modal-header pb-3">
							<h5 class="modal-title">회원 추가</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<div class="modal-body py-0">

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-2">아이디</label> <input type="text" class="form-control col-lg-10" value="">
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-2">비밀번호</label> <input type="text" class="form-control col-lg-10" value="">
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-2">회원 이름</label> <input type="text" class="form-control col-lg-10" value="">
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-2">회원 등급</label>
								<div class="col-lg-10 p-0">
									<select class="custom-select">
										<option value="opt1">관리자</option>
										<option value="opt2">작업자</option>
										<option value="opt3">기타</option>
									</select>
								</div>
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-2">소속</label> <input type="text" class="form-control col-lg-10" value="">
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-2">이메일</label> <input type="text" class="form-control col-lg-10" value="">
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-2">연락처</label> <input type="text" class="form-control col-lg-10" value="">
							</div>

						</div>

						<div class="modal-footer pt-3">
							<button type="button" class="btn btn-link" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary">회원 등록</button>
						</div>
					</div>
				</div>
			</div>

			<!--회원 추가 modal end-->


		</div>
		<!-- /content area -->



	</div>
	<!-- /main content -->
</div>

<script>

$(document).ready(function() {
	
});

//수정버튼 클릭
$(document).on("click",".listUserModify", function(){
	var userNo = $(this).attr("value");
	//console.log(userNo);
	userGradeModifyList(userNo);
});

//회원등급 수정 조회
function userGradeModifyList(userNo){
	
    $.ajax({
        url: '/user/userGradeModifyList',
        method: 'GET',
        data: {userNo: userNo},
        success: function(data) {
        	console.log(data);
        	userGradeModifyListModal(data);
        },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
	
}

//회원등급 수정 모달창
function userGradeModifyListModal(data){
	
	var name = `\${data[0].userName}`;
	var department = `\${data[0].userDepartment}`;
	var email = `\${data[0].email}`;
	var phone = `\${data[0].hp}`;
	var regiDate = `\${data[0].regiDate}`;
	var grade = `\${data[0].userGrade}`;
	var userNo = `\${data[0].userNo}`;
	
	
	$(".userGradeModify .userName").each(function() {
		$(this).text(name)
	})
	
	$(".userGradeModify .userDepartment").each(function() {
		$(this).text(department)
	})
	
	$(".userGradeModify .email").each(function() {
		$(this).text(email)
	})
	
	$(".userGradeModify .userPhone").each(function() {
		$(this).text(phone)
	})
	
	$(".userGradeModify .regiDate").each(function() {
		$(this).text(regiDate)
	})
	
	$(".userGradeModify .userNo").each(function() {
		$(this).val(userNo)
	})
	
	$(".userGradeModify .custom-select").each(function() {
		
		if(grade == "관리자"){
			$(this).val('opt1');
		}else if(grade == "작업자"){
			$(this).val('opt2');
		}else{
			$(this).val('opt3');
		}//if end
		
	})
	
}


$(document).on("click",".userGradeModifyClose", function(){

});


$(document).on("click",".userModify", function(){
	var grade = $(".userGradeModify .custom-select option:checked").text()
	var userNo = $(".userGradeModify .userNo").val()
	//console.log(grade);
	//console.log(userNo);
	userGradeModify(grade, userNo);
});


//회원등급 수정
function userGradeModify(grade, userNo){
	
    $.ajax({
        url: '/user/userGradeModify',
        method: 'GET',
        data: { grade: grade,
        		userNo: userNo },
        success: function(data) {
        	console.log(data);
        	alert("회원등급이 수정 되었습니다.");
        	location.reload();
       },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
	
}







</script>