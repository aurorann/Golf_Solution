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
						<tr>
							<td>10</td>
							<td>홍길동</td>
							<td>관리자</td>
							<td>코스관리팀</td>
							<td>abc@gmail.com</td>
							<td>010-1234-5678</td>
							<td>2023-10-06 15:37:45</td>
							<td>
								<button class="btn btn-info" type="button" data-toggle="modal" data-target="#modal_user">수정</button>
							</td>
						</tr>
						<tr>
							<td>10</td>
							<td>홍길동</td>
							<td>관리자</td>
							<td>코스관리팀</td>
							<td>abc@gmail.com</td>
							<td>010-1234-5678</td>
							<td>2023-10-06 15:37:45</td>
							<td>
								<button class="btn btn-info" type="button" data-toggle="modal" data-target="#modal_user">수정</button>
							</td>
						</tr>
					</tbody>
				</table>

				<div id="modal_user" class="modal fade" tabindex="-1">
					<div class="modal-dialog modal-dialog-scrollable">
						<div class="modal-content">
							<div class="modal-header pb-3">
								<h5 class="modal-title">회원 등급 수정</h5>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body py-0">
								<div class="row">
									<label class="col-form-label font-weight-bold col-lg-2">회원명</label> <label class="col-form-label col-lg-10">홍길동</label>
								</div>

								<div class="row">
									<label class="col-form-label font-weight-bold col-lg-2">소속</label> <label class="col-form-label col-lg-10">코스관리팀</label>
								</div>

								<div class="row">
									<label class="col-form-label font-weight-bold col-lg-2">이메일</label> <label class="col-form-label col-lg-10">abc@gmail.com</label>
								</div>

								<div class="row">
									<label class="col-form-label font-weight-bold col-lg-2">연락처</label> <label class="col-form-label col-lg-10">010-1234-5678</label>
								</div>

								<div class="row">
									<label class="col-form-label font-weight-bold col-lg-2">가입일자</label> <label class="col-form-label col-lg-10">2023-10-06
										15:37:45</label>
								</div>

								<div class="row mt-3">
									<label class="col-form-label font-weight-bold col-lg-2">회원 등급</label>
									<div class="col-lg-10">
										<select class="custom-select">
											<option value="opt1">관리자</option>
											<option value="opt2">작업자</option>
											<option value="opt2">승인 대기</option>
										</select>
									</div>
								</div>

								<div class="modal-footer pt-3">
									<button type="button" class="btn btn-link" data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary">회원등급 수정</button>
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