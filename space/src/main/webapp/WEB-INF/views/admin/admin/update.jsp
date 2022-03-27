<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/link.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
	const address = "${path}/uploadSummernoteImageFile/notice-admin";
</script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"/>
	<jsp:include page="../common/aside.jsp"/>
	<div class="container home-container">
		<jsp:include page="../common/subLink.jsp"/>
		<div class="list-wrap">
			<div class="notice-title-area">
				<select name="category" id="category">
					<option value="0">카테고리</option>
					<option value="0">--</option>
					<c:forEach var="list" items="${list }">
						<option value="${list.ac_id }">${list.ac_name }</option>
					</c:forEach>
				</select>
				<div class="notice-title-input">
					<input type="text" name="notice_admin_title" placeholder="제목을 입력해주세요."/>
				</div>
			</div>
			<div class="notice-content-area">
				<textarea class="summernote" name="notice_admin_content"></textarea>
				<div class="btn-wrap">
					<ul>
						<li class="notice-update">수정</li>
						<li class="notice-cancel">취소</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script>
		$.ajax({
			url : "${path}/admin/admin/admin/${dto.notice_admin_id}",
			type: "GET",
			success : function(result) {
				const list = result['list'];
				const options = $("#category option");
				$('input[name="notice_admin_title"]').val(list['notice_admin_title']);
				$('#category').val(list['acDTO'].ac_id).prop("selected",true);
				$('.summernote').summernote('pasteHTML', list['notice_admin_content']);
			}
		});
		
		$('.notice-update').on('click', () => {
			const data = {
				notice_admin_id: "${dto.notice_admin_id}",
				notice_admin_title: $('input[name="notice_admin_title"]').val(),
				notice_admin_content: $('textarea[name="notice_admin_content"]').val(),
				ac_id: $("#category").val()
			};
			
			if($("#category").val() === '0') {
				alert('카테고리를 선택해주세요!');
				return;
			} else if($('input[name="notice_admin_title"]').val() === '') {
				alert('제목을 입력해주세요!');
				return;
			} else if($('.summernote').summernote('isEmpty')) {
				alert('내용을 입력해주세요!');
				return;
			}
			
			if(confirm('공지사항을 수정하시겠습니까?')) {
				$.ajax({
					url : "${path}/admin/admin/admin/${dto.notice_admin_id}",
					type : "PUT",
					data : JSON.stringify(data),
					contentType: 'application/json; charset=utf-8',
					success : function(data) {
						alert('수정이 완료되었습니다.');
						location.href = "${path}/admin/admin/detail?notice_admin_id=${dto.notice_admin_id}";
					}
				});
			}
		});
		
		$('.notice-cancel').on('click', () => {
			if(confirm('수정을 취소하시겠습니까?')) {
				location.href = "${path}/admin/admin/detail?notice_admin_id=${dto.notice_admin_id}";
			}
		});
	</script>
	<script type="text/javascript" src="${path}/resources/admin/js/summernoteForm.js"></script>
</body>
</html>











