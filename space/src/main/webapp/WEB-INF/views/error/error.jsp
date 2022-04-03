<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR</title>
<jsp:include page="../admin/common/link.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/error/css/error.css" />
</head>
<body>
	<div class="error-wrap">
		<p><i class="fa-solid fa-triangle-exclamation"></i></p>
		<p>${error.STATUS_CODE }&nbsp;${error.NAME }</p>
		<p>${error.MESSAGE }</p>
		<button type="button" onclick="goHome()">홈으로</button>
	</div>
</body>
<script type="text/javascript">
	function goHome() {
		location.href= "${path}/main/space";
	}
</script>
</html>