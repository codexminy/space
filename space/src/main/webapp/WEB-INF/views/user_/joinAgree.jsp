<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 약관</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user_/css/joinAgree.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user_/js/joinAgree.js"></script>
</head>
<body>
<div id="wrapjoinAgree">
	<div class="wrap-login-logo">
	    <a href="${pageContext.request.contextPath}/main/space"><img src="${pageContext.request.contextPath}/resources/images/main/space_logo.png" width="150px" height="37.54px"></a>
	</div>
	<div class="joinAgree-box">
	    <p class="joinAgree-text">우리 주위의 장터 : 우주장터 <br>
	    회원가입을 위한 서비스 약관에 동의해 주세요.</p>
	    <form action="./info" method="POST" id="join-agreement"> 
	        <ul class="join-box">
	            <div class="join-top">
	                <li class="checkAllBtn">
	                    <input type="checkbox" name="selectall" value='selectall' id="selectall" onclick='javascript:selectAll(this)'>
	                    <label for="selectall">모두 동의합니다.</label>
	                </li>
	                <p class="join-agreement-text">
	                전체동의는 필수 및 선택정보에 대한 동의도 포함되어있으며 <br>
	                개별적으로 동의를 선택하실 수 있습니다.<br>
	                선택항목에 대한 동의를 거부하시는 경우에도 서비스는 이용 가능합니다.
	                </p>
	            </div>
	            <div class="join-content">
	                <li class="checkBtn">
	                    <input type="checkbox" name="chktxt" value='select2' id="select2" onclick='checkSelectAll()'> 
	                 <label for="select2">만 14세 이상입니다</label>
	                    <h3>></h3>
	                </li>
	                <li class="checkBtn">
	                    <input type="checkbox" name="chktxt" value='select3' id="select3" onclick='checkSelectAll()'>
	                 <label for="select3">[필수] 우주장터 이용약관</label>
	                    <p>></p>
	                </li>
	                <li class="checkBtn">
	                    <input type="checkbox" name="chktxt" value='select4' id="select4" onclick='checkSelectAll()'>
	                 <label for="select4">[필수] 개인정보 수집 이용 동의</label>
	                    <p>></p>
	                </li>
	                <li class="checkBtn">
	                    <input type="checkbox" name="chktxt" value='select5' id="select5" onclick='checkSelectAll()'>
	                 <label for="select5">[선택] 마케팅 수신 동의</label>
	                    <p>></p>
	                </li>
	                <li class="checkBtn">
	                    <input type="checkbox" name="chktxt" value='select6' id="select6" onclick='checkSelectAll()'>
	                 <label for="select6">[선택] 개인정보 활용 동의</label>
	                    <p>></p>
	                </li>                   
	            </div>
	        </ul>
	        <button type="button" class="btn" name="동의" id="submitBtn" >동의</button> 
	        </form>
	    </div>
	</div>
<jsp:include page="../main/footerJoin.jsp"></jsp:include>
</body>
<script>
const input = document.getElementsByName("chktxt");
var submitBtn = document.getElementById("submitBtn");
var joinFrm = document.getElementById("join-agreement");
submitBtn.addEventListener('click', (e) => {
	var confirm  = true;
	
	for(var i = 0; i < input.length-2; i++){
		if(input[0].checked == false){
			alert("만14세 이상만 가입이 가능합니다.");
			confirm = false;
			break;
		}else if(input[i].checked == false){
			alert("필수 항목을 모두 체크해주세요");
			confirm = false;
			break;
		}else {
			confirm = true;
		}
	}
	
	if(confirm){
		joinFrm.submit();
	}
});
</script>
</html>