<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<header>
	<nav>
		<ul class="header-nav">
			<li><a href="<c:url value="/admin/home"/>">홈</a></li>
			<li><a href="<c:url value="/admin/notification"/>">신고관리</a></li>
			<li><a href="<c:url value="/admin/banner"/>">배너관리</a></li>
			<li><a href="#">공지사항</a></li>
			<li><a href="#">통계</a></li>
			<li><a href="#">문의사항</a></li>
			<li><a href="#">회원관리</a></li>
			<li><a href="#">게시물관리</a></li>
			<li><a href="#">어드민안내</a></li>
		</ul>
	</nav>
</header>
