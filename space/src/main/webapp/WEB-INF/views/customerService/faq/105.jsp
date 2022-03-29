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
               		<li><span class='strong'>Q.</span> 동네생활 운영정책</li>
                   	<hr style="border: 0.1px solid  #D1D1D1">
               		<li style="line-height: 28px;">
               			<span class='strong'>A.</span><br/>
						따뜻한 동네생활 커뮤니티를 만들기 위한 약속을 지켜주세요.<br/>
						동네생활은 우리 동네 근처 이웃을 위한 공간이에요. 동네인증한 이웃만 게시글과 댓글을 남길 수 있어요.<br/>
						카테고리와 주제에 맞는 글을 작성해 주세요.<br/>
						광고/홍보, 부동산, 구인구직 등의 게시글은 동네홍보 게시판이나 비즈프로필의 소식 발행 기능을 이용해주세요.<br/>
						닉네임 등으로 간접적으로 홍보하는 게시글도 올릴 수 없어요.<br/>
						클래스 참가자/ 레슨 학생 모집글은 동네홍보 게시판을 이용해주세요. 홍보성 이벤트도 동네생활에 올릴 수 없어요. (단, 클래스/수업을 같이 들을 이웃을 모집하는 것은 가능해요.)<br/>
						우리동네 사장님이시라면, 우주마켓 내 비즈프로필 을 등록하고 사용해보세요.<br/>
						중고거래는 중고거래 게시판을 이용해 주세요.<br/>
						중고거래 금지 품목은 동네생활에도 올릴 수 없어요.<br/>
						중고거래 관련 문의 및 신고는 [나의 우주 > 자주 묻는 질문 > 고객센터에 문의하기] 에 남겨 주세요. 고객센터에 문의를 해주셔야 빠르게 문제를 해결할 수 있어요.<br/>
						<br/>
						<br/>
						생명이 있는 반려동물의 분양/교배 관련 게시글은 올릴 수 없어요.<br/>
						게시글이나 댓글로 친분을 과시하지 말아 주세요. 다른 이웃이 소외되지 않도록 배려해 주세요. (예시: 특정 이웃을 언급하며 글 작성하기, 특정 이웃만 아는 이야기나 은어로 대화하기, 반말하기)<br/>
						댓글이나 채팅에서 대화해요.<br/>
						동네 정보는 다른 이웃들도 알 수 있게 댓글에서 나눠보세요.<br/>
						개인채팅은 상대방을 배려하면서, 서로가 원할 때 시작해요.<br/>
						동네생활은 동네와 관련된 이야기나 관심사를 나누는 공간이에요. 너무 개인적인 이야기를 반복적으로 올리는 것은 지양해주세요.<br/>
						셀카(본인/타인의 사진)등 초상권 침해 우려가 있는 사진은 올릴 수 없어요.<br/>
						개인정보 게시/교환은 주의해주세요.<br/>
						연애 목적의 글은 올릴 수 없어요.<br/>
						특정 주제의 도배글, 내용 없는 글은 안 돼요.<br/>
						청소년도 함께하는 공간이기에 청소년에게 유해할 수 있는 게시글은 지양해주세요. (술, 담배 등 청소년에게 유해가 될 수 있는 요소의 내용은 미노출될 수 있어요.)<br/>
						남녀노소 다양한 이웃이 함께하는 공간이에요. 내가 작성하려는 글이 누군가에는 불편한 이야기일 수 있어요. (예시: 논란이 될 만한 글, 욕설, 과도한 비방글, 저격글, 혐오표현)<br/>
						정치, 종교 등 개인적인 신념, 가치관이 드러나 분쟁 / 논란이 될 수 있는 글은 미노출될 수 있어요. 다양한 이웃이 함께하는 공간이니 참고해주세요.<br/>
						국민 청원 관련 글들은 해당 청원의 내용과 상관없이 미노출될 수 있어요. 양해 부탁드려요.<br/>
						정치적, 종교적 목적의 캠페인 및 홍보 글은 내용과 상관없이 미노출될 수 있어요.<br/>
						업체에 대한 부정적인 후기는 미노출될 수 있어요.<br/>
						단순 후기가 아닌 비방 목적의 글이나 업체를 특정할 수 있는 부정적 후기는 미노출될 수 있어요.<br/>
						불법적인 내용 혹은 불법적인 상업 활동과 연관된 내용은 미노출 될 수 있어요.<br/>
						비속어를 사용하거나 이웃에 대한 존중이 부족한 경우 미노출될 수 있어요.<br/>
						<br/>
						<br/>
						서비스 이용제한<br/>
						위 약속을 포함하여 아래의 경우라면 정상적으로 우주마켓을 사용하는 사용자 보호를 위해 사전 안내 없이 서비스 이용이 한시적 또는 영구적으로 제한될 수 있어요. <br/>
						<br/>
						<br/>
						<br/>
						외부 관계법령을 위반한 경우<br/>
						앱 시스템 및 다른 사용자의 정상적인 앱 사용을 방해하는 활동을 한 경우<br/>
						범죄 행위(사기, 성범죄, 폭력 등) 기록이 있거나 확인되는 경우<br/>
						<br/>
						<br/>
						위 운영정책은 우주 이웃과의 즐겁고 따뜻한 공간을 만들기 위한 최소한의 장치예요. <br/>
						<br/>
						앞으로도 계속 찾게 되고, 오래 사용하고 싶은 우주마켓이 되도록 더욱 노력하겠습니다.
               		</li>
                </ul>
            </div>
        </div>
    </div>
    <jsp:include page="../../main/footer.jsp"/>
</body>
</html>