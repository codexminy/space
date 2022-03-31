<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입-정보입력</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link href="${pageContext.request.contextPath}/resources/user_/css/info.css" rel="stylesheet"/>
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
	<div id="wrapinfo">
        <div class="wrap-login-logo">
            <a href="#"><img src="${pageContext.request.contextPath}/resources/images/main/space_logo.png" width="150px" height="37.54px"></a>
        </div>
        <div class="info">
            <form action="./joinFinish" method="POST" id="infopage">
                <div class="inputinfo">
                    <input type="text" name="login_id" placeholder="아이디" id="userId" required>
                    <input type="button" id="chkId" value="중복확인" /><br>
                    <input type="text" name="user_nickname" placeholder="닉네임" id="userNickName" required>
                    <input type="button" id="chkNickName" value="중복확인" /><br>
                    <input type="password" name="user_password" placeholder="비밀번호" id="userPassword" required><br>
                    <input type="password" name="비밀번호확인" placeholder="비밀번호확인" id="userPasswordcheck" required><br>
                    <input type="text" name="user_name" placeholder="이름" id="userName" required>
                    <select name="user_gender" id="userGender" onchange="checkGender(this.options[this.selectedIndex].text);" >
                        <option value="no">성별</option>
                        <option value="M">남</option>
                        <option value="F">여</option>
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
                        <input type="hidden" name="user_birth" id="userBirth"/>
                    <br>
                    <input type="text" name="이메일" placeholder="이메일" id="userEmail" required>
                    <select name="email" id="userEmail2" onchange="checkMail(this.options[this.selectedIndex].text);">
                        <option value="no">@선택</option>
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="nate.com">nate.com</option>
                        <option value="me">직접입력</option>
                    </select>
                    <input type="hidden" name="user_email" id="email"/>
                    <br>
                    <select name="agency" id="userAgency" onchange="checkAgency(this.options[this.selectedIndex].text);">
                        <option value="no">통신사 선택</option>
                        <option value="SKT">SKT</option>
                        <option value="KT">KT</option>
                        <option value="LG">U+</option>  
                    </select>
                    <input type="text" name="user_phone" placeholder="휴대전화" id="userPhone" >
                    <input type="button" id="sendNum" value="인증번호 받기" />
                    <br>
                    <input type="text" name="인증번호" placeholder="인증번호" id="userNumber">
                    <input type="button" class="number" name="인증번호" id="chkNum" value="인증번호 확인">
                    <input type="text" name="주소" placeholder="주소" id="userAddress" readonly="readonly">
                    <input type="text" name="주소" id="userPostcode" readonly="readonly">
                    <input type="button" class="address"  value="우편번호 검색" id="searchAdress">
                    <input type="hidden" name="user_address" id="user_address"/>
                    <input type="button" class="join" name="가입" value="가입하기" id="joinBtn" >
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="../main/footerJoin.jsp"></jsp:include>
</body>
<script type="text/javascript">
var chkId = document.getElementById("chkId");
const chkIdPut = new XMLHttpRequest();
chkIdPut.responseType = 'text';
const id = document.getElementById("userId");
var click = 0; //중복체크

/*아이디*/
id.addEventListener('click', (e) => {
	id.value = "";
	id.style.marginTop = '40px';
	const div = document.getElementsByClassName("userId_div");
	for(var i = 0; i < div.length; ++i){
		if(div[i] != null){
			div[i].remove();
		}
	}
});

chkIdPut.addEventListener('readystatechange', (e) => {
	const readyState = e.target.readyState;
	const status = e.target.status;

	
	if (status == 200 && readyState == 4){
		const putResult = e.target.responseText.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");

		//사용불가능한 아이디
		if(putResult == 0){
			
			const inputinfo = document.getElementsByClassName("inputinfo");
			var span = document.createElement("div");
			span.setAttribute("class", "userId_div");
			span.innerText= "사용이 불가한 아이디입니다.";
			span.style.color = "red";
			inputinfo[0].prepend(span);
			//info.appendChild(span);
			id.style.marginTop = '10px';
			click = 0;
		} else if(putResult == 1){
			
			const inputinfo = document.getElementsByClassName("inputinfo");
			var span = document.createElement("div");
			span.setAttribute("class", "userId_div");
			span.style.color = "green";
			span.innerText= "사용이 가능한 아이디입니다.";
			inputinfo[0].prepend(span);
			id.style.marginTop = '10px';
			click = 1;
		}
	} 
});

