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
</head>
<body>
	<jsp:include page="../common/nav.jsp"/>
	<jsp:include page="../common/noticeAside.jsp"/>
	<div class="container home-container">
		<jsp:include page="../common/noticeLink.jsp"/>
		<div class="list-wrap">
			<div class="notice-title-area">
				<select name="category" id="category">
					<option value="0">카테고리</option>
					<option value="0">--</option>
					<c:forEach var="list" items="${list }">
						<option value="${list.noc_id }">${list.noc_name }</option>
					</c:forEach>
				</select>
				<div class="notice-title-input">
					<input type="text" name="notice_title" placeholder="제목을 입력해주세요."/>
				</div>
			</div>
			<div class="notice-content-area">
				<textarea class="summernote" name="notice_content"></textarea>
				<div class="btns">
					<ul>
						<li class="notice-create">등록</li>
						<li class="cancel">취소</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('.notice-create').on('click', () => {
			const data = {
				notice_title: $('input[name="notice_title"]').val(),
				notice_content: $('textarea[name="notice_content"]').val(),
				noc_id: $("#category option:selected").val()
			};
			
			$.ajax({
				url : "${path}/admin/page/notice/create",
				type : "POST",
				data : JSON.stringify(data),
				contentType: 'application/json; charset=utf-8',
				success : function(data) {
					alert('등록이 완료되었습니다.');
					location.href = "${path}/admin/notice/list";
				}
			});
		});
	
		$(document).ready(function() {
			var toolbar = [
			    // 글꼴 설정
			    ['fontname', ['fontname']],
			    // 글자 크기 설정
			    ['fontsize', ['fontsize']],
			    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    // 글자색
			    ['color', ['forecolor','color']],
			    // 표만들기
			    ['table', ['table']],
			    // 글머리 기호, 번호매기기, 문단정렬
			    ['para', ['ul', 'ol', 'paragraph']],
			    // 줄간격
			    ['height', ['height']],
			    // 그림첨부, 링크만들기, 동영상첨부
			    ['insert',['picture','link','video']],
			    // 코드보기, 확대해서보기, 도움말
			    ['view', ['codeview','fullscreen', 'help']]
			  ];
	
			var setting = {
	            height : 500,
	            minHeight : 500,
	            maxHeight : 500,
	            focus : true,
	            lang : 'ko-KR',
	            toolbar : toolbar,
	            callbacks : { //여기 부분이 이미지를 첨부하는 부분
		            onImageUpload : function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	uploadSummernoteImageFile(files[i], this);
	           			}
	            	}
	            }
	         };
	
	        $('.summernote').summernote(setting);
		});
		
		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "${path}/uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					setTimeout(function() {
						$(el).summernote('editor.insertImage', data.url);
					}, 4000);
				}
			});
		}
	</script>
</body>
</html>











