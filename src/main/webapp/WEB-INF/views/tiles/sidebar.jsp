<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!-- Main sidebar -->
<div class="sidebar sidebar-light sidebar-expand-lg sidebar-main-resized">

	<!-- Sidebar content -->
	<div class="sidebar-content sidebar-small">


		<!-- Main navigation -->
		<div class="sidebar-section">
			<ul class="nav nav-sidebar" data-nav-type="accordion">

				<!-- Main -->
				<!-- <li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">Main</div> <i class="icon-menu" title="Main"></i></li> -->
				<li class="nav-item p-0"><a href="/all/course_allcourse" class="nav-link active"> <i class="fas fa-map"></i>
						<span> 전체 코스 </span>
				</a> <a href="/each/course_separatecourse" class="nav-link"> <i class="fas fa-golf-ball"></i> <span> 개별 코스 </span>
				</a> <a href="/report/course_report" class="nav-link"> <i class="fas fa-chart-bar"></i> <span> 리포트 </span>
				</a></li>
				<!-- /main -->
			</ul>
		</div>
		<!-- /main navigation -->

	</div>
	<!-- /sidebar content -->

</div>
<!-- /main sidebar -->