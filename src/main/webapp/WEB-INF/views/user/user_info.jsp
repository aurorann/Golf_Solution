<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="userInfo"/>
</sec:authorize>
<div class="content-wrapper">

	<!-- Page header -->
	<div class="page-header page-header-light">
		<div class="page-header-content d-sm-flex">
			<div class="page-title" style="width: 100%;">
				<h6 class="mr-2 mt-1 font-weight-semibold float-left ml-2">내 정보</h6>
			</div>
		</div>
	</div>
	<!-- /page header -->


	<!-- Content area -->
	<div class="content layout-boxed">
		<!-- Basic card -->
		<!-- Basic view -->
		<div class="row">

			<div class="col-lg-12">
				<div class="card-body">
					<div class="mb-3">
						<h6 class="mb-0 font-weight-bold">내 정보</h6>
					</div>
					<div class="col-lg-12 row">
						<div class="col-lg-12">
							<div class="card more-round">
								<div class="card-body">
									<form id="updateForm" action="/user/updateUserInfo?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<div class="modal-body py-0">
										<div class="row">
											<label class="col-form-label font-weight-bold col-lg-2">회원명</label> 
											<label class="col-form-label col-lg-10">${userInfo.userName}</label>
										</div>

										<div class="row mt-2">
											<label class="col-form-label font-weight-bold col-lg-2">아이디</label> 
											<label class="col-form-label col-lg-10">${userInfo.userId}</label>
										</div>

										
										<div class="row mt-2">
											<label class="col-form-label font-weight-bold col-lg-2">비밀번호</label> 
											<input type="password" name="password" class="form-control h-auto col-lg-3" placeholder="기존 비밀번호를 입력해 주세요.">
											<button id="changePwBtn" type="button" class="btn btn-info ml-2">비밀번호 변경</button>
										</div>
										

										<div class="row mt-2">
											<label class="col-form-label font-weight-bold col-lg-2">회원 등급</label> 
											<label class="col-form-label col-lg-10">${userInfo.userGrade}</label>
										</div>

										<div class="row mt-2">
											<label class="col-form-label font-weight-bold col-lg-2">소속</label> 
											<label class="col-form-label col-lg-10">${userInfo.userDepartment}</label>
										</div>

										<div class="row mt-2">
											<label class="col-form-label font-weight-bold col-lg-2">이메일</label> 
											<input type="email" name="email" class="form-control h-auto col-lg-2" value="${userInfo.email}">
										</div>

										<div class="row mt-2">
											<label class="col-form-label font-weight-bold col-lg-2">연락처</label> 
											<input type="text" name="hp" class="form-control h-auto col-lg-2" value="${userInfo.hp}">
										</div>

										<div class="row mt-2">
											<label class="col-form-label font-weight-bold col-lg-2">가입일자</label> 
											<label class="col-form-label col-lg-10">${userInfo.regiDate}</label>
										</div>

										<div class="row mt-2">
											<label class="col-form-label font-weight-bold col-lg-2">회원사진</label> 
											<input type="file" name="userImgOriName" class="form-control col-lg-4">
										</div>

										<div class="text-center mt-2">
											<button type="submit" id="changeUserBtn" class="btn btn-lg btn-primary">정보 수정</button>
										</div>
									</div>
									</form>
								</div>
							</div>



						</div>
					</div>
				</div>
				<!-- /basic view -->

				<!-- /basic card -->


			</div>
			<!-- /content area -->



		</div>
	</div>
</div>
<script type="text/javascript">
$(document).on('click','#changePwBtn',function(){
	$('#updateForm').attr('action','/user/user_changePwForm');
	$('#updateForm').submit();
})

$(document).on('click','#changeUserBtn',function(){

	if(!confirm('회원정보를 변경하시겠습니까?')){
		return;
	}
	
	$('#updateForm').attr('action','/user/updateUserInfo?${_csrf.parameterName}=${_csrf.token}');
	$('#updateForm').submit();
})
</script>