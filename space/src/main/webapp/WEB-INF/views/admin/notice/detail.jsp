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
			<div class="notice-title">
				<ul></ul>
				<ul></ul>
			</div>
			<div class="notice-content"></div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			getLoad();
		});
	
		function goDetail(id) {
			const form = $('#form');
			form.find('input[name="notice_id"]').val(id);
			form.submit();
		}
		
		function formatDate(date) {
		    let d = new Date(date);
		    let month = '' + (d.getMonth() + 1);
		    let day = '' + d.getDate();
		    let year = d.getFullYear();
		    
		    if (month.length < 2) month = '0' + month; 
		    if (day.length < 2) day = '0' + day; 
		    
		    return [year, month, day].join('-');
	    }

		function getLoad(page) {
			const noticeTitle1 = $('.notice-title ul:first-child');
			const noticeTitle2 = $('.notice-title ul:last-child');
			const noticeContent = $('.notice-content');
			
			$.ajax({
				url : "${path}/admin/page/notice/detail",
				data: {
					notice_id: "${dto.notice_id}"
				},
				success : function(result) {
					const list = result['list'];
					
					let noticeTitleData1 = "";
					let noticeTitleData2 = "";
					let noticeContentData = "";
					
					noticeTitleData1 += '<li>' + list['ncDTO'].noc_name + '</li>';
					noticeTitleData1 += '<li>' + list['notice_title'] + '</li>';
					
					noticeTitleData2 += '<li>조회수 : ' + list['notice_view'] + '</li>';
					noticeTitleData2 += '<li>작성일 : ' + formatDate(list['notice_date']) + '</li>';

					noticeContentData += '<p>' + list['notice_content'] + '</p>';
					
					noticeTitle1.html(noticeTitleData1);
					noticeTitle2.html(noticeTitleData2);
					noticeContent.html(noticeContentData);
				}
			});
		}
	</script>
</body>
</html>











