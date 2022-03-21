<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<script src="https://kit.fontawesome.com/ff32eb5689.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/reset.css">
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
		                <a href="#">관리자</a>
		                <a href="#">로그인/회원가입</a>
		                <a href="#">고객센터</a>
		            </div>
		        </nav>
			</div>           
	        <div id="fixed-bar-wrap">
	           <div id="menu-box">
	                <div class="menu-left">
	                    <div class="menu-icon"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/menu.png"></a></div>
        	            <div class="space-logo"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/space_logo.png" width="150px"></a></div>
	                </div>
    	            <div class="search-bar">
                        <input class="search-bar-input" type="search">  
    	                <i class="fas fa-search"></i>
    	            </div>
    	            <nav>
    	                <ul class="gnb">
    	                    <div class="gnb-button-sell">
    	                        <li><img src="${pageContext.request.contextPath}/resources/images/main/board.png"></li>
                                <li>판매하기</li>
    	                    </div>
    	                    <div class="gnb-button-store">
    	                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/store.png"></a></li>
                                <li>나의 우주</li>
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

