<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user_/css/id.css" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapid">
        <h3>아이디 찾기</h3>
        <p>아이디가 기억나지 않으세요? 원하시는 방법을 선택하여 아이디를 확인하실 수 있습니다. <br>
            본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집 하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.</p>
        <div class="findId">
            <div class="id-confirm">
                <h4>아이디 찾기</h4>
                <div class="box-confirm">
                    <h5>인증기관을 통해 본인인증 후 아이디 찾기를 할 수 있습니다.<br>
                    아래에서 원하시는 인증방법을 선택하여 주세요.</h5>
                    <div class="confirm-type">   
                        <div class="type1_ipin">
                            <h5>아이핀으로 찾기</h5>
                            <p>아이핀이 없으시더라도 신규 발급받아 바로 이용할 수 있습니다.</p>
                            <form id="form2" method="post" novalidate="novalidate" action="">
                                <input type="hidden" id="isUserIDI" name="isUserIDI" value="">
                                <button type="submit" title="새창" class="round gray" id="btn_find_ipin"><span>아이핀인증으로 확인</span></button>
                            </form>
                        </div>                     
                        <div class="type2_cellphone">
                            <h5>휴대폰으로 찾기</h5>
                            <p>&nbsp;</p>
                            <form id="form3" name="form3" novalidate="novalidate" action="">
                                <input type="hidden" id="isUserID" name="isUserID" value="">
                                <button type="submit" title="새창" class="round gray" id="btn_find_nice"><span>휴대폰인증으로 확인</span></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp" />
</body>
</html>