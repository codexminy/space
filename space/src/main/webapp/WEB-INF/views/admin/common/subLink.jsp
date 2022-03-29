<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
	String[] link = (String[])request.getAttribute("link");
	String[] menu = (String[])request.getAttribute("menu");
%>
<div class="subLink-wrap">
	<h2 class="title">${title }</h2>
<!-- 	<ul> -->
<%-- 		<% for(int i=0; i<link.length; ++i) { %> --%>
<%-- 			<li><a href="${path }<%=link[i] %>"><%=menu[i] %></a></li> --%>
<%-- 		<% } %> --%>
<!-- 	</ul> -->
</div>