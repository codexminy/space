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
		<div class="left-aside">
			<jsp:include page="leftNav.jsp">
				<jsp:param value="${list }" name="list"/>
			</jsp:include>
		</div>
		<div class="board-container">
			<div class="board-wrap">
				<div class="stats-wrap">
					<table class="notification" border="1">
					<colgroup>
						<col width="50%"/>
						<col width="50%"/>
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">신고접수 &gt;</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>회원 신고 접수</td>
							<td><c:out value="${all }"/>건</td>
						</tr>
						<tr>
							<td>게시글 신고 접수</td>
							<td><c:out value="${board }"/>건</td>
						</tr>
						<tr>
							<td>댓글 신고 접수</td>
							<td><c:out value="${cmt }"/>건</td>
						</tr>
						<tr>
							<td>리뷰 신고 접수</td>
							<td><c:out value="${review }"/>건</td>
						</tr>
					</tbody>
				</table>
				</div>
				<table class="banner" border="1">
					<colgroup>
						<col width="70%"/>
						<col width="30%"/>
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">배너관리 &gt;</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="banner" items="${banner }">
							<tr>
								<td><c:out value="${banner.na_name }"/></td>
								<td>
									<fmt:formatDate value="${banner.na_start_date }" pattern="yyyy/MM/dd"/> ~
									<fmt:formatDate value="${banner.na_end_date }" pattern="yyyy/MM/dd"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="admin" border="1">
					<colgroup>
						<col width="70%"/>
						<col width="25%"/>
						<col width="5%"/>
					</colgroup>
					<thead>
						<tr>
							<th colspan="3">어드민안내 &gt;</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="admin" items="${admin }">
							<tr>
								<td><c:out value="${admin.notice_admin_title }"/></td>
								<td><fmt:formatDate value="${admin.notice_admin_date }" pattern="yyyy/MM/dd"/></td>
								<td><c:out value="${admin.notice_admin_view }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>