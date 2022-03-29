<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<ul class="nav">
	<li class="nav-home">
		<a href="${path }/admin/home">
			<i class="fa-solid fa-house menuHover"></i>
			<span class="menuHover">홈</span>
		</a>
	</li>
	<li class="nav-notify">
		<a href="${path }/admin/notification/board">
			<i class="fa-solid fa-circle-exclamation menuHover"></i>
			<span class="menuHover">신고 관리</span>
		</a>
	</li>
	<li class="nav-banner">
		<a href="${path }/admin/banner/list">
			<i class="fa-solid fa-image menuHover"></i>
			<span class="menuHover">배너 관리</span>
		</a>
	</li>
	<li class="nav-notice">
		<a href="${path }/admin/notice/list">
			<i class="fa-solid fa-bullhorn menuHover"></i>
			<span class="menuHover">공지사항</span>
		</a>
	</li>
	<li class="nav-stats">
		<a href="${path }/admin/stats/stats">
			<i class="fa-solid fa-chart-simple menuHover"></i>
			<span class="menuHover">통계</span>
		</a>
	</li>
	<li class="nav-contactUs">
		<a href="${path }/admin/enquiry/contactUs">
			<i class="fa-solid fa-circle-question menuHover"></i>
			<span class="menuHover">문의사항</span>
		</a>
	</li>
	<li class="nav-user">
		<a href="${path }/admin/user/list">
			<i class="fa-solid fa-user menuHover"></i>
			<span class="menuHover">회원 관리</span>
		</a>
	</li>
	<li class="nav-board">
		<a href="${path }/admin/board/sale">
			<i class="fa-regular fa-clipboard menuHover"></i>
			<span class="menuHover">게시물 관리</span>
		</a>
	</li>
	<li class="nav-admin">
		<a href="${path }/admin/admin/list">
			<i class="fa-solid fa-address-card menuHover"></i>
			<span class="menuHover">관리자 공지</span>
		</a>
	</li>
</ul>