<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 1:1문의</title>
<link href="${pageContext.request.contextPath}/resources/customerService/css/contentList.css" rel="stylesheet"/>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapContentList">
        <div class="customerService">
            <h3>고객센터</h3>
            <p>무엇을 도와드릴까요?</p>
            <div class="cs-search">
                <input class="search-bar-input" type="search">  
                <i class="fas fa-search"></i>
            </div>
        </div>
        <div class="client">
            <h3>1:1 문의하기</h3>
            <div class="snb">
                <ul>
                    <li style="color: #22007F; font-weight: 700;"><a href="#">개인 식품 판매 관련 문의</a></li>
                    <li><a href="#">핸드폰 번호 재인증</a></li>
                    <li><a href="#">사진 첨부가 안 돼요ㅠ</a></li>   
                </ul>
            </div>
            <div class="updown"></div>
            <div class="contentList">
                <table>
                    <tr>
                        <td>제목 | </td>
                        <td>[구매 / 판매] 개인 식품 판매 관련 문의 (답변완료)</td>
                        <td style="padding-left:300px;">2022년 03월 16일 17:20</td>
                    </tr>
                </table>
                <hr style="border: 0.1px solid  #D1D1D1">
                <table>
                    <tr>
                        <td>내용 | </td>
                        <td>혹시 코스트코 같은 곳에서 산 대용량 식품 파는것도 안 되는건가요?? <br>
                            버터 산거 소분해서 반절만 팔고싶은데<br>
                            시중 상품 판매하는건 괜찮은지 궁금해요~!</td>
                    </tr>
                </table>
                <hr style="border: 0.1px solid  #D1D1D1">
                <table>
                    <tr>
                        <td>답변 | </td>
                        <td>
		                	안녕하세요. 우주장터 고객만족센터 상담사 이서광 입니다. <br>
		
		                    시중 식품 소분하거나 판매하는 것에 대하여 문의를 주셨는데요.<br>
		                    해당 사항은 영업신고를 한 사업자에 한해서만 가능하기 때문에 우주장터 내에서 개인이 판매하는것은 금지되어있습니다.<br>
		                    일반인이 식품을 판매하는 것은 '건강기능식품에 관한 법률' 위반이므로 <br>
		                    사업자가 아니시라면 판매하실 수 없으며, 또한 커뮤니티에서 공동구매 형태의 게시글 또한 허용되지 않습니다.<br>
		                    
		                    자세한 '판매 금지 품목' 을 알고싶으시다면<br>
		                    [TIP] 중고거래 불가능한 품목 안내 (2022/03/11) 혹은 자주 묻는 질문 > 거래 품목을 확인해주세요!<br>
		                    
		                    답변이 도움이 되셨나요?<br>
		                    더 궁금한 점이 있으시다면 언제든지 1:1 문의하기를 이용해주세요.<br>
		                    감사합니다.
                        </td>
                    </tr>
                </table>       
            </div>
        </div>
        <jsp:include page="../main/footer.jsp"/>
</body>
</html>