chkId.addEventListener('click', (e) => {
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	
	const div = document.getElementsByClassName("userId_div");
	for(var i = 0; i < div.length; ++i){
		if(div[i] != null){
			div[i].remove();
		}
	}
	
	if(regEmail.test(id.value) === true){
		const idPut = {id : id.value};

		chkIdPut.open('PUT', `${pageContext.request.contextPath}/user_/info`);
		chkIdPut.setRequestHeader('content-type', 'application/json');
		chkIdPut.send(JSON.stringify(idPut));
	}else {

		alert("이메일 형식에 맞지 않습니다.");
	}
});

/*닉네임*/
 var userNickName = document.getElementById("userNickName");
 var chkNickName = document.getElementById("chkNickName");
 const chkNick = new XMLHttpRequest();
 var click3 = 0;
 chkNick.addEventListener('readystatechange', (e) => {
	 const readyState = e.target.readyState;
	 const status = e.target.status;
	 var resultName = e.target.responseText.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");

		if (status == 200 && readyState == 4){
			if(resultName == 0){
				alert("사용이 가능한 닉네임 입니다.");
				click3 = 3;
			}else{
				alert("사용이 불가능한 닉네임 입니다.");
				click3 = 0;
			}
		}
 });
 chkNickName.addEventListener('click', (e) => {
	 
	const nickname = {nickname : userNickName.value};
	
	chkNick.open('POST', `${pageContext.request.contextPath}/user_/nickname`);
	chkNick.setRequestHeader('content-type', 'application/json');
	chkNick.send(JSON.stringify(nickname));
	 
 });



/*비밀번호*/
 
 var pwd = document.getElementById("userPassword");
 var pwdChk = document.getElementById("userPasswordcheck");
 
 pwd.addEventListener("change", (e) => {
	 const img = document.createElement("img");
	 img.setAttribute("src", `${pageContext.request.contextPath}/resources/images/emoji/greencheck.png`);
	 img.setAttribute("id", "greenchk");
	 img.style.marginTop = '9px';
	 /* img.style.left = "1080px"; */
	 pwd.style.width = '387px';
	 pwd.style.marginRight = '20px';
	 pwd.after(img);
 });
 
 pwdChk.addEventListener("change", (e) => {
	
	 if(pwdChk.value == pwd.value){
		 const img = document.createElement("img");
		 const redchk = document.getElementById("redchk");
		 img.style.marginTop = '9px';
		 pwdChk.style.width = '387px';
		 pwdChk.style.marginRight = '20px';
		 if(redchk != null){
			 redchk.remove();
		 }
		 img.setAttribute("src", `${pageContext.request.contextPath}/resources/images/emoji/greencheck.png`);
		 img.setAttribute("id", "greenchk2");
		 /* img.style.left = "1080px"; */
		 pwdChk.after(img);
		 
	 }else {
		 const img = document.createElement("img");
		 const redchk = document.getElementById("redchk");
		 const greenchk2 = document.getElementById("greenchk2");
		 img.style.marginTop = '9px';
		 pwdChk.style.width = '387px';
		 pwdChk.style.marginRight = '20px';
		 if(redchk == null){
			 if(greenchk2 != null){
				 greenchk2.remove();
			 }
			 img.setAttribute("src", `${pageContext.request.contextPath}/resources/images/emoji/redcheck.png`);
			 img.setAttribute("id", "redchk");
			 img.style.left = "1080px";
			 pwdChk.after(img);
		 }
	 }
	 
 });

/*인증번호보내기*/
var sendNum = document.getElementById("sendNum");

const sendSms = new XMLHttpRequest();
var randomNum = 0;
sendSms.addEventListener('readystatechange', (e) => {
	const readyState = e.target.readyState;
	const status = e.target.status;
	
	if (status == 200 && readyState == 4){
		console.log("성공");
		const randomString = e.target.responseText;
		randomNum = parseInt(randomString);
		console.log(randomNum);
		
	}else if(status != 200 && status != 0){
		console.log(readyState + "-" + status);
		alert("인증번호 발송에 실패하였습니다. 다시 시도해주세요");
	}else {
		console.log(readyState + "-" + status);
	}
});

