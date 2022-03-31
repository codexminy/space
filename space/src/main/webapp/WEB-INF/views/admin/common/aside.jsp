<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
	String[] link = (String[])request.getAttribute("link");
	String[] menu = (String[])request.getAttribute("menu");
%>
<aside>
	<div class="img" style="padding: 25px 40px; height: 100px;">
		<a href="${path }/main/space"><img src="${path }/resources/admin/space_white_logo.png" alt="우주장터 로고" style="width: 170px;"/></a>
	</div>
	<ul>
		<% for(int i=0; i<link.length; ++i) { %>
			<li>
				<a href="${path }<%=link[i] %>">
					<span class="menuHover"><%=menu[i] %></span>
					<span><i class="fa-solid fa-angle-right menuHover"></i></span>
				</a>
			</li>
		<% } %>
	</ul>
</aside>