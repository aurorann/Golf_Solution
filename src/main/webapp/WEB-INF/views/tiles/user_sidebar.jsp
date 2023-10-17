<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<div class="sidebar sidebar-light sidebar-main sidebar-expand-lg sidebar-main-resized">

	<!-- Sidebar content -->
	<div class="sidebar-content sidebar-small ">


		<!-- Main navigation -->
		<div class="sidebar-section">
			<ul class="nav nav-sidebar" data-nav-type="accordion">

				<div class="sidebar-main-close text-right">
					<button type="button"
						class="btn btn-outline-light-100 text-dark border-transparent btn-icon rounded-pill btn-sm sidebar-mobile-main-toggle d-lg-none">
						<i class="icon-cross2"></i>
					</button>
				</div>

				<!-- Main -->
				<!-- <li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">Main</div> <i class="icon-menu" title="Main"></i></li> -->
				<li class="nav-item p-0"><a href="/user/user_management" class="nav-link"> <i class="icon-users2"></i> <span>
							회원 관리 </span>
				</a> <a href="/user/user_info" class="nav-link"> <i class="icon-vcard"></i> <span> 내 정보 </span>
				</a></li>
				<!-- /main -->
			</ul>
		</div>
		<!-- /main navigation -->

	</div>
	<!-- /sidebar content -->

</div>


