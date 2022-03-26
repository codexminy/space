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
	const url = '/admin/notify/notify';
	
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
			listData += '<td>'+ formatDate(list[i].n_notify_date) +'</td>';
			listData += '<td>'+ list[i].reporter +'</td>';
			listData += '<td>'+ list[i].nfc_name +'</td>';
			listData += '<td><button type="button">내용보기</button></td>';
			
			if(list[i].board_id === 0) {
				listData += '<td><button type="button" onclick="goCommunityboard('+ list[i].c_board_id +')">바로가기</button></td>';
			} else {
				listData += '<td><button type="button" onclick="goBoard('+ list[i].board_id +')">바로가기</button></td>';
			}
			
			listData += '<td>'+ list[i].user_reported +'</td>';
			listData += '<td>';
			
			if(list[i].n_handling === 'N') {
				listData += '<button type="button" onclick="approval('+ list[i].n_id + ',' + list[i].board_id + ',' + list[i].c_board_id + ',' + list[i].user_id + ',\'Y\')">승인</button>';
				listData += '<button type="button" onclick="resignation('+ list[i].n_id + ',' + list[i].board_id + ',' + list[i].c_board_id + ',' + list[i].user_id + ',\'C\')">반려</button>';
			} else if(list[i].n_handling === 'Y') {
				listData += '<button type="button" onclick="cancelApproval('+ list[i].n_id + ',' + list[i].board_id + ',' + list[i].c_board_id + ',' + list[i].user_id + ',\'N\')">승인 취소</button>';
			} else if(list[i].n_handling === 'C') {
				listData += '<button type="button" onclick="cancelResignation('+ list[i].n_id + ',' + list[i].board_id + ',' + list[i].c_board_id + ',' + list[i].user_id + ',\'N\')">반려 취소</button>';
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
		function approval(nId, boardId, cBoardId, userId, nHandling) {
			const message = '승인 하시겠습니까?';
			const successMessage = '승인이 완료되었습니다.';
			const failMessage = 'error: 승인 실패';
			
			if(cBoardId === 0) {
				putAjax(message, successMessage, failMessage, "${path}/admin/notify/notify/board", nId, boardId, cBoardId, userId, nHandling);
			} else {
				putAjax(message, successMessage, failMessage, "${path}/admin/notify/notify/community-board", nId, boardId, cBoardId, userId, nHandling);
			}
		}
		
		function resignation(nId, boardId, cBoardId, userId, nHandling) {
			const message = '반려 하시겠습니까?';
			const successMessage = '반려가 완료되었습니다.';
			const failMessage = 'error: 반려 실패';
			
			if(cBoardId === 0) {
				putAjax(message, successMessage, failMessage, "${path}/admin/notify/notify/board-resignation", nId, boardId, cBoardId, userId, nHandling);
			} else {
				putAjax(message, successMessage, failMessage, "${path}/admin/notify/notify/community-board-resignation", nId, boardId, cBoardId, userId, nHandling);
			}
		}
		
		function cancelApproval(nId, boardId, cBoardId, userId, nHandling) {
			const message = '승인을 취소하시겠습니까?';
			const successMessage = '승인 취소가 완료되었습니다.';
			const failMessage = 'error: 승인 취소 실패';
			
			if(cBoardId === 0) {
				putAjax(message, successMessage, failMessage, "${path}/admin/notify/notify/board-cancel", nId, boardId, cBoardId, userId, nHandling);
			} else {
				putAjax(message, successMessage, failMessage, "${path}/admin/notify/notify/community-board-cancel", nId, boardId, cBoardId, userId, nHandling);
			}
		}
		
		function cancelResignation(nId, boardId, cBoardId, userId, nHandling) {
			const message = '반려를 취소 하시겠습니까?';
			const successMessage = '반려 취소가 완료되었습니다.';
			const failMessage = 'error: 반려 취소 실패';
			
			if(cBoardId === 0) {
				putAjax(message, successMessage, failMessage, "${path}/admin/notify/notify/board-resignation-cancel", nId, boardId, cBoardId, userId, nHandling);
			} else {
				putAjax(message, successMessage, failMessage, "${path}/admin/notify/notify/community-board-resignation-cancel", nId, boardId, cBoardId, userId, nHandling);
			}
		}
		
		function putAjax(message, successMessage, failMessage, address, nId, boardId, cBoardId, userId, nHandling) {
			if(confirm(message)) {
				$.ajax({
					url : address,
					type : "PUT",
					contentType: 'application/json',
					data : JSON.stringify({
						n_id: nId,
						board_id: boardId,
						c_board_id: cBoardId,
						user_id: userId,
						n_handling: nHandling
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
		
		function goCommunityboard(board_id) {
			location.href = "${path}/community/c_board?c_board_id=" + board_id;
		}
	</script>
	<jsp:include page="../common/js.jsp"/>
</body>
</html>









