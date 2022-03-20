<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPACE</title>
<script src="https://kit.fontawesome.com/ff32eb5689.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
</head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    text-decoration : none;    
}

#wrap{
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
/*슬라이드*/
.swiper {
    width: 1200px;
    height: 400px;
}

.swiper-slide {
    text-align: center;
    font-size: 18px;
    background: #fff;    
    display: -webkit-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    align-items: center;
}

.swiper-slide img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
/*인기매물*/
.hot-items{
	width: 1200px;
	position: relative;
    align-items: center;
    justify-content: space-between;
}

.hot-items h2{
	float: left;
    margin: 30px;
    height: auto;
    font-size: 26px;
    line-height: 1.4;
    background-image: none;
}
.hot-items p{
	float: right;
    margin: 30px;
    padding: 4px 32px 4px 15px;
    font-size: 20px;
    line-height: 1.4;
}

.cards-wrap {
	clear:both;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
}

.cards-wrap .card{
    padding-right: 1px;
    padding-bottom: 42px;
}
.cards-wrap .card .card-link .card-photo img{
    width: 228px;
    height: 228px;
    float: left;
    border: 1px solid;
    border-radius: 15px; 
}
.cards-wrap .card .card-link .card-text{
    padding-left: 10px;
    font-size: 15px;
}
/*공지*/
.notice{
    width: 530px;
	height: 334px;
    position: relative;
    align-items: center;
    justify-content: space-between;
    float: left;
    overflow: hidden;
}
.notice-title h2{
    float: left;
    margin: 30px;
   
}
.notice-title p{
    float: right;
    margin: 30px;
    padding: 4px 32px 4px 15px;
    font-size: 20px;
}
.notice .notice-board ul li{
    clear: both;
    padding: 5px 30px;
}
/*커뮤니티*/
.community{
	width: 530px;
	height: 334px;
    position: relative;
    align-items: center;
    justify-content: space-between;
    overflow: hidden;
    float: right;
}

.community h2{
    float: left;
    margin: 30px;
}
.community .text{
	float: right;
    margin: 30px;
    padding: 4px 32px 4px 15px;
    font-size: 20px;
}
.community .community-board ul li{
    clear: both;
    padding: 5px 30px;
    
}
/*푸터*/
.footer {
    clear: both;
	width: 1200px;
	height: 150px;
	padding :70px;
}
.footer .copyright ul{
    padding:0 5px;
    font-size: 12px;
    text-align: center;
    
}
.footer .copyright ul li{
    display: inline-block;
}

