<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<aside>
	<ul>
		<li>
			<a href="${path }/admin/enquiry/contactUs">
				<span>1:1 문의</span>
				<span><i class="fa-solid fa-angle-right"></i></span>
			</a>
		</li>
		<li>
			<a href="${path }/admin/enquiry/advertising">
				<span>광고제의</span>
				<span><i class="fa-solid fa-angle-right"></i></span>
			</a>
		</li>
	</ul>
</aside>