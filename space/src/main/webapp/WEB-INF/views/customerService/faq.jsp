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
		color: #22007F;
		font-size: 18px;
		font-weight: bold;
	}
</style>
<link href="${pageContext.request.contextPath}/resources/customerService/css/faq.css" rel="stylesheet"/>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapFAQ">
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
                	<c:forEach items="${cs_category_list }" var="cs_category_list">
                	<c:choose>
                	<c:when test="${(cs_category_list.cs_category_id eq category_id) and (category_id eq 1) }">
                		<li><a href="101?id=${cs_category_list.cs_category_id }">Q. 커뮤니티 가이드라인</a></li>
                    	<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="102?id=${cs_category_list.cs_category_id }">Q. 중고거래 운영정책</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="103?id=${cs_category_list.cs_category_id }">Q. 우주마켓 지역광고 운영정책</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="104?id=${cs_category_list.cs_category_id }">Q. 신고는 어떻게 하나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="105?id=${cs_category_list.cs_category_id }">Q. 동네생활 운영정책</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                	</c:when>
                	<c:when test="${(cs_category_list.cs_category_id eq category_id) and (category_id eq 2) }">
                		<li><a href="201?id=${cs_category_list.cs_category_id }">Q. 탈퇴는 어떻게 하나요?</a></li>
                    	<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="202?id=${cs_category_list.cs_category_id }">Q. 프로필 사진과 닉네임을 변경하고 싶어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="203?id=${cs_category_list.cs_category_id }">Q. 휴대폰 번호를 변경하고 싶어요. 어떻게 변경하나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="204?id=${cs_category_list.cs_category_id }">Q. 갑자기 로그아웃 되었어요</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="205?id=${cs_category_list.cs_category_id }">Q. 계정 휴면상태가 무엇인가요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="206?id=${cs_category_list.cs_category_id }">Q. 인증번호 문자가 오지 않아요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="207?id=${cs_category_list.cs_category_id }">Q. 인증번호를 보낸 적 없는데 인증번호가 왔어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="208?id=${cs_category_list.cs_category_id }">Q. 내 계정에 등록된 휴대폰 번호가 궁금해요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="209?id=${cs_category_list.cs_category_id }">Q. 인증번호 메일이 오지 않아요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="210?id=${cs_category_list.cs_category_id }">Q. 가입한 적 없는데 계정이 있다고 나와요!</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                	</c:when>
                	<c:when test="${(cs_category_list.cs_category_id eq category_id) and (category_id eq 3) }">
                		<li><a href="301?id=${cs_category_list.cs_category_id }">Q. 중고거래 게시판 거래 및 환불 정책</a></li>
                    	<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="302?id=${cs_category_list.cs_category_id }">Q. 사진을 첨부하여 판매글을 작성하고 싶어요. 어떻게 하나요? (판매글 작성하는 방법)</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="303?id=${cs_category_list.cs_category_id }">Q. 휴대폰 번호를 변경하고 싶어요. 어떻게 변경하나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="304?id=${cs_category_list.cs_category_id }">Q. 게시글에 사진을 첨부할 수 없어요. (사진이 안 올라가요.)</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="305?id=${cs_category_list.cs_category_id }">Q. 사기를 당했을 때는 어떻게 하나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="306?id=${cs_category_list.cs_category_id }">Q. 거래 후기는 어떻게 쓰나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="307?id=${cs_category_list.cs_category_id }">Q. 판매자와 채팅은 어떻게 하나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="308?id=${cs_category_list.cs_category_id }">Q. 중고거래 매물을 검색하는 방법을 알고 싶어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="309?id=${cs_category_list.cs_category_id }">Q. 게시글은 어떻게 수정하나요? (게시글 내용과 가격 수정하는 방법)</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="310?id=${cs_category_list.cs_category_id }">Q. 게시글은 어떻게 삭제하나요? (게시글 삭제하기)</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                	</c:when>
                	<c:when test="${(cs_category_list.cs_category_id eq category_id) and (category_id eq 4) }">
                		<li><a href="401?id=${cs_category_list.cs_category_id }">Q. 판매 금지 물품</a></li>
                    	<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="402?id=${cs_category_list.cs_category_id }">Q. 직접 재배하거나 채취한 농수산물도 중고거래할 수 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="403?id=${cs_category_list.cs_category_id }">Q. 가품, 전문판매업자 글이 있는데 보기 싫어요. 어떻게 해야 하나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="404?id=${cs_category_list.cs_category_id }">Q. 형편없는 물건을 판매해요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="405?id=${cs_category_list.cs_category_id }">Q. 코로나19 자가진단 키트는 판매할 수 없어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="406?id=${cs_category_list.cs_category_id }">Q. 종량제봉투를 거래할 수 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="407?id=${cs_category_list.cs_category_id }">Q. 판매 금지 물품에 해당하는 암표매매 행위는 어떤 것이 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="408?id=${cs_category_list.cs_category_id }">Q. 반려동물, 생명이 있는 동물·곤충을 무료로 분양할 수 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="409?id=${cs_category_list.cs_category_id }">Q. 내가 운영하는 쇼핑몰 물건을 우주마켓에서 중고거래할 수 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="410?id=${cs_category_list.cs_category_id }">Q. 핸드메이드 제품을 중고거래할 수 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                	</c:when>
                	<c:when test="${(cs_category_list.cs_category_id eq category_id) and (category_id eq 5) }">
                		<li><a href="501?id=${cs_category_list.cs_category_id }">Q. 우주마켓에서 지켜야 할 매너</a></li>
                    	<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="502?id=${cs_category_list.cs_category_id }">Q. 거래 상대방이 거래 약속을 안 지켰어요! 어떻게 해야 하나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="503?id=${cs_category_list.cs_category_id }">Q. 우주마켓에서 직거래 잘하는 방법</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="504?id=${cs_category_list.cs_category_id }">Q. 코로나19 함께 예방해요</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="505?id=${cs_category_list.cs_category_id }">Q. 거래 순서는 꼭 채팅의 선착순으로 해야 하나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                	</c:when>
                	<c:when test="${(cs_category_list.cs_category_id eq category_id) and (category_id eq 6) }">
                		<li><a href="601?id=${cs_category_list.cs_category_id }">Q. 판매 금지 물품이 보여요!</a></li>
                    	<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="602?id=${cs_category_list.cs_category_id }">Q. 이용정지 된 이유가 궁금해요</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="603?id=${cs_category_list.cs_category_id }">Q. 이용정지 된 사용자와 거래해도 괜찮나요? (어떤 경우에 이용정지 되나요?)</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="604?id=${cs_category_list.cs_category_id }">Q. 차단한 사용자가 탈퇴 후 재가입하면 차단 상태가 이어지나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="605?id=${cs_category_list.cs_category_id }">Q. 불건전한 게시글이나 사용자를 발견하면 어떻게 해야하나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="606?id=${cs_category_list.cs_category_id }">Q. 중고거래 사기를 주의하세요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="607?id=${cs_category_list.cs_category_id }">Q. 비매너 사유로 경고 및 이용정지 된 이유가 궁금해요</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="608?id=${cs_category_list.cs_category_id }">Q. 거래약속 불이행 사유로 경고 및 이용정지 된 이유가 궁금해요</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="609?id=${cs_category_list.cs_category_id }">Q. 사회 통념상 용인되기 어려운 글을 발견했어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="610?id=${cs_category_list.cs_category_id }">Q. 사기 등의 이유로 이용정지된 사용자가 재가입한 뒤 우주마켓을 이용할 수 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                	</c:when>
                	<c:when test="${(cs_category_list.cs_category_id eq category_id) and (category_id eq 7) }">
                		<li><a href="701?id=${cs_category_list.cs_category_id }">Q. 동네생활 탭은 어떤 공간인가요?</a></li>
                    	<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="702?id=${cs_category_list.cs_category_id }">Q. 동네생활에서 다른 이웃과 어떻게 채팅할 수 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="703?id=${cs_category_list.cs_category_id }">Q. 내가 쓴 게시글과 댓글은 어디서 볼 수 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="704?id=${cs_category_list.cs_category_id }">Q. 동네생활 게시글/댓글을 수정/삭제하고 싶어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="705?id=${cs_category_list.cs_category_id }">Q. 동네생활에서 특정 주제를 보고 싶지 않아요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="706?id=${cs_category_list.cs_category_id }">Q. 동네생활에서 특정 사용자의 게시글/댓글을 안 볼 수 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="707?id=${cs_category_list.cs_category_id }">Q. 다채로운 이웃들의 이야기가 궁금해요</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="708?id=${cs_category_list.cs_category_id }">Q. 동네생활 게시글 개수에 제한이 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="709?id=${cs_category_list.cs_category_id }">Q. 안전한 동네생활을 위해 함께해주세요</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="710?id=${cs_category_list.cs_category_id }">Q. '해주세요'에 구인구직 내용 작성이 가능한가요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                	</c:when>
                	<c:when test="${(cs_category_list.cs_category_id eq category_id) and (category_id eq 8) }">
                		<li><a href="801?id=${cs_category_list.cs_category_id }">Q. 상대방이 내 메시지를 읽었는지 알 수 있나요?</a></li>
                    	<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="802?id=${cs_category_list.cs_category_id }">Q. 채팅방을 삭제했어요. 복구할 수 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="803?id=${cs_category_list.cs_category_id }">Q. 우주채팅 PC버전이 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="804?id=${cs_category_list.cs_category_id }">Q. 특정 채팅방을 즐겨찾기 하고 싶어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="805?id=${cs_category_list.cs_category_id }">Q. 채팅방에 이모티콘을 보내고 싶어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="806?id=${cs_category_list.cs_category_id }">Q. 채팅 내용을 다른 사람이 볼 수 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                	</c:when>
                	<c:when test="${(cs_category_list.cs_category_id eq category_id) and (category_id eq 9) }">
                		<li><a href="901?id=${cs_category_list.cs_category_id }">Q. 본인인증 문자가 오지 않아요.</a></li>
                    	<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="902?id=${cs_category_list.cs_category_id }">Q. 우주페이 본인인증 시 등록한 휴대폰 번호를 수정하고 싶어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="903?id=${cs_category_list.cs_category_id }">Q. "입력한 정보와 통신사 정보가 달라요. 가입한 통신사에 문의해주세요.” 사유로 본인인증에 실패했어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="904?id=${cs_category_list.cs_category_id }">Q. 타인명의 휴대폰을 사용하고 있어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="905?id=${cs_category_list.cs_category_id }">Q. 법인명의 휴대폰을 사용하고 있어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="906?id=${cs_category_list.cs_category_id }">Q. 개명했어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="907?id=${cs_category_list.cs_category_id }">Q. 국적 또는 주민등록번호가 바뀌었어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="908?id=${cs_category_list.cs_category_id }">Q. 본인인증 시 등록한 정보를 수정하고 싶어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="909?id=${cs_category_list.cs_category_id }">Q. “다른 휴대폰 번호로 가입된 계정이 있어요.” 사유로 본인인증에 실패했어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="910?id=${cs_category_list.cs_category_id }">Q. “기존 본인인증 정보와 불일치해요.” 사유로 본인인증에 실패했어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                	</c:when>
                	<c:when test="${(cs_category_list.cs_category_id eq category_id) and (category_id eq 10) }">
                		<li><a href="1001?id=${cs_category_list.cs_category_id }">Q. 알림은 어디서 확인하나요?</a></li>
                    	<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="1002?id=${cs_category_list.cs_category_id }">Q. 알림이 안 와요!</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="1003?id=${cs_category_list.cs_category_id }">Q. 알림을 받고 싶지 않아요. (방해금지 시간 설정하기)</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="1004?id=${cs_category_list.cs_category_id }">Q. 알림음을 변경할 수 있나요? (알림음 변경 방법)</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="1005?id=${cs_category_list.cs_category_id }">Q. 알림 목록을 모두 삭제할 수 없나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="1006?id=${cs_category_list.cs_category_id }">Q. 알림을 삭제하고 싶어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="1007?id=${cs_category_list.cs_category_id }">Q. 댓글을 삭제하고 싶어요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="1008?id=${cs_category_list.cs_category_id }">Q. 특정 사용자가 내 게시글을 못 보게 할 수 있나요?</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="1009?id=${cs_category_list.cs_category_id }">Q. 부동산 직거래 주의사항</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                		<li><a href="1010?id=${cs_category_list.cs_category_id }">Q. 우주마켓에 대해서 알려주세요.</a></li>
                		<hr style="border: 0.1px solid  #D1D1D1">
                	</c:when>
                	</c:choose>
                	</c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>