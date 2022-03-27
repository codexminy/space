<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터-자주묻는질문-질의응답</title>
<link href="${pageContext.request.contextPath}/resources/customerService/css/QnA.css" rel="stylesheet"/>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapQnA">
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
                    <li style="color: #22007F; font-weight: 700;"><a href="#">운영 정책</a></li>
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
            <div class="QnA">
                <div class="cs-top">
                    <h4>01. 신고 방법</h4>
                </div>
                <div class="cs-title">
                    <ul>
                        <li>Q) 신고는 어떻게 하나요?</li>
                    </ul>  
                </div>
                <div class="cs-content">
                    <p>
	                    A) 우주장터는 다양한 신고 제보를 받아 관련 법 또는 운영정책 기준으로 신속히 대응하고 있습니다. <br>
	                    &nbsp;&nbsp;&nbsp;&nbsp;신고 방법은 아래와 같습니다.
	                </p>
	                <p>&nbsp;&nbsp;&nbsp;&nbsp;게시글 신고 : 게시글 [상품설명] 좌측하단 > 게시글 신고하기</p>
	                <p>&nbsp;&nbsp;&nbsp;&nbsp;프로필 신고 : 상점 > [프로필] 하단 > 프로필 신고하기</p>
                </div>
            </div>
            <button id="btn">목록</button>
        </div>
    </div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>