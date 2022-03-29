<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 1:1문의</title>
<link href="${pageContext.request.contextPath}/resources/community/css/common.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/customerService/css/contact_us_list_view.css" rel="stylesheet"/>
<c:choose>
<c:when test="${empty val }">
	<style>
		.list_${contact_us_list[0].cu_id } a {
			font-size:18px;
			font-weight:bold;
			color:#22007F;
		}
	</style>
</c:when>
<c:otherwise>
	<style>
		.list_${val } a {
			font-size:18px;
			font-weight:bold;
			color:#22007F;
		}
	</style>
</c:otherwise>
</c:choose>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapContentList">
        <div class="customerService">
            <h3>고객센터</h3>
            <p>무엇을 도와드릴까요?${val }</p>
            <div class="cs-search">
                <input class="search-bar-input" type="search">  
                <i class="fas fa-search"></i>
            </div>
        </div>
        <div class="client">
            <h3 style="font-size: 22px; font-weight:bold;">1:1 문의하기</h3>
            <div class="snb">
                <ul id="snb_check">
               		<c:forEach items="${contact_us_list }" var="contact_us_list">
					<c:if test="${contact_us_list.user_id eq user_id }">
						<li class="list_${contact_us_list.cu_id }"><a href="./contactUsListView?val=${contact_us_list.cu_id }">${contact_us_list.cu_title}</a></li>
					</c:if>
					</c:forEach>
                </ul>
            </div>
            <div class="updown"></div>
            <div class="contentList">
            	<c:choose>
            	<c:when test="${empty val }">
            	
            	
                <div id='cl_title'>
                    <ul>
                        <li style="font-weight:bold;">제목:</li>
                        <li>[
                        	<c:forEach items="${cs_category_list }" var="cs_category_list">
                        	<c:if test="${(cs_category_list.cs_category_id eq contact_us_list[0].cs_category_id)}">
								${cs_category_list.cs_name }
							</c:if>
                        	</c:forEach>
                        ] ${contact_us_list[0].cu_title } 
                        <c:choose>
                        <c:when test="${contact_us_list[0].cu_state eq 'Y' }">
                        	(답변 완료)
                        </c:when>
                        <c:when test="${contact_us_list[0].cu_state eq 'D' }">
                        	(답변 삭제)
                        </c:when>
                        <c:otherwise>
                        	(답변 대기 중)
                        </c:otherwise>
                        </c:choose>
                        </li>
                    </ul>
                    <div><fmt:formatDate value="${contact_us_list[0].cu_date }" pattern="yy.MM.dd a hh:mm"/></div>
                </div>
                <hr style="border: 0.1px solid  #D1D1D1">
                <div id='cl_content'>
                    <ul>
                        <li style="font-weight:bold;">내용:</li>
                        <li> ${contact_us_list[0].cu_content } </li>
                    </ul>
                    <div></div>
                </div>
                <hr style="border: 0.1px solid  #D1D1D1">
                <div id='cl_comment'>
                    <ul>
                        <li style="font-weight:bold;">답변:</li>
                        <li>
                        	<c:forEach items="${contact_us_comments_list }" var="contact_us_comments_list">
                        	<c:choose>
                        	<c:when test="${(contact_us_comments_list.cu_id eq contact_us_list[0].cu_id)
                        		and (contact_us_comments_list.cuc_comment_delete eq 'N')}">
                        		${contact_us_comments_list.cuc_comment_content }
                        	</c:when>
                        	<c:otherwise>
                        		현재 답변 대기 중 상태입니다.<br>
                        		신속하게 답변을 드릴 예정이오니, 조금만 더 기다려주세요.<br>
                        		최선을 다하는 우주마켓 되겠습니다.<br>
                        		감사합니다.
                        	</c:otherwise>
                        	</c:choose>
                        	</c:forEach>
                        </li>
                    </ul>
                    <div></div>
                </div>
                
                
                </c:when>
                <c:otherwise>
                
                
                <c:forEach items="${contact_us_list }" var="contact_us_list">
               	<c:if test="${contact_us_list.cu_id eq val }">
                <div id='cl_title'>
                    <ul>
                        <li style="font-weight:bold;">제목:</li>
                        <li>[
                        	<c:forEach items="${cs_category_list }" var="cs_category_list">
                        	<c:if test="${(cs_category_list.cs_category_id eq contact_us_list.cs_category_id)}">
								${cs_category_list.cs_name }
							</c:if>
                        	</c:forEach>
                        ] ${contact_us_list.cu_title } 
                        <c:choose>
                        <c:when test="${contact_us_list.cu_state eq 'Y' }">
                        	(답변 완료)
                        </c:when>
                        <c:when test="${contact_us_list.cu_state eq 'D' }">
                        	(답변 삭제)
                        </c:when>
                        <c:otherwise>
                        	(답변 대기 중)
                        </c:otherwise>
                        </c:choose>
                        </li>
                    </ul>
                    <div><fmt:formatDate value="${contact_us_list.cu_date }" pattern="yy.MM.dd a hh:mm"/></div>
                </div>
                <hr style="border: 0.1px solid  #D1D1D1">
                <div id='cl_content'>
                    <ul>
                        <li style="font-weight:bold;">내용:</li>
                        <li> ${contact_us_list.cu_content } </li>
                    </ul>
                    <div></div>
                </div>
                <hr style="border: 0.1px solid  #D1D1D1">
                <div id='cl_comment'>
                    <ul>
                        <li style="font-weight:bold;">답변:</li>
                        <li>
                        	<c:forEach items="${contact_us_comments_list }" var="contact_us_comments_list">
                        	<c:choose>
                        	<c:when test="${(contact_us_comments_list.cu_id eq contact_us_list.cu_id)
                        		and (contact_us_comments_list.cuc_comment_delete eq 'N')}">
                        		${contact_us_comments_list.cuc_comment_content }
                        	</c:when>
                        	<c:otherwise>
                        		현재 답변 대기 중 상태입니다.<br>
                        		신속하게 답변을 드릴 예정이오니, 조금만 더 기다려주세요.<br>
                        		최선을 다하는 우주마켓 되겠습니다.<br>
                        		감사합니다.
                        	</c:otherwise>
                        	</c:choose>
                        	</c:forEach>
                        </li>
                    </ul>
                    <div></div>
                </div>
               	</c:if>
                </c:forEach>
                
                
                </c:otherwise>
				</c:choose>
            </div>
        </div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
	<script src="${pageContext.request.contextPath}/resources/customerService/js/contact_us_list_view.js"></script>
</body>
</html>