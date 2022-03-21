<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPACE</title>
<script src="https://kit.fontawesome.com/ff32eb5689.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
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
        <section>
            <div class="blank"></div>
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
                    <p class="text"><a href="#">더보기 ></a></p>
                </div>
            </div>
            <div class="cards-wrap">
                <article class="card">	                   
                    <div class="card-photobox">
                        <div class="card-photo">
                            <div class="card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
                            <div class="card-heart"><img src="${pageContext.request.contextPath}/resources/images/main/heart_full.png"></div>
                        </div>
                        <div class="card-textbox">
                            <div class="card-text">
                                <div class="card-title">상품이름</div>
                                <div class="card-info">
                                    <div class="card-price">10,000원</div>
                                    <div class="card-region-name">경기도 구리시</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
                <article class="card">	                   
                    <div class="card-photobox">
                        <div class="card-photo">
                            <div class="card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
                            <div class="card-heart"><img src="${pageContext.request.contextPath}/resources/images/main/heart_full.png"></div>
                        </div>
                        <div class="card-textbox">
                            <div class="card-text">
                                <div class="card-title">상품이름</div>
                                <div class="card-info">
                                    <div class="card-price">10,000원</div>
                                    <div class="card-region-name">경기도 구리시</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
                <article class="card">	                   
                    <div class="card-photobox">
                        <div class="card-photo">
                            <div class="card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
                            <div class="card-heart"><img src="${pageContext.request.contextPath}/resources/images/main/heart_full.png"></div>
                        </div>
                        <div class="card-textbox">
                            <div class="card-text">
                                <div class="card-title">상품이름</div>
                                <div class="card-info">
                                    <div class="card-price">10,000원</div>
                                    <div class="card-region-name">경기도 구리시</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
                <article class="card">	                   
                    <div class="card-photobox">
                        <div class="card-photo">
                            <div class="card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
                            <div class="card-heart"><img src="${pageContext.request.contextPath}/resources/images/main/heart_full.png"></div>
                        </div>
                        <div class="card-textbox">
                            <div class="card-text">
                                <div class="card-title">상품이름</div>
                                <div class="card-info">
                                    <div class="card-price">10,000원</div>
                                    <div class="card-region-name">경기도 구리시</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
                <article class="card">	                   
                    <div class="card-photobox">
                        <div class="card-photo">
                            <div class="card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
                            <div class="card-heart"><img src="${pageContext.request.contextPath}/resources/images/main/heart_full.png"></div>
                        </div>
                        <div class="card-textbox">
                            <div class="card-text">
                                <div class="card-title">상품이름</div>
                                <div class="card-info">
                                    <div class="card-price">10,000원</div>
                                    <div class="card-region-name">경기도 구리시</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
                <article class="card">	                   
                    <div class="card-photobox">
                        <div class="card-photo">
                            <div class="card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
                            <div class="card-heart"><img src="${pageContext.request.contextPath}/resources/images/main/heart_full.png"></div>
                        </div>
                        <div class="card-textbox">
                            <div class="card-text">
                                <div class="card-title">상품이름</div>
                                <div class="card-info">
                                    <div class="card-price">10,000원</div>
                                    <div class="card-region-name">경기도 구리시</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
                <article class="card">	                   
                    <div class="card-photobox">
                        <div class="card-photo">
                            <div class="card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
                            <div class="card-heart"><img src="${pageContext.request.contextPath}/resources/images/main/heart_full.png"></div>
                        </div>
                        <div class="card-textbox">
                            <div class="card-text">
                                <div class="card-title">상품이름</div>
                                <div class="card-info">
                                    <div class="card-price">10,000원</div>
                                    <div class="card-region-name">경기도 구리시</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
                <article class="card">	                   
                    <div class="card-photobox">
                        <div class="card-photo">
                            <div class="card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
                            <div class="card-heart"><img src="${pageContext.request.contextPath}/resources/images/main/heart_full.png"></div>
                        </div>
                        <div class="card-textbox">
                            <div class="card-text">
                                <div class="card-title">상품이름</div>
                                <div class="card-info">
                                    <div class="card-price">10,000원</div>
                                    <div class="card-region-name">경기도 구리시</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
                <article class="card">	                   
                    <div class="card-photobox">
                        <div class="card-photo">
                            <div class="card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
                            <div class="card-heart"><img src="${pageContext.request.contextPath}/resources/images/main/heart_full.png"></div>
                        </div>
                        <div class="card-textbox">
                            <div class="card-text">
                                <div class="card-title">상품이름</div>
                                <div class="card-info">
                                    <div class="card-price">10,000원</div>
                                    <div class="card-region-name">경기도 구리시</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
                <article class="card">	                   
                    <div class="card-photobox">
                        <div class="card-photo">
                            <div class="card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
                            <div class="card-heart"><img src="${pageContext.request.contextPath}/resources/images/main/heart_full.png"></div>
                        </div>
                        <div class="card-textbox">
                            <div class="card-text">
                                <div class="card-title">상품이름</div>
                                <div class="card-info">
                                    <div class="card-price">10,000원</div>
                                    <div class="card-region-name">경기도 구리시</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>            
            </div>
            <div class="bottom-contents">
                <div class="notice">
                    <div class="notice-title">
                        <h2>공지사항</h2>
                        <p class="text"><a href="#">더보기 ></a></p>
                    </div>    
                    <div class="notice-board">
                        <ul>
                            <li><a href="#">공지사항 1</a></li>
                            <li><a href="#">공지사항 2</a></li>
                            <li><a href="#">공지사항 3</a></li>
                            <li><a href="#">공지사항 4</a></li>
                            <li><a href="#">공지사항 5</a></li>
                        </ul>
                    </div>
                </div>
                <div class="community">
                    <div class="community-title">
                        <h2>커뮤니티</h2>
                        <p class="text"><a href="#">더보기 ></a></p>
                    </div> 
                    <div class="community-board">
                        <ul>
                            <li><a href="#">커뮤니티 게시글1</a></li>
                            <li><a href="#">커뮤니티 게시글2</a></li>
                            <li><a href="#">커뮤니티 게시글3</a></li>
                            <li><a href="#">커뮤니티 게시글4</a></li>
                            <li><a href="#">커뮤니티 게시글5</a></li>
                        </ul>
                    </div>       
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