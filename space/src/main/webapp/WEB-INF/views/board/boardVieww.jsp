<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 상품 보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/board/boardView.css">
</head>
<style>
.img_div > img {
	width: 120px;
	height: 120px;
	border: 1px solid #707070;
	border-radius: 11px;
}
</style>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="board-wrapper">
    <div class="category-view">
        <h2>전체 ></h2>
        <h2>카테고리</h2>
    </div>
    <form action="./boardView" method="post" id="board_form" enctype="multipart/form-data">
    	<c:if test="${userLoggedIn ne null }">
    		<input type="hidden" id="user_id" value="${userLoggedIn.user_id }" />
    	</c:if>
    	<c:if test="${userLoggedIn eq null }">
    		<input type="hidden" id="user_id"  />
    	</c:if>
        <input type="hidden" name="user_id" value="${board.user_id }" />
        <div class="board-top">
            <h2>기본 정보</h2>
            <div class="prouct-info">
                <div class="board-img"  id="postimg">
                    <c:forEach var="b" items="${boardImgList }" >
                     	<c:if test="${b.main_img eq 'Y' }">
                     	<img src="<c:url value='/resources/upload/board/${b.renamedfilename}' />" />
                    		<%--  <img src="${pageContext.request.contextPath}/resources/upload/board/${b.originalfilename}" alt="대표이미지"> --%>
                    	</c:if> 
                    </c:forEach>
                </div>
                <div class="board-input">
                    <div class="product-title">
                        <h3>제목</h3>
                        <h3>${board.board_title }</h3>
                    </div>
                    <div class="product-price">
                        <h3>가격</h3>
                        <c:if test="${board.board_trade_type eq 'give_away' }">
                        	<h3>무료나눔</h3>
                        </c:if> 
                         <c:if test="${board.board_trade_type ne 'give_away' }">
                        	<h3>${board.board_price }</h3>
                        </c:if>                                                    
                    </div>
                    <div class="product-location">
                        <h3>거래 지역</h3>
                        <h3>${user.user_address }</h3>
                        <div class="chkbox">
	                        <c:if test="${board.board_trade_type eq 'both' }">
	                            <input type="checkbox" name="board_trade_type" value="delivery"  class="radio"  id="delivery" checked="checked"/>
	                            <label for="delivery" class="label" >택배</label>
	                            <input type="checkbox" name="board_trade_type" value="direct"  class="radio" id="direct" checked="checked"/>
	                            <label for="direct" class="label" >직거래</label>
	                        </c:if>
	                        <c:if test="${board.board_trade_type eq 'direct' }">
	                       		<input type="checkbox" name="board_trade_type" value="delivery"  class="radio"  id="delivery" />
	                            <label for="delivery" class="label" >택배</label>
	                            <input type="checkbox" name="board_trade_type" value="direct"  class="radio" id="direct" checked="checked"/>
	                            <label for="direct" class="label" >직거래</label>
	                         </c:if>
	                        <c:if test="${board.board_trade_type eq 'delivery' }">
	                       		<input type="checkbox" name="board_trade_type" value="delivery"  class="radio"  id="delivery" checked="checked" />
	                            <label for="delivery" class="label" >택배</label>
	                            <input type="checkbox" name="board_trade_type" value="direct"  class="radio" id="direct" />
	                            <label for="direct" class="label" >직거래</label>
	                         </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="board-middle">
            <div class="img_divs">
            <c:forEach var="b" items="${boardImgList }" varStatus="status">
                <div class="img_div" id="img_div${status.count}">
                	<img src="${pageContext.request.contextPath}/resources/upload/board/${b.renamedfilename}">
                </div>
                <c:if test="${status.last }">
                	<c:forEach var="i" begin="${status.count + 1}"  end="6">
                		<div class="img_div" id="img_div${i}"></div>
                	</c:forEach>
                </c:if>
            </c:forEach>
            </div>
            <div class="product-contact">
            <c:if test="${userLoggedIn ne null }">
            <c:if test="${userLoggedIn.user_id ne board.user_id}">
            	<c:if test="${boardLike ne 0}">
                	<div class="interested active" id="like"></div>
                </c:if>
                <c:if test="${boardLike eq 0 }">
                   		<div class="interested" id="like"></div>
                </c:if>
            </c:if>    
            </c:if>
            <c:if test="${userLoggedIn eq null }">
                	<div class="interested " id="like"></div>
            </c:if>
            <c:if test="${userLoggedIn ne null }">
            	<c:if test="${userLoggedIn.user_id ne board.user_id}">
                 	<div class="space-talk-button"></div>
                </c:if>
            </c:if>
            <c:if test="${userLoggedIn eq null }">
            	<div class="space-talk-button"></div>
            </c:if>
            </div>
        </div>           
        <div class="board_end">
            <div class="board-end-left">
                <h2>상품 설명</h2>
                <div class="content">
                    <p>${board.board_content }</p>
                </div>
                <input type="button" value="이 게시글 신고하기 >"id="show"></input>
                <div class="background">
                    <div class="window">
                        <div class="popup">
                            <h3>신고하기</h3>
                            <div class="check-report-reason">
                                <input type="checkbox" name="report_reson" value="bad_manners"  class="radio"  id="bad_manners"/>
                                <label for="bad_manners" class="label" >비매너 유저</label>
                                <input type="checkbox" name="report_reson" value="malicious_post"  class="radio"  id="malicious_post"/>
                                <label for="malicious_post" class="label" >광고 / 도배 / 악성 게시글</label>
                                <input type="checkbox" name="report_reson" value="phishing"  class="radio"  id="phishing"/>
                                <label for="phishing" class="label" >사기 / 피싱</label>
                                <input type="checkbox" name="report_reson" value="sell_prohibited_items"  class="radio"  id="sell_prohibited_items"/>
                                <label for="sell_prohibited_items" class="label" >거래 금지 품목 판매</label>
                                <input type="checkbox" name="report_reson" value="verbal_abuse"  class="radio"  id="verbal_abuse"/>
                                <label for="verbal_abuse" class="label" >욕설 / 희롱 / 성적인 언어</label>
                                <input type="checkbox" name="report_reson" value="malicious_chat"  class="radio"  id="malicious_chat"/>
                                <label for="malicious_chat" class="label" >악성 채팅</label>
                                <input type="checkbox" name="report_reson" value="calumny_post"  class="radio"  id="calumny_post"/>
                                <label for="calumny_post" class="label" >악의적 비방 게시글</label>
                                <input type="checkbox" name="report_reson" value="other_purpose"  class="radio"  id="other_purpose"/>
                                <label for="other_purpose" class="label" >다른 목적의 글 / 채팅</label>
                                <input type="checkbox" name="report_reson" value="etc"  class="radio"  id="etc"/>
                                <label for="etc" class="label" >기타</label>
                                <textarea rows="3"  name="report-reason-etc" id="report-reason-etc" 
                                    placeholder="사유를 입력해주세요."></textarea>
                            </div>
                            <div class="report-buttons">
                                <input type="button" value="신고" id="send-report"/>
                                <input type="button" value="취소" id="close"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="board-end-right">
                <h2>판매자 정보</h2>
                <div class="store-profile">
                    <img src="${pageContext.request.contextPath}/resources/images/board/store_basic.png">
                    <div class="store-info">
                        <h3>${nickname }</h3>
                        <p>상품 ${boardCnt } | 팔로워 ${follower }</p>
                    </div>
                    <c:if test="${following ne null }">
                    	<c:if test="${following ne 0 }">
                   			<div class="follow active" id="follow"></div>
                   		</c:if>
                   		<c:if test="${following eq 0 }">
                   			<div class="follow" id="follow"></div>
                   		</c:if>
                    </c:if>
                    <c:if test="${following eq null }">
                    	<div class="follow" id="follow"></div>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="buttons">
            <input type="button" value="목록" id="cancle"/>
        </div>
    </form>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
