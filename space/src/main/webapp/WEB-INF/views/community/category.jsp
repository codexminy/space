<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>우주장터</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/common.css?ver=2" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/community.css?ver=3" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/js/community.js?ver=3" />
</head>
<body>
	<div>
		<header>
			
		</header>
		<main>
			<ul>
				<li><a href="main">전체보기</a></li>
				<c:forEach items="${c_category_list }" var="c_category_list">
					<li><a href="category?id=${c_category_list.c_category_id }">${c_category_list.c_category_name }</a></li>
				</c:forEach>
			</ul>
			<c:forEach items="${c_board_list }" var="c_board_list">
			<c:if test="${c_board_list.c_category_id eq category_id }">
				<div class='c_board c_board_id_${c_board_list.c_board_id }'>
					<div class='c_category'>${c_board_list.c_category_name }</div>
					<div class='c_board_profile'><img src="${pageContext.request.contextPath}/resources/images/profile/profile${c_board_list.user_id }.png" width="60px"/></div>
					<ul class='c_board_writer'>
						<li>작성자&nbsp;&nbsp;${c_board_list.user_nickname }</li>
						<li><fmt:formatDate value="${c_board_list.c_board_date }" pattern="yy.MM.dd a hh:mm"/></li>
					</ul>				
					<h3>${c_board_list.c_board_title }</h3>
					<hr />
					<p class='c_board_content'>${c_board_list.c_board_content }</p>
					<ul class='c_board_option'>
						<li>신고하기</li>
						<li>댓글보기</li>
					</ul>
					<hr />
					<c:forEach items="${c_comment_list }" var="c_comment_list">
					<c:if test="${c_comment_list.c_board_id eq c_board_list.c_board_id }">
						<div class='c_comment_profile'><img src="${pageContext.request.contextPath}/resources/images/profile/profile${c_comment_list.user_id }.png" width="60px"/></div>
						<ul class='c_board_commenter'>
							<li>작성자&nbsp;&nbsp;${c_comment_list.user_nickname }</li>
							<li><fmt:formatDate value="${c_comment_list.c_date }" pattern="yy.MM.dd a hh:mm"/></li>
						</ul>
						<div class='c_comment_content'>${c_comment_list.c_content }</div>
						<ul class='c_comment_option'>
							<li>신고하기</li>
							<li>답글쓰기</li>
						</ul>
					</c:if>	
					</c:forEach>
				</div>
			</c:if>	
			</c:forEach>
		</main>
	</div>
</body>
</html>