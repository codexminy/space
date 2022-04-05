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
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="./userProfile.jsp"/>
<jsp:include page="./mySpaceNav.jsp"/>
<div class="reviews">
	<div class="my-space-nav-title">
        <h2>거래후기</h2>
        <p>${total }</p>
    </div>
    <div class="reviews-post-wrap">
    	<c:forEach var="list" items="${list }">
		    <div class="reviews-post">
		        <div class="reviewer-profile">
		            <div class="reviewer-profile-photo">
		                <img src="${pageContext.request.contextPath}/resources/${list.user_profile}">
		            </div>
		            <div class="reviewer-profile-info">
		                <div class="nickname-writedate">
		                    <h2>${list.user_nickname }</h2>
		                    <p><fmt:formatDate value="${list.review_date }" pattern="yyyy/MM/dd"/></p>
		                </div>
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
		        <div class="reviews-content">
		            <p>${list.review_content }</p>
		        </div>
		    </div>
    	</c:forEach>
	</div>
	<div class="pagenation">
		<ul class="paging">
			<c:if test="${paging.prev }">
				<li><a href="${path }/myspace/reviews?user_id=${ps.user_id}&pageNum=${paging.startPage - 1 }&amount=10" class="go"><i class="fa-solid fa-angle-left"></i></a></li>
			</c:if>
			<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
				<li><a href="${path }/myspace/reviews?user_id=${ps.user_id}&pageNum=${num}&amount=10" class="go ${paging.ps.pageNum == num ? 'pageActive' : '' }">${num }</a></li>
			</c:forEach>
			<c:if test="${paging.next }">
				<li><a href="${path }/myspace/reviews?user_id=${ps.user_id}&pageNum=${paging.endPage + 1 }&amount=10" class="go"><i class="fa-solid fa-angle-right"></i></a></li>
			</c:if>
		</ul>
	</div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>