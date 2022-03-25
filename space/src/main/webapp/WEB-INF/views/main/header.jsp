<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<script src="https://kit.fontawesome.com/ff32eb5689.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/header.css">
</head>
<body>
<div id="wrap">
	<header id="fixed-bar">
		<div id="navbar-box">
			<nav class="navbar">
				<div class="navbar-header-left">
	                <a href="#">북마크</a>
	            </div>
	            <div class="navbar-header-right">
	                <a href="${pageContext.request.contextPath}/admin/home">관리자</a>
	                <a href="${pageContext.request.contextPath}/user_/login">로그인/회원가입</a>
	                <a href="#">고객센터</a>
	            </div>
	        </nav>
		</div>           
		<div id="fixed-bar-wrap">
			<div id="menu-box">
				<div class="menu-left">
					<div class="dropdown">
                       <img src="${pageContext.request.contextPath}/resources/images/main/menu.png" class="dropbtn" onclick="dropdowmMenu()"></img>
                          <div id="dropMenu" class="dropdown-content">
                              <div class="category-box"><a href="#">인기매물</a></div>
                              <div class="category-box"><a href="#">디지털</a></div>
                              <div class="category-box"><a href="#">가전</a></div>
                              <div class="category-box"><a href="#">가구</a></div>
                              <div class="category-box"><a href="#">패션</a></div>
                              <div class="category-box"><a href="#">스포츠</a></div>
                              <div class="category-box"><a href="#">문화</a></div>
                              <div class="category-box"><a href="#">취미</a></div>
                              <div class="category-box"><a href="#">미용</a></div>
                              <div class="category-box"><a href="#">반려동물</a></div>
                              <div class="category-box"><a href="#">기타</a></div>
                              <div class="category-box"><a href="#">커뮤니티</a></div>
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
                                    <div class="category-box"><a href="#">일반 상품</a></div>
                                    <div class="category-box"><a href="#">경매 상품</a></div>
                                </div>
                            </div>
	  	                    <div class="gnb-button-store" href="${pageContext.request.contextPath}/myspace/product">
	  	                        <li><a href="${pageContext.request.contextPath}/myspace/product"><img src="${pageContext.request.contextPath}/resources/images/main/store.png"></a></li>
	                            <li><a href="${pageContext.request.contextPath}/myspace/product">나의 우주</a></li>
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
</html>
