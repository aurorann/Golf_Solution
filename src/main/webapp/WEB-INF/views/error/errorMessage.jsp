<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
MSG = '${exception.message}';
<security:authorize access='isAuthenticated()'>
	if(MSG === 'Access is denied') {
		alert('페이지를 이용 할 수 없습니다.')
	} else {
		alert(MSG);
	}
	<c:if test="${exception.message eq '존재하지 않는 채팅방입니다.'}">
		self.close();
	</c:if>
	<c:if test="${exception.message eq '채팅방은 회원만 이용가능합니다.'}">
		self.close();
	</c:if>
	<c:if test="${exception.message eq '비밀방입니다. 비밀번호가 정확하지 않습니다.'}">
		self.close();
	</c:if>
	<c:if test="${exception.message eq '채팅방 개설권이 모자랍니다.'}">
	self.close();
	</c:if>
	history.back();
	</security:authorize>
<security:authorize access='isAnonymous()'>
	<c:if test="${exception.message eq '존재하지 않는 채팅방입니다.'}">
		self.close();
	</c:if>
	<c:if test="${exception.message eq '채팅방은 회원만 이용가능합니다.'}">
		self.close();
	</c:if>
	<c:if test="${exception.message eq '비밀방입니다. 비밀번호가 정확하지 않습니다.'}">
		self.close();
	</c:if>
	if(MSG === 'Access is denied') {
		if(confirm('로그인이 필요합니다, 로그인 하시겠습니까?')) {
			if(window.location != window.parent.location) {
				window.parent.location.href = '/sign/loginForm';
			} else {
				location.href = '/sign/loginForm';
			}
		} else {
			if(window.location != window.parent.location) {
				history.back();
				//window.parent.location.href = '/';
			} else {
				history.back();
				//location.href = '/';
			}
		}
	} else {
		alert(MSG);
		history.back();
	}
</security:authorize>
</script>