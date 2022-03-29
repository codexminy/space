<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/link.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="styleSheet" href="${path }/resources/admin/css/notifyDetail.css">
</head>
<body>
	<div class="board-detail-wrap">
		<h2>신고상세 정보</h2>
		<table>
			<colgroup>
				<col width="25%"/>
				<col width="75%"/>
			</colgroup>
			<tbody></tbody>
		</table>
		<div class="notify-content"></div>
		<div class="btn-wrap">
			<button type="button" onclick="popupClose()">확인</button>
		</div>
	</div>
	<script type="text/javascript">
		const tbody = $('tbody');
		const notifyContent = $('.notify-content');
		
		$.ajax({
			url : "${path}/admin/notify/notify/review",
			success : function(result) {
				const list = result['list'];

				let tbodyData = '';
				let contentData = '';
				let boardId = 0;
				
				list.forEach(list => {
					if(list.nr_id === parseInt("${nr_id}")) {
						tbodyData += '<tr>';
						tbodyData += '<td>신고대상</td>';
						tbodyData += '<td>'+ list.reported +'</td>';
						tbodyData += '</tr>';
						tbodyData += '<tr>';
						tbodyData += '<td>접수일</td>';
						tbodyData += '<td>'+ formatDate(list.nr_notify_date) +'</td>';
						tbodyData += '</tr>';
						tbodyData += '<tr>';
						tbodyData += '<td>신고자</td>';
						tbodyData += '<td>'+ list.reporter +'</td>';
						tbodyData += '</tr>';
						tbodyData += '<tr>';
						tbodyData += '<td>사유</td>';
						tbodyData += '<td>'+ list.nfc_name +'</td>';
						tbodyData += '</tr>';
						contentData += '<h3>신고내용</h3>';
						
						let content = list.nr_content === null ? '' : list.nr_content;
						contentData += '<p>'+ content +'</p>';
						
						boardId = list.board_id;
					}
				});
				
				tbody.html(tbodyData);
				notifyContent.html(contentData);
			}
		});
		
		function formatDate(date) {
		    let d = new Date(date);
		    let month = '' + (d.getMonth() + 1);
		    let day = '' + d.getDate();
		    let year = d.getFullYear();
		    
		    if (month.length < 2) month = '0' + month; 
		    if (day.length < 2) day = '0' + day; 
		    
		    return [year, month, day].join('-');
		}
		
		function popupClose() {
			window.close();
		}
	</script>
</body>
</html>














