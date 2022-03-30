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
               		<li><span class='strong'>Q.</span> 우주마켓 지역광고 운영정책</li>
                   	<hr style="border: 0.1px solid  #D1D1D1">
               		<li style="line-height: 28px;">
               			<span class='strong'>A.</span><br/>
               			광고 게재제한<br/>
						<br/>
						<br/>
						지역광고가 다음의 각 항목 중 어느 하나에 해당할 경우, 해당 지역광고의 심사 미승인 또는 게재를 제한할 수 있습니다.<br/>
						<br/>
						1. 광고 미승인 및 게재제한 사유<br/>
						<br/>
						① 회사에 법률적 또는 재산적 위험을 발생시키거나 발생시킬 우려가 있는 경우<br/>
						<br/>
						* 지역광고가 관련 법령을 위반하는 상점, 상품 또는 서비스를 홍보함으로써 회사가 민.형사적 책임을 부담할 가능성이 있는 경우<br/>
						<br/>
						* 지역광고가 관련 법령을 위반하는 회원의 영업행위 등에 연계됨으로써 회사가 민.형사적 책임을 부담할 가능성이 있는 경우<br/>
						<br/>
						[대표적 사례들]<br/>
						<br/>
						- 흥신소/심부름센터 업소 내에서 개인사생활 조사 등의 서비스 제공 확인시 광고게재제한<br/>
						<br/>
						- 출장 안마/마사지 서비스 제공 확인시 광고게재제한 (성매매 연계 개연성)<br/>
						<br/>
						- 의료기관이 아닌데 문신/반영구 시술 서비스 제공이 확인되는 경우 광고게재제한<br/>
						<br/>
						 <br/>
						<br/>
						② 회사 및 광고매체의 명예ㆍ평판ㆍ신용이나 신뢰도를 훼손하거나 훼손할 우려가 있는 경우<br/>
						<br/>
						* 지역광고가 관련 법령을 위반하지는 않더라도 도의적으로 비난의 대상이 되거나 사회 일반의 정서에 반하는 회원의 영업행위에 연계됨으로써 회사의 명예.평판.신용.신뢰도가 훼손될 가능성이 있는 경우<br/>
						<br/>
						 [대표적 사례들]<br/>
						<br/>
						- 단란주점, 토킹바 같은 유흥업소 광고나 유흥업소 직업정보 제공 광고로 확인시 광고게재제한<br/>
						<br/>
						- 애인대행 서비스 제공 확인시 광고게재제한<br/>
						<br/>
						- 흥신소 및 심부름센터 광고의 광고게재 제한<br/>
						<br/>
						- 대출 또는 사채 광고의 광고게재 제한<br/>
						<br/>
						- 다단계 업체의 구인광고 광고게재 제한<br/>
						<br/>
						<br/>
						<br/>
						③ 서비스 또는 광고매체의 품질을 저하시키거나 저하시킬 우려가 있는 경우<br/>
						<br/>
						* 광고 품질이 현저히 떨어지는 경우<br/>
						<br/>
						[대표적 사례들]<br/>
						<br/>
						- 첫번째 이미지에 텍스트가 20% 이상 포함(예: 전단지)<br/>
						<br/>
						- 업소나 상품 및 서비스의 내용을 충분히 설명하지 못함<br/>
						<br/>
						- 해상도나 촛점이 안 맞는 등 이미지 퀄러티가 낮음<br/>
						<br/>
						- 무성의한 광고<br/>
						<br/>
						- 기타 광고 품질이 떨어지는 광고들<br/>
						<br/>
						 <br/>
						<br/>
						* 지역광고라고 보기에 관련성이 지나치게 떨어지는 상품이나 서비스에 연계됨으로써 지역광고 서비스의 품질을 떨어뜨릴 가능성이 있는 경우<br/>
						<br/>
						[대표적 사례들]<br/>
						<br/>
						- 지역과 상관 없는 인터넷 쇼핑몰 광고<br/>
						<br/>
						- 지역과 상관 없는 보험/대출 광고 등<br/>
						<br/>
						- 지역과 상관 없는 제품판매 광고 등<br/>
						<br/>
						 <br/>
						<br/>
						④ 동일한 내용의 광고글을 반복해서 올리는 경우<br/>
						<br/>
						 <br/>
						<br/>
						⑤ 지역광고의 효과가 현저히 떨어지는 경우<br/>
						<br/>
						* 지역광고가 광고매체에서 노출되기는 하나 광고매체 이용자의 클릭율이 지나치게 낮은 경우<br/>
						<br/>
						 <br/>
						<br/>
						⑥ 광고매체의 운영 주체가 정당하고 합리적인 이유를 근거로 자신의 광고매체에서의 지역광고 게재 제한 등을 요청하는 경우 <br/>
						<br/>
						<br/>
						<br/>
						⑦ 정치적, 종교적 목적의 캠페인 및 홍보 게시글<br/>
						<br/>
						 <br/>
						<br/>
						<br/>
						<br/>
						2. 광고 심사 미승인 및 게재제한 절차<br/>
						<br/>
						① 회사는 광고매체의 요청에 의해 일정한 지역광고의 미승인 또는 게재 제한 등을 하는 경우 회원에게 약관 제11조에 따른 방법으로 통지합니다.<br/>
						<br/>
						② 광고매체의 요청에 의해 일정한 지역광고의 게재 제한을 하는 경우 원칙적으로 지역광고 게재 제한 등의 조치를 취하기 전에 회원에게 통지하며, 다만 광고매체가 긴급한 사정을 이유로 시급히 요청해 왔을 경우에는 부득이 게재 제한 등의 조치를 취한 후에 회원에게 통지할 수 있습니다.<br/>
						<br/>
						 <br/>
						<br/>
						 <br/>
						<br/>
						이용제한<br/>
						 <br/>
						<br/>
						1. 이용제한 조치<br/>
						<br/>
						① 회사는 회원이 관련 법령 및 약관 또는 광고운영정책에 따른 의무를 위반하는 경우 지역광고 게재 신청 제한, 지역광고 게재 제한, 지역광고 서비스 이용 정지, 지역광고 이용계약 해지 등을 할 수 있습니다.<br/>
						<br/>
						 <br/>
						<br/>
						1) 지역광고 게재 제한 (광고에 대한 제한)<br/>
						<br/>
						광고 제목 및  내용 등이 법령, 약관, 광고운영정책 및 검수기준에 부합하지 않는 광고에 대한 노출제한 조치를 의미함<br/>
						<br/>
						[대표적 사례들]<br/>
						<br/>
						- 광고 제목 및 내용 등이 법령 등에 위배되거나 제3자 권리를 침해하는 경우<br/>
						<br/>
						- 광고 썸네일 또는 제목과 광고 상세게시물 내용 간의 연관성이 적은 경우<br/>
						<br/>
						- 광고 제목 및 내용 상에 특수문자 기재 및 글자수 제한 초과하는 경우<br/>
						<br/>
						 <br/>
						<br/>
						2) 지역광고 게재 신청 제한 (업소에 대한 제한)<br/>
						<br/>
						광고를 불허하는 업종임이 확인되거나 해당 업소/상품/서비스가 약관, 광고운영정책, 검수기준 및 관련 법령에 부합하지 않는 경우, 해당 광고에 대한 광고제한조치를 의미함<br/>
						<br/>
						 <br/>
						<br/>
						[대표적 사례들]<br/>
						<br/>
						- 업소/상품/서비스 내용이나 운영 등이 법령 등에 위배되거나 제3자의 권리를 침해하는 경우<br/>
						<br/>
						예) 불법 사행행위 관련 업소 , 최음제판매 업소, 성매매 알선 업소, 자위기구 판매(연계) 업소, 사기행위 관련 업소 등 해당 업소가 약관(운영정책 및 검수 기준 포함) 위반 또는 불법적 업소임이 확인된 경우 1회 적발 시 즉시 광고제한조치를 취함 (서비스 이용정지 조치 병행)<br/>
						<br/>
						예) 기타 법령위반 및 제3자침해 내용을 포함하는 경우<br/>
						<br/>
						- 불법 업소는 아니나 약관, 광고운영정책 및 검수기준을 반복적으로 위반하는 업소의 경우<br/>
						<br/>
						 <br/>
						<br/>
						3) 지역광고 서비스 이용정지 (회원계정에 대한 제한)<br/>
						<br/>
						중대한 법령 위반 사실이 확인되거나 약관, 광고운영정책 및 검수기준의 위반이 지속적으로 확인되는 경우 등 일정 기간 서비스 이용을 제한해야 하는 경우의 서비스 이용정지조치를 의미함<br/>
						<br/>
						[대표적 사례들]<br/>
						<br/>
						- 어뷰징 행위에 대한 경고를 일정 수 이상 받은 경우<br/>
						<br/>
						예) 3회의 경고를 받은 경우 7일의 이용정지조치가 취해지며, 그 이후 추가로 적발되는 경우 1개월의 이용정지조치가 취해짐<br/>
						<br/>
						- 회원의 광고행위에서 중대한 법령 위반 사실이 확인되는 경우<br/>
						<br/>
						예) 불법 사행행위 관련 업소, 최음제판매 업소, 성매매 알선 업소, 자위기구 판매(연계) 업소, 사기행위 관련 업소 등 회원의 업소가 불법적 업소임이 확인된 경우(업소 제한 조치 병행)<br/>
						<br/>
						- 회원이 허위정보를 기재하였거나 휴폐업자로 확인되는 경우<br/>
						<br/>
						- 업소에 대한 광고제한조치를 받은 회원이 반복하여(추가로) 업소 광고제한조치를 받은 경우<br/>
						<br/>
						 <br/>
						<br/>
						4) 지역광고 이용계약 해지 및 회원 직권해지<br/>
						<br/>
						회원의 행위가 법령과 약관 및 운영정책의 심각한 위반 등에 해당하여 객관적으로 회사와 회원 사이의 신뢰관계의 회복이 어려운 정도의 현저한 것일 경우, 회사는 지역광고 이용계약을 해지하고 회원 지위를 박탈하는 행위를 할 수 있음<br/>
						<br/>
						[대표적 사례들]<br/>
						<br/>
						- 회원이 회사의 서비스를 방해하는 어뷰징 프로그램 등을 배포하는 경우<br/>
						<br/>
						- 어뷰징 행위를 반복적, 지속적으로 하는 경우<br/>
						<br/>
						 <br/>
						<br/>
						② 회사가 이용제한을 하는 경우 회원이 회사와 이용계약을 체결하여 이용하고 계시는 회사의 다른 서비스 (마켓 앱)에 대하여도 이용을 제한하거나, 이용계약을 해지할 수 있습니다.<br/>
						<br/>
						 <br/>
						<br/>
						 <br/>
						<br/>
						2. 이용제한 절차<br/>
						<br/>
						① 회사는 이용제한을 하는 경우 회원에게 약관 제11조에 따른 방법으로 통지합니다.<br/>
						<br/>
						② 회사는 전항의 통지를 하는 경우 회원에게 원칙적으로 3 영업일 이상의 기간을 정하여 이의신청의 기회를 부여 하며, 다만 별도의 사전 이의신청 기회를 부여하지 않겠다는 뜻을 약관 제11조에 따른 방법으로 통지하였거나 회원의 관련 법령, 약관, 광고운영정책 등 위반행위가 중대하거나 고의적이라고 판단될 경우에는 이의신청 기회를 부여하지 않을 수 있습니다.<br/>
						<br/>
						③ 회사는 기간제 또는 종량제 지역광고에 대해 이용제한을 하는 경우 상품 성격에 따라 남은 계약기간 또는 종량 만큼의 서비스 이용료를 환급해 드립니다.<br/>
						<br/>
						④ 이용제한 조치에 대하여 궁금한 점이나 이의가 있으신 회원은 마켓 지역광고 고객센터(1644-9736) 또는 광고영업 담당자를 통하여 해당 내용을 문의하시거나 이의를 제기하실 수 있습니다.<br/>
						<br/>
						⑤ 이용제한 조치와 관련된 회원의 문의 및 이의가 접수될 경우, 회사는 해당 내용을 검토하고 처리하며 약관 제11조의 방법에 따라 회원에게 그 결과를 통지합니다. <br/>
						<br/>
						⑥ 이용제한 사유를 확인하고 해소한 회원은 마켓 지역광고 고객센터(1644-9736) 또는 광고영업 담당자를 통해 이용제한 철회 요청을 하실 수 있으며, 회사는 해당 이용제한의 철회 여부를 검토하고 처리하며 약관 제11조의 방법에 따라 광고주님께 그 결과를 통지합니다.<br/>
						<br/>
						 <br/>
						<br/>
						광고문안과 권리보호<br/>
						 <br/>
						<br/>
						1. 광고문안과 업소/상품/서비스의 연관성<br/>
						<br/>
						① 제목, 설명 등에는 해당 업소/상품/서비스 내에서 확인되는 내용을 기재하는 것을 원칙으로 합니다.<br/>
						<br/>
						② 제목에 기재된 광고주명, 업소/상품/서비스명, 수식어나 설명 등에 기재된 표현 등은 업소/상품/서비스 조회 결과 확인되는 한 원칙적으로 게재를 허용하며, 마켓 지역 광고는 해당 회원에게 사용권한이 있는지에 대해 사전에 심사하지 않습니다.<br/>
						<br/>
						③ 제목에 기재된 광고주명, 업소/상품/서비스명, 수식어나 설명 등에 기재된 표현 등이 업소/상품/서비스 조회 결과 확인되지 않을 경우 해당 광고의 게재를 중단할 수 있습니다.<br/>
						<br/>
						 <br/>
						<br/>
						2. 상표권/서비스표권의 보호<br/>
						<br/>
						① 회사는 상표권/서비스표권의 존재 여부 및 효력범위에 관하여 임의로 판단하지 않으며, 아울러 상표권/서비스표권을 사전에 보호하거나 대신 행사하지 않습니다.<br/>
						<br/>
						② 상표권/서비스표권을 보유한 자는 자신의 권리가 침해되었을 경우 먼저 침해한 자를 상대로 광고게재 중지요청, 권리침해에 해당하는 기재의 삭제요청 등의 권리행사를 해야 합니다.<br/>
						<br/>
						③ 회사는 자신의 상표권/서비스표권이 침해되었음을 주장하면서 일정한 광고의 게재중단을 요청해 오는 경우, 해당 요청인에게 상표권/서비스표권의 침해를 소명할 수 있는 서류 등의 제출을 요청할 수 있습니다.<br/>
						<br/>
						④ 회사는 요청인이 자신의 상표권/서비스표권의 침해를 소명하였을 경우, 요청인이 자신의 권리를 침해하고 있다고 지적한 회원에게 해당 광고의 게재 또는 해당 기재가 적법한 권리 또는 권한에 의해 행해졌다는 것을 소명할 수 있는 서류 등의 제출을 요청할 수 있습니다.<br/>
						<br/>
						⑤ 회사는 요청인의 권리를 침해하고 있다고 지적된 회원이 해당 광고의 게재 또는 해당 기재가 적법한 권리 또는 권한에 의해 행하여진 것임을 소명하지 못했을 경우 해당 광고의 게재를 중단할 수 있으며, 만약 소명하였을 경우라면 임의로 해당 광고의 게재를 중단하는 대신 지체 없이 요청인에게 이러한 사정을 통지할 것입니다.<br/>
						<br/>
						⑥ 회사는 특정 광고나 광고의 대상이 되는 영업이 타인의 상표권/서비스표권을 침해하거나 침해할 우려가 있다는 법원의 판결/결정/명령문, 기타 관련 국가기관의 유권해석 등이 제출되는 경우, 지체 없이 해당 광고의 게재를 중단할 수 있습니다.<br/>
						<br/>
						 <br/>
						<br/>
						3. 기타 권리의 보호<br/>
						<br/>
						① 회사는 광고 게재와 관련하여 상표권/서비스표권 이외의 권리에 대한 침해가 문제되는 경우에도 상표권/서비스표권에 대한 보호기준을 준용합니다.<br/>
						<br/>
						 <br/>
						<br/>
						4. 부정경쟁행위의 금지<br/>
						<br/>
						① 회사는 『부정경쟁방지 및 영업비밀의 보호에 관한 법률』 상의 “부정경쟁행위”의 존재 여부 및 그 범위에 관하여 임의로 판단하지 않으며, 아울러 “부정경쟁행위”로부터 회원 등을 사전에 보호하거나 동 행위의 중단을 요청하지 않습니다.<br/>
						<br/>
						② 회사는 일정한 회원의 광고 게재 등이 “부정경쟁행위”에 해당한다는 법원의 판결문, 기타 관련 국가기관의 유권해석 등이 제출되는 경우 지체 없이 해당 광고의 게재를 중단할 수 있습니다.
               		</li>
                </ul>
            </div>
        </div>
    </div>
    <jsp:include page="../../main/footer.jsp"/>
</body>
</html>