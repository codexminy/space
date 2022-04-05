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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="./userProfile.jsp"/>
<jsp:include page="./mySpaceNav.jsp"/>
<div class="interested">
	<div class="my-space-nav-title">
        <h2>찜한 상품</h2>
        <p>${total }</p>
    </div>
	<div class="myspace-cards-wrap">
		<c:forEach var="list" items="${list }">
			<article class="myspace-card">	                   
		        <div class="myspace-card-photo">
		        	 <div class="myspace-card-photo-img" onclick="location.href='${path}/board/boardVieww?board_id=${list.board_id }'">
		            	<img src="${path}/resources/upload/board/${list.renamedfilename}" alt="" width="90%"/>
		            </div>
		        	<div class="card-heart" onclick="deleteLike(${list.board_like_id})"></div>
		        </div>
		        <div class="myspace-card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww?board_id=${list.board_id }'">
		            <div class="myspace-card-text">
		                <div class="myspace-card-title">${list.board_title }</div>
		                <div class="myspace-card-info">
		                    <div class="card-price">${list.board_price }</div>
		                    <div class="card-region-name">${list.user_address }</div>
		                </div>
		            </div>
		        </div>
		    </article>                   
		</c:forEach>
	</div>
	<div class="pagenation">
		<ul class="paging">
			<c:if test="${paging.prev }">
				<li><a href="${path }/myspace/interested?user_id=${ps.user_id}&pageNum=${paging.startPage - 1 }&amount=10" class="go"><i class="fa-solid fa-angle-left"></i></a></li>
			</c:if>
			<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
				<li><a href="${path }/myspace/interested?user_id=${ps.user_id}&pageNum=${num}&amount=10" class="go ${paging.ps.pageNum == num ? 'pageActive' : '' }">${num }</a></li>
			</c:forEach>
			<c:if test="${paging.next }">
				<li><a href="${path }/myspace/interested?user_id=${ps.user_id}&pageNum=${paging.endPage + 1 }&amount=10" class="go"><i class="fa-solid fa-angle-right"></i></a></li>
			</c:if>
		</ul>
	</div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
<script>

// 	let like = document.querySelectorAll(".card-heart");
	
// 	for (let i=0; i < like.length; i++) {
// 	    like[i].addEventListener('click', function() {
// 	    	this.classList.toggle('active');
// 	    });
// 	}

	function deleteLike(id) {
		if(confirm('선택한 찜을 삭제하시겠습니까?')) {
			$.ajax({
				url : "${path}/myspace/myspace/interested/" + id,
				type: "DELETE",
				success : function(result) {
					alert('삭제가 완료되었습니다.');
					location.reload();
				}
			});
		}
	}
	
</script>
</html>









