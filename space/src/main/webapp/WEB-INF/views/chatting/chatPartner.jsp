<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상대방이랑 대화</title>
<link href="${pageContext.request.contextPath}/resources/chatting/css/chatPartner.css" rel="stylesheet"/>
</head>
<body>
	<div id="chat">
        <div class="profile">
            <span class="profile-name">스트릿market<a href="javascript:show();"><img src="${pageContext.request.contextPath}/resources/images/chatting/arrow.png" alt="하단"></a></span>
            <div id="profile-bar">
                <ul id="profile-detail01">
                    <li class="profile-detail01-title">판매상품</li>
                    <span>219</span>
                    <span>★★★★☆</span>
                    <li class="more"><a href="">></a></li>
                </ul>
                <ul id="profile-detail02">
                    <li class="profile-detail02-title">거래후기</li>
                    <span>143</span>
                    <li class="more"><a href="">></a></li>
                </ul>
                <button class="report">신고하기</button>
                <button class="store">상점 바로가기</button>
                <div class="background"></div>
            </div>
        </div>
        <div class="chat-content">
            <div class="date-line">
                <time datetime="2022-03-16">2022년 3월 16일</time>
            </div>
            <!-- 채팅 내용 -->
            <div class="main-chat">
                <div class="friend-chat">
                    <img class="profile-img" src="${pageContext.request.contextPath}/resources/images/chatting/chat_basic_profile.png" alt="스트릿market">
                    <div class="friend-chat-col">
                        <span class="balloon">안녕하세요!</span>
                        <span class="balloon">
                            <div class="box"></div>
                            <p>게이밍 컴퓨터(롤 상옵 배그 중옵 가능)<br>
                            520,000원</p>
                        </span>
                        <span class="balloon">팔렸나요?</span>
                    </div>
                    <time datetime="11:12:00+09:00">오전 11:12</time>
                </div>
                <div class="me-chat">
                    <div class="me-chat-col">
                        <span class="balloon">아직 안팔렸습니다!</span>
                    </div>
                    <time datetime="11:39:00+09:00">오전 11:39</time>
                </div>
            </div>
        </div>
        <!-- 채팅 입력창 -->
        <div class="insert-content">
            <form name="chatform" action="#" method="POST">
                <button class="chat-add"><img src="${pageContext.request.contextPath}/resources/images/chatting/add_content.png" alt="추가" width="44px" height="40px"></button>
                <textarea name="chat-insert" required></textarea>
                <button type="submit" class="chat-submit"><img src="${pageContext.request.contextPath}/resources/images/chatting/send.png " alt="전송" width="44px" height="40px"></button>
            </form>
        </div>
    </div>
</body>
<script type="text/javascript">
    function show(){
        var con = document.getElementById("profile-bar");
        if(con.style.display=='none'){
            con.style.display = 'block';
        }else{
            con.style.display = 'none';
        }
    }
</script>
</html>