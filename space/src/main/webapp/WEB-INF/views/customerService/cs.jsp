<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link href="${pageContext.request.contextPath}/resources/customerService/css/cs.css" rel="stylesheet"/>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapcs">
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
            <ul>
                <li><button type="submit" id="btn01">운영 정책</button></li>
                <li><button type="submit" id="btn02">계정 / 인증</button></li>
                <li><button type="submit" id="btn03">구매 / 판매</button></li>
                <li><button type="submit" id="btn04">거래 품목</button></li>
                <li><button type="submit" id="btn05">거래 매너</button></li>       
                <li><button type="submit" id="btn06">이용 제재</button></li>
                <li><button type="submit" id="btn07">커뮤니티</button></li>
                <li><button type="submit" id="btn08">우주톡</button></li>
                <li><button type="submit" id="btn09">본인 인증</button></li>
                <li><button type="submit" id="btn10">기타</button></li>
            </ul>
        </div>
        <div class="FAQ2">
            <h3>자주 묻는 질문</h3>
            <p>찾으시는 서비스가 없으신가요? <br>
            1:1문의를 이용해 보세요.</p>
            <button type="submit" id="faqBtn01">문의하기</button>
            <button type="submit" id="faqBtn02">문의 내역보기</button>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>