<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<div class="common-menu-wrap">
	<ul class="common-menu-nav">
		<% List<String> list = (List)request.getAttribute("list"); %>
		<% for(String s : list) { %>
			<li><%=s %></li>
		<% } %>
	</ul>
</div>
