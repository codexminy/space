<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<aside>
	<ul>
		<li>
			<a href="${path }/admin/user/list">
				<span>목록</span>
				<span><i class="fa-solid fa-angle-right"></i></span>
			</a>
		</li>
		<li>
			<a href="${path }/admin/user/withdrawalList">
				<span>탈퇴 회원</span>
				<span><i class="fa-solid fa-angle-right"></i></span>
			</a>
		</li>
		<li>
			<a href="#">
				<span>누적 신고</span>
				<span><i class="fa-solid fa-angle-right"></i></span>
			</a>
		</li>
	</ul>
</aside>