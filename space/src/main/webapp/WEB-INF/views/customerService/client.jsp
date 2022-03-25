<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 1:1문의하기</title>
<link href="${pageContext.request.contextPath}/resources/customerService/css/client.css" rel="stylesheet"/>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapClient">
        <div class="customerService">
            <h3>고객센터</h3>
            <p>무엇을 도와드릴까요?</p>
            <div class="cs-search">
                <input class="search-bar-input" type="search">  
                <i class="fas fa-search"></i>
            </div>
        </div>
        <div class="client">
            <h3>1:1 문의하기</h3>
            <form action="#" method="POST" id="clientForm">
                <select name="category" id="category" onchange="checkcategory(this.options[this.selectedIndex].text);">
                    <option value="no">카테고리</option>
                    <option value="no01">운영 정책</option>
                    <option value="no02">계정 / 인증</option>
                    <option value="no03">구매 / 판매</option>
                    <option value="no04">거래 품목</option>
                    <option value="no05">거래 매너</option>
                    <option value="no06">이용 제재</option>
                    <option value="no07">커뮤니티</option>
                    <option value="no08">우주톡</option>
                    <option value="no09">본인 인증</option>
                    <option value="no010">기타</option>
                </select>
                <input type="text" name="title" placeholder="제목" id="title">
                <input type="text" name="content" id="content" placeholder=
                    "내용을 입력해주세요.
                    여러분의 이야기는 더 좋은 서비스를 만들어가는데에 밑거름이 됩니다.
                    고객센터 운영시간 > 10:00 ~ 17:00
                    답변에는 시간이 소요됩니다. 조금만 기다려주시면 빠르게 답변드리기 위해 노력하겠습니다.
                    산업안전보건법에 따라 고객응대 근로자 보호조치를 위해 모든 문의는 기록으로 남습니다."
                >
                <div class="card">
                    <div class="card-photo-img"></div>
                </div>
                <div class="card">
                    <div class="card-photo-img"></div>
                </div>
                <div class="card">
                    <div class="card-photo-img"></div>
                </div>
                <div class="card">
                    <div class="card-photo-img"></div>
                </div>
                <button type="submit" id="register" name="등록">등록</button>
                <button type="submit" id="cancel" name="취소">취소</button>
            </form>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>