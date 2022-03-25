<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터-자주묻는질문</title>
<link href="${pageContext.request.contextPath}/resources/customerService/css/FAQ.css" rel="stylesheet"/>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapFAQ">
        <div class="customerService">
            <h3>고객센터</h3>
            <p>무엇을 도와드릴까요?</p>
            <div class="cs-search">
                <input class="search-bar-input" type="search">  
                <i class="fas fa-search"></i>
            </div>
        </div>
        <div class="FAQ">
            <h3>자주 묻는 질문</h3>
            <div class="snb">
                <ul>
                    <li><a href="#">운영 정책</a></li>
                    <li><a href="#">계정 / 인증</a></li>
                    <li><a href="#">구매 / 판매</a></li>
                    <li><a href="#">거래 품목</a></li>
                    <li><a href="#">거래 매너</a></li>       
                    <li><a href="#">이용 제재</a></li>
                    <li><a href="#">커뮤니티</a></li>
                    <li><a href="#">우주톡</a></li>
                    <li><a href="#">본인 인증</a></li>
                    <li><a href="#">기타</a></li>
                </ul>
            </div>
            <div class="updown"></div>
            <div class="faqList">
                <ul>
                    <li><a href="#">01. 중고거래 운영정책</a></li>
                    <hr style="border: 0.1px solid  #D1D1D1">
                    <li><a href="#">02. 커뮤니티 가이드라인</a></li>
                    <hr style="border: 0.1px solid  #D1D1D1">
                    <li><a href="#">03. 광고 운영정책</a></li>
                    <hr style="border: 0.1px solid  #D1D1D1">
                    <li><a href="#">04. 신고 방법</a></li>
                    <hr style="border: 0.1px solid  #D1D1D1">
                    <li><a href="#">05. 우주장터에서 지켜야할 매너</a></li>
                    <hr style="border: 0.1px solid  #D1D1D1">
                    <li><a href="#">06. 판매 금지 물품</a></li>
                    <hr style="border: 0.1px solid  #D1D1D1">
                    <li><a href="#">07. 다른 프로필로 전환하고 싶어요</a></li>
                    <hr style="border: 0.1px solid  #D1D1D1">
                    <li><a href="#">08. 작성한 게시글이 보이지 않나요?</a></li>
                    <hr style="border: 0.1px solid  #D1D1D1">
                    <li><a href="#">09. 경매는 어떻게 하는건가요?</a></li>
                    <hr style="border: 0.1px solid  #D1D1D1">
                    <li><a href="#">10. 광고를 삭제하고 싶어요</a></li>
                    <hr style="border: 0.1px solid  #D1D1D1">
                </ul>
            </div>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>