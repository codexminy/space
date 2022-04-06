<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<link href="${pageContext.request.contextPath}/resources/chatting/css/chat.css" rel="stylesheet"/>
</head>
<style>
.chat{
margin-top: 193px;
}
</style>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapChat">
		<div class="chat">
	        <div class="header">
	            <img src="${pageContext.request.contextPath}/resources/images/chatting/talk_blue.png" alt="우주톡" width="30px" height="27px"><h1>우주톡</h1>
	        </div>
	        <hr>
	        <div class="main">
	            <ul>
	            	
	            <c:if test="${content ne null }">
	            <c:forEach var="c" items="${content }">
	                <li>
	                    <a onclick="window.open('${pageContext.request.contextPath}/chatting/chatPartner?board_id=${c.board_id}&buyer_id=${c.buyer_id}','우주톡','width=600, height=800')">
	                        <div class="img-box">
	                            <img src="${pageContext.request.contextPath}/resources/images/chatting/chat_basic_profile.png" class="profile-img" alt="스트릿market">
	                        </div>
	                        <div class="talk">
	                            <p class="friend-name">${c.nickname }</p>
	                            <p class="chat-content">${c.chat_contents }</p>
	                        </div>
	                        <div class="chat-status">
	                            <time datetime="11:39:00+09:00"><fmt:formatDate value="${c.chat_createat }" pattern="MM월HH일" /></time>
	                        	<c:if test="${c.cnt_status ne 0 && c.send_id ne user.user_id }">
	                        		<span class="chat-balloon">1</span>
	                        	</c:if>
	                        </div>
	                    </a>
	                </li>
	            </c:forEach>
	            </c:if>
	    
	
	            </ul>
	        </div>
	    </div>
	</div>
    <jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>