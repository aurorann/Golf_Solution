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
				<div class="card-body">
                          <div class="mb-3">
                              <h6 class="mb-0 font-weight-bold">
                                  전체 보기
                              </h6>
                          </div>
                          <div class="col-lg-12 row">
                              <div class="col-lg-12">
                                  <div class="card more-round">
                                      <div class="card-header bg-white">
                                          <span class="font-weight-semibold float-left ml-1 mr-2 font-weight-bold">작업자명</span>
                                          <div class="list-icons float-right ml-3">
                                              <div class="dropdown position-static">
                                                  <a href="#" class="list-icons-item" data-toggle="dropdown" aria-expanded="false"><i class="icon-more2 mr-1"></i></a>
                                                  <div class="dropdown-menu dropdown-menu-right" style="">
                                                      <a href="#" class="dropdown-item">수정</a>
                                                      <a href="#" class="dropdown-item">삭제</a>
                                                  </div>
                                              </div>
                                          </div>
                                          <span class="float-left text-muted">2023.06.08 14:11</span>
                                      </div>
                                      <div class="card-body">
                                          <h6 class="card-title font-weight-bold">코스 1, 2 시약 작업</h6>
									<div class="row">
										<label class="col-form-label font-weight-bold col-lg-2">작업 기간</label>
										<label class="col-form-label col-lg-10">01/01/2015 - 01/31/2015</label>
									</div>

									<div class="row">
										<label class="col-form-label font-weight-bold col-lg-2">작업 내용</label>
										<div class="col-form-label col-lg-10">
											<span class="badge badge-info">Hole 1</span> <!--코스 위치 라벨-->
											<span class="badge badge-success">Green</span> <!--코스 유형 라벨-->
											<span class="badge badge-warning">갱신</span> <!--작업 분류 라벨-->
											<span class="badge badge-secondary">시비</span> <!--작업 종류 라벨-->
										</div>
									</div>

									<div class="row">
										<label class="col-form-label font-weight-bold col-lg-2">브랜드명</label>
										<label class="col-form-label col-lg-10">브랜드명</label>
									</div>

									<div class="row">
										<label class="col-form-label font-weight-bold col-lg-2">작업 메모</label>
										<label class="col-form-label col-lg-10">작업 메모 내용입니다.</label>
									</div>

									<div class="form-group row mt-2">
										<label class="col-form-label font-weight-bold col-lg-12">작업 이미지</label>
											<div class="row">
												<div class="col-lg-4">
													<div class="card">
														<div class="card-img-actions m-1">
															<img class="card-img img-fluid" src="assets/img/ndvi-1.png" alt="">
															<div class="card-img-actions-overlay card-img">
																<a href="assets/img/ndvi-1.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
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
															<img class="card-img img-fluid" src="assets/img/ndvi-1.png" alt="">
															<div class="card-img-actions-overlay card-img">
																<a href="assets/img/ndvi-1.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
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
															<img class="card-img img-fluid" src="assets/img/noimage.png" alt="">
															<div class="card-img-actions-overlay card-img">
																<a href="assets/img/noimage.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
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
															<img class="card-img img-fluid" src="assets/img/noimage.png" alt="">
															<div class="card-img-actions-overlay card-img">
																<a href="assets/img/noimage.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
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

						<div class="col-lg-12">
                                  <div class="card more-round">
                                      <div class="card-header bg-white">
                                          <span class="font-weight-semibold float-left ml-1 mr-2 font-weight-bold">작업자명</span>
                                          <div class="list-icons float-right ml-3">
                                              <div class="dropdown position-static">
                                                  <a href="#" class="list-icons-item" data-toggle="dropdown" aria-expanded="false"><i class="icon-more2 mr-1"></i></a>
                                                  <div class="dropdown-menu dropdown-menu-right" style="">
                                                      <a href="#" class="dropdown-item">수정</a>
                                                      <a href="#" class="dropdown-item">삭제</a>
                                                  </div>
                                              </div>
                                          </div>
                                          <span class="float-left text-muted">2023.06.08 14:11</span>
                                      </div>
                                      <div class="card-body">
                                          <h6 class="card-title font-weight-bold">코스 1, 2 시약 작업</h6>
									<div class="row">
										<label class="col-form-label font-weight-bold col-lg-2">작업 기간</label>
										<label class="col-form-label col-lg-10">01/01/2015 - 01/31/2015</label>
									</div>

									<div class="row">
										<label class="col-form-label font-weight-bold col-lg-2">작업 내용</label>
										<div class="col-form-label col-lg-10">
											<span class="badge badge-info">Hole 1</span> <!--코스 위치 라벨-->
											<span class="badge badge-success">Green</span> <!--코스 유형 라벨-->
											<span class="badge badge-warning">갱신</span> <!--작업 분류 라벨-->
											<span class="badge badge-secondary">시비</span> <!--작업 종류 라벨-->
										</div>
									</div>

									<div class="row">
										<label class="col-form-label font-weight-bold col-lg-2">브랜드명</label>
										<label class="col-form-label col-lg-10">브랜드명</label>
									</div>

									<div class="row">
										<label class="col-form-label font-weight-bold col-lg-2">작업 메모</label>
										<label class="col-form-label col-lg-10">작업 메모 내용입니다.</label>
									</div>

									<div class="form-group row mt-2">
										<label class="col-form-label font-weight-bold col-lg-12">작업 이미지</label>
											<div class="row">
												<div class="col-lg-4">
													<div class="card">
														<div class="card-img-actions m-1">
															<img class="card-img img-fluid" src="assets/img/ndvi-1.png" alt="">
															<div class="card-img-actions-overlay card-img">
																<a href="assets/img/ndvi-1.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
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
															<img class="card-img img-fluid" src="assets/img/ndvi-1.png" alt="">
															<div class="card-img-actions-overlay card-img">
																<a href="assets/img/ndvi-1.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
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
															<img class="card-img img-fluid" src="assets/img/noimage.png" alt="">
															<div class="card-img-actions-overlay card-img">
																<a href="assets/img/noimage.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
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
															<img class="card-img img-fluid" src="assets/img/noimage.png" alt="">
															<div class="card-img-actions-overlay card-img">
																<a href="assets/img/noimage.png" class="btn btn-outline-white border-2 btn-icon rounded-pill" data-popup="lightbox" data-gallery="gallery1">
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

						

						

						

						

						

                          </div>
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
										<a href="#"><span class="badge badge-info active">Hole 1</span></a> <!--코스 위치 라벨-->
										<a href="#"><span class="badge badge-info">Hole 2</span></a>
										<a href="#"><span class="badge badge-info">Hole 3</span></a>
										<a href="#"><span class="badge badge-info">Hole 4</span></a>
										<a href="#"><span class="badge badge-info">Hole 5</span></a>
										<a href="#"><span class="badge badge-info">Hole 6</span></a>
										<a href="#"><span class="badge badge-info">Hole 7</span></a>
										<a href="#"><span class="badge badge-info">Hole 8</span></a>
										<a href="#"><span class="badge badge-info">Hole 9</span></a>
										<a href="#"><span class="badge badge-info">Hole 10</span></a>
										<a href="#"><span class="badge badge-info">Hole 11</span></a>
										<a href="#"><span class="badge badge-info">Hole 12</span></a>
										<a href="#"><span class="badge badge-info">Hole 13</span></a>
										<a href="#"><span class="badge badge-info">Hole 14</span></a>
										<a href="#"><span class="badge badge-info">Hole 15</span></a>
										<a href="#"><span class="badge badge-info">Hole 16</span></a>
										<a href="#"><span class="badge badge-info">Hole 17</span></a>
										<a href="#"><span class="badge badge-info">Hole 18</span></a>
									</li>
								</ul>

								<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
									<li class="nav-item-header">코스 유형</li>
									<li class="nav-item pl-3 pr-3 course-category-badge">
										<a href="#"><span class="badge badge-success active">Green</span></a><!--코스 유형 라벨-->
										<a href="#"><span class="badge badge-success">Fairway</span></a>						
									</li>
								</ul>

								<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
									<li class="nav-item-header">작업 분류</li>
									<li class="nav-item pl-3 pr-3 work-class-badge">
										<a href="#"><span class="badge badge-warning active">갱신</span></a><!--작업 분류 라벨-->
										<a href="#"><span class="badge badge-warning">예고</span></a>				
										<a href="#"><span class="badge badge-warning">기타</span></a>				
									</li>
								</ul>
						
								<ul class="nav nav-sidebar my-2" data-nav-type="accordion">
									<li class="nav-item-header">작업 종류</li>
									<li class="nav-item pl-3 pr-3 work-category-badge">
										<a href="#"><span class="badge badge-secondary active">시비</span></a> <!--작업 종류 라벨-->
										<a href="#"><span class="badge badge-secondary">시약</span></a>				 					
									</li>
								</ul>


								
										
								<ul class="nav nav-sidebar my-2" >
									<li class="nav-item pl-3 pr-3">
										<button type="button" class="btn btn-primary btn-block">검색하기<i class="icon-search4 ml-2"></i></button>
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
					<button type="button" class="btn btn-round" data-toggle="modal" data-target="#modal_scrollable">작업 등록<i class="fas fa-plus mt-2"></i></button>
				</div>
				
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
											<input type="text" class="form-control daterange-basic" value="01/01/2015 - 01/31/2015"> 
											
										</div>
									</div>
									
								</div>
	
								<div class="form-group row mt-3">
									<label class="col-form-label col-lg-2">코스 위치</label>
									<div class="col-lg-10 course-location-badge">
										<a href="#"><span class="badge badge-info active">Hole 1</span></a> <!--코스 위치 라벨-->
										<a href="#"><span class="badge badge-info">Hole 2</span></a>
										<a href="#"><span class="badge badge-info">Hole 3</span></a>
										<a href="#"><span class="badge badge-info">Hole 4</span></a>
										<a href="#"><span class="badge badge-info">Hole 5</span></a>
										<a href="#"><span class="badge badge-info">Hole 6</span></a>
										<a href="#"><span class="badge badge-info">Hole 7</span></a>
										<a href="#"><span class="badge badge-info">Hole 8</span></a>
										<a href="#"><span class="badge badge-info">Hole 9</span></a>
										<a href="#"><span class="badge badge-info">Hole 10</span></a>
										<a href="#"><span class="badge badge-info">Hole 11</span></a>
										<a href="#"><span class="badge badge-info">Hole 12</span></a>
										<a href="#"><span class="badge badge-info">Hole 13</span></a>
										<a href="#"><span class="badge badge-info">Hole 14</span></a>
										<a href="#"><span class="badge badge-info">Hole 15</span></a>
										<a href="#"><span class="badge badge-info">Hole 16</span></a>
										<a href="#"><span class="badge badge-info">Hole 17</span></a>
										<a href="#"><span class="badge badge-info">Hole 18</span></a>
									</div>
								</div>
	
								<div class="form-group row mt-3">
									<label class="col-form-label col-lg-2">작업 분류</label>
									<div class="col-lg-10 course-category-badge">
										<a href="#"><span class="badge badge-success active">Green</span></a><!--코스 유형 라벨-->
										<a href="#"><span class="badge badge-success">Fairway</span></a>						
									</div>
								</div>
	
								<div class="form-group row mt-3">
									<label class="col-form-label col-lg-2">작업 분류</label>
									<div class="col-lg-10 work-class-badge">
										<a href="#"><span class="badge badge-warning active">갱신</span></a><!--작업 분류 라벨-->
										<a href="#"><span class="badge badge-warning">예고</span></a>				
										<a href="#"><span class="badge badge-warning">기타</span></a>							
									</div>
								</div>
	
								<div class="form-group row mt-3">
									<label class="col-form-label col-lg-2">작업 종류</label>
									<div class="col-lg-10 work-category-badge">
										<a href="#"><span class="badge badge-secondary active">시비</span></a> <!--작업 종류 라벨-->
										<a href="#"><span class="badge badge-secondary">시약</span></a>				 											
									</div>
								</div>
	
	
	
								<div class="form-group row mt-3">
									<label class="col-form-label col-lg-2">브랜드 명</label>
									<div class="col-lg-10">
										<select class="custom-select">
											<option value="opt1">브랜드 명 1</option>
											<option value="opt2">브랜드 명 2</option>
											<option value="opt3">브랜드 명 3</option>
											<option value="opt4">브랜드 명 4</option>
											<option value="opt5">브랜드 명 5</option>
											<option value="opt6">브랜드 명 6</option>
											<option value="opt7">브랜드 명 7</option>
											<option value="opt8">브랜드 명 8</option>
										</select>
									</div>
								</div>
								<div class="form-group row mt-3">
									<label class="col-form-label col-lg-2">작업 이미지</label>
									<div class="col-lg-10">
										<input type="file" class="form-control h-auto">
									</div>
								</div>
								<div class="form-group row mt-3">
									<label class="col-form-label col-lg-2">작업 메모</label>
									<div class="col-lg-10">
										<textarea rows="3" cols="3" class="form-control" placeholder="작업 내용을 입력해 주세요."></textarea>
									</div>
								</div>
							</div>
	
							<div class="modal-footer pt-3">
								<button type="button" class="btn btn-link" data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary">작업 등록</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /scrollable modal -->
				

</div>
<!-- /main content -->

<!-- twentytwenty -->
<script>
	$(function(){
		$(".twentytwenty-container[data-orientation!='vertical']").twentytwenty({default_offset_pct: 0.5});
		$(".twentytwenty-container[data-orientation='vertical']").twentytwenty({default_offset_pct: 0.5, orientation: 'vertical'});
	});
</script>
<!-- twentytwenty end -->