<script>

    function show () {
    document.querySelector(".background").className = "background show";
    }

    function close () { 
    document.querySelector(".background").className = "background";
    }

    document.querySelector("#show").addEventListener('click', show);
    document.querySelector("#close").addEventListener('click', close);


    let interest = document.querySelectorAll(".interested");
    const sendLike = new XMLHttpRequest();

    for (let i=0; i < interest.length; i++) {
        interest[i].addEventListener('click', function() {
       		this.classList.toggle('active');
       		var like = document.getElementById("like");
       		if(user_id != null && user_id.value != ""){
	    		if(like.classList.contains("active")){
	    			const params = {user_id : user_id.value, board_id :  ${board.board_id}};
	    			sendLike.open('POST', `${pageContext.request.contextPath}/board/like`);
	    			sendLike.setRequestHeader('content-type', 'application/json');
	    			sendLike.send(JSON.stringify(params));
	    		}else {
	    			const params = {user_id : user_id.value, board_id :  ${board.board_id}};
	    			sendLike.open('POST', `${pageContext.request.contextPath}/board/unlike`);
	    			sendLike.setRequestHeader('content-type', 'application/json');
	    			sendLike.send(JSON.stringify(params));
	    		}
       		} else {
       			alert("로그인 후 이용가능 합니다.");
        		location.href = `${pageContext.request.contextPath}/user_/login`;
       		}
       	
        });
    }

    let follow = document.querySelectorAll(".follow");
    // follow.classList.toggle("active");
	const sendFollow = new XMLHttpRequest();
	
	sendFollow.addEventListener('readystatechange', (e) => {
		
	});
	
    for (let i=0; i < follow.length; i++) {
        follow[i].addEventListener('click', function() {
        this.classList.toggle('active');
        var user_id = document.getElementById("user_id");
   		if(user_id != null && user_id.value != ""){
    		/* var user_login_id = ${user.user_login_id}; */
    		
    		var follow = document.getElementById("follow");
    		if(follow.classList.contains("active")){
    			console.log(user_id.value);
    			console.log( ${user.user_login_id});
    			const params = {user_id : user_id.value, user_login_id :  ${user.user_login_id}};
    			sendFollow.open('POST', `${pageContext.request.contextPath}/board/follow`);
    			sendFollow.setRequestHeader('content-type', 'application/json');
    			sendFollow.send(JSON.stringify(params));
    		}else {
    			const params = {user_id : user_id.value, user_login_id :  ${user.user_login_id}};
    			sendFollow.open('POST', `${pageContext.request.contextPath}/board/unfollow`);
    			sendFollow.setRequestHeader('content-type', 'application/json');
    			sendFollow.send(JSON.stringify(params));
    		}
    		
    	} else {
    		alert("로그인 후 이용가능 합니다.");
    		location.href = `${pageContext.request.contextPath}/user_/login`;
    	}
        });
    }
    
</script>
</html>