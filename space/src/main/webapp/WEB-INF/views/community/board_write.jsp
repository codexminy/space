<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>우주장터</title>
	<style>
		.box3 > #postimg {
			background-image: url('${pageContext.request.contextPath}/resources/images/board/postimg.png');
			background-repeat: no-repeat;
			background-size: cover;
		}
	</style>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/common.css?ver=1" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/css/c_board_write.css?ver=2" />
</head>
<body>
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
	<main>
		<div>
			<ul id="temp_ul">
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
					<textarea id="c_board_title" name="c_board_title"></textarea>
				</div>
				<!-- 내용 -->
				<div class="box2">
					<textarea id="c_board_content" name="c_board_content"></textarea>
				</div>
				<!-- 이미지 등록 -->
				<div class="box3">
					<div id="postimg">사진추가
						<input type="file"  id="upload_file" name="upfile" multiple="multiple"  />
						<input type="hidden" name="main_img" id="main_img"/>
					</div>
					<div class="img_div" id="img_div1"></div>
					<div class="img_div" id="img_div2"></div>
					<div class="img_div" id="img_div3"></div>
					<div class="img_div" id="img_div4"></div>
					<div class="img_div" id="img_div5"></div>
				</div>
				<div class="box4">
					<ul>
						<li>- 이미지는 등록 순서대로 첨부되며, 클릭하여 대표 이미지를 변경할 수 있습니다.</li>
						<li>- 최대 5장까지 등록이 가능합니다.</li>
						<li>- jpg,jpeg,png 확장자만 등록이 가능합니다.</li>
						<li>- 규정에 위배되는 이미지는 등록시 게시글이 제한 될 수 잇으며 추후 발견시 무통보 삭제 및 제재를 받으실 수 있습니다.</li>
					</ul>
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
<script src="${pageContext.request.contextPath}/resources/community/js/c_board_write.js?ver=2"></script>
</body>
</html>