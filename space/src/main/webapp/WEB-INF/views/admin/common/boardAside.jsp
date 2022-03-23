<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<aside>
	<ul>
		<li>
			<a href="${path }/admin/board/sale" class="sale">
				<span>장터</span>
				<span><i class="fa-solid fa-angle-right"></i></span>
			</a>
		</li>
		<li>
			<a href="${path }/admin/board/community" class="community">
				<span>커뮤니티</span>
				<span><i class="fa-solid fa-angle-right"></i></span>
			</a>
		</li>
	</ul>
</aside>