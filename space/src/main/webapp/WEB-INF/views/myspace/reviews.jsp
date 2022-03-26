<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 우주</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mySpace/reviews.css">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="./userProfile.jsp"/>
<div class="my-space-nav">
	<ul>
	    <li><a href="${pageContext.request.contextPath}/myspace/product">판매상품</a></li>
	    <li><a href="${pageContext.request.contextPath}/myspace/reviews">거래후기</a></li>
	    <li><a href="${pageContext.request.contextPath}/myspace/interested">찜한 상품</a></li>
	    <li><a href="${pageContext.request.contextPath}/myspace/followings">팔로잉</a></li>
	    <li><a href="${pageContext.request.contextPath}/myspace/followers">팔로워</a></li>
	</ul>
</div>
<div class="reviews">
	<div class="my-space-nav-title">
        <h2>거래후기</h2>
        <p>000</p>
    </div>
    
    <div class="reviews-post-wrap">
	    <div class="reviews-post">
	        <div class="reviewer-profile">
	            <div class="reviewer-profile-photo">
	                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
	            </div>
	            <div class="reviewer-profile-info">
	                <div class="nickname-writedate">
	                    <h2>닉네임</h2>
	                    <p>2022 / 03 / 25</p>
	                </div>
	                <div class="user-star-ratings">
	                    <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
		                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
		                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
		                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
		                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_empty.png">
	                </div>
	            </div>
	        </div>
	        <div class="reviews-content">
	            <p>
	                좋은 상품 저렴하게 팔아주셔서 너무 감사합니다
	            </p>
	        </div>
	    </div>
	    <div class="reviews-post">
	        <div class="reviewer-profile">
	            <div class="reviewer-profile-photo">
	                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
	            </div>
	            <div class="reviewer-profile-info">
	                <div class="nickname-writedate">
	                    <h2>닉네임</h2>
	                    <p>2022 / 03 / 25</p>
	                </div>
	                <div class="user-star-ratings">
	                    <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
		                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
		                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
		                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
		                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_empty.png">
	                </div>
	            </div>
	        </div>
	        <div class="reviews-content">
	            <p>
	                좋은 상품 저렴하게 팔아주셔서 너무 감사합니다
	            </p>
	        </div>
	    </div>
	    <div class="reviews-post">
	        <div class="reviewer-profile">
	            <div class="reviewer-profile-photo">
	                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
	            </div>
	            <div class="reviewer-profile-info">
	                <div class="nickname-writedate">
	                    <h2>닉네임</h2>
	                    <p>2022 / 03 / 25</p>
	                </div>
	                <div class="user-star-ratings">
	                    <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
		                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
		                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
		                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
		                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_empty.png">
	                </div>
	            </div>
	        </div>
	        <div class="reviews-content">
	            <p>
	                좋은 상품 저렴하게 팔아주셔서 너무 감사합니다
	                좋은 상품 저렴하게 팔아주셔서 너무 감사합니다
	                좋은 상품 저렴하게 팔아주셔서 너무 감사합니다
	                길게 써도 박스 안 삐져나가나 테스트 안 나가네
	            </p>
	        </div>
	    </div>                
	</div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>