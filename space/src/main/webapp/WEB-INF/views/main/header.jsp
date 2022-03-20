<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<script src="https://kit.fontawesome.com/ff32eb5689.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<link href="${pageContext.request.contextPath}/resources/user_/css/info.css" rel="stylesheet"/>
</head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    text-decoration : none;   
}
header{
    max-width: 1920px;
    width: 1200px;
    margin: 0 auto;
}
/*네비*/
.navbar{
    width: 1200px;
    height: 40px;
    display: flex;
    justify-content: space-between;
}
.navbar .navbar-header-left a{
    padding-left: 30px;
    display: flex;
    align-items: center;
    position: relative;
    color:#707070;
}
.navbar .navbar-header-right a{
    padding-right:30px;
    display: inline;
    align-items: center;
    position: relative;
    color:#707070;
}

/*헤더*/
#fixed-bar{
    width: 1200px;
	
}
#fixed-bar-wrap{
    display : flex;
	align-items: center;
    height: 145px;
}
#fixed-bar #fixed-bar-wrap #menu-icon{
    padding-left: 30px;
    padding-right: 80px;
    
}
#fixed-bar #fixed-bar-wrap #fixed-bar-logo {
    padding-right: 110px;

}
.search-bar {
  width: 370px;
  height: 30px;
  border-radius: 5px;
  border: solid 1px ;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1;
  opacity: 1;
  
}
.search-bar-input {
  width: 100px;
  border: none;
  text-align: left;
  margin-left: 10px;
  overflow: auto;
  z-index: -1;
  font-size: 15px;
}
.search-bar-input:focus {
  outline: none;
  width: 350px;
  text-align: left;
}
.fa-search {
 	font-size: 15px;
}

#fixed-bar #fixed-bar-wrap ul{
	display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    list-style:none;
    padding-left: 100px;
}
#fixed-bar #fixed-bar-wrap li{
    padding: 0 20px;
}
#fixed-bar #fixed-bar-wrap li img{
	text-align: center;
}
</style>
<body>
	<header id="fixed-bar">
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
        <div id="fixed-bar-wrap">
            <div id="menu-icon"><a href="#"><i class="fa-solid fa-bars fa-3x" style="color:#707070"></i></a></div>
            <h1 id="fixed-bar-logo">
                <a href="#">
                    <img src="${pageContext.request.contextPath}/resources/images/main/space_logo.png" width="150px" height="37.54px">
                </a>
            </h1>
           <div class="search-bar">
                <i class="fas fa-search"></i>
                <input class="search-bar-input" type="search">  
            </div>
            <nav>
                <ul class="gnb">
                    <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/board.png" width="38.33px" height="25.25px"><br>판매하기</a></li>
                    <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/store.png" width="38.33px" height="25.25px"><br>나의 우주</a></li>
                    <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/spacetalk.png" width="38.33px" height="25.25px"><br>우주톡</a></li>
                </ul>
            </nav>
        </div>
	</header>
