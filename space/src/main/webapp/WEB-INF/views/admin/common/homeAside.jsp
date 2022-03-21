<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<aside>
	<ul>
		<li>
			<a href="${path }/admin/notification/main">
				<span>신고 접수</span>
				<span><i class="fa-solid fa-angle-right"></i></span>
			</a>
		</li>
		<li>
			<a href="#">
				<span>통계</span>
				<span><i class="fa-solid fa-angle-right"></i></span>
			</a>
		</li>
		<li>
			<a href="#">
				<span>광고</span>
				<span><i class="fa-solid fa-angle-right"></i></span>
			</a>
		</li>
		<li>
			<a href="#">
				<span>배너 관리</span>
				<span><i class="fa-solid fa-angle-right"></i></span>
			</a>
		</li>
		<li>
			<a href="#">
				<span>관리자 공지</span>
				<span><i class="fa-solid fa-angle-right"></i></span>
			</a>
		</li>
	</ul>
</aside>