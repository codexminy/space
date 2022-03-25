<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<ul class="nav">
	<li><a href="${path }/admin/home">홈</a></li>
	<li><a href="${path }/admin/notification/main">신고 관리</a></li>
	<li><a href="${path }/admin/banner/list">배너 관리</a></li>
	<li><a href="${path }/admin/notice/list">공지사항</a></li>
	<li><a href="${path }/admin/stats/stats">통계</a></li>
	<li><a href="${path }/admin/enquiry/contactUs">문의사항</a></li>
	<li><a href="${path }/admin/user/list">회원 관리</a></li>
	<li><a href="${path }/admin/board/sale">게시물 관리</a></li>
	<li><a href="${path }/admin/admin/list">관리자 공지</a></li>
</ul>