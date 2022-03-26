<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
	String[] link = (String[])request.getAttribute("link");
	String[] menu = (String[])request.getAttribute("menu");
%>
<aside>
	<ul>
		<% for(int i=0; i<link.length; ++i) { %>
			<li>
				<a href="${path }<%=link[i] %>">
					<span><%=menu[i] %></span>
					<span><i class="fa-solid fa-angle-right"></i></span>
				</a>
			</li>
		<% } %>
	</ul>
</aside>