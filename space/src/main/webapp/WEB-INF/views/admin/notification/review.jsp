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
	const url = '/admin/notify/notify/review';
	
	function createSearch(paging) {
		let searchData = '';

		searchData += '<select name="type">';
		searchData += '<option value="A" ' + (paging.ps.type == "A" ? "selected" : "") + '>전체</option>';
		searchData += '<option value="B" ' + (paging.ps.type == "B" ? "selected" : "") + '>신고대상</option>';
		searchData += '<option value="C" ' + (paging.ps.type == "C" ? "selected" : "") + '>신고자</option>';
		searchData += '<option value="D" ' + (paging.ps.type == "D" ? "selected" : "") + '>사유</option>';
		searchData += '</select>';
		searchData += '<input type="text" name="keyword" value=' + (paging.ps.keyword == null ? "" : paging.ps.keyword) + '>';
		
		return searchData;
	}
	
	function createTable(list) {
		let listData = '';

		for(let i=0; i<list.length; ++i) {
			listData += '<tr>';
			listData += '<td>'+ list[i].rn +'</td>';
			listData += '<td>'+ list[i].reported +'</td>';
			listData += '<td>'+ formatDate(list[i].nr_notify_date) +'</td>';
			listData += '<td>'+ list[i].reporter +'</td>';
			listData += '<td>'+ list[i].nfc_name +'</td>';
			listData += '<td><button type="button">내용보기</button></td>';
			listData += '<td><button type="button">바로가기</button></td>';
			listData += '<td>'+ list[i].user_reported +'</td>';
			listData += '<td>';
			if(list[i].nr_handling === 'N') {
				listData += '<button type="button" onclick="approval('+ list[i].nr_id + ',' + list[i].review_id + ',' + list[i].user_id + ',\'Y\')">승인</button>';
				listData += '<button type="button" onclick="resignation('+ list[i].nr_id + ',' + list[i].review_id + ',' + list[i].user_id + ',\'C\')">반려</button>';
			} else if(list[i].nr_handling === 'Y') {
				listData += '<button type="button" onclick="cancelApproval('+ list[i].nr_id + ',' + list[i].review_id + ',' + list[i].user_id + ',\'N\')">승인 취소</button>';
			} else if(list[i].nr_handling === 'C') {
				listData += '<button type="button" onclick="cancelResignation('+ list[i].nr_id + ',' + list[i].review_id + ',' + list[i].user_id + ',\'N\')">반려 취소</button>';
			}
			listData += '</td>';
			listData += '</tr>';
		}
		
		return listData;
	}
</script>
<script type="text/javascript" src="${path }/resources/admin/js/common.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"/>
	<jsp:include page="../common/aside.jsp"/>
	<div class="container home-container">
		<jsp:include page="../common/subLink.jsp"/>
		<jsp:include page="../common/table.jsp"/>
	</div>
	<script type="text/javascript">
		function approval(nrId, reviewId, userId, nrHandling) {
			const message = '승인 하시겠습니까?';
			const successMessage = '승인이 완료되었습니다.';
			const failMessage = 'error: 승인 실패';
			
			putAjax(message, successMessage, failMessage, "${path}/admin/notify/notify/review/review", nrId, reviewId, userId, nrHandling);
		}
		
		function resignation(nrId, reviewId, userId, nrHandling) {
			const message = '반려 하시겠습니까?';
			const successMessage = '반려가 완료되었습니다.';
			const failMessage = 'error: 반려 실패';

			putAjax(message, successMessage, failMessage, "${path}/admin/notify/notify/review/review-resignation", nrId, reviewId, userId, nrHandling);
		}
		
		function cancelApproval(nrId, reviewId, userId, nrHandling) {
			const message = '승인을 취소하시겠습니까?';
			const successMessage = '승인 취소가 완료되었습니다.';
			const failMessage = 'error: 승인 취소 실패';

			putAjax(message, successMessage, failMessage, "${path}/admin/notify/notify/review/review-cancel", nrId, reviewId, userId, nrHandling);
		}
		
		function cancelResignation(nrId, reviewId, userId, nrHandling) {
			const message = '반려를 취소 하시겠습니까?';
			const successMessage = '반려 취소가 완료되었습니다.';
			const failMessage = 'error: 반려 취소 실패';
			
			putAjax(message, successMessage, failMessage, "${path}/admin/notify/notify/review/review-resignation-cancel", nrId, reviewId, userId, nrHandling);
		}
		
		function putAjax(message, successMessage, failMessage, address, nrId, reviewId, userId, nrHandling) {
			if(confirm(message)) {
				$.ajax({
					url : address,
					type : "PUT",
					contentType: 'application/json',
					data : JSON.stringify({
						nr_id: nrId,
						review_id: reviewId,
						user_id: userId,
						nr_handling: nrHandling
					}),
					success : function(result) {
						getLoad();
						alert(successMessage);
					},
					error : function(result) {
						alert(failMessage);
					}
				});
			}
		}
	</script>
	<jsp:include page="../common/js.jsp"/>
</body>
</html>









