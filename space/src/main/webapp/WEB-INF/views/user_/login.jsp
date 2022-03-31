<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login 화면</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link href="${pageContext.request.contextPath}/resources/user_/css/login.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/user_/js/login.js" rel="stylesheet"/> 
<body>
<jsp:include page="../main/header.jsp"/>
	<div class="wraplogin">
        <img src="${pageContext.request.contextPath}/resources/images/main/space_logo.png">
        <div class="wrap-login">
            <div class="login-box">
                <form action="#" method="POST" id="loginform" >
                    <div class="login">
                        <div class="login-input-box">
                            <input type="text" name="아이디" placeholder="아이디" id="userId">
                        </div>
                        <div class="login-input-box">
                            <input type="password" name="비밀번호" placeholder="비밀번호" id="userPassword">
                        </div>
                    </div>
                    <div class="login-status">
                        <input type="checkbox" onclick="loginChkOnclick()" id="login-status-id">
                        <label for="login-status-id">로그인 상태 유지</label>
                    </div>
                    <button type="submit" id="submit" name="로그인"><span>로그인</span></button>
                </form>   
                <div class="login-option">
                    <ul>
                        <li><a href="#">아이디 찾기</a></li>
                        <li>|</li>
                        <li><a href="#">비밀번호 찾기</a></li>
                        <li>|</li>
                        <li><a href="${pageContext.request.contextPath}/user_/join">회원가입</a></li>
                    </ul>  
                </div>
                <div class="social-login">
                    <div class="google">
                        <div class="google-icon"></div>
                        <h2>구글로 로그인하기</h2>
                    </div>
                    <div class="naver">
                        <div class="naver-icon"></div>
                        <h2>네이버로 로그인하기</h2>
                    </div>
                    <div class="kakao">
                        <div class="kakao-icon"></div>
                        <h2>카카오로 로그인하기</h2>
                    </div>
                </div>
            </div> 
     	</div>
    </div>
<jsp:include page="../main/footer.jsp"></jsp:include> 
</body>
</html>