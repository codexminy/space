<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	request.setAttribute("c_board_id", request.getParameter("uid1"));
	request.setAttribute("c_id", request.getParameter("uid2"));
%>
<!DOCTYPE html>
<html>
<head>
	<title>신고하기</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/common.css?ver=1" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/report.css?ver=3" />
</head>
<body>
	<div>
		<h3>신고하기</h3>
		<form id="report" name="reportForm" action="./comment_report/process" method="POST">
			<input type="hidden" name="c_id" value="${c_id }" />
			<input type="hidden" name="c_board_id" value="${c_board_id }" />
			<input type="hidden" name="user_id" value="${user_id }" />
			<p>신고유저: 
				<c:forEach items="${c_board_list }" var="c_board_list">
				<c:if test="${c_board_list.c_board_id eq c_board_id}">
					${c_board_list.user_nickname }
				</c:if>
				</c:forEach>
			</p>
			<p>해당 댓글내용:</p>
			<p class="c_content">
				<c:forEach items="${c_comment_list }" var="c_comment_list">
				<c:if test="${c_comment_list.c_id eq c_id}">
					${c_comment_list.c_content }
				</c:if>
				</c:forEach>
			</p>						
			<button id="send_btn">보내기</button>			
		</form>
	</div>
<script src="${pageContext.request.contextPath}/resources/community/js/report.js?ver=2"></script>
</body>
</html>