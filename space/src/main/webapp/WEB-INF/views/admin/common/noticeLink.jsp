<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="title-wrap">
	<h2 class="title">공지사항</h2>
	<div class="line"></div>
	<ul>
		<li><a href="${path }/admin/notice/list">목록</a></li>
		<li><a href="${path }/admin/notice/create">신규 등록</a></li>
	</ul>
</div>