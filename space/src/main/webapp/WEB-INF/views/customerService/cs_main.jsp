<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link href="${pageContext.request.contextPath}/resources/customerService/css/cs_main.css?ver=2" rel="stylesheet"/>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapcs">
        <div class="customerService">
            <h3>고객센터</h3>
            <p>무엇을 도와드릴까요?</p>
            <div class="cs-search">
                <input class="search-bar-input" type="search">  
                <i class="fas fa-search"></i>
            </div>
        </div>
        <div class="FAQ">
            <h3>자주 묻는 질문</h3>
            <ul>
            	<c:forEach items="${cs_category_list }" var="cs_category_list">
					<li class='cs_category'><a href="category?id=${cs_category_list.cs_category_id }">${cs_category_list.cs_name }</a></li>
				</c:forEach>
            </ul>
        </div>
        <hr id='faq_hr' />
        <div class="FAQ2">
            <p>찾으시는 서비스가 없으신가요? <br>
            1:1문의를 이용해 보세요.</p>
            <div>
	            <button type="submit" id="faqBtn01">문의하기</button>
	            <button type="submit" id="faqBtn02">문의 내역보기</button>
            </div>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>