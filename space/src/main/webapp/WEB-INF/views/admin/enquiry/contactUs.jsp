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
	const url = '/admin/enquiry/enquiry/contactUs';
	
	function createSearch(paging) {
		let searchData = '';

		searchData += '<select name="type">';
		searchData += '<option value="A" ' + (paging.ps.type == "A" ? "selected" : "") + '>전체</option>';
		searchData += '<option value="B" ' + (paging.ps.type == "B" ? "selected" : "") + '>분류</option>';
		searchData += '<option value="C" ' + (paging.ps.type == "C" ? "selected" : "") + '>제목</option>';
		searchData += '</select>';
		searchData += '<input type="text" name="keyword" value=' + (paging.ps.keyword == null ? "" : paging.ps.keyword) + '>';
		
		return searchData;
	}
	
	function createTable(list) {
		let listData = '';

		for(let i=0; i<list.length; ++i) {
			listData += "<tr>";
			listData += "<td>" + list[i].rn + "</td>";
			listData += "<td><input type=checkbox value=" + list[i].cu_id + "/></td>";
			listData += "<td>" + list[i].cscDTO.cs_name + "</td>";
			listData += "<td><a href=javascript:goDetail(" + list[i].cu_id + ")>" + list[i].cu_title + "</a></td>";
			listData += "<td>" + formatDate(list[i].cu_date) + "</td>";
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
</body>
</html>