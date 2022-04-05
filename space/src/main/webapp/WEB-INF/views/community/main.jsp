<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>우주장터</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/community.css?ver=2" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrap_cm">
		<p id="hello">${userLoggedIn.user_id }</p>
		<div id="community_category">
			<ul>
				<li><a href="main">전체보기</a></li>
				<c:forEach items="${c_category_list }" var="c_category_list">
					<li><a href="category?id=${c_category_list.c_category_id }">${c_category_list.c_category_name }</a></li>
				</c:forEach>
			</ul>		
		</div>
		<main>
			<div class="flex-end">
				<!-- 
				<div>
					<form name="board_search_form" method="post" action="search">
						<input class="search-bar-input" type="search" name="keyword">
						<input type="submit" value="확인"></input>
					</form>
					<i class="fas fa-search"></i>
				</div>
				 -->
				<div id="board_write">글쓰기
					<form id="board_write_on" action="./c_board_write" method="POST">
					</form>
				</div>
			</div>
			<c:forEach items="${c_board_list }" var="c_board_list">
			
			<c:choose>
			<c:when test="${(c_board_list.c_board_hidden eq 'N') and (c_board_list.c_board_delete eq 'N')}">
				<div class='c_board'>
					<form class="c_board_view" action="./c_board" method="GET">
						<input type="hidden" name="c_board_id" value="${c_board_list.c_board_id }" />
					</form>
					<div class='c_category'>${c_board_list.c_category_name }</div>
					<div class='c_board_profile'>
						<c:forEach items="${c_user_list }" var="c_user_list">
						<c:if test="${c_board_list.user_id eq c_user_list.user_id}">
							<c:choose>
							<c:when test="${not empty c_user_list.user_profile }">
								<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="60px"/>
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="60px"/>
							</c:otherwise>
							</c:choose>
						</c:if>
						</c:forEach>
					</div>
					<ul class='c_board_writer'>
						<li>작성자&nbsp;&nbsp;${c_board_list.user_nickname }</li>
						<li><fmt:formatDate value="${c_board_list.c_board_date }" pattern="yy.MM.dd a hh:mm"/></li>
					</ul>
					<h3>${c_board_list.c_board_title }</h3>
					<hr />
					<div class='c_board_max_height'>
						<div class='view_count'>조회수: ${c_board_list.c_board_view }</div>
						<p class='c_board_content'>${c_board_list.c_board_content }</p>
					</div>
					<hr />
					<ul class='c_board_option'>
						<!-- 
						<li class='view_report'>신고하기
							<p class='data_board_id'>${c_board_list.c_board_id }</p>
						</li>
						 -->						
						<li class='view_comment'><img src="${pageContext.request.contextPath}/resources/images/community/spacetalk.png" width="20px" height="18px">댓글보기
							<c:forEach items="${c_comment_count }" var="c_comment_count">
							<c:choose>
							<c:when test="${c_comment_count.c_board_id eq c_board_list.c_board_id }">
								${c_comment_count.total }
							</c:when>
							</c:choose>	
							</c:forEach>
						</li>
					</ul>	
				</div>
			</c:when>
			
			<c:when test="${(c_board_list.c_board_hidden eq 'N') and (c_board_list.c_board_delete ne 'N')}">
				<div class='c_board'>
					<form class="c_board_view" action="./c_board" method="GET">
						<input type="hidden" name="c_board_id" value="${c_board_list.c_board_id }" />
					</form>
					<div class='c_category'>${c_board_list.c_category_name }</div>
					<div class='alert'>신고된 게시물</div>
					<div class='c_board_profile'>
						<c:forEach items="${c_user_list }" var="c_user_list">
						<c:if test="${c_board_list.user_id eq c_user_list.user_id}">
							<c:choose>
							<c:when test="${not empty c_user_list.user_profile }">
								<img src="${pageContext.request.contextPath}/resources/${c_user_list.user_profile }" width="60px"/>
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/resources/images/profile/null.png" width="60px"/>
							</c:otherwise>
							</c:choose>
						</c:if>
						</c:forEach>
					</div>
					<ul class='c_board_writer'>
						<li>작성자&nbsp;&nbsp;${c_board_list.user_nickname }</li>
						<li><fmt:formatDate value="${c_board_list.c_board_date }" pattern="yy.MM.dd a hh:mm"/></li>
					</ul>
					<h3>${c_board_list.c_board_title }</h3>
					<hr />
					<div class='c_board_max_height'>
						<div class='view_count'>조회수: ${c_board_list.c_board_view }</div>
						<p class='c_board_content'>${c_board_list.c_board_content }</p>
					</div>
					<hr />
					<ul class='c_board_option'>
						<!-- 
						<li class='view_report'>신고하기
							<p class='data_board_id'>${c_board_list.c_board_id }</p>
						</li>
						 -->						
						<li class='view_comment'><img src="${pageContext.request.contextPath}/resources/images/community/spacetalk.png" width="20px" height="18px">댓글보기
							<c:forEach items="${c_comment_count }" var="c_comment_count">
							<c:choose>
							<c:when test="${c_comment_count.c_board_id eq c_board_list.c_board_id }">
								${c_comment_count.total }
							</c:when>
							</c:choose>	
							</c:forEach>
						</li>
					</ul>	
				</div>
			</c:when>
			</c:choose>

			</c:forEach>
		</main>
	</div>
<jsp:include page="../main/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/community/js/community.js?ver=3"></script>
</body>
</html>