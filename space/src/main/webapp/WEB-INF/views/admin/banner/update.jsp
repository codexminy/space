<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/link.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="styleSheet" href="${path }/resources/admin/css/banner.css">
</head>
<body>
	<jsp:include page="../common/nav.jsp"/>
	<jsp:include page="../common/aside.jsp"/>
	<div class="container home-container">
		<jsp:include page="../common/subLink.jsp"/>
		<div class="list-wrap">
			<form id="form" action="${path}/admin/page/banner/create" method="post" encType="multipart/form-data">
				<table class="common-table">
					<colgroup>
						<col width="15%"/>
						<col width="85%"/>
					</colgroup>
					<tbody class="banner-create banner-table">
						<tr>
							<td>업체</td>
							<td>
								<div class="picture" onclick="fileClick()">
									<div class="pic-img" style="display: none;">
										<i class="fa-solid fa-camera"></i>
										<p>사진 등록</p>
									</div>
									<img src="" alt="" class="img" height="300"/>
								</div>
								<input type="file" id="uploadFile" name="uploadFile" accept="image/*"/>
							</td>
						</tr>
						<tr>
							<td>배너 URL</td>
							<td><input type="text" name="na_url" id="na_url"/></td>
						</tr>
						<tr>
							<td>업체명</td>
							<td><input type="text" name="na_title" id="na_title"/></td>
						</tr>
						<tr>
							<td>노출 상호</td>
							<td><input type="text" name="na_name" id="na_name"/></td>
						</tr>
						<tr>
							<td>시작 날짜</td>
							<td><input type="date" name="na_start_date" id="na_start_date"/></td>
						</tr>
						<tr>
							<td>종료 날짜</td>
							<td><input type="date" name="na_end_date" id="na_end_date"/></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="btn-wrap">
				<ul>
					<li class="banner-update update">수정</li>
					<li class="banner-update-cancel cancel">취소</li>
				</ul>
			</div>
		</div>
	</div>
	<input type="hidden" name="na_img" id="na_img"/>
	<input type="hidden" name="na_id" id="na_id" value="${dto.na_id }"/>
	<script type="text/javascript">
		$('.nav-banner').css('backgroundColor', 'rgb(240,240,240)');
		$('.nav-banner i, .nav-banner span').css('color', '#22007F');
		$('aside li:first-child').css('backgroundColor', 'rgb(240,240,240)');
		$('aside li:first-child .menuHover').css('color', '#22007F');
	
		$(document).ready(function() {
			getLoad();
		});
		
		function formatDate(date) {
		    let d = new Date(date);
		    let month = '' + (d.getMonth() + 1);
		    let day = '' + d.getDate();
		    let year = d.getFullYear();
		    
		    if (month.length < 2) month = '0' + month; 
		    if (day.length < 2) day = '0' + day; 
		    
		    return [year, month, day].join('-');
	    }

		function getLoad() {
			$.ajax({
				url : "${path}/admin/banner/banner/${dto.na_id}",
				type: 'GET',
				success : function(result) {
					const list = result['list'];
					
					$("#na_title").val(list['na_title']);
					$('#na_name').val(list['na_name']);
					$('#na_url').val(list['na_url']);
					$('#na_start_date').val(formatDate(list['na_start_date']));
					$('#na_end_date').val(formatDate(list['na_end_date']));
					$('#na_img').val(list['na_img']);
					$('.picture img').attr('src', "${path}/resources/" + list['na_img']);
				}
			});
		}
		
		$('.banner-update').on('click', () => {
			const na_id = $('#na_id').val();
			const title = $("#na_title").val().trim();
			const name = $("#na_name").val().trim();
			const url = $("#na_url").val().trim();
			const img = $('#na_img').val().trim();
			const start = $("#na_start_date").val();
			const end = $("#na_end_date").val();
			const uploadFile = $("#uploadFile")[0].files[0];

			if(title === '') {
				alert('업체명을 입력해주세요!');
				return;
			} else if(name === '') {
				alert('노출 상호명을 입력해주세요!');
				return;
			} else if(url === '') {
				alert('배너 URL을 입력해주세요!');
				return;
			} else if(start === '') {
				alert('시작 날짜를 입력해주세요!');
				return;
			} else if(end === '') {
				alert('종료 날짜를 입력해주세요!');
				return;
			} else if(!uploadFile && !$(".picture img").hasClass("img")) {
				alert('배너를 업로드해주세요!');
				return;
			} else if(start > end) {
				alert('시작 날짜는 종료 날짜보다 일찍 시작해야 합니다.');
				return;
			}

			var formData = new FormData();
			
			formData.append("na_id", na_id);
			formData.append("na_title", title);
			formData.append("na_name", name);
			formData.append("na_url", url);
			formData.append("na_img", img);
			formData.append("na_start_date", start);
			formData.append("na_end_date", end);
			
			if(uploadFile) {
				formData.append("uploadFile", uploadFile);
			}
			
			if(confirm('배너를 수정하시겠습니까?')) {
				$.ajax({
					enctype : 'multipart/form-data',
					processData : false,
					contentType : false,
					cache : false,
					url : "${path}/admin/banner/banner/${dto.na_id}",
					data : formData,
					type : "POST",
					success : function(res) {
						alert('배너 수정이 완료되었습니다.');
						location.href = '${path}/admin/banner/detail?na_id=${dto.na_id}';
					}
				});
			}
		})
		
		$('.banner-update-cancel').on('click', () => {
			if(confirm('수정을 취소하시겠습니까?')) {
				location.href = '${path}/admin/banner/detail?na_id=${dto.na_id}';
			}
		});
		
		$('#uploadFile').on('change', (e) => {
			const reader = new FileReader();
			reader.onload = function(e) {
				$('.picture img').attr('src', e.target.result);
			};

			if(e.target.files[0]) {
				reader.readAsDataURL(e.target.files[0]);
			} else {
				$('.pic-img').css('display', 'block');
				$('.picture img').css('display', 'none');
			}
			
			$('.picture img').removeClass('img');
		});

		function fileClick() {
			$('input[type="file"]').click();
		}
	</script>
</body>
</html>







