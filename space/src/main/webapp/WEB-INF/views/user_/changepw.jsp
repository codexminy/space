<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user_/css/changepw.css" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrappw">
        <h3>비밀번호 변경 안내</h3>
        <p>영문, 숫자, 특수문자를 조합해 8~20자로 설정해주세요 <br>
            개인정보 관련 숫자, 연속된 숫자와 같이 쉬운 비밀번호 사용은 유의해주세요.</p>
        <div class="findPw">
            <div class="pw-confirm">
                <div class="box-confirm">
                    <div class="confirm-type">   
                        <form id="form1" name="form1" method="post" novalidate="novalidate" action="">
                            <label for="findpw" id="new-pw">새 비밀번호</label>
                            <input type="text" placeholder="비밀번호를 입력해주세요" > <br>
                            <label for="findpw" id="new-pwchk">새 비밀번호 확인</label>
                            <input type="text" placeholder="비밀번호를 입력해주세요" >
                        </form>
                        <p>비밀번호를 변경하면, 모든 기기/ 브라우저에서 다시 로그인후에 사용할 수 있습니다.</p>
                        <button type="submit" id="btn_pw">비밀번호 변경</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp" />
</body>
</html>