<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer.jsp</title>
<script src="https://kit.fontawesome.com/ff32eb5689.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/footer.css">
</head>
<body>
	<div id="wrap">
		<footer class="footer">
	        <div class="copyright">
	            <ul>
	                <li><a href="${pageContext.request.contextPath}/main/company">회사소개</a></li>
	                <li>|</li>
	                <li><a href="${pageContext.request.contextPath}/main/recruitment">인재채용</a></li>
	                <li>|</li>
	                <li><a href="${pageContext.request.contextPath}/main/ad">광고문의</a></li>
	                <li>|</li>
	                <li><a href="${pageContext.request.contextPath}/main/personal">개인정보처리방침</a></li>
	                <li>|</li>
	                <li><a href="${pageContext.request.contextPath}/main/terms">이용약관</a></li>
	            </ul>
	        </div>
	        <div class="copyright-text">Copyright ⓒ <strong>SPACE MARKET</strong> Corp. All rights reserved.</div>  
	    </footer>
	</div>
</body>
</html>