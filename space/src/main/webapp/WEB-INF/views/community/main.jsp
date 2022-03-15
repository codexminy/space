<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>우주장터</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/common.css?ver=1" />
</head>
<body>
	<div>
		<header>
			
		</header>
		<main>
			<ul>
				<li>
					전체
				</li>
				<li>
					카테고리1
				</li>
				<li>
					카테고리2
				</li>
				<li>
					카테고리3
				</li>
				<li>
					카테고리4
				</li>
				<li>
					카테고리5
				</li>
			</ul>
			<c:forEach items="${c_board_list }" var="c_board_list">
				<div class='c_board'>
					<div class='c_category'>${c_board_list.c_category_name }</div>
					<div class='c_board_img'>${c_board_list.c_board_img }</div>
					<ul>
						<li>작성자&nbsp;&nbsp;${c_board_list.user_nickname }</li>
						<li>${c_board_list.c_board_date }</li>
					</ul>				
					<h3>${c_board_list.c_board_title }</h3>
					<hr />
					<p>${c_board_list.c_board_content }</p>
					<div class='c_comment'>댓글쓰기</div>
				</div>			
			</c:forEach>
		</main>
	</div>
</body>
</html>