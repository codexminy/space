<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 상품 등록하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/board/auctionPost.css">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="board-wrapper">
	<h2>● 경매 상품 등록하기</h2>
	<form action="./boardView" method="post" id="board_form" enctype="multipart/form-data">
	    <input type="hidden" name="user_id" value="2" />
	    <div class="board-top">
	        <h2>기본 정보</h2>
	        <div class="prouct-info">
	            <div class="board-img"  id="postimg">
	                <img src="${pageContext.request.contextPath}/resources/images/board/camera.png" alt="첨부파일이미지">
	                <p>이미지 등록</p>
	                <input type="file"  id="upload_file" name="upfile" multiple="multiple"  />
		<input type="hidden" name="main_img" id="main_img"/>
	            </div>
	            <div class="board-input">
	                <div class="product-title">
	                    <h3>제목</h3>
	                        <select name="p_category_id" id="p_category_id" class="category">
	                            <option>카테고리</option>
	                            <c:forEach items="${categoryList }" var="list">
	                                <option value="${list.p_category_id}">${list.p_category_name }</option>
	                            </c:forEach>
	                        </select>
	                    <input type="text" name="board_title" class="title"/>
	                </div>
	                <div class="product-price">
	                    <h3>가격</h3>
	                    <input type="text" name="board_price" class="min_price" id="min_price"  pattern="[0-9]+" onkeyup="inputNumberFormat(this)"
	                    placeholder="최소입찰가"/>
	                    <input type="text" name="board_price" class="price" id="price"  pattern="[0-9]+" onkeyup="inputNumberFormat(this)"
	                    placeholder="즉시구매가"/>
	                    <div class="chkbox">
	                        <input type="checkbox" name="board_trade_type" value="give_away" class="radio" id="give_away"/>
	                    </div>
	                </div>
	                <div class="product-location">
	                    <h3>거래 지역</h3>
	                        <input type="text" value="${address }" id="address" />
	                            <select name="p_category_id" id="p_category_id" class="category">
	                                <option disabled selected>등록기간</option>
	                                <option value="">3일</option>
	                                <option value="">7일</option>
	                                <option value="">14일</option>
	                            </select>
	                            <div class="chkbox">
	                                <input type="checkbox" name="board_trade_type" value="delivery"  class="radio"  id="delivery"/>
	                                <label for="delivery" class="label" >택배</label>
	                                <input type="checkbox" name="board_trade_type" value="direct"  class="radio" id="direct" />
	                                <label for="direct" class="label" >직거래</label>
	                            </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="board-middle">
	            <div class="img_div" id="img_div1"></div>
	            <div class="img_div" id="img_div2"></div>
	            <div class="img_div" id="img_div3"></div>
	            <div class="img_div" id="img_div4"></div>
	            <div class="img_div" id="img_div5"></div>
	            <div class="img_div" id="img_div6"></div>
	            <div id="star_p"><img src="${pageContext.request.contextPath}/resources/images/board/star_full.png"></div>
	        </div>
	        <div class="img_info">
	            <ul>
	                <li>- 이미지는 등록 순서대로 첨부되며, 클릭하여 대표 이미지를 변경할 수 있습니다.</li>
	                <li>- 최대 6장까지 등록이 가능합니다.</li>
	                <li>- JPG, JPEG, PNG 확장자만 등록이 가능합니다.</li>
	                <li>- 규정에 위배되는 이미지는 등록시 게시글이 제한 될 수 있으며 추후 발견시 무통보 삭제 및 제재를 받으실 수 있습니다.</li>
	            </ul>
	        </div>
	        <div class="board_end">
	            <h2>상품 설명</h2>
	            <div class="content">
	                <textarea rows="20"  name="board_content" id="board_content" 
	                placeholder="상품 설명을 입력해주세요.
	                &#10;상품에 대한 자세한 설명은 빠른 거래에 도움을 줍니다.&#10;가품 및 온라인 거래 금지 품목 거래시 게시가 제한 될 수 있으며,&#10;현행법에 의거하여 처벌 받으실 수 있습니다.
	                &#10;자세한 사항은 공지사항을 확인해주세요!"></textarea>
	            </div>
	            <div class="buttons">
	                <input type="button" value="등록" id="submit_btn"/>
	                <input type="button" value="취소" id="cancle" onclick="location.href='${pageContext.request.contextPath}/board/boardList'"/>
	            </div>
	        </div>
	    </form>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>