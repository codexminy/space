<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 - 내용</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/notice/notice_view.css">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapNotice">
        <div class="notice-top">
            <h3>● 공지사항</h3>
            <p>우주장터는 모두가 함께 만들어가는 중고거래, 커뮤니티 서비스 입니다. <br>
            운영 정책 및 규정에 위배되는 행위는 제재가 있을 수 있습니다.</p>
        </div>
        <div class="notice-board">
            <hr style="border: 0.1px solid  #D1D1D1">
            <ul class="notice-board-top">
                <li class="title">우리 주위의 장터 : 우주장터</li>
                    <span class="day">2022/03/17</span>     
                </li>
            </ul>
            <hr style="border: 0.1px solid  #D1D1D1">
            <div class="notice-board-view">
                <p>우리 주위의 장터 : 우주장터의 다양한 서비스를 이용해보세요.</p>
                <a href="#">중고 거래 안내 ></a> <br>
                <a href="#">커뮤니티 안내 ></a>
            </div>
            <hr style="border: 0.1px solid  #D1D1D1">
        </div>
        <button>목록</button>
    </div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>