<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 약관</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user_/css/joinAgree.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user_/js/joinAgree.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapjoinAgree">
        <div class="wrap-login-logo">
            <a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/space_logo.png" width="150px" height="37.54px"></a>
        </div>
        <div class="joinAgree">
            <p class="joinAgree-text">우리 주위의 장터 : 우주장터 <br>
            회원가입을 위한 서비스 약관에 동의해 주세요.</p>
            <form action="#" method="POST" id="join-agreement"> 
                <ul class="join-box">
                    <div class="join-top">
                        <li class="checkAllBtn">
                            <input type="checkbox" name="selectall" value='selectall' onclick='javascript:selectAll(this)'>
                            모두 동의합니다.
                        </li>
                        <p class="join-agreement-text">
                        전체동의는 필수 및 선택정보에 대한 동의도 포함되어있으며 <br>
                        개별적으로 동의를 선택하실 수 있습니다.<br>
                        선택항목에 대한 동의를 거부하시는 경우에도 서비스는 이용 가능합니다.
                    </p>
                    </div>
                    <hr>
                    <ul class="jointext">
                        <li class="checkBtn">
                            <input type="checkbox" name="chktxt" value='select3' onclick='checkSelectAll()'> 
                            만 14세 이상입니다.
                        </li>
                        <li class="more">></li>
                    </ul>
                    <ul class="jointext">
                        <li class="checkBtn">
                            <input type="checkbox" name="chktxt" value='select3' onclick='checkSelectAll()'>
                            [필수] 우주장터 이용약관
                        </li>
                        <li class="more">></li>
                    </ul>
                    <ul class="jointext">
                        <li class="checkBtn">
                            <input type="checkbox" name="chktxt" value='select4' onclick='checkSelectAll()'>
                            [필수] 개인정보 수집 이용 동의
                        </li>
                        <li class="more">></li>
                    </ul>
                    <ul class="jointext">
                        <li class="checkBtn">
                            <input type="checkbox" name="chktxt" value='select5' onclick='checkSelectAll()'>
                            [선택] 마케팅 수신 동의
                        </li>
                        <li class="more">></li>
                    </ul>
                    <ul class="jointext">
                        <li class="checkBtn">
                            <input type="checkbox" name="chktxt" value='select6' onclick='checkSelectAll()'>
                            [선택] 개인정보 활용 동의
                        </li>
                        <li class="more">></li>
                    </ul>
                    <li><button type="submit" class="btn" name="동의">동의</button></li>
                </ul>
            </form>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>