.footer .copyright-text{
    font-size: 12px;
    text-align: center;
}
</style>
<body>
	<div id="wrap">
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
        <!--섹션파트-->
        <section>
            <!-- Swiper -->
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">Slide 1</div>
                    <div class="swiper-slide">Slide 2</div>
                    <div class="swiper-slide">Slide 3</div>
                    <div class="swiper-slide">Slide 4</div>
                    <div class="swiper-slide">Slide 5</div>
                    <div class="swiper-slide">Slide 6</div>
                    <div class="swiper-slide">Slide 7</div>
                    <div class="swiper-slide">Slide 8</div>
                    <div class="swiper-slide">Slide 9</div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
            <!-- Swiper JS -->
            <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        
            <!-- Initialize Swiper -->
            <script>
                var swiper = new Swiper(".mySwiper", {
	                navigation: {
	                    nextEl: ".swiper-button-next",
	                    prevEl: ".swiper-button-prev",
                	},
                });
            </script>
	        <div class="hot-items">
	            <div class="hot-items-text">
		            <h2>인기매물</h2>
		            <p class="text"><a href="#">더보기</a></p>
	            </div>
	            <div class="cards-wrap">
	                <article class="card">	
	                    <a class="card-link" href="#">
	                        <div class="card-photo">
	                            <img src="/space/mainpage/images/images/jpg" alt="상품사진">
	                        </div>
	                        <div class="card-text">
	                            <div class="card-title">상품이름</div>
	                            <div class="card-price">10,000원</div>
	                            <div class="card-region-name">경기도 구리</div>
	                            <div class="card-heart">♥</div>
	                        </div>
	                    </a>
	                </article>
	                <article class="card">	
	                    <a class="card-link" href="#">
	                        <div class="card-photo">
	                            <img src="http://placehold.it/228x228" alt="상품사진">
	                        </div>
	                        <div class="card-text">
	                            <div class="card-title">상품이름</div>
	                            <div class="card-price">10,000원</div>
	                            <div class="card-region-name">경기도 구리</div>
	                            <div class="card-heart">♥</div>
	                        </div>
	                    </a>
	                </article>
	                <article class="card">	
	                    <a class="card-link" href="#">
	                        <div class="card-photo">
	                            <img src="http://placehold.it/228x228" alt="상품사진">
	                        </div>
	                        <div class="card-text">
	                            <div class="card-title">상품이름</div>
	                            <div class="card-price">10,000원</div>
	                            <div class="card-region-name">경기도 구리</div>
	                            <div class="card-heart">♥</div>
	                        </div>
	                    </a>
	                </article>
	                <article class="card">	
	                    <a class="card-link" href="#">
	                        <div class="card-photo">
	                            <img src="http://placehold.it/228x228" alt="상품사진">
	                        </div>
	                        <div class="card-text">
	                            <div class="card-title">상품이름</div>
	                            <div class="card-price">10,000원</div>
	                            <div class="card-region-name">경기도 구리</div>
	                            <div class="card-heart">♥</div>
	                        </div>
	                    </a>
	                </article>
	                <article class="card">	
	                    <a class="card-link" href="#">
	                        <div class="card-photo">
	                            <img src="http://placehold.it/228x228" alt="상품사진">
	                        </div>
	                        <div class="card-text">
	                            <div class="card-title">상품이름</div>
	                            <div class="card-price">10,000원</div>
	                            <div class="card-region-name">경기도 구리</div>
	                            <div class="card-heart">♥</div>
	                        </div>
	                    </a>
	                </article>
	                <article class="card">	
	                    <a class="card-link" href="#">
	                        <div class="card-photo">
	                            <img src="http://placehold.it/228x228" alt="상품사진">
	                        </div>
	                        <div class="card-text">
	                            <div class="card-title">상품이름</div>
	                            <div class="card-price">10,000원</div>
	                            <div class="card-region-name">경기도 구리</div>
	                            <div class="card-heart">♥</div>
	                        </div>
	                    </a>
	                </article>
	                <article class="card">	
	                    <a class="card-link" href="#">
	                        <div class="card-photo">
	                            <img src="http://placehold.it/228x228" alt="상품사진">
	                        </div>
	                        <div class="card-text">
	                            <div class="card-title">상품이름</div>
	                            <div class="card-price">10,000원</div>
	                            <div class="card-region-name">경기도 구리</div>
	                            <div class="card-heart">♥</div>
	                        </div>
	                    </a>
	                </article>
	                <article class="card">	
	                    <a class="card-link" href="#">
	                        <div class="card-photo">
	                            <img src="http://placehold.it/228x228" alt="상품사진">
	                        </div>
	                        <div class="card-text">
	                            <div class="card-title">상품이름</div>
	                            <div class="card-price">10,000원</div>
	                            <div class="card-region-name">경기도 구리</div>
	                            <div class="card-heart">♥</div>
	                        </div>
	                    </a>
	                </article>
	                <article class="card">	
	                    <a class="card-link" href="#">
	                        <div class="card-photo">
	                            <img src="http://placehold.it/228x228" alt="상품사진">
	                        </div>
	                        <div class="card-text">
	                            <div class="card-title">상품이름</div>
	                            <div class="card-price">10,000원</div>
	                            <div class="card-region-name">경기도 구리</div>
	                            <div class="card-heart">♥</div>
	                        </div>
	                    </a>
	                </article>
	                <article class="card">	
	                    <a class="card-link" href="#">
	                        <div class="card-photo">
	                            <img src="http://placehold.it/228x228" alt="상품사진">
	                        </div>
	                        <div class="card-text">
	                            <div class="card-title">상품이름</div>
	                            <div class="card-price">10,000원</div>
	                            <div class="card-region-name">경기도 구리</div>
	                            <div class="card-heart">♥</div>
	                        </div>
	                    </a>
	                </article>    
	            </div>
	        </div>
	        <div class="notice">
                <div class="notice-title">
                    <h2>공지사항</h2>
                    <p class="text"><a href="#">더보기</a></p>
                </div>    
                <div class="notice-board">
                    <ul>
                        <li><a href="#">게시글1</a></li>
                        <li><a href="#">게시글1</a></li>
                        <li><a href="#">게시글1</a></li>
                        <li><a href="#">게시글1</a></li>
                        <li><a href="#">게시글1</a></li>
                    </ul>
                </div>
            </div>
	        <div class="community">
                <div class="community-title">
                    <h2>커뮤니티</h2>
                    <p class="text"><a href="#">더보기</a></p>
                </div> 
                <div class="community-board">
                    <ul>
                        <li><a href="#">게시글1</a></li>
                        <li><a href="#">게시글1</a></li>
                        <li><a href="#">게시글1</a></li>
                        <li><a href="#">게시글1</a></li>
                        <li><a href="#">게시글1</a></li>
                    </ul>
                </div>       
	        </div>
	    </section>
        <!--푸터-->
        <footer class="footer">
	        <div class="copyright">
	            <ul>
	                <li><a href="#">회사소개</a></li>
	                <li>|</li>
	                <li><a href="#">인재채용</a></li>
	                <li>|</li>
	                <li><a href="#">광고문의</a></li>
	                <li>|</li>
	                <li><a href="#">개인정보처리방침</a></li>
	                <li>|</li>
	                <li><a href="#">이용약관</a></li>
	            </ul>
	        </div>
	        <div class="copyright-text">Copyright ⓒ <strong>SPACE MARKET</strong> Corp. All rights reserved.</div>  
	    </footer>
    </div>
</body>
</html>