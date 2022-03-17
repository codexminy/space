<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<jsp:include page="./common/cssLink.jsp"/>
</head>
<body>
	<jsp:include page="./common/headerNav.jsp"/>
	<div class="container">
		<div class="common-menu">
			<jsp:include page="./common/leftNav.jsp">
				<jsp:param value="${list }" name="list"/>
			</jsp:include>
		</div>
		<div class="common-con update-container">
			<p>배너 이미지</p>
			<img src="${pageContext.request.contextPath}/resources/${banner.na_img }" alt="" id="img"/>
			<p>배너 URL</p>
			<p>${banner.na_url }</p>
			<p>업체명</p>
			<p>${banner.na_title }</p>
			<p>노출상호명</p>
			<p>${banner.na_name }</p>
			<p>시작날짜</p>
			<p>${banner.na_start_date }</p>
			<p>종료날짜</p>
			<p>${banner.na_end_date }</p>
				<input type="hidden" name="na_id" value="${na_id }"/>
				<input type="hidden" name="pageNum" value="${ps.pageNum }"/>
				<input type="hidden" name="amount" value="${ps.amount }"/>
			<form id="form" enctype="multipart/form-data">
				<input type="file" name="multiFile" accept="image/*" id="image" multiple/>
			</form>
			<a href="${na_id }" id="update">수정</a>
			<a href="javascript:history.back();" id="go-to-list">취소</a>
		</div>
	</div>
	<script>
		//const image = document.querySelector('#image');
		//const img = document.querySelector('#img');
		
		//image.addEventListener('change', (e) => {
		//	const reader = new FileReader();
			
		//	reader.onload = (e) => {
		//		img.setAttribute('src', e.target.result);
		//	};
			
		//	reader.readAsDataURL(e.target.files[0]);
		//});
		
		const form = document.querySelector('#form');
		const update = document.querySelector('#update');
		//const goToList = document.querySelector('#');

		update.addEventListener('click', (e) => {
			e.preventDefault();
			form.setAttribute('action', '${pageContext.request.contextPath}/admin/update');
			form.setAttribute('method', 'post');
			form.submit();
		});
	</script>
</body>
</html>