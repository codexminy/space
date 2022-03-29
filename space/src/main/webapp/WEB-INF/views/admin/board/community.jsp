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
	const url = '/admin/board/board/community';
	
	function createSearch(paging) {
		let searchData = '';

		searchData += '<select name="type">';
		searchData += '<option value="A" ' + (paging.ps.type == "A" ? "selected" : "") + '>전체</option>';
		searchData += '<option value="B" ' + (paging.ps.type == "B" ? "selected" : "") + '>아이디</option>';
		searchData += '<option value="C" ' + (paging.ps.type == "C" ? "selected" : "") + '>닉네임</option>';
		searchData += '<option value="D" ' + (paging.ps.type == "D" ? "selected" : "") + '>카테고리</option>';
		searchData += '<option value="E" ' + (paging.ps.type == "E" ? "selected" : "") + '>제목</option>';
		searchData += '</select>';
		searchData += '<input type="text" name="keyword" value=' + (paging.ps.keyword == null ? "" : paging.ps.keyword) + '>';
		
		return searchData;
	}
	
	function createTable(list) {
		let listData = '';

		for(let i=0; i<list.length; ++i) {
			listData += "<tr>";
			listData += "<td><input type=checkbox name=chkBox value=" + list[i].acbDTO.c_board_id + " onclick=checking() /></td>";
			listData += "<td>" + list[i].rn + "</td>";
			listData += "<td>" + list[i].lilDTO.login_id + "</td>";
			listData += "<td>" + list[i].user_nickname + "</td>";
			listData += "<td>" + list[i].ccDTO.c_category_name + "</td>";
			listData += "<td><a href=javascript:goDetail(" + list[i].acbDTO.c_board_id + ")>" + list[i].acbDTO.c_board_title + "</a></td>";
			listData += "<td>" + formatDate(list[i].acbDTO.c_board_date) + "</td>";
			
			if(list[i].acbDTO.c_board_hidden === 'N') {
				listData += '<td><button type="button" class="hiddenBtn" onclick="hiddenBtn('+ list[i].acbDTO.c_board_id +')">숨기기<i class="fa-solid fa-angle-right"></i></button></td>';
			} else {
				listData += '<td><button type="button" class="visibleBtn" onclick="visibleBtn('+ list[i].acbDTO.c_board_id +')">숨겨짐<i class="fa-solid fa-angle-right"></i></button></td>';
			}
			
			listData += "</tr>";
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
		$('.nav-board').css('backgroundColor', 'rgb(240,240,240)');
		$('.nav-board i, .nav-board span').css('color', '#22007F');
		$('aside li:nth-child(2)').css('backgroundColor', 'rgb(240,240,240)');
		$('aside li:nth-child(2) .menuHover').css('color', '#22007F');
	
		function hiddenFunc(c_board_hidden, value, message) {
			$.ajax({
				url : "${path}/admin/board/c-board/" + c_board_hidden + "/" + value,
				type: "PUT",
				success : function(result) {
					getLoad();
					alert('게시글 '+ message +' 완료되었습니다.');
				},
				error : function(result) {
					alert('error : 요청 실패');
				}
			});
		}
		
		function hiddenBtn(value) {
			if(confirm('게시글을 숨기시겠습니까?')) {
				hiddenFunc('Y', value, '숨김이');
			}
		}
		
		function visibleBtn(value) {
			if(confirm('게시글을 숨김 해제하시겠습니까?')) {
				hiddenFunc('N', value, '숨김 해제가');
			}
		}
	</script>
	<jsp:include page="../common/js.jsp"/>
</body>
</html>












