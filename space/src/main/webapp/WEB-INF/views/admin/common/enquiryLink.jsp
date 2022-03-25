<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="title-wrap">
	<h2 class="title">문의사항</h2>
	<div class="line"></div>
	<ul>
		<li><a href="${path }/admin/enquiry/contactUs">1:1 문의</a></li>
		<li><a href="${path }/admin/enquiry/advertising">광고제의</a></li>
	</ul>
</div>