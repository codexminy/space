<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상대방이랑 대화</title>
<link href="${pageContext.request.contextPath}/resources/chatting/css/chatPartner.css" rel="stylesheet"/>
</head>
<style>
.chat-content{
	height: 740px;
	 padding-left:0;

    margin:0;

    list-style-type:none;

    display:flex;

    flex-direction: column-reverse;

    overflow-y:auto;

    height:535px;

    border-top:2px solid #fff;

    border-bottom:2px solid #fff;

}

::-webkit-scrollbar {
  display: none;
}
</style>
<body>
	<div id="chat">
        <div class="profile">
            <span class="profile-name">${user.user_nickname }<a href="javascript:show();"><img src="${pageContext.request.contextPath}/resources/images/chatting/arrow.png" alt="하단"></a></span>
            <div id="profile-bar">
                <ul id="profile-detail01">
                    <li class="profile-detail01-title">판매상품</li>
                    <span>219</span>
                    <span>
                    	<img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png" width="13px" height="13px">
                    	<img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png" width="13px" height="13px">
                    	<img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png" width="13px" height="13px">
                    	<img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png" width="13px" height="13px">
                    	<img src="${pageContext.request.contextPath}/resources/images/mySpace/star_empty.png" width="13px" height="13px">
                    </span>
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
          <div class="date-line">
                <time datetime="2022-03-16" id ="today-time"></time>
            </div>
        <div class="chat-content">
          
            <!-- 채팅 내용 -->
            <div class="main-chat" id="main-chat">
                <div class="friend-chat">
                    <img class="profile-img" src="${pageContext.request.contextPath}/resources/images/chatting/chat_basic_profile.png" alt="스트릿market">
                    <div class="friend-chat-col">
                        <span class="balloon">
                            <div class="box" style="background-image : url('${pageContext.request.contextPath}/resources/upload/board/${boardImg.renamedfilename}')"></div>
                            <p>${board.board_title}<br>
                            ${board.board_price}원</p>
                        </span>
                    </div>
                </div>
                <c:forEach var="c" items="${content}">
                	<c:if test="${user.user_id eq c.send_id }">
                		<div class="me-chat">
		                    <div class="me-chat-col">
		                        <span class="balloon">${c.chat_contents }</span>
		                    </div>
		                    <time datetime="11:39:00+09:00"><fmt:formatDate value="${c.chat_createat }" pattern="MM월HH일" /></time>
		                </div>
                	</c:if>
                	<c:if test="${user.user_id ne c.send_id }">
                		<div class="friend-chat">
		                    <img class="profile-img" src="${pageContext.request.contextPath}/resources/images/chatting/chat_basic_profile.png" alt="스트릿market">
		                    <div class="friend-chat-col">
		                        <span class="balloon">${c.chat_contents }</span>
			                  </div>
			                   <time datetime="11:39:00+09:00"><fmt:formatDate value="${c.chat_createat }" pattern="MM월HH일" /></time>
			               </div>
                	</c:if>
                </c:forEach>
            </div>
        </div>
        <!-- 채팅 입력창 -->
        <div class="insert-content">
            <form name="chatform" action="#" method="POST">
                <button class="chat-add"><img src="${pageContext.request.contextPath}/resources/images/chatting/add_content.png" alt="추가" width="44px" height="40px"></button>
                <textarea name="chat-insert" id="textMessage" required></textarea>
                <button type="button" class="chat-submit" id="chat-btn"><img src="${pageContext.request.contextPath}/resources/images/chatting/send.png " alt="전송" width="44px" height="40px"></button>
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
    
  
    
    
    
    window.onload = function(){
    	 var time = document.getElementById("today-time");
    	 
        let today = new Date();
		
        let year = today.getFullYear();
        let month = today.getMonth() + 1;
        let day = today.getDay();
        
        time.innerHTML = year + "년 " + month + "월 " + day + "일";
    }
    
    var webSocket = new WebSocket("ws://localhost:8090/space/websocketChat/${roomid}/${user.user_id}");
    
    Date.prototype.amPm = function() {
    	let h = this.getHours() < 12 ? "오전" : "오후";
    	return h;
    }

    
    
    var main = document.getElementById("main-chat");
    
  
    
    webSocket.onmessage = function(message) {
    	let today = new Date();

        let hours = today.getHours(); // 시
        let minutes = today.getMinutes();  // 분
    	
    	// 콘솔 텍스트에 메시지를 출력한다.
    	var div = document.createElement("div");
    	div.setAttribute("class", "friend-chat");
    	var div2 = document.createElement("div");
    	div2.setAttribute("class", "friend-chat-col");
    	var img = document.createElement("img");
    	img.setAttribute("class", "profile-img");
    	img.setAttribute("src", "${pageContext.request.contextPath}/resources/images/chatting/chat_basic_profile.png");
    	var span = document.createElement("span");
    	span.setAttribute("class", "balloon");
    	var time = document.createElement("time");
    	let amPm = today.amPm();
    	time.innerHTML =  amPm + hours + ":" + minutes;
    	
    	span.innerHTML = message.data;
    	div.appendChild(img);
    	div2.appendChild(span);
    	div.appendChild(div2);
    	div.appendChild(time);
    	
    	main.appendChild(div);
    	//상대가
    	const getMsg = new XMLHttpRequest();
    	const params = {room_id : ${roomid} , user_id : ${user.user_id}, content : message.data };
    	getMsg.open('POST', `${pageContext.request.contextPath}/chatting/insert`);
    	getMsg.setRequestHeader('content-type', 'application/json');
    	getMsg.send(JSON.stringify(params));
  
    };
    
    var btn = document.getElementById("chat-btn");
    
    
    btn.addEventListener('click', (e) => {
    	let today = new Date();
        let hours = today.getHours(); // 시
        let minutes = today.getMinutes();  // 분

    	var message = document.getElementById('textMessage');
    	
    	var div = document.createElement("div");
    	div.setAttribute("class", "me-chat");
    	var div2 = document.createElement("div");
    	div2.setAttribute("class", "me-chat-col");
    	var span = document.createElement("span");
    	span.setAttribute("class", "balloon");
    	var time = document.createElement("time");
    	let amPm = today.amPm();
    	time.innerHTML = amPm +hours + ":" + minutes;
    	
    	span.innerHTML = message.value;
    	
    	div2.appendChild(span);
    	div.appendChild(div2);
    	div.appendChild(time);
    	main.appendChild(div);
    	webSocket.send(message.value);
    	
    	//내가
    	const go = new XMLHttpRequest();
    	const params = {room_id : ${roomid} , user_id : ${user.user_id}, content : message.value };
    	go.open('POST', `${pageContext.request.contextPath}/chatting/sendInsert`);
    	go.setRequestHeader('content-type', 'application/json');
    	go.send(JSON.stringify(params));
    	
    	message.value = "";
    	
    });

    window.onbeforeunload = function (e) {
    	// WebSocket 접속 해제
    	/* webSocket.close(); */
    }
    
    var close = function() {
    	// 재 접속을 시도한다.
    	setTimeout(function() {
    	// 재접속
    	webSocket = connectWebSocket("ws://localhost:8090/space/websocketChat/${roomid}/${user.user_id}", message, open, close, error);
    	});
    }

   	
    const sendHttp = new XMLHttpRequest();
    document.onmousedown = function leftClick() {
    	  var target = window.event.srcElement.id;
    	   if (target) {
    		   	const params = {room_id : ${roomid}};
    		  	sendHttp.open('POST', `${pageContext.request.contextPath}/chatting/read`);
    		  	sendHttp.setRequestHeader('content-type', 'application/json');
    		  	sendHttp.send(JSON.stringify(params));
    	  }
    	 };
</script>
</html>