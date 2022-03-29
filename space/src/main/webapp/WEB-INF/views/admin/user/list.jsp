<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="../common/link.jsp"/>
<script type="text/javascript">
	const url = '/admin/user/user/user';
	
	function createSearch(paging) {
		let searchData = '';

		searchData += '<select name="type">';
		searchData += '<option value="A" ' + (paging.ps.type == "A" ? "selected" : "") + '>전체</option>';
		searchData += '<option value="B" ' + (paging.ps.type == "B" ? "selected" : "") + '>아이디</option>';
		searchData += '<option value="C" ' + (paging.ps.type == "C" ? "selected" : "") + '>닉네임</option>';
		searchData += '<option value="D" ' + (paging.ps.type == "D" ? "selected" : "") + '>주소</option>';
		searchData += '<option value="E" ' + (paging.ps.type == "E" ? "selected" : "") + '>휴대전화</option>';
		searchData += '<option value="F" ' + (paging.ps.type == "F" ? "selected" : "") + '>메일</option>';
		searchData += '</select>';
		searchData += '<input type="text" name="keyword" value=' + (paging.ps.keyword == null ? "" : paging.ps.keyword) + '>';
		
		return searchData;
	}
	
	function createTable(list) {
		let listData = '';

		for(let i=0; i<list.length; ++i) {
			listData += "<tr>";
			listData += "<td>" + list[i].rn + "</td>";
			listData += "<td><input type=checkbox name=chkBox value=" + list[i].user_id + " onclick=checking() /></td>";
			listData += "<td><a href=javascript:goTest(" + list[i].user_id + ")>" + list[i].lilDTO.login_id + "</a></td>";
			listData += "<td>" + list[i].user_nickname + "</td>";
			listData += "<td>" + formatDate(list[i].user_join_date) + "</td>";
			listData += "<td>" + list[i].user_address + "</td>";
			listData += "<td>" + list[i].user_phone + "</td>";
			listData += "<td>" + list[i].lilDTO.login_id + "</td>";
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
	<jsp:include page="../common/js.jsp"/>
	<script type="text/javascript">
		function goTest(id) {
			window.open("${path }/admin/user/detail", "userDetail", "width = 500, height = 500");
		}
	</script>
</body>
</html>












