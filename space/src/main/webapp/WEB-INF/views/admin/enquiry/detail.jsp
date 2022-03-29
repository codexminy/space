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
<link rel="styleSheet" href="${path }/resources/admin/css/notice.css">
<link rel="styleSheet" href="${path }/resources/admin/css/contactUs.css">
<script type="text/javascript">
	const address = "${path}/uploadSummernoteImageFile/contact-us";
</script>
<script type="text/javascript" src="${path }/resources/admin/js/common.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"/>
	<jsp:include page="../common/aside.jsp"/>
	<div class="container home-container">
		<jsp:include page="../common/subLink.jsp"/>
		<div class="list-wrap">
			<div class="notice-title">
				<ul></ul>
				<ul></ul>
			</div>
			<div class="notice-content"></div>
			<div class="line"></div>
			<div class="answer-wrap">
				<h2>답변 내역</h2>
				<div class="answer"></div>
			</div>
<!-- 			<div class="line"></div> -->
			<div class="textarea">
				<textarea class="summernote" name="cuc_comment_content"></textarea>
			</div>
			<div class="btn-wrap">
				<ul>
					<li class="notice-update" onclick="answer(${cu_id})">답변 등록</li>
					<li class="notice-go-list">목록</li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('.nav-contactUs').css('backgroundColor', 'rgb(240,240,240)');
		$('.nav-contactUs i, .nav-contactUs span').css('color', '#22007F');
		$('aside li:nth-child(1)').css('backgroundColor', 'rgb(240,240,240)');
		$('aside li:nth-child(1) .menuHover').css('color', '#22007F');
	
		$(document).ready(function() {
			getLoad();
			getCmt();
		});
	
		function answer(id) {
			const data = {
				cu_id: id,
				cuc_comment_content: $('textarea[name="cuc_comment_content"]').val(),
			};

			if($('.summernote').summernote('isEmpty')) {
				alert('내용을 입력해주세요!');
				return;
			}
			
			if(confirm('답변을 등록하시겠습니까?')) {
				$.ajax({
					url : "${path}/admin/enquiry/enquiry/contactUs/" + id + "/Y",
					type : "POST",
					data : JSON.stringify(data),
					contentType: 'application/json; charset=utf-8',
					success : function(data) {
						getLoad();
						getCmt();
						$('.summernote').summernote('code', '');
						alert('등록이 완료되었습니다.');
					}
				});	
			}
		}

		function answerDelete(cuc_id, cu_id) {
			if(confirm('답변을 삭제하시겠습니까?')) {
				$.ajax({
					url : "${path}/admin/enquiry/enquiry/contactUs/cmt/" + cuc_id + "/N/" + cu_id,
					type: "DELETE",
					success : function(result) {
						getLoad();
						getCmt();
						$('.summernote').summernote('code', '');
						alert('삭제가 완료되었습니다.');
					}
				});
			}
		}

		$('.notice-go-list').on('click', () => {
			location.href = "${path}/admin/enquiry/contactUs";
		});

		function getLoad() {
			const noticeTitle1 = $('.notice-title ul:first-child');
			const noticeTitle2 = $('.notice-title ul:last-child');
			const noticeContent = $('.notice-content');
			
			$.ajax({
				url : "${path}/admin/enquiry/enquiry/contactUs/${cu_id}",
				type: "GET",
				success : function(result) {
					const list = result['list'];
					
					let noticeTitleData1 = "";
					let noticeTitleData2 = "";
					let noticeContentData = "";
					
					noticeTitleData1 += '<li>' + list.cs_name + '</li>';
					noticeTitleData1 += '<li>' + list.cu_title + '</li>';
					noticeTitleData2 += '<li>작성일 : ' + formatDate(list.cu_date) + '</li>';
					
					if(list.cu_state === 'Y') {
						noticeTitleData2 += "<li>완료</li>";
					} else if(list.cu_state === 'N') {
						noticeTitleData2 += "<li>대기중</li>";
					}
					
					noticeContentData += '<p>' + list.cu_content + '</p>';

					noticeTitle1.html(noticeTitleData1);
					noticeTitle2.html(noticeTitleData2);
					noticeContent.html(noticeContentData);
				}
			});
		}
		
		function getCmt() {
			const answer = $('.answer');
			
			$.ajax({
				url : "${path}/admin/enquiry/enquiry/contactUs/${cu_id}",
				type: "GET",
				success : function(result) {
					const cmt = result['cmt'];
					
					let answerData = "";
					
					if(cmt != null) {
						answerData += '<div>';
						answerData += '<ul>';
						answerData += '<li class="pa">'+ cmt.cuc_comment_content +'</li>'
						answerData += '<li><ul class="answer-date">';
						answerData += '<li class="pa">'+ formatDate(cmt.cuc_comment_date) +'</li>';
						answerData += '<li><button type="button" onclick="answerDelete('+ cmt.cuc_comment_id + ',' + "${cu_id}" +')">답변 삭제</button></li>';
						answerData += '</ul></li>';
						answerData += '</ul>';
						answerData += '</div>';
	
					}
					
					answer.html(answerData);
				}
			});
		}
	</script>
	<script type="text/javascript" src="${path}/resources/admin/js/summernoteForm.js"></script>
</body>
</html>











