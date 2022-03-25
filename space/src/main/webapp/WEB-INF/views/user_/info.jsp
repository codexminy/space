<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입-정보입력</title>
<link href="${pageContext.request.contextPath}/resources/user_/css/info.css" rel="stylesheet"/>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="wrapinfo">
        <div class="wrap-login-logo">
            <a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/space_logo.png" width="150px" height="37.54px"></a>
        </div>
        <div class="info">
            <form action="#" method="POST" id="infopage">
                <div class="inputinfo">
                    <input type="text" name="아이디" placeholder="아이디" id="userId"><br>
                    <input type="password" name="비밀번호" placeholder="비밀번호" id="userPassword"><br>
                    <input type="password" name="비밀번호확인" placeholder="비밀번호확인" id="userPasswordcheck"><br>
                    <input type="text" name="이름" placeholder="이름" id="userName">
                    <select name="gender" id="userGender" onchange="checkGender(this.options[this.selectedIndex].text);">
                        <option value="no">성별</option>
                        <option value="man">남</option>
                        <option value="woman">여</option>
                    </select>
                    <br>
                    <select name="year" id="userYear">
                        <%for(int i=2022; i>1949; i--){ %>
                        <option value="<%=i%>"><%=i %>년</option>
                        <%} %>
                        </select>
                        <select name="month" id="userMonth">
                        <%for(int i=1; i<=12; i++){ %>
                        <option value="<%=i%>"><%=i %>월</option>
                        <%} %>
                        </select>
                        <select name="day" id="userDay">
                        <%for(int i=1; i<=31; i++){ %>
                        <option value="<%=i%>"><%=i %>일</option>
                        <%} %>
                        </select>
                    <br>
                    <input type="text" name="이메일" placeholder="이메일" id="userEmail">
                    <select name="email" id="userEmail2" onchange="checkMail(this.options[this.selectedIndex].text);">
                        <option value="no">@선택</option>
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="nate.com">nate.com</option>
                        <option value="me">직접입력</option>
                    </select>
                    <br>
                    <select name="agency" id="userAgency" onchange="checkAgency(this.options[this.selectedIndex].text);">
                        <option value="no">통신사 선택</option>
                        <option value="SKT">SKT</option>
                        <option value="KT">KT</option>
                        <option value="LG">U+</option>  
                    </select>
                    <input type="text" name="전화" placeholder="휴대전화" id="userPhone">
                    <br>
                    <input type="text" name="인증번호" placeholder="인증번호" id="userNumber">
                    <button type="submit" class="number" name="인증번호">인증번호 확인</button>
                    <input type="text" name="주소" placeholder="주소" id="userAddress">
                    <input type="text" name="주소" id="userPostcode">
                    <button type="submit" class="address" name="주소">우편번호 검색</button>
                    <button type="submit" class="join" name="가입">가입하기</button>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>