<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>우주장터</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/common.css?ver=1" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/community.css?ver=2" />
</head>
<body>
	<div>
		<header>
			<div class="input_login">
				<form id="temp_user" name="createForm" action="./login" method="POST">
					<input type="text" name="temp_id" placeholder="아이디를 입력하세요." autocomplete="off" />
					<input type="password" name="temp_pw" placeholder="비밀번호를 입력하세요." autocomplete="off" />
				</form>
				<button id="login_btn">확인</button>
			</div>
			<div class="hello_login">${user_id }님 반갑습니다.</div>
			<p id="hello">${user_id }</p>
		</header>
		<main>
			<ul>
				<li><a href="main">전체보기</a></li>
				<c:forEach items="${c_category_list }" var="c_category_list">
					<li><a href="category?id=${c_category_list.c_category_id }">${c_category_list.c_category_name }</a></li>
				</c:forEach>
			</ul>
			<c:forEach items="${c_board_list }" var="c_board_list">
				<div class='c_board'>
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
						<li class='view_comment'>댓글보기(
							<c:forEach items="${c_comment_count }" var="c_comment_count">
							<c:choose>
							<c:when test="${c_comment_count.c_board_id eq c_board_list.c_board_id }">
								${c_comment_count.total }
							</c:when>
							</c:choose>	
							</c:forEach>
						)</li>
					</ul>
					<div class='c_comment'>
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
						<c:choose>
						<c:when test="${not empty user_id}">
							<div class='mycomment'>
								<div class='c_comment_myprofile'><img src="${pageContext.request.contextPath}/resources/images/profile/profile${user_id }.png" width="50px"/></div>
								<form class='c_comment_write' name="commentForm" action="./comment_write" method="POST">
									<textarea class='c_comment_textarea' name="c_content" style="width:80%;height:50px;border:1;overflow:visible;text-overflow:ellipsis;"></textarea>
									<input type="hidden" name="c_board_id" value="${c_board_list.c_board_id }" />
									<input type="hidden" name="user_id" value="${user_id }" />
									<input class='c_comment_btn' type="submit" value="등록"/>
								</form>
							</div>			
						</c:when>
						</c:choose>	
						
					</div>
				</div>
			</c:forEach>
		</main>
	</div>
<script src="${pageContext.request.contextPath}/resources/community/js/community.js?ver=1"></script>
</body>
</html>