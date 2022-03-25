<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mySpace/mySpaceNav.css">
</head>
<body>
<div class="my-space-nav">
	<ul>
	    <li><a href="${pageContext.request.contextPath}/myspace/product">판매상품</a></li>
	    <li><a href="${pageContext.request.contextPath}/myspace/reviews">거래후기</a></li>
	    <li><a href="${pageContext.request.contextPath}/myspace/interested">찜한 상품</a></li>
	    <li><a href="${pageContext.request.contextPath}/myspace/followings">팔로잉</a></li>
	    <li><a href="${pageContext.request.contextPath}/myspace/followers">팔로워</a></li>
	</ul>
</div>
</body>
</html>