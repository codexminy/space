<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.second.space.user_.model.UserDTO"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
	UserDTO user = null;
	
	if(session.getAttribute("userLoggedIn") != null) {
		user = (UserDTO)session.getAttribute("userLoggedIn");
	}

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
	<div class="admin-logout">
		<div><%=user.getUser_nickname() %>님</div>
		<div onclick="logout()">로그아웃</div>
	</div>
</aside>
<script type="text/javascript">
	function logout() {
		if(confirm('로그아웃 하시겠습니까?')) {
			location.href = "${path}/admin/logout";
		}
	}
</script>