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
				<li class="nav-item p-0">
					<a href="/management/dashboard" class="nav-link active"><i class="far fa-clone"></i><span>대시보드</span></a>
					<a href="/management/course" class="nav-link"><i class="far fa-calendar-alt"></i><span>코스관리</span></a>
					<a href="/management/robot" class="nav-link"><i class="fas fa-robot"></i><span>로봇관리</span></a>
				</li>
				<!-- /main -->
			</ul>
		</div>
		<!-- /main navigation -->

	</div>
	<!-- /sidebar content -->

</div>
<!-- /main sidebar -->


