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
<body>
<jsp:include page="../main/header.jsp"/>
<div class="board-wrapper">
    <div class="category-view">
        <h2>전체 ></h2>
        <h2>카테고리</h2>
    </div>
    <form action="./boardView" method="post" id="board_form" enctype="multipart/form-data">
        <input type="hidden" name="user_id" value="2" />
        <div class="board-top">
            <h2>기본 정보</h2>
            <div class="prouct-info">
                <div class="board-img"  id="postimg">
                    <img src="${pageContext.request.contextPath}/resources/images/board/product_image.png" alt="대표이미지">
                </div>
                <div class="board-input">
                    <div class="product-title">
                        <h3>제목</h3>
                        <h3>입력한 제목</h3>
                    </div>
                    <div class="product-price">
                        <h3>가격</h3>
                        <h3>입력한 가격</h3>                                                    
                    </div>
                    <div class="product-location">
                        <h3>거래 지역</h3>
                        <h3>입력한 거래 지역</h3>
                        <div class="chkbox">
                            <input type="checkbox" name="board_trade_type" value="delivery"  class="radio"  id="delivery"/>
                            <label for="delivery" class="label" >택배</label>
                            <input type="checkbox" name="board_trade_type" value="direct"  class="radio" id="direct" />
                            <label for="direct" class="label" >직거래</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="board-middle">
            <div class="img_divs">
                <div class="img_div" id="img_div1"></div>
                <div class="img_div" id="img_div2"></div>
                <div class="img_div" id="img_div3"></div>
                <div class="img_div" id="img_div4"></div>
                <div class="img_div" id="img_div5"></div>
                <div class="img_div" id="img_div6"></div>
            </div>
            <div class="product-contact">
                <div class="interested"></div>
                <div class="space-talk-button"></div>
            </div>
        </div>           
        <div class="board_end">
            <div class="board-end-left">
                <h2>상품 설명</h2>
                <div class="content">
                    <p>상품 설명 길이가 길어도 박스 사이즈에 맞춰서 늘어납니다</p>
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
                        <h3>유저닉네임최대열글자</h3>
                        <p>상품 000 | 팔로워 000</p>
                    </div>
                    <div class="follow"></div>
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

    for (let i=0; i < interest.length; i++) {
        interest[i].addEventListener('click', function() {
        this.classList.toggle('active');
        });
    }

    let follow = document.querySelectorAll(".follow");
    // follow.classList.toggle("active");

    for (let i=0; i < follow.length; i++) {
        follow[i].addEventListener('click', function() {
        this.classList.toggle('active');
        });
    }

</script>
</html>