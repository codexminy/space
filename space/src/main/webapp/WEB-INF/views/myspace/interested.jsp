<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 우주</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mySpace/interested.css">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="./userProfile.jsp"/>
<jsp:include page="./mySpaceNav.jsp"/>
<div class="interested">
	<div class="my-space-nav-title">
        <h2>찜한 상품</h2>
        <p>000</p>
    </div>

	<div class="myspace-cards-wrap">
		<article class="myspace-card">	                   
	        <div class="myspace-card-photo">
	            <div class="myspace-card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
	        </div>
	        <div class="myspace-card-textbox">
	            <div class="myspace-card-text">
	                <div class="myspace-card-title">상품이름</div>
	                <div class="myspace-card-info">
	                    <div class="card-price">10,000원</div>
	                    <div class="card-region-name">경기도 구리시</div>
	                </div>
	            </div>
	        </div>
	    </article>                   
		<article class="myspace-card">	                   
	        <div class="myspace-card-photo">
	            <div class="myspace-card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
	        </div>
	        <div class="myspace-card-textbox">
	            <div class="myspace-card-text">
	                <div class="myspace-card-title">상품이름</div>
	                <div class="myspace-card-info">
	                    <div class="card-price">10,000원</div>
	                    <div class="card-region-name">경기도 구리시</div>
	                </div>
	            </div>
	        </div>
	    </article>                   
		<article class="myspace-card">	                   
	        <div class="myspace-card-photo">
	            <div class="myspace-card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
	        </div>
	        <div class="myspace-card-textbox">
	            <div class="myspace-card-text">
	                <div class="myspace-card-title">상품이름</div>
	                <div class="myspace-card-info">
	                    <div class="card-price">10,000원</div>
	                    <div class="card-region-name">경기도 구리시</div>
	                </div>
	            </div>
	        </div>
	    </article>                   
		<article class="myspace-card">	                   
	        <div class="myspace-card-photo">
	            <div class="myspace-card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
	        </div>
	        <div class="myspace-card-textbox">
	            <div class="myspace-card-text">
	                <div class="myspace-card-title">상품이름</div>
	                <div class="myspace-card-info">
	                    <div class="card-price">10,000원</div>
	                    <div class="card-region-name">경기도 구리시</div>
	                </div>
	            </div>
	        </div>
	    </article>                   
		<article class="myspace-card">	                   
	        <div class="myspace-card-photo">
	            <div class="myspace-card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
	        </div>
	        <div class="myspace-card-textbox">
	            <div class="myspace-card-text">
	                <div class="myspace-card-title">상품이름</div>
	                <div class="myspace-card-info">
	                    <div class="card-price">10,000원</div>
	                    <div class="card-region-name">경기도 구리시</div>
	                </div>
	            </div>
	        </div>
	    </article>                   
		<article class="myspace-card">	                   
	        <div class="myspace-card-photo">
	            <div class="myspace-card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
	        </div>
	        <div class="myspace-card-textbox">
	            <div class="myspace-card-text">
	                <div class="myspace-card-title">상품이름</div>
	                <div class="myspace-card-info">
	                    <div class="card-price">10,000원</div>
	                    <div class="card-region-name">경기도 구리시</div>
	                </div>
	            </div>
	        </div>
	    </article>                   
		<article class="myspace-card">	                   
	        <div class="myspace-card-photo">
	            <div class="myspace-card-photo-img"><img src="/space/mainpage/images/images/jpg" alt="상품사진"></div>
	        </div>
	        <div class="myspace-card-textbox">
	            <div class="myspace-card-text">
	                <div class="myspace-card-title">상품이름</div>
	                <div class="myspace-card-info">
	                    <div class="card-price">10,000원</div>
	                    <div class="card-region-name">경기도 구리시</div>
	                </div>
	            </div>
	        </div>
	    </article>                 
	</div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>