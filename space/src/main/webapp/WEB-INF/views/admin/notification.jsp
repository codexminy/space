<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/admin.css" />
</head>
<body>
	<jsp:include page="headerNav.jsp"/>
	<div class="container">
		<div class="common-menu">
			<jsp:include page="leftNav.jsp">
				<jsp:param value="${list }" name="list"/>
			</jsp:include>
		</div>
		<div class="common-con notification-container">
		</div>
	</div>
</body>
</html>