sendNum.addEventListener('click', (e) => {
		var userAgency = document.getElementById("userAgency");
		var userPhone = document.getElementById("userPhone");
		var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		 
		const request = {recipientPhoneNumber : userPhone.value , title : '사용자번호전송', content : ''};
		
		if(userAgency.value == "no" || userAgency.value == ""){
			alert("통신사를 선택해주세요");
		}else if(userPhone.value == "" || userPhone.value == null){
			alert("번호를 입력해주세요");
		}else{
			if(regPhone.test(userPhone.value) === true){
				sendSms.open('POST', `${pageContext.request.contextPath}/msg/sms`);
				sendSms.setRequestHeader('content-type', 'application/json');
				sendSms.send(JSON.stringify(request));
			}else {
				alert("핸드폰 번호 형식에 맞지 않습니다.");
			}
		}
	
});

/*확인하기*/
 const chkNum = document.getElementById("chkNum");
 const userNumber = document.getElementById("userNumber");
 var click2 = 0;
 chkNum.addEventListener('click', (e) => {
	 
	 if(randomNum != 0){
		 if(userNumber.value == randomNum){
			 alert("인증이 완료되었습니다.");
			 userNumber.setAttribute("readonly", "readonly");
			 sendNum.setAttribute("disabled", "disabled");
			 click2 = 2;
		 }else {
			 alert("인증번호가 틀렸습니다.");
		 }
	 }else {
		 alert("인증번호를 다시 받아주세요.");
	 }
	 
 });


/*지도*/
 var userAddress = document.getElementById("userAddress");
 var userPostcode = document.getElementById("userPostcode");
 var searchAdress = document.getElementById("searchAdress");
 var user_address = document.getElementById("user_address");

 searchAdress.addEventListener('click', (e) => {
	 new daum.Postcode({
       oncomplete: function(data) {
          
       console.log(data);
	 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
     // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
     var roadAddr = data.roadAddress; // 도로명 주소 변수
     var jibunAddr = data.jibunAddress; // 지번 주소 변수
     // 우편번호와 주소 정보를 해당 필드에 넣는다.
     userPostcode.value = data.zonecode;
     if(roadAddr !== ''){
         userAddress.value = roadAddr;
         user_address.value = roadAddr;
     } 
     else if(jibunAddr !== ''){
         userAddress.value = jibunAddr;
         user_address.value = jibunAddr;
     }
 }
}).open();
 });
 

 userAddress.addEventListener('click', (e) => {
	 searchAdress.click();
 });
 
 /*가입하기*/
 const joinBtn = document.getElementById("joinBtn");
joinBtn.addEventListener('click', (e) => {
	//성별
	var userGender = document.getElementById("userGender");
	//출생년도
	var userYear = document.getElementById("userYear");
	var userDay = document.getElementById("userDay");
	var userMonth = document.getElementById("userMonth");
	var userBirth = document.getElementById("userBirth");
	userBirth.value = userYear.value + "-" + userMonth.value + "-" + userDay.value;
	console.log(userBirth.value);
	//이메일
	var userEmail = document.getElementById("userEmail");
	var userEmail2 = document.getElementById("userEmail2");
	var email = document.getElementById("email");
	
	if(userEmail2.value == "me"){
		email.value = userEmail.value + userEmail2.value;
	}else {
		email.value = userEmail.value +"@"+userEmail2.value;
	}
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	console.log(email.value);
	var infopage = document.getElementById("infopage");
	if(click != 1){
		alert("아이디 중복체크 해주세요.");
	}else if(pwd.value != pwdChk.value){
		alert("비밀번호를 확인해주세요.");
	}else if(click2 != 2){
		alert("핸드폰 인증을 해주세요.");
	}else if(userAddress.value == null || userPostcode.value == null){
		alert("주소를 입력해주세요.");
	}else if(userGender.value == "no"){
		alert("성별을 선택해주세요.");
	}else if(regEmail.test(email.value) === false){
		alert("이메일 형식을 확인해주세요");
	}else if(click3 != 3){
		alert("닉네임 중복체크 해주세요");
	}else {
		infopage.submit();
	}
});
</script>
</html>