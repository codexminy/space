<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pw찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user_/css/pw.css" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrappw">
        <h3>비밀번호 찾기</h3>
        <p>비밀번호가 기억나지 않으세요? 원하시는 방법을 선택하여 비밀번호를 재설정하실 수 있습니다. <br>
            본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집 하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.</p>
        <div class="findPw">
            <div class="pw-confirm">
                <h4>비밀번호 재설정</h4>
                <div class="box-confirm">
                    <h5>비밀번호를 재설정할 아이디를 입력해주세요.</h5>
                    <div class="confirm-type">   
                        <form id="form1" name="form1" method="post" novalidate="novalidate" action="">
                            <label for="input_findpw_id">아이디</label>
                            <input type="text" id="txtUserId" name="txtUserId">
                            <button type="submit" id="submit" class="btn_find_id" title="조회"><span>조회</span></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp" />
</body>
</html>