<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user_/css/findpw.css" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrappw">
        <h3>비밀번호 찾기</h3>
        <p>등록하신 개인정보로 인증코드가 발송됩니다. <br>
            개인 메일 주소와 휴대폰 번호가 등록되어 있지 않을 경우, 메일 관리자에게 문의주세요.</p>
        <div class="findPw">
            <div class="pw-confirm">
                <div class="box-confirm">
                    <div class="confirm-type">   
                        <form id="form1" name="form1" method="post" novalidate="novalidate" action="">
                            <label for="findpw" id="confirm-method">인증수단</label>
                            <input type="radio" value="개인메일" id="mail" checked>개인메일 주소로 찾기(a*********@n****.com)
                            <button type="submit" id="submit" class="btn_find_id" title="조회"><span>인증코드 확인</span></button> <br>
                            <input type="radio" value="휴대폰번호" id="phone">휴대폰 번호로 찾기(010-1***-1***)
                            <label for="findpw" id="confirm-code">인증코드</label>
                            <input type="text" value="" id="code">
                        </form>
                        <button type="submit" id="btn_confirm">인증하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp" />
</body>
</html>