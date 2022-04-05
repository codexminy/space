<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/board/boardList.css">
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="board-list-wrapper">
	<div class="category-page">
		<div class="category-page-top">
		    <div class="board-category">
		        <h2>전체 &gt;</h2>
		        <c:choose>
			        <c:when test="${paging.ps.p_category_id == 0 }">
			        	<h2>인기매물</h2>
			        </c:when>
		        	<c:otherwise>
		        		<h2>${name }</h2>
		        	</c:otherwise>
		        </c:choose>
		    </div>
		    <div class="sort">
		    	<c:if test="${paging.ps.sort eq 'board_date desc' }">
			        <input type="checkbox" class="sort-by" id="sort-by-recent" checked onclick='checkOnlyOne(this, "board_date desc")'>
			        <label for="sort-by-recent">최신순</label>
			        <p>|</p>
			        <input type="checkbox" class="sort-by" id="sort-by-high" onclick='checkOnlyOne(this, "board_price desc")'>
			        <label for="sort-by-high">높은 가격순</label>
			        <p>|</p>
			        <input type="checkbox" class="sort-by" id="sort-by-low" onclick='checkOnlyOne(this, "board_price")'>
		            <label for="sort-by-low">낮은 가격순</label>
		    	</c:if>
		    	<c:if test="${paging.ps.sort eq 'board_price desc' }">
			        <input type="checkbox" class="sort-by" id="sort-by-recent" onclick='checkOnlyOne(this, "board_date desc")'>
			        <label for="sort-by-recent">최신순</label>
			        <p>|</p>
			        <input type="checkbox" class="sort-by" id="sort-by-high" checked onclick='checkOnlyOne(this, "board_price desc")'>
			        <label for="sort-by-high">높은 가격순</label>
			        <p>|</p>
			        <input type="checkbox" class="sort-by" id="sort-by-low" onclick='checkOnlyOne(this, "board_price")'>
		            <label for="sort-by-low">낮은 가격순</label>
		    	</c:if>
		    	<c:if test="${paging.ps.sort eq 'board_price' }">
			        <input type="checkbox" class="sort-by" id="sort-by-recent" onclick='checkOnlyOne(this, "board_date desc")'>
			        <label for="sort-by-recent">최신순</label>
			        <p>|</p>
			        <input type="checkbox" class="sort-by" id="sort-by-high" onclick='checkOnlyOne(this, "board_price desc")'>
			        <label for="sort-by-high">높은 가격순</label>
			        <p>|</p>
			        <input type="checkbox" class="sort-by" id="sort-by-low" checked onclick='checkOnlyOne(this, "board_price")'>
		            <label for="sort-by-low">낮은 가격순</label>
		    	</c:if>
	        </div>
	    </div>
	</div>
    <div class="cards-wrap">
    	<c:forEach var="list" items="${list }">
	        <article class="card">
	            <div class="card-photobox">
	            	<div class="card-photo">
	            		<c:choose>
	            			<c:when test="${list.auction_state eq 'Y' }">
				                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/auctionView?board_id=${list.board_id }&auction_id=${list.auction_id }'">
				                	<img src="${pageContext.request.contextPath}/resources/upload/board/${list.renamedfilename}" alt="" width="100%"/>
				                </div>
	            			</c:when>
	            			<c:when test="${list.auction_state eq 'N' }">
				                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww?board_id=${list.board_id }'">
				                	<img src="${pageContext.request.contextPath}/resources/upload/board/${list.renamedfilename}" alt="" width="100%"/>
				                </div>
	            			</c:when>
	            		</c:choose>
		                <div class="card-heart"></div>
		            </div>
	                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww?board_id=${list.board_id }'">
	                    <div class="card-text">
	                        <div class="card-title">${list.board_title }</div>
	                        <div class="card-info">
	                            <div class="card-price">${list.board_price }</div>
	                            <div class="card-region-name">${list.user_address }</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </article>
    	</c:forEach>
	    <div class="page">
	        <ul class="pagination modal">
	        	<c:if test="${paging.prev }">
	                <li><a href="${path }/board/boardList?p_category_id=${paging.ps.p_category_id }&sort=${paging.ps.sort }&pageNum=${paging.startPage - 1}" class="arrow left">&lt;&lt;</a></li>
            	</c:if>
                <c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
                	<li><a href="${path }/board/boardList?p_category_id=${paging.ps.p_category_id }&sort=${paging.ps.sort }&pageNum=${num}" class="${paging.ps.pageNum == num ? 'active' : '' }">${num }</a></li>
                </c:forEach>
                <c:if test="${paging.next }">
	                <li><a href="${path }/board/boardList?p_category_id=${paging.ps.p_category_id }&sort=${paging.ps.sort }&pageNum=${paging.endPage + 1}" class="arrow right">&gt;&gt;</a></li>
                </c:if>
	        </ul>
	    </div>
	</div>
</div>	
<jsp:include page="../main/footer.jsp"/>
</body>
<script>

    let like = document.querySelectorAll(".card-heart");

    for (let i=0; i < like.length; i++) {
        like[i].addEventListener('click', function() {
        this.classList.toggle('active');
        });
    }

    function checkOnlyOne(element, sort) {
  
	  const checkboxes = document.querySelectorAll(".sort-by");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	  
	  location.href = "${pageContext.request.contextPath}/board/boardList?p_category_id=${paging.ps.p_category_id}&sort="+sort+"";
	}
</script>
</html>