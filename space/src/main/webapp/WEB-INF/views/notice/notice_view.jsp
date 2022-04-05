<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 - 내용</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/notice/notice_view.css">
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
        <div class="notice-board">
            <hr style="border: 0.1px solid  #D1D1D1">
            <ul class="notice-board-top">
                <li class="title">${list.notice_title }</li>
                    <span class="day"><fmt:formatDate value="${list.notice_date }" pattern="yyyy/MM/dd"/></span>     
                </li>
            </ul>
            <hr style="border: 0.1px solid  #D1D1D1">
            <div class="notice-board-view">
                <p>${list.notice_content }</p>
            </div>
            <hr style="border: 0.1px solid  #D1D1D1">
        </div>
        <input type="button" value="목록" id="list" onclick="location.href='${pageContext.request.contextPath}/notice/notice'"/>
    </div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>