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
		<jsp:include page="../common/searchForm.jsp"/>
		<div class="title-wrap">
			<h2 class="title">신고 관리</h2>
			<div class="line"></div>
		</div>
		<div class="nc-table-wrap">
			<table border="1">
				<thead>
					<tr>
						<th>신고대상</th>
						<th>접수일</th>
						<th>신고자</th>
						<th>사유</th>
						<th>내용</th>
						<th>게시글</th>
						<th>누적신고</th>
						<th>처리</th>
					</tr>
				</thead>
				<tbody class="notify-table"></tbody>
			</table>
			<div class="pagenation">
				<ul class="paging"></ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			getLoad();
		});
		
		$('.search').on('click', (e) => {
			e.preventDefault();
			getLoad();
		});
		
		$('select[name="amount"]').on('change', () => {
			getLoad();
		});
		
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
		
		function getLoad(page) {
			const nt = $('.notify-table');
			const pagenation = $('.paging');
			const searchArea = $('.search-area');
			
			$.ajax({
				url : "${path}/admin/notify/notify",
				type : "GET",
				data: {
					pageNum: page,
					type: $('select[name="type"]').val(),
					keyword: $('input[name="keyword"]').val(),
					amount: $('select[name="amount"]').val()
				},
				success : function(result) {
					const list = result['list'];
					const paging = result['paging'];
					
					let nd = '';
					let searchData = "";
					let listData = "";
					let pageData = "";
					
					searchData += '<select name="type">';
					searchData += '<option value="A" ' + (paging.ps.type == "A" ? "selected" : "") + '>전체</option>';
					searchData += '<option value="B" ' + (paging.ps.type == "B" ? "selected" : "") + '>신고대상</option>';
					searchData += '<option value="C" ' + (paging.ps.type == "C" ? "selected" : "") + '>신고자</option>';
					searchData += '<option value="D" ' + (paging.ps.type == "D" ? "selected" : "") + '>사유</option>';
					searchData += '</select>';
					searchData += '<input type="text" name="keyword" value=' + (paging.ps.keyword == null ? "" : paging.ps.keyword) + '>';
					
					for(let i=0; i<list.length; ++i) {
						nd += '<tr>';
						nd += '<td>'+ list[i].reported +'</td>';
						nd += '<td>'+ formatDate(list[i].n_notify_date) +'</td>';
						nd += '<td>'+ list[i].reporter +'</td>';
						nd += '<td>'+ list[i].nfc_name +'</td>';
						nd += '<td><button type="button">내용보기</button></td>';
						nd += '<td><button type="button">바로가기</button></td>';
						nd += '<td>'+ list[i].user_reported +'</td>';
						nd += '<td>';
						if(list[i].n_handling === 'N') {
							nd += '<button type="button" onclick="approval('+ list[i].n_id + ',' + list[i].board_id + ',' + list[i].c_board_id + ',' + list[i].user_id + ',\'Y\')">승인</button>';
							nd += '<button type="button" onclick="resignation('+ list[i].n_id + ',' + list[i].board_id + ',' + list[i].c_board_id + ',' + list[i].user_id + ',\'C\')">반려</button>';
						} else if(list[i].n_handling === 'Y') {
							nd += '<button type="button" onclick="cancelApproval('+ list[i].n_id + ',' + list[i].board_id + ',' + list[i].c_board_id + ',' + list[i].user_id + ',\'N\')">승인 취소</button>';
						} else if(list[i].n_handling === 'C') {
							nd += '<button type="button" onclick="cancelResignation('+ list[i].n_id + ',' + list[i].board_id + ',' + list[i].c_board_id + ',' + list[i].user_id + ',\'N\')">반려 취소</button>';
						}
						nd += '</td>';
						nd += '</tr>';
					}
					
					if(paging['prev']) {
						pageData += '<li><a href=javascript:getLoad(' + (paging['startPage'] - 1)  + ')><i class="fa-solid fa-angle-left"></i></a></li>';
					} else {
						pageData += '<li><a><i class="fa-solid fa-angle-left"></i></a></li>';
					}
					
					for(let i=paging['startPage']; i<=paging['endPage']; ++i) {
						if(paging['ps'].pageNum === i) {
							pageData += '<li><a href=javascript:getLoad(' + i + ') class="pageActive">' + i + '</a></li>';
						} else {
							pageData += '<li><a href=javascript:getLoad(' + i + ')>' + i + '</a></li>';
						}
					}
					
					if(paging['next']) {
						pageData += '<li><a href=javascript:getLoad(' + (paging['endPage'] + 1)  + ')><i class="fa-solid fa-angle-right"></i></a></li>';
					} else {
						pageData += '<li><a><i class="fa-solid fa-angle-right"></i></a></li>';
					}
					
					nt.html(nd);
					searchArea.html(searchData);
					pagenation.html(pageData);
				}
			});
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
		
	</script>
</body>
</html>









