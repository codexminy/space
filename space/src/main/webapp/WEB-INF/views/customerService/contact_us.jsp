<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 1:1문의하기</title>
<link href="${pageContext.request.contextPath}/resources/customerService/css/contact_us.css" rel="stylesheet"/>
<jsp:include page="../summernoteLink.jsp"/>
<script type="text/javascript">
   const address = "${pageContext.request.contextPath}/uploadSummernoteImageFile/c-board";
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapClient">
        <div class="customerService">
            <h3>고객센터</h3>
            <p>무엇을 도와드릴까요?</p>
            <div class="cs-search">
                <input class="search-bar-input" type="search">  
                <i class="fas fa-search"></i>
            </div>
        </div>
        <div class="client">
            <h3>1:1 문의하기</h3>
            <div id="main_box">
				<form id="contact_us_create" name="contact_us_create_form" action="./contactUs/process" method="POST" enctype="multipart/form-data">
				<input type="hidden" id="user_id" name="user_id" value="${user_id }" />
				<!-- 카테고리 제목 -->
				<div class="box1">
					<select id="cs_category_select" name="cs_category_id">
						<option value="none">카테고리 선택</option>
						<option value="1">운영정책</option>
						<option value="2">계정/인증</option>
						<option value="3">구매/판매</option>
						<option value="4">거래 품목</option>
						<option value="5">거래 매너</option>
						<option value="6">이용 제재</option>
						<option value="7">동네생활</option>
						<option value="8">우주채팅</option>
						<option value="9">본인인증</option>
						<option value="10">기타</option>
					</select>
					<div></div>
					<textarea id="cu_title" name="cu_title"></textarea>
				</div>
				<!-- 내용 -->
				<div class="box2">
					<textarea class="summernote" id="cu_content" name="cu_content"></textarea>
				</div>
				</form>
				<div class="box5">
					<form id="go_back_main" action="./main"></form>
					<div>
						<button id="submit_btn">등록</button>
					</div>
					<div>
						<button id="go_back_btn">취소</button>
					</div>
				</div>
			</div>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp"/>
<script src="${pageContext.request.contextPath}/resources/customerService/js/contact_us.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/summernoteForm.js"></script>
</body>
</html>