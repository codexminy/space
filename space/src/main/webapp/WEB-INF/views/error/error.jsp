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
		<p>${code }&nbsp;${errorName }</p>
		<p>${message }</p>
		<button type="button" onclick="javascript:history.back();">이전페이지로</button>
	</div>
</body>
</html>