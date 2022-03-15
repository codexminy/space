<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.left-aside-nav {
		list-style: none;
	}
</style>
</head>
<body>
	<div class="wrap">
		<ul class="left-aside-nav">
			<c:forEach var="list" items="${param.list }">
				<li>${list }</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>