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
				<h6 class="mr-2 mt-1 font-weight-semibold float-left ml-2">비밀번호 변경</h6>
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
						<h6 class="mb-0 font-weight-bold">비밀번호 변경</h6>
					</div>
					<div class="col-lg-12 row">
						<div class="col-lg-12">
							<div class="card more-round">
								<div class="card-body">
									<form action="/user/updateUserPw" method="post" onsubmit="return formCheck(this);">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<div class="modal-body py-0">

										<div class="mt-2 mb-3">
											<span class="d-block text-muted">변경할 비밀번호를 설정해 주세요.</span>
										</div>

										<div class="row mt-2">
											<label class="col-form-label font-weight-bold col-lg-2">새 비밀번호</label> 
											<input type="password" name="password" class="form-control h-auto col-lg-2">
										</div>

										<div class="row mt-2">
											<label class="col-form-label font-weight-bold col-lg-2">비밀번호 확인</label> 
											<input type="password" name="passwordChk" class="form-control h-auto col-lg-2">
										</div>

										<div class="text-center mt-2">
											<button type="submit" class="btn btn-lg btn-primary">비밀번호 변경</button>
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
function formCheck(frm){
	if(frm.password.value != frm.passwordChk.value){
		alert("비밀번호 확인이 일치하지 않습니다.")
		return false;
	}

	if(!confirm("비밀번호를 변경하시겠습니까?")){
		return false;
	}

	return true;
}
</script>