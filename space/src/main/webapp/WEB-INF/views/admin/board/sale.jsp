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
	<jsp:include page="../common/boardAside.jsp"/>
	<div class="container home-container">
		<jsp:include page="../common/boardLink.jsp"/>
		<div class="list-wrap">
			<div class="search-area"></div>
			<button class="sale-search">검색</button>
			<select name="amount">
				<option value="10" selected>10건</option>
				<option value="20">20건</option>
				<option value="30">30건</option>
				<option value="40">40건</option>
				<option value="50">50건</option>
			</select>
			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>선택</th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>등록일</th>
						<th>처리</th>
					</tr>
				</thead>
				<tbody class="sale-list"></tbody>
			</table>
			<div class="pagenation">
				<ul class="paging"></ul>
			</div>
		</div>
	</div>
	<form id="form" action="${path }/admin/user/detail" method="get">
		<input type="hidden" name="na_id"/>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			getLoad();
		});
	
		function goDetail(id) {
			const form = $('#form');
			form.find('input[name="notice_id"]').val(id);
			form.submit();
		}
		
		$('.sale-search').on('click', (e) => {
			e.preventDefault();
			getLoad();
		});
		
		$('select[name="amount"]').on('change', () => {
			getLoad();
		});
		
		function hiddenFunc(board_hidden, value, message) {
			$.ajax({
				url : "${path}/admin/board/board/" + board_hidden + "/" + value,
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
			const saleList = $('.sale-list');
			const pagenation = $('.paging');
			const searchArea = $('.search-area');
			
			$.ajax({
				url : "${path}/admin/page/board/sale",
				data: {
					pageNum: page,
					type: $('select[name="type"]').val(),
					keyword: $('input[name="keyword"]').val(),
					amount: $('select[name="amount"]').val()
				},
				success : function(result) {
					const list = result['list'];
					const paging = result['paging'];

					let searchData = "";
					let listData = "";
					let pageData = "";
					
					searchData += '<select name="type">';
					searchData += '<option value="A" ' + (paging.ps.type == "A" ? "selected" : "") + '>전체</option>';
					searchData += '<option value="B" ' + (paging.ps.type == "B" ? "selected" : "") + '>아이디</option>';
					searchData += '<option value="C" ' + (paging.ps.type == "C" ? "selected" : "") + '>닉네임</option>';
					searchData += '<option value="D" ' + (paging.ps.type == "D" ? "selected" : "") + '>카테고리</option>';
					searchData += '<option value="E" ' + (paging.ps.type == "E" ? "selected" : "") + '>제목</option>';
					searchData += '</select>';
					searchData += '<input type="text" name="keyword" value=' + (paging.ps.keyword == null ? "" : paging.ps.keyword) + '>';
					
					for(let i=0; i<list.length; ++i) {
						listData += "<tr>";
						listData += "<td>" + list[i].rn + "</td>";
						listData += "<td><input type=checkbox value=" + list[i].abDTO.board_id + "/></td>";
						listData += "<td><a href=javascript:goDetail(" + list[i].user_id + ")>" + list[i].lilDTO.login_id + "</a></td>";
						listData += "<td>" + list[i].user_nickname + "</td>";
						listData += "<td>" + list[i].pcDTO.p_category_name + "</td>";
						listData += "<td>" + list[i].abDTO.board_title + "</td>";
						listData += "<td>" + formatDate(list[i].abDTO.board_date) + "</td>";
						
						if(list[i].abDTO.board_hidden === 'N') {
							listData += '<td><button type="button" class="hiddenBtn" onclick="hiddenBtn('+ list[i].abDTO.board_id +')">숨기기<i class="fa-solid fa-angle-right"></i></button></td>';
						} else {
							listData += '<td><button type="button" class="visibleBtn" onclick="visibleBtn('+ list[i].abDTO.board_id +')">숨겨짐<i class="fa-solid fa-angle-right"></i></button></td>';
						}
						
						listData += "</tr>";
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
					
					searchArea.html(searchData);
					saleList.html(listData);
					pagenation.html(pageData);
				}
			});
		}
	</script>
</body>
</html>












