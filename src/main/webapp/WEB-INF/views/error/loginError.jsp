<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	MSG = '${errorMessage}';
	alert(MSG);
	//console.log(MSG)
	history.back();
</script>