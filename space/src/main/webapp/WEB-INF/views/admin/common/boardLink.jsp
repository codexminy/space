<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="title-wrap">
	<h2 class="title">게시물 관리</h2>
	<div class="line"></div>
	<ul>
		<li><a href="${path }/admin/board/sale" class="sale">장터</a></li>
		<li><a href="${path }/admin/board/community" class="community">커뮤니티</a></li>
	</ul>
</div>