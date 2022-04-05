<%@page import="com.second.space.user_.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	if(session.getAttribute("userLoggedIn") != null){
		UserDTO userLoggedIn = (UserDTO)session.getAttribute("userLoggedIn");
		System.out.println(userLoggedIn.getUser_name());
	}

	if(session.getAttribute("loginType") != null){
		String loginType = (String)session.getAttribute("loginType");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<script src="https://kit.fontawesome.com/ff32eb5689.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/header.css">
</head>
<body>
<div id="wrap">
	<header id="fixed-bar">
		<div id="navbar-box">
			<nav class="navbar">
				<div class="navbar-header-left">
	                <a href="javascript:bookMark('타이틀', 'http://localhost:8090/space/main/space')">북마크</a>
	            </div>
	            <div class="navbar-header-right">
	             <c:if test="${userLoggedIn != null}">
	            	 <c:if test="${userLoggedIn.user_id eq '1'}">
	              		  <a href="${pageContext.request.contextPath}/admin/home">관리자</a>
	                 </c:if>
	             </c:if>
	             <c:if test="${userLoggedIn == null}">
	                <a href="${pageContext.request.contextPath}/user_/login">로그인/회원가입</a>
	             </c:if>
	             <c:if test="${userLoggedIn != null}">
						<c:if test="${loginType eq 'general' }">	                
	                		<a href="${pageContext.request.contextPath}/user_/logout">로그아웃</a>
	                	</c:if>
	                	<c:if test="${loginType eq 'google' }">	                
	                		<a id="googlLogout" href="${pageContext.request.contextPath}/user_/googleLogout?token=${token}">로그아웃</a>
	                	</c:if>
	              </c:if>
	                <a href="${pageContext.request.contextPath}/customerService/main">고객센터</a>
	            </div>
	        </nav>
		</div>           
		<div id="fixed-bar-wrap">
			<div id="menu-box">
				<div class="menu-left">
					<div class="dropdown">
                       <img src="${pageContext.request.contextPath}/resources/images/main/menu.png" class="dropbtn" onclick="dropdowmMenu()"></img>
                          <div id="dropMenu" class="dropdown-content">
                              <div class="category-box"><a href="${pageContext.request.contextPath}/board/boardList">인기매물</a></div>
                              <div class="category-box"><a href="${pageContext.request.contextPath}/board/boardList">디지털</a></div>
                              <div class="category-box"><a href="${pageContext.request.contextPath}/board/boardList">가전</a></div>
                              <div class="category-box"><a href="${pageContext.request.contextPath}/board/boardList">가구</a></div>
                              <div class="category-box"><a href="${pageContext.request.contextPath}/board/boardList">패션</a></div>
                              <div class="category-box"><a href="${pageContext.request.contextPath}/board/boardList">스포츠</a></div>
                              <div class="category-box"><a href="${pageContext.request.contextPath}/board/boardList">문화</a></div>
                              <div class="category-box"><a href="${pageContext.request.contextPath}/board/boardList">취미</a></div>
                              <div class="category-box"><a href="${pageContext.request.contextPath}/board/boardList">미용</a></div>
                              <div class="category-box"><a href="${pageContext.request.contextPath}/board/boardList">반려동물</a></div>
                              <div class="category-box"><a href="${pageContext.request.contextPath}/board/boardList">기타</a></div>
                              <div class="category-box"><a href="${pageContext.request.contextPath}/community/main">커뮤니티</a></div>
                              <div class="category-box"><a href="${pageContext.request.contextPath}/notice/notice">공지사항</a></div>
                          </div>
					</div>
					<div class="space-logo"><a href="${pageContext.request.contextPath}/main/space"><img src="${pageContext.request.contextPath}/resources/images/main/space_logo.png" width="150px"></a></div>
					</div>
					<div class="search-bar">
						<input class="search-bar-input" type="search">
	  	                <i class="fas fa-search"></i>
					</div>
					<nav>
						<ul class="gnb">		
   	                        <div class="gnb-button-sell">
                                <li><img src="${pageContext.request.contextPath}/resources/images/main/board.png" class="dropbtn" onclick="dropdownSell()"></li>
                                <li class="dropbtn" onclick="dropdownSell()">판매하기</li>
                                <div id="dropSell" class="dropdown-content">
                                    <div class="category-box"><a href="${pageContext.request.contextPath}/board/boardPost">일반 상품</a></div>
                                    <div class="category-box"><a href="${pageContext.request.contextPath}/board/auctionPost">경매 상품</a></div>
                                </div>
                            </div>
	  	                    <div class="gnb-button-store" href="${pageContext.request.contextPath}/myspace/product">
	  	                        <li><a href="${pageContext.request.contextPath}/myspace/product?user_id=${userLoggedIn.user_id}&pageNum=1&amount=10"><img src="${pageContext.request.contextPath}/resources/images/main/store.png"></a></li>
	                            <li><a href="${pageContext.request.contextPath}/myspace/product?user_id=${userLoggedIn.user_id}&pageNum=1&amount=10">나의 우주</a></li>
	  	                    </div>
	  	                    <div class="gnb-button-talk">
	  	                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/spacetalk.png"></a></li>
	                            <li>우주톡</li>
							</div>
						</ul>
					</nav>
			</div>
		</div>
	</header>
</div>
</body>
<script>

function dropdowmMenu() {
    document.getElementById("dropMenu").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
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

function dropdownSell() {
    document.getElementById("dropSell").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
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
</script>
<script type="text/javascript">
function bookMark(title,url) { 
   // Internet Explorer
   if(document.all)
   {
       window.external.AddFavorite(url, title); 
   }
   // Google Chrome
   else if(window.chrome){
      alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
   }
   // Firefox
   else if (window.sidebar) {
       window.sidebar.addPanel(title, url, ""); 
   }
   // Opera
   else if(window.opera && window.print) {
      var elem = document.createElement('a'); 
      elem.setAttribute('href',url); 
      elem.setAttribute('title',title); 
      elem.setAttribute('rel','sidebar'); 
      elem.click(); 
   }
} 
</script>
</html>
