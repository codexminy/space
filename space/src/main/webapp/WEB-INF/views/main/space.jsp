<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPACE</title>
<script src="https://kit.fontawesome.com/ff32eb5689.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/main.css">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<section>
	
		<div class="blank"></div>
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/main/ad_01.jpg"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/main/ad_02.jpg"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/main/ad_03.jpg"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/main/ad_04.jpg"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/main/ad_05.jpg"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/main/ad_06.jpg"></div>
			</div>
			    <div class="swiper-button-next"></div>
			    <div class="swiper-button-prev"></div>
		</div>
            
            <div class="hot-items">
                <div class="hot-items-text">
                    <h2>인기매물</h2>
                    <p class="text"><a href="${pageContext.request.contextPath}/board/boardList">더보기 ></a></p>
                </div>
            </div>
            <div class="cards-wrap">
            <c:if test="${not empty mainList}">
            <c:forEach var="m" items="${mainList}" varStatus="status">
            	<c:if test="${status.first }">
            		<input type="hidden" id="user_id" value="${user_id }">
            	</c:if>
                <article class="card">	                   
            		<div class="card-photobox">
                		<div class="card-photo">
                			<c:if test="${m.auction_id eq null }">
                    			<div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww?board_id=${m.board_id}'"
                    			style="background-image : url('${pageContext.request.contextPath}/resources/upload/board/${m.renamedfilename}')"></div>
                    		</c:if>
                    		<c:if test="${m.auction_id ne null }">
                    			<div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/auctionView?board_id=${m.board_id}&auction_id=${m.auction_id}'"
                    			style="background-image : url('${pageContext.request.contextPath}/resources/upload/board/${m.renamedfilename}')"></div>
                    		</c:if>
                    		
                    		<c:if test="${m.board_like eq 'Y'}">
                    			<div class="card-heart active" id="heart${status.count}" value="${m.board_id}"></div>
                    		</c:if>
                    		<c:if test="${m.board_like eq null }">
                    			<div class="card-heart" id="heart${status.count}" value="${m.board_id}"></div>
                    		</c:if>
                    		
                		</div>
                		<div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    		<div class="card-text">
                        		<div class="card-title">${m.board_title}</div>
                        		<div class="card-info">
                            		<div class="card-price">${m.board_price}</div>
                            		<div class="card-region-name">${m.user_address }</div>
                        		</div>
                    		</div>
                		</div>
            		</div>
        		</article>                                            
             </c:forEach>     
             </c:if>                         
            </div>
            <div class="bottom-contents">
                <div class="notice">
                    <div class="notice-title">
                        <h2>공지사항</h2>
                        <p class="text"><a href="#">더보기 ></a></p>
                    </div>    
                    <div class="notice-board">
                        <ul>
                          <c:if test="${not empty noticeList }">
                        	<c:forEach var="n" items="${noticeList}">
                            	<li><a href="#">${n.notice_title }</a></li>
                       		</c:forEach>
                          </c:if>
                        </ul>
                    </div>
                </div>
                <div class="community">
                    <div class="community-title">
                        <h2>커뮤니티</h2>
                        <p class="text"><a href="${pageContext.request.contextPath}/community/main">더보기 ></a></p>
                    </div> 
                    <div class="community-board">
                        <ul>
                          <c:if test="${not empty communityList }">
                       		 <c:forEach var="c" items="${communityList}">
                            	<li><a href="${pageContext.request.contextPath}/community/c_board?c_board_id=${c.c_board_id}">${c.c_board_title}</a></li>
                       		 </c:forEach>
                        </c:if>
                        </ul>
					</div>       
				</div>
			</div>
	</section>
<jsp:include page="../main/footer.jsp"/>        
</body>
<script>
    var swiper = new Swiper(".mySwiper", {
		navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		},
    });

	function myFunction() {
	    document.getElementById("myDropdown").classList.toggle("show");
	}

	window.onclick = function(event) {
		if (!event.target.matches('.dropbtn')) {

	    var dropdowns = document.getElementsByClassName("dropdown-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
	        openDropdown.classList.remove('show');
			}
	    }
	  }
	}
	
	let like = document.querySelectorAll(".card-heart");
	const sendLike = new XMLHttpRequest();

    for (let i=0; i < like.length; i++) {
        like[i].addEventListener('click', function(e) {
        	
       		 this.classList.toggle('active');
       		 
       		 
       		var user_id = document.getElementById("user_id");
       
       		if(user_id != null && user_id.value != ""){
	       		if(this.classList.contains("active")){
	       			const params = {user_id : user_id.value, board_id : this.getAttribute("value")};
	    			sendLike.open('POST', `${pageContext.request.contextPath}/board/like`);
	    			sendLike.setRequestHeader('content-type', 'application/json');
	    			sendLike.send(JSON.stringify(params));
	       		}else {
	    			const params = {user_id : user_id.value, board_id : this.getAttribute("value")};
	    			sendLike.open('POST', `${pageContext.request.contextPath}/board/unlike`);
	    			sendLike.setRequestHeader('content-type', 'application/json');
	    			sendLike.send(JSON.stringify(params));
	    		} 
       		}else {
       			alert("로그인 후 이용가능 합니다.");
        		location.href = `${pageContext.request.contextPath}/user_/login`; 
        		console.log(${userLoggedIn.user_id});
       		}
        });
    }

    function checkOnlyOne(element) {
  
  const checkboxes 
      = document.querySelectorAll(".sort-by");
  
  checkboxes.forEach((cb) => {
    cb.checked = false;
  })
  
  element.checked = true;
}
</script>
</html>