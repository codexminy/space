<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_profile</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mySpace/userProfile.css">
</head>
<body>
<div class="user-profile-box">
	<div class="user-profile-content">
	    <div class="user-profile-photo"></div>
	    <div class="user-profile-info">
	        <!-- <h2>${nickname }</h2> -->
	        <h2>테스트닉네임</h2>
	            <div class="user-star-ratings">
	                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
	                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
	                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
	                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
	                <img src="${pageContext.request.contextPath}/resources/images/mySpace/star_empty.png">
	        	</div>
	    </div>
	</div>
</div>
</body>
</html>