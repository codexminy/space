<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user_/css/joinFinish.css" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapjoinFinish">
        <img src="${pageContext.request.contextPath}/resources/images/main/space_logo.png">
        <div class="join-finish">
            <img src="${pageContext.request.contextPath}/resources/images/user_/after_join.png" alt="아이콘">
            <h2>회원가입이 완료되었습니다!</h2>
            <p>로그인 후 우주장터의 모든 서비스를 이용하실 수 있습니다. <br>
            지금 내 주위에는 어떤 물건이 기다리고 있을지 <br>
            우주장터를 통해 확인하세요!</p>
            <button type="button" name="로그인하기" id="login" onclick="location.href='${pageContext.request.contextPath}/user_/login'">로그인 하기</button>
            <button type="button" name="메인화면으로" id="gomain" onclick="location.href='${pageContext.request.contextPath}/main/space'">메인 화면으로</button>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>