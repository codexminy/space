<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 우주</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mySpace/product.css">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="./userProfile.jsp"/>
<jsp:include page="./mySpaceNav.jsp"/>
<div class="selling-product">
	<div class="my-space-nav-title">
        <h2>판매상품</h2>
        <p>000</p>
    </div>
	<div class="myspace-cards-wrap">
		<article class="myspace-card">	                   
	        <div class="myspace-card-photo">
	            <div class="myspace-card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	        </div>
	        <div class="myspace-card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
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
	            <div class="myspace-card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	        </div>
	        <div class="myspace-card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
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
	            <div class="myspace-card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	        </div>
	        <div class="myspace-card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
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
	            <div class="myspace-card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	        </div>
	        <div class="myspace-card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
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
	            <div class="myspace-card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	        </div>
	        <div class="myspace-card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
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
	            <div class="myspace-card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	        </div>
	        <div class="myspace-card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
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
	            <div class="myspace-card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	        </div>
	        <div class="myspace-card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
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