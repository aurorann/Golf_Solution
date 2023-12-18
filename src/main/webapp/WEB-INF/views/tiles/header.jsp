<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="userInfo"/>
</sec:authorize>
<!-- Main navbar -->
<div class="navbar navbar-expand-lg navbar-light navbar-static">
	<div class="d-flex flex-1 d-lg-none">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-mobile">
			<i class="icon-paragraph-justify3"></i>
		</button>
		<button class="navbar-toggler sidebar-mobile-main-toggle" type="button">
			<i class="icon-transmission"></i>
		</button>
		<button type="button" class="navbar-toggler sidebar-mobile-main-toggle">
			<i class="icon-transmission"></i>
		</button>
		<button type="button" class="navbar-toggler sidebar-mobile-right-toggle">
			<i class="icon-arrow-right8"></i>
		</button>
	</div>

	<div class="navbar-brand text-center text-lg-left" style="padding: 10px;">
		<a href="/all/course_allcourse" class="d-inline-block"> 
			<img src="/resources/assets/img/golf_logo2.png"	class="d-none d-sm-block" alt="Logo" style="height: 30px"> 
			<img src="/resources/assets/img/golf_logo2.png" class="d-sm-none" alt="Logo">
		</a>
	</div>

	<div class="collapse navbar-collapse order-2 order-lg-1" id="navbar-mobile">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a href="/all/course_allcourse" class="navbar-nav-link course">
					COURSE
				</a>
			</li>
			<li class="nav-item">
				<a href="/management/dashboard" class="navbar-nav-link management">
					MANAGEMENT
				</a>
			</li>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li class="nav-item">
				<a href="/user/user_management" class="navbar-nav-link user">
					MEMBER
				</a>
			</li>
			</sec:authorize>
		</ul>

	</div>

	<ul class="navbar-nav flex-row order-1 order-lg-2 flex-1 flex-lg-0 justify-content-end align-items-center">
		<li class="nav-item nav-item-dropdown-lg dropdown h-100">
			<a href="#" class="navbar-nav-link navbar-nav-link-toggler d-inline-flex align-items-center h-100" data-toggle="dropdown">
				<i class="fas fa-bell"></i>
				<span class="badge badge-warning badge-pill ml-auto ml-lg-0">2</span>
			</a>	
			
			<div class="dropdown-menu dropdown-menu-right" style="width: 300px">
				<h6 class="font-weight-semibold" style="padding:.5rem 1rem">알림</h6>
				<div class="dropdown-divider"></div>
				<div class="alertMsg" style="padding:.5rem 1rem; padding-bottom: 2rem;">코스 01,02,09 Green 시비,시약 작업</div>
				<div class="alertMsg" style="padding:.5rem 1rem; padding-bottom: 2rem;">코스 09 Green 시비 작업</div>
			</div>		
		</li>

		<li class="nav-item nav-item-dropdown-lg dropdown dropdown-user h-100">
			<a href="#" class="navbar-nav-link navbar-nav-link-toggler dropdown-toggle d-inline-flex align-items-center h-100" data-toggle="dropdown">
				<c:choose>
				    <c:when test="${empty userInfo.userImgFilePath}">
				        <img src="/resources/assets/img/UserProfileImage.png" class="rounded-pill mr-lg-2" height="34" alt="">
				    </c:when>
				    <c:otherwise>
				        <img src="${fn:replace(userInfo.userImgFilePath, 'C:', '')}" class="rounded-pill mr-lg-2" height="34" width="34" alt="">
				    </c:otherwise>
				</c:choose>
				<span class="d-none d-lg-inline-block">${userInfo.userId}</span>
			</a>

			<div class="dropdown-menu dropdown-menu-right">
				<a href="/user/user_info" class="dropdown-item">내 정보</a>
				<div class="dropdown-divider"></div>
				<a href="javascript:logout()" class="dropdown-item">로그아웃</a>
			</div>
		</li>
	</ul>
</div>
<!-- /main navbar -->

<script>

function logout(){
	var form = document.createElement('form'); // 폼객체 생성
	form.setAttribute('method', 'post'); //get,post 가능
	form.setAttribute('action', "/logout"); //보내는 url
    var hiddenField = document.createElement("input");

    hiddenField.setAttribute("type", "hidden");

    hiddenField.setAttribute("name", "${_csrf.parameterName}");

    hiddenField.setAttribute("value", "${_csrf.token}");

    form.appendChild(hiddenField);
    
	document.body.appendChild(form);
	form.submit();
}

$(document).ready(function() {
	
    var path = window.location.pathname; // 현재 페이지의 경로

    if(path=='/management/course2'){
    	path = '/management/course1'
    }

    if(path == '/management/robot2'){
    	path = '/management/robot1'
    }
    //nav 메뉴에 active 추가
    $('.nav-item a').each(function() {
        var href = $(this).attr('href');
        if (path === href) {
            $(this).addClass('active');
            // 경로에 따라 active 클래스 추가
            if (path === '/management/course1' || path === '/management/course2' || path === '/management/robot1' || path == '/management/robot2') {
                $('.management').addClass('active');
            }else if (path === '/each/course_separatecourse' || path === '/report/course_report' || path === '/all/course_allcourse') {
                $('.course').addClass('active');
            }else if (path === '/user/user_info') {
            	$('.user').addClass('active');
            }
        }
    });
    
});//ready end
</script>








