<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user_/css/join.css" />
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="wrapjoin">
	<img src="${pageContext.request.contextPath}/resources/images/main/space_logo.png">
	<div class="wrap-join">
	    <div class="join-box">
	        <form action="" method="POST" id="join" >
	            <div class="space-join">
	                <p>우주장터 간편 회원가입</p>
	                <button type="button" id="submit" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/user_/joinAgree'"><span>회원가입</span></button>
	            </div>
            </form>   
            <div class="social-join">
                <p>SNS 계정으로 간편 회원가입</p>
                <div class="google">
                    <div class="google-icon"></div>
                    <h2>구글 계정으로 회원가입</h2>
                </div>
                <div class="naver">
                    <div class="naver-icon"></div>
                    <h2>네이버 계정으로 회원가입</h2>
                </div>
                <div class="kakao">
                    <div class="kakao-icon"></div>
                    <h2>카카오 계정으로 회원가입</h2>
                </div>
            </div>
        </div> 
 	</div>
</div>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>