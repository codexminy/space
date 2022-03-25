<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 우주</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mySpace/followers.css">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="./userProfile.jsp"/>
<jsp:include page="./mySpaceNav.jsp"/>
<div class="followers">
	<div class="my-space-nav-title">
        <h2>팔로워</h2>
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
            <div class="follow-button" onclick="changeButton()">
                <div class="follow-button-content">
                    <img src="${pageContext.request.contextPath}/resources/images/mySpace/following.png">
                    <p>팔로잉</p>
                </div>
            </div>
        </div>
        <div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
            <div class="follow-button" onclick="changeButton()">
                <div class="follow-button-content">
                    <img src="${pageContext.request.contextPath}/resources/images/mySpace/following.png">
                    <p>팔로잉</p>
                </div>
            </div>
        </div>
        <div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
            <div class="follow-button" onclick="changeButton()">
                <div class="follow-button-content">
                    <img src="${pageContext.request.contextPath}/resources/images/mySpace/following.png">
                    <p>팔로잉</p>
                </div>
            </div>
        </div>
        <div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
            <div class="follow-button" onclick="changeButton()">
                <div class="follow-button-content">
                    <img src="${pageContext.request.contextPath}/resources/images/mySpace/following.png">
                    <p>팔로잉</p>
                </div>
            </div>
        </div>
        <div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
            <div class="follow-button" onclick="changeButton()">
                <div class="follow-button-content">
                    <img src="${pageContext.request.contextPath}/resources/images/mySpace/following.png">
                    <p>팔로잉</p>
                </div>
            </div>
        </div>
        <div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
            <div class="follow-button" onclick="changeButton()">
                <div class="follow-button-content">
                    <img src="${pageContext.request.contextPath}/resources/images/mySpace/following.png">
                    <p>팔로잉</p>
                </div>
            </div>
        </div>
        <div class="follows-user-profile">
            <div class="follows-user-profile-photo">
                <img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
            </div>
            <div class="follows-user-profile-info">
                <h2>닉네임</h2>
                <p>상품수  000  |  팔로워  0000</p>
            </div>
            <div class="follow-button" onclick="changeButton()">
                <div class="follow-button-content">
                    <img src="${pageContext.request.contextPath}/resources/images/mySpace/following.png">
                    <p>팔로잉</p>
                </div>
            </div>
        </div>
              
    </div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>