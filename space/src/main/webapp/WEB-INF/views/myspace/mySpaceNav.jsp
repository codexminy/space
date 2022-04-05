<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.second.space.user_.model.UserDTO"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mySpace/mySpaceNav.css">
<%
	if(session.getAttribute("userLoggedIn") != null){
		UserDTO userLoggedIn = (UserDTO)session.getAttribute("userLoggedIn");
	}
%>
<div class="my-space-nav">
	<ul>
	    <li><a href="${pageContext.request.contextPath}/myspace/product?user_id=${userLoggedIn.user_id}">판매상품</a></li>
	    <li><a href="${pageContext.request.contextPath}/myspace/reviews?user_id=${userLoggedIn.user_id}">거래후기</a></li>
	    <li><a href="${pageContext.request.contextPath}/myspace/interested?user_id=${userLoggedIn.user_id}">찜한 상품</a></li>
	    <li><a href="${pageContext.request.contextPath}/myspace/followings?user_id=${userLoggedIn.user_id}">팔로잉</a></li>
	    <li><a href="${pageContext.request.contextPath}/myspace/followers?user_id=${userLoggedIn.user_id}">팔로워</a></li>
	</ul>
</div>
