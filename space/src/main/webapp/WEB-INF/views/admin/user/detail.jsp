<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="../common/link.jsp"/>
<link rel="styleSheet" href="${path }/resources/admin/css/user.css">
</head>
<body>
	<div class="user-detail-container">
		<table class="common-table user-table">
			<colgroup>
				<col width="35%"/>
				<col width="65%"/>
			</colgroup>
			<thead>
				<tr>
					<th colspan="2">회원상세 정보</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>아이디</td>
					<td>${list.lilDTO.login_id }</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${list.user_name }</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td class="user-info">${list.user_nickname }</td>
					<td class="user-update"><input type="text" name="user_nickname" value="${list.user_nickname }" /></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>${list.user_gender }</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${list.user_address }</td>
				</tr>
				<tr>
					<td>가입일</td>
					<td><fmt:formatDate value="${list.user_join_date }" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<td>팔로잉 수</td>
					<td>${list.user_following }</td>
				</tr>
				<tr>
					<td>팔로워 수</td>
					<td>${list.user_followed }</td>
				</tr>
				<tr>
					<td>이메일 수신여부</td>
					<td>${list.user_check_email }</td>
				</tr>
				<tr>
					<td>프로필 공개여부</td>
					<td >${list.user_public_profile }</td>
				</tr>
				<tr>
					<td>누적 신고 횟수</td>
					<td>${list.user_reported }</td>
				</tr>
				<tr>
					<td>탈퇴 여부</td>
					<td>${list.user_delete }</td>
				</tr>
				<tr>
					<td>정지 여부</td>
					<td class="user-info">${list.user_ban }</td>
					<td class="user-update">
						<select name="user_ban">
							<option value="N">N</option>
							<option value="Y">Y</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>정지 시작일</td>
					<td class="user-info"><fmt:formatDate value="${list.user_notify_start_date }" pattern="yyyy-MM-dd"/></td>
					<td class="user-update"><input type="date" name="user_notify_start_date" value="${list.user_notify_start_date }" /></td>
				</tr>
				<tr>
					<td>정지 종료일</td>
					<td class="user-info"><fmt:formatDate value="${list.user_notify_end_date }" pattern="yyyy-MM-dd"/></td>
					<td class="user-update"><input type="date" name="user_notify_end_date" value="${list.user_notify_end_date }" /></td>
				</tr>
			</tbody>
		</table>
		<div class="user-btn btn-wrap">
			<ul class="user-info">
				<li class="update" onclick="goUpdate()">회원정보 수정</li>
				<li class="delete">회원정보 삭제</li>
			</ul>
			<ul class="user-update">
				<li class="confirm" onclick="confirm()">적용</li>
				<li class="cancel">취소</li>
			</ul>
		</div>
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$('.user-update').css('display', 'none');

    function cDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress;

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
            }
        }).open();
    }
    
    function goUpdate() {
    	$('.user-info').css('display', 'none');
    	$('.user-update').css('display', 'flex');
    }
    
    function confirm() {
    	const data = {
   			user_nickname: $('input[name="user_nickname"]').val(),
   			user_ban: $('select[name="user_ban"]').val(),
   			user_notify_start_date: $('input[name="user_notify_start_date"]').val(),
   			user_notify_end_date: $('input[name="user_notify_end_date"]').val()
    	}

    	$.ajax({
    		url : '${path}/admin/user/user/user/${user_id}',
    		type: 'PUT',
    		data: JSON.stringify(data),
			contentType: 'application/json',
    		success : function(result) {
    			alert('성공!');
    			opener.parent.location.reload();
    			window.close();
    		}
    	});
    }
</script>
</html>







