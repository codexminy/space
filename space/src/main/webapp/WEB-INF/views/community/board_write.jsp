<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>우주장터</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/common.css?ver=1" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/c_board_write.css?ver=2" />
	<jsp:include page="../summernoteLink.jsp"/>
	<script type="text/javascript">
	   const address = "${pageContext.request.contextPath}/uploadSummernoteImageFile/c-board";
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id='wrap_cm'>
		<form id="go_back_main" action="./main"></form>
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
		<div id="community_category">
			<ul>
				<a href="main"><li>전체보기</li></a>
				<c:forEach items="${c_category_list }" var="c_category_list">
					<a href="category?id=${c_category_list.c_category_id }"><li>${c_category_list.c_category_name }</li></a>
				</c:forEach>
			</ul>		
		</div>
		<main>
			<!-- 바깥 박스 -->
			<div id="outer_box">
				<!-- 왼쪽 박스 -->
				<div id="left_box">
					<h3>제목</h3>
					<h3>내용</h3>
				</div>
				<!-- 메인 내용물 박스 -->
				<div id="main_box">
					<form id="c_board_create" name="c_board_create_form" action="./c_board_write/process" method="POST" enctype="multipart/form-data">
					<input type="hidden" id="user_id" name="user_id" value="${user_id }" />
					<!-- 카테고리 제목 -->
					<div class="box1">
						<select id="c_category_select" name="c_category_id">
							<option value="none">카테고리 선택</option>
							<option value="1">동네질문</option>
							<option value="2">동네소식</option>
							<option value="3">취미생활</option>
							<option value="4">분실/실종센터</option>
							<option value="5">해주세요</option>
							<option value="6">기타</option>
						</select>
						<div></div>
						<textarea id="c_board_title" name="c_board_title"></textarea>
					</div>
					<!-- 내용 -->
					<div class="box2">
						<textarea class="summernote" id="c_board_content" name="c_board_content"></textarea>
					</div>
					</form>
					<div class="box5">
						<div>
							<button id="submit_btn">등록</button>
						</div>
						<div>
							<button id="go_back_btn">취소</button>
						</div>
					</div>
				</div>
				<!-- 오른쪽 박스 -->
				<div id="empty_box"></div>
			</div>
		</main>
	</div>
	<jsp:include page="../main/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/community/js/c_board_write.js?ver=1"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/summernoteForm.js"></script>
</body>
</html>