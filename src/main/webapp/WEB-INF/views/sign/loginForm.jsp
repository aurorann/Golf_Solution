<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파워볼</title>
</head>





<link href="/resources/assets/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="/resources/css/basic_style.css">
<link rel="stylesheet" href="/resources/css/login.css">

<body>

	<div class="full-bg">
		<div class="contents">
			<h1>로그인</h1>
			<form class="border-bottom" action="/login" method="post">
				<div class="id">
					<h5 class="form-title">아이디</h5>
					<input type="text" name="userId" class="form-control" required="required">
				</div>
				<div class="password">
					<h5 class="form-title">비밀번호</h5>
					<input type="password" name="password" class="form-control" required="required">
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<button type="submit" class="btn btn-login">로그인</button>
				<br> <br>
			</form>
			<p>회원가입 후 로그인이 가능합니다</p>
			<div class="text-center">
				<button type="button" class="btn btn-join" onclick="location.href='/sign/referForm'">회원가입</button>
			</div>
		</div>
	</div>



</body>
<script>

</script>

</html>