<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터-자주묻는질문</title>
<style>
	.cs_category${category_id} a {
		font-size: 18px;
		font-weight: bold;
		color: #22007F;
	}
</style>
<link href="${pageContext.request.contextPath}/resources/customerService/css/faq.css?ver=1" rel="stylesheet"/>
</head>
<body>
	<jsp:include page="../../main/header.jsp"/>
	<div id="wrapFAQ">
        <div class="customerService">
        	<img src="${pageContext.request.contextPath}/resources/images/customerService/cs_banner.png" width="1200px"/>
        </div>
        <div class="FAQ">
            <h3>자주 묻는 질문</h3>
            <div class="snb">
	            <ul>
	            	<c:forEach items="${cs_category_list }" var="cs_category_list">
						<li class='cs_category cs_category${cs_category_list.cs_category_id }'><a href="category?id=${cs_category_list.cs_category_id }">${cs_category_list.cs_name }</a></li>
					</c:forEach>
	            </ul>
            </div>
            <div class="updown"></div>
            <div class="faqList">
                <ul>
               		<li><span class='strong'>Q.</span> 신고는 어떻게 하나요?</li>
                   	<hr style="border: 0.1px solid  #D1D1D1">
               		<li style="line-height: 28px;">
               			<span class='strong'>A.</span><br/>
               			우주마켓은 이웃 분들의 다양한 신고 제보를 받아 관련 법 또는 운영정책 기준으로 신속히 대응하고 있어요.<br/>
						<br/>
						탈퇴한 사용자라도 개인정보 처리방침에 따라 부정이용 기록은 10년 동안 보관하고 있기 때문에 동일한 기준으로 신고가 처리돼요.<br/>
						<br/>
						신고 방법은 아래와 같아요.<br/>
						<br/>
						<br/>
						<br/>
						1. 게시글 신고하기<br/>
						<br/>
						<br/>
						<br/>
						게시글 신고 : 우주마켓 > 홈 탭 > 게시글 선택 > 우측 상단 더보기(...) > 신고하기 항목 선택<br/>
						<br/>
						<br/>
						2. 사용자 프로필 신고하기<br/>
						<br/>
						<br/>
						<br/>
						사용자 프로필 신고 : 우주마켓 > 홈 탭 > 우측 상단 돋보기 > 사용자 검색 > 프로필 선택 > 우측 상단 더보기(...) > 신고하기 항목 선택<br/>
						<br/>
						<br/>
						3. 채팅방/댓글/탈퇴한 사용자 신고하기<br/>
						<br/>
						<br/>
						<br/>
						채팅방 신고 : 우주마켓 > 채팅 탭 > 채팅방 선택 > 우측 상단 더보기(...) > 신고하기 항목 선택<br/>
						댓글 신고 : 우주마켓 > 동네생활 탭 > 댓글 선택 > 우측 더보기(...) > 신고하기 항목 선택<br/>
						탈퇴한 사용자 신고 : 우주마켓 > 채팅방 선택 > 채팅방 내 상대방 프로필 클릭 > 탈퇴 프로필 우측 상단 더보기(...) > 신고하기 항목 선택<br/>
						<br/>
						<br/>
						4. 메시지 신고하기<br/>
						<br/>
						메시지 신고 : 우주마켓 > 채팅 탭 > 채팅방 선택 > 채팅 메시지 길게 누르기 > 채팅 메시지 신고하기 항목 선택<br/>
						<br/>
						<br/>
						5. 기타 제보하기<br/>
						<br/>
						- 우주마켓 > 나의 우주 탭 > 자주 묻는 질문 > 하단 고객센터에 문의하기 > 계정 문의 > 제재 > 우주마켓팀에게 보내기<br/>
               		</li>
                </ul>
            </div>
        </div>
    </div>
    <jsp:include page="../../main/footer.jsp"/>
</body>
</html>