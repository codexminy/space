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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="./userProfile.jsp"/>
<jsp:include page="./mySpaceNav.jsp"/>
<div class="followers">
	<div class="my-space-nav-title">
        <h2>팔로워</h2>
        <p>${total }</p>
    </div>
    <div class="follows-wrap">
    	<c:forEach var="list" items="${list }">
	        <div class="follows-user-profile">
	            <div class="follows-user-profile-photo">
	            	<c:choose>
	            		<c:when test="${list.user_profile eq null }">
	            			<img src="${pageContext.request.contextPath}/resources/images/profile/profile1.png">
	            		</c:when>
	            		<c:otherwise>
			                <img src="${pageContext.request.contextPath}/resources/${list.user_profile }">
	            		</c:otherwise>
	            	</c:choose>
	            </div>
	            <div class="follows-user-profile-info">
	                <h2>${list.user_nickname }</h2>
	                <p>상품수 ${list.cnt }</p>
	            </div>
	            <c:set var="stop" value="true"/>
	            <c:forEach var="num" items="${testing }">
		            <c:if test="${stop }">
	            		<c:if test="${num eq list.user_id }">
				            <div class="followbtn" onclick="deleteFollowing(${ps.user_id},${list.user_id })"></div>
				            <c:set var="stop" value="false"/>
	            		</c:if>
		            </c:if>
	            </c:forEach>
	            <c:if test="${stop }">
	            	<div class="followbtn active" onclick="follow(${ps.user_id},${list.user_id })"></div>
	            </c:if>
	        </div>            
    	</c:forEach>
    </div>
    <div class="pagenation">
		<ul class="paging">
			<c:if test="${paging.prev }">
				<li><a href="${path }/myspace/followers?user_id=${ps.user_id}&pageNum=${paging.startPage - 1 }&amount=10" class="go"><i class="fa-solid fa-angle-left"></i></a></li>
			</c:if>
			<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
				<li><a href="${path }/myspace/followers?user_id=${ps.user_id}&pageNum=${num}&amount=10" class="go ${paging.ps.pageNum == num ? 'pageActive' : '' }">${num }</a></li>
			</c:forEach>
			<c:if test="${paging.next }">
				<li><a href="${path }/myspace/followers?user_id=${ps.user_id}&pageNum=${paging.endPage + 1 }&amount=10" class="go"><i class="fa-solid fa-angle-right"></i></a></li>
			</c:if>
		</ul>
	</div>     
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
<script>
	function deleteFollowing(user_id, user_login_id) {
		if(confirm('팔로우를 해제하시겠습니까?')) {
			$.ajax({
				url : "${path}/myspace/myspace/followings/" + user_id + "/" + user_login_id,
				type: "DELETE",
				success : function(result) {
					alert('팔로우 해제가 완료되었습니다.');
					location.reload();
				}
			});
		}
	}

	function follow(user_id, user_login_id) {
		if(confirm('팔로우 하시겠습니까?')) {
			$.ajax({
				url : "${path}/myspace/myspace/followings/" + user_id + "/" + user_login_id,
				type: "POST",
				success : function(result) {
					alert('팔로우가 완료되었습니다.');
					location.reload();
				}
			});
		}
	}
// 	function changeButton() {
//     	let follow = document.querySelectorAll(".followbtn");

// 	    for (let i=0; i < follow.length; i++) {
// 	        follow[i].addEventListener('click', function() {
// 	        	this.classList.toggle('active');
// 	        });
// 	    }
// 	}
</script>
</html>