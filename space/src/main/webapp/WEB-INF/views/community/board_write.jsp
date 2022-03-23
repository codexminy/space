<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>우주장터</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/common.css?ver=1" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/c_board_write.css?ver=1" />
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
			<div>
				<ul>
					<li><a href="main">전체보기</a></li>
					<c:forEach items="${c_category_list }" var="c_category_list">
						<li><a href="category?id=${c_category_list.c_category_id }">${c_category_list.c_category_name }</a></li>
					</c:forEach>
				</ul>
			</div>
			<!-- 바깥 박스 -->
			<div id="outer_box">
				<!-- 왼쪽 박스 -->
				<div id="left_box">
					<h3>제목</h3>
					<h3>내용</h3>
				</div>
				<!-- 메인 내용물 박스 -->
				<div id="main_box">
					<form id="c_board_create" name="c_board_create_form" action="./board????" method="POST">
					<!-- 카테고리 제목 -->
					<div class="box1">
						<select id="c_category_select" name="c_category_id">
							<option value="1">동네질문</option>
							<option value="2">동네소식</option>
							<option value="3">취미생활</option>
							<option value="4">분실/실종센터</option>
							<option value="5">해주세요</option>
							<option value="6">기타</option>
						</select>
						<textarea id="c_board_title" name="c_board_title"></textarea>
					</div>
					<!-- 내용 -->
					<div class="box2">
						<textarea id="c_board_content" name="c_board_content"></textarea>
					</div>
					<!-- 이미지 등록 -->
					<div class="box3">
						<div>이미지등록</div>
						<div>1</div>
						<div>2</div>
						<div>3</div>
						<div>4</div>
						<div>5</div>
					</div>
					<div class="box4">
						<div>
							<button>등록</button>
						</div>
						<div>
							<button>취소</button>
						</div>
					</div>
					</form>
				</div>
				<!-- 오른쪽 박스 -->
				<div id="empty_box"></div>
			</div>			
		</main>
	</div>
<script src="${pageContext.request.contextPath}/resources/community/js/c_board_write.js?ver=1"></script>
</body>
</html>