<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="title-wrap">
	<h2 class="title">회원 관리</h2>
	<div class="line"></div>
	<ul>
		<li><a href="${path }/admin/user/list">목록</a></li>
		<li><a href="${path }/admin/user/withdrawalList">탈퇴 회원</a></li>
		<li><a href="#">누적 신고</a></li>
	</ul>
</div>