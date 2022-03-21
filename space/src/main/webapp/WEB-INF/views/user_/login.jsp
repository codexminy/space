<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login 화면</title>
</head>
<link href="${pageContext.request.contextPath}/resources/user_/css/login.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/user_/js/login.js" rel="stylesheet"/> 
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrap">
        <div class="wrap-login-logo">
            <a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/space_logo.png" width="150px" height="37.54px"></a>
        </div>
        <div class="wrap-login">
            <div class="login-box">
                <form action="#" method="POST" id="loginform" >
                    <div class="login">
                        <input type="text" name="아이디" placeholder="아이디" id="userId"> <br>
                        <input type="password" name="비밀번호" placeholder="비밀번호" id="userPassword">
                    </div>
                    <div class="login-status">
                        <input type="checkbox" onclick="loginChkOnclick()" id="loginChk">
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
                        <li><a href="#">회원가입</a></li>
                    </ul>  
                </div>
                <div class="social-login">
                    <ul>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/user_/google.png" alt="구글"></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/user_/naver.png" alt="네이버"></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/user_/kakao.png" alt="카카오"></a></li>
                    </ul>
                </div>
            </div> 
        </div>
    </div>
    <jsp:include page="../main/footer.jsp"></jsp:include> 
</body>
</html>