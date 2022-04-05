<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/notice/notice.css">
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapNotice">
        <div class="notice-top">
            <h3>● 공지사항</h3>
            <p>우주장터는 모두가 함께 만들어가는 중고거래, 커뮤니티 서비스 입니다. <br>
            운영 정책 및 규정에 위배되는 행위는 제재가 있을 수 있습니다.</p>
        </div>
        <div class="notice-content">
            <ul>
            	<c:forEach var="list" items="${list }">
	                <li>
	                    <a href="${path }/notice/notice_view?notice_id=${list.notice_id}">[${list.ncDTO.noc_name }]&nbsp;${list.notice_title }</a>
	                    <span class="day"><fmt:formatDate value="${list.notice_date }" pattern="yyyy/MM/dd"/></span>
	                </li>
	                <hr style="border: 0.1px solid  #D1D1D1">
            	</c:forEach>
            </ul>
        </div>
        <div class="page">
            <ul class="pagination modal">
            	<c:if test="${paging.prev }">
	                <li><a href="${path }/notice/notice?pageNum=${paging.startPage - 1}" class="arrow left">&lt;&lt;</a></li>
            	</c:if>
                <c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
                	<li><a href="${path }/notice/notice?pageNum=${num}" class="${paging.ps.pageNum == num ? 'active' : '' }">${num }</a></li>
                </c:forEach>
                <c:if test="${paging.next }">
	                <li><a href="${path }/notice/notice?pageNum=${paging.endPage + 1}" class="arrow right">&gt;&gt;</a></li>
                </c:if>
            </ul>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>