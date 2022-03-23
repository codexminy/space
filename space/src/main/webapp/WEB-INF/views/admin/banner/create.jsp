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
	<jsp:include page="../common/bannerAside.jsp"/>
	<div class="container home-container">
		<jsp:include page="../common/bannerLink.jsp"/>
		<div class="list-wrap">
			<form id="form" action="${path}/admin/page/banner/create" method="post" encType="multipart/form-data">
				<table>
					<tbody class="banner-create banner-table">
						<tr>
							<td>업체</td>
							<td colspan="3">
								<div class="picture" onclick="fileClick()">
									<div class="pic-img">
										<i class="fa-solid fa-camera"></i>
										<p>사진 등록</p>
									</div>
								</div>
								<input type="file" id="uploadFile" name="uploadFile" onchange="fileChange(event)"/>
							</td>
						</tr>
						<tr>
							<td>배너 URL</td>
							<td colspan="3"><input type="text" name="na_url" id="na_url"/></td>
						</tr>
						<tr>
							<td>업체명</td>
							<td><input type="text" name="na_title" id="na_title"/></td>
							<td>노출 상호</td>
							<td><input type="text" name="na_name" id="na_name"/></td>
						</tr>
						<tr>
							<td>시작 날짜</td>
							<td><input type="date" name="na_start_date" id="na_start_date"/></td>
							<td>종료 날짜</td>
							<td><input type="date" name="na_end_date" id="na_end_date"/></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="btn-wrap">
				<ul>
					<li class="create">등록</li>
					<li class="cancel">취소</li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.create').on('click', () => {
				const title = $("#na_title").val().trim();
				const name = $("#na_name").val().trim();
				const url = $("#na_url").val().trim();
				const start = $("#na_start_date").val();
				const end = $("#na_end_date").val();
				const uploadFile = $("#uploadFile")[0].files[0];
				
				var formData = new FormData();
				
				formData.append("na_title", title);
				formData.append("na_name", name);
				formData.append("na_url", url);
				formData.append("na_start_date", start);
				formData.append("na_end_date", end);
				formData.append("uploadFile", uploadFile);
				
				$.ajax({
					enctype : 'multipart/form-data',
					processData : false,
					contentType : false,
					cache : false,
					url : "${path}/admin/page/banner/create",
					data : formData,
					type : "POST",
					success : function(res) {
						alert('게시글 등록 완료');
						location.href = '${path}/admin/banner/list';
					}
				});
			})
		});
		
		function fileChange(event) {
			const reader = new FileReader();
			reader.onload = function(event) {
				document.querySelector(".picture").innerHTML = '<img src=' + event.target.result + ' width=400>';
			};
			reader.readAsDataURL(event.target.files[0]);
		}

		function fileClick() {
			$('input[type="file"]').click();
		}
	</script>
</body>
</html>