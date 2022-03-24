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
	<jsp:include page="../common/notificationAside.jsp"/>
	<div class="container nc-container">
		<div class="title-wrap">
			<h2 class="title">신고 관리</h2>
			<div class="line"></div>
		</div>
		<div class="nc-table-wrap">
			<table>
				<thead>
					<tr>
						<th>아이디</th>
						<th>접수일</th>
						<th>신고자</th>
						<th>제목</th>
						<th>사유</th>
						<th>게시글</th>
						<th>누적신고</th>
						<th>처리</th>
					</tr>
				</thead>
				<tbody class="noti"></tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			getLoad();
		});
		
		function getLoad() {
			const noti = $('.noti');
			
			$.ajax({
				url : "${path}/admin/notify/notify",
				type : "GET",
				success : function(result) {
					alert('받아오기 성공!' + result['list'].length);
				}
			});
		}
		
	</script>
</body>
</html>