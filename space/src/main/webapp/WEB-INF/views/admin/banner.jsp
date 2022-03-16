<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/admin.css" />
</head>
<body>
	<jsp:include page="headerNav.jsp"/>
	<div class="container">
		<div class="common-menu">
			<jsp:include page="leftNav.jsp">
				<jsp:param value="${list }" name="list"/>
			</jsp:include>
		</div>
		<div class="common-con banner-container">
			<div class="banner-wrap">
				<div class="title-wrap">
					<h2>배너관리 &gt;</h2>
					<div class="line"></div>
					<ul class="title-list">
						<li><a href="#">목록</a></li>
						<li class="sep"></li>
						<li><a href="#">신규등록</a></li>
						<li class="sep"></li>
						<li><a href="#">마감</a></li>
					</ul>
				</div>
				<div class="banner-table-wrap">
					<table>
						<thead>
							<tr>
								<th>업체</th>
								<th>노출 상호</th>
								<th>링크</th>
								<th>기간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="pageList" items="${pageList }">
								<tr>
									<td><a href="#"><c:out value="${pageList.na_title }"/></a></td>
									<td><a href="#"><c:out value="${pageList.na_name }"/></a></td>
									<td><c:out value="${pageList.na_url }"/></td>
									<td>
										<fmt:formatDate value="${pageList.na_start_date }" pattern="yyyy/MM/dd"/> ~
										<fmt:formatDate value="${pageList.na_end_date }" pattern="yyyy/MM/dd"/>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="paging-wrap">
						<ul class="paging-list">
							<c:choose>
								<c:when test="${paging.prev }">
									<li><a href="#">&lt;</a></li>
								</c:when>
								<c:when test="${!paging.prev }">
									<li><a href="#" class="disable">&lt;</a></li>
								</c:when>
							</c:choose>
							<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
								<li><a href="#">${num }</a></li>
							</c:forEach>
							<c:choose>
								<c:when test="${paging.next }">
									<li><a href="#">&gt;</a></li>
								</c:when>
								<c:when test="${!paging.next }">
									<li><a href="#" class="disable">&gt;</a></li>
								</c:when>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>