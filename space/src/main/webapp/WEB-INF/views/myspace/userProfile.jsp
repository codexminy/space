<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	    <div class="user-profile-photo">
	    	<c:choose>
	    		<c:when test="${info.user_profile == null}">
		    		<i class="fa-solid fa-user"></i>
	    		</c:when>
	    		<c:when test="${info.user_profile != null}">
			    	<img src="${pageContext.request.contextPath}/resources/${info.user_profile }" alt="프로필사진" />
	    		</c:when>
	    	</c:choose>
	    </div>
	    <div class="user-profile-info">
	        <h2>${info.user_nickname }</h2>
            <div class="user-star-ratings">
            	<c:forEach begin="1" end="${info.stars }">
            		<img src="${pageContext.request.contextPath}/resources/images/mySpace/star_full.png">
            	</c:forEach>
				<c:forEach begin="${info.stars }" end="4">
            		<img src="${pageContext.request.contextPath}/resources/images/mySpace/star_empty.png">
            	</c:forEach>
        	</div>
	    </div>
	</div>
</div>
</body>
</html>