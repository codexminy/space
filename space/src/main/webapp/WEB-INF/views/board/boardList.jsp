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
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="board-list-wrapper">
<div class="category-page">
	<div class="category-page-top">
	    <div class="board-category">
	        <h2>전체 > </h2>
	        <h2>카테고리</h2>
	    </div>
	    <div class="sort">
	        <input type="checkbox" class="sort-by" id="sort-by-recent" checked="on" onclick='checkOnlyOne(this)'>
	        <label for="sort-by-recent">최신순</label>
	        <p>|</p>
	        <input type="checkbox" class="sort-by" id="sort-by-high" onclick='checkOnlyOne(this)'>
	        <label for="sort-by-high">높은 가격순</label>
	        <p>|</p>
	        <input type="checkbox" class="sort-by" id="sort-by-low" onclick='checkOnlyOne(this)'>
	            <label for="sort-by-low">낮은 가격순</label>
	        </div>
	    </div>
	</div>
    <div class="cards-wrap">
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
        <article class="card">	                   
            <div class="card-photobox">
            	<div class="card-photo">
	                <div class="card-photo-img" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'"></div>
	                <div class="card-heart"></div>
	            </div>
                <div class="card-textbox" onclick="location.href='${pageContext.request.contextPath}/board/boardVieww'">
                    <div class="card-text">
                        <div class="card-title">상품이름</div>
                        <div class="card-info">
                            <div class="card-price">10,000원</div>
                            <div class="card-region-name">경기도 구리시</div>
                        </div>
                    </div>
                </div>
            </div>
        </article> 
         
        

    <div class="page">
        <ul class="pagination modal">
            <li><a href="#" class="arrow left"><<</a></li>
            <li><a href="#" class="active num">1</a></li>
            <li><a href="#" class="num">2</a></li>
            <li><a href="#" class="num">3</a></li>
            <li><a href="#" class="num">4</a></li>
            <li><a href="#" class="num">5</a></li>
            <li><a href="#" class="num">6</a></li>
            <li><a href="#" class="num">7</a></li>
            <li><a href="#" class="num">8</a></li>
            <li><a href="#" class="num">9</a></li>
            <li><a href="#" class="num">10</a></li>
            <li><a href="#" class="arrow right">>></a></li>
        </ul>
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

    function checkOnlyOne(element) {
  
  const checkboxes 
      = document.querySelectorAll(".sort-by");
  
  checkboxes.forEach((cb) => {
    cb.checked = false;
  })
  
  element.checked = true;
}
</script>
</html>