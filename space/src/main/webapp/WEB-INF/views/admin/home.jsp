<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
	.container {
		display: flex;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/common.css" />
</head>
<body>
	<jsp:include page="nav.jsp"/>
	<p>테스트 : ${count }</p>
	<div class="container">
		<div class="left-aside">
			<jsp:include page="leftNav.jsp">
				<jsp:param value="${list }" name="list"/>
			</jsp:include>
		</div>
		<div class="test">
		
		</div>
	</div>
	
</body>
</html>