<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user_/css/join.css" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapjoin">
        <div class="wrap-login-logo">
            <a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/space_logo.png" width="150px" height="37.54px"></a>
        </div>
        <div class="wrap-login">
            <div class="login-box">
                <form action="" method="POST" id="join" >
                    <div class="space-login">
                        <p>우주장터 간편 회원가입</p>
                        <button type="submit" id="submit" name="회원가입"><span>회원가입</span></button>
                    </div>
                </form>
                <div class="social-login">
                    <p>SNS 계정으로 간편 회원가입</p>
                    <ul>
                        <li class="google"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/user_/google.png" alt="구글">구글 계정으로 로그인</a></li>
                        <li class="naver"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/user_/naver.png" alt="네이버">네이버 계정으로 로그인</a></li>
                        <li class="kakao"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/user_/kakao.png" alt="카카오">카카오 계정으로 로그인</a></li>
                    </ul>
                </div>
            </div> 
        </div>
    </div>
    <jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>