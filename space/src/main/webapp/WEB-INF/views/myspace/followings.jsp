<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 우주</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mySpace/followings.css">
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
<div class="followings">
	<div class="my-space-nav-title">
        <h2>팔로잉</h2>
        <p>000</p>
    </div>

    <div class="follows-wrap">
		<div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
			<div class="followbtn" onclick="changeButton()"></div>
        </div>
		<div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
			<div class="followbtn" onclick="changeButton()"></div>
        </div>
		<div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
			<div class="followbtn" onclick="changeButton()"></div>
        </div>
		<div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
			<div class="followbtn" onclick="changeButton()"></div>
        </div>
		<div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
			<div class="followbtn" onclick="changeButton()"></div>
        </div>
		<div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
			<div class="followbtn" onclick="changeButton()"></div>
        </div>
		<div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
			<div class="followbtn" onclick="changeButton()"></div>
        </div>
		<div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
			<div class="followbtn" onclick="changeButton()"></div>
        </div>
    </div>                    
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
<script>
	function changeButton() {
    	let follow = document.querySelectorAll(".followbtn");

	    for (let i=0; i < follow.length; i++) {
	        follow[i].addEventListener('click', function() {
	        	this.classList.toggle('active');
	        });
	    }
	}
</script>
</html>