<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<link href="${pageContext.request.contextPath}/resources/chatting/css/chat.css" rel="stylesheet"/>
</head>
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
	                <li>
	                    <a href="${pageContext.request.contextPath}/chatting/chatPartner">
	                        <div class="img-box">
	                            <img src="${pageContext.request.contextPath}/resources/images/chatting/chat_basic_profile.png" class="profile-img" alt="스트릿market">
	                        </div>
	                        <div class="talk">
	                            <p class="friend-name">스트릿market</p>
	                            <p class="chat-content">아직 안팔렸습니다!</p>
	                        </div>
	                        <div class="chat-status">
	                            <time datetime="11:39:00+09:00">오전 11:39</time>
	                        </div>
	                    </a>
	                </li>
	                <li>
	                    <a href="#">
	                        <div class="img-box">
	                            <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png" class="profile-img" alt="중고컴매입은컴닷">
	                        </div>
	                        <div class="talk">
	                            <p class="friend-name">중고컴매입은컴닷</p>
	                            <p class="chat-content">컴퓨터 고가로 매입합니다. 상점 팔로우시 택배비 지...</p>
	                        </div>
	                        <div class="chat-status">
	                            <time datetime="11:21:00+09:00">오전 11:21</time>
	                                <span class="chat-balloon">1</span>
	                        </div>
	                    </a>
	                </li>
	                <li>
	                    <a href="#">
	                        <div class="img-box">
	                            <img src="${pageContext.request.contextPath}/resources/images/profile/profile2.png" class="profile-img" alt="후기에진심인사람">
	                        </div>
	                        <div class="talk">
	                            <p class="friend-name">후기에진심인사람</p>
	                            <p class="chat-content">저 이제 1번 출구 앞이에요!</p>
	                        </div>
	                        <div class="chat-status">
	                            <time datetime="2022-03-12">03월 12일</time>
	                        </div>
	                    </a>
	                </li>
	                <li>
	                    <a href="#">
	                        <div class="img-box">
	                            <img src="${pageContext.request.contextPath}/resources/images/chatting/chat_basic_profile.png" class="profile-img" alt="공기팡">
	                        </div>
	                        <div class="talk">
	                            <p class="friend-name">공기팡</p>
	                            <p class="chat-content">네고 가능한가요?ㅠ</p>
	                        </div>
	                        <div class="chat-status">
	                            <time datetime="2022-03-03">03월 03일</time>
	                        </div>
	                    </a>
	                </li>
	            </ul>
	        </div>
	    </div>
	</div>
    <jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>