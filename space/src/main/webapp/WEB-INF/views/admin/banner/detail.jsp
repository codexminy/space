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
</head>
<body>
	<jsp:include page="../common/nav.jsp"/>
	<jsp:include page="../common/bannerAside.jsp"/>
	<div class="container home-container">
		<jsp:include page="../common/bannerLink.jsp"/>
		<div>
			<form id="form" action="${path}/admin/page/banner/create" method="post" encType="multipart/form-data">
				<table border="0">
					
					<tbody class="banner-table">
						<tr>
							<td>배너</td>
							<td colspan="3" class="detail-img"><img height="300"/></td>
						</tr>
						<tr>
							<td>배너 URL</td>
							<td colspan="3" class="na_url"></td>
						</tr>
						<tr>
							<td>업체명</td>
							<td class="na_title"></td>
							<td>노출 상호</td>
							<td class="na_name"></td>
						</tr>
						<tr>
							<td>시작 날짜</td>
							<td class="na_start_date"></td>
							<td>종료 날짜</td>
							<td class="na_end_date"></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="btn-wrap">
				<ul>
					<li class="update">수정</li>
					<li class="delete">삭제</li>
					<li class="go-list">목록</li>
				</ul>
			</div>
		</div>
	</div>
	<form id="update-form" action="${path }/admin/banner/update" method="get">
		<input type="hidden" name="na_id" value="${dto.na_id }"/>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			getLoad();
		});
		
		$('.update').on('click', () => {
			$('#update-form').submit();
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
		
		function getLoad() {
			$.ajax({
				url : "${path}/admin/page/banner/detail",
				type: 'GET',
				data: {
					na_id: "${dto.na_id}"
				},
				success : function(result) {
					const list = result['list'];
					
					$(".na_title").html(list['na_title']);
					$('.na_name').html(list['na_name']);
					$('.na_url').html(list['na_url']);
					$('.na_start_date').html(formatDate(list['na_start_date']));
					$('.na_end_date').html(formatDate(list['na_end_date']));
					$('.detail-img img').attr('src', "${path}/resources/" + list['na_img']);
				}
			});
		}
	</script>
</body>
</html>







