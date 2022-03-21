<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="./common/link.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<jsp:include page="./common/nav.jsp"/>
	<jsp:include page="./common/homeAside.jsp"/>
	<div class="container home-container">
		<div class="stats-container">
			<div class="info-wrap">
				<div class="info">
					<div class="home-title-wrap">
						<h2 class="title">신고 접수</h2>
						<p><i class="fa-solid fa-angle-right"></i></p>
					</div>
					<div class="line"></div>
					<table>
						<tbody class="notify-info"></tbody>
					</table>
				</div>
				<div class="info">
					<div class="home-title-wrap">
						<h2 class="title">통계</h2>
						<p><i class="fa-solid fa-angle-right"></i></p>
					</div>
					<div class="line"></div>
					<table>
						<tbody class="stats-info"></tbody>
					</table>
				</div>
				<div class="info">
					<div class="home-title-wrap">
						<h2 class="title">광고</h2>
						<p><i class="fa-solid fa-angle-right"></i></p>
					</div>
					<div class="line"></div>
					<table>
						<tbody class="stats-info"></tbody>
					</table>
				</div>
			</div>
			<div class="list-wrap">
				<div class="banner-wrap">
					<div class="banner info">
						<div class="home-title-wrap">
							<h2 class="title">배너 관리</h2>
							<p><i class="fa-solid fa-angle-right"></i></p>
						</div>
						<div class="line"></div>
						<table>
							<tbody class="banner-info"></tbody>
						</table>
					</div>
				</div>
				<div class="admin-wrap">
					<div class="admin info">
						<div class="home-title-wrap">
							<h2 class="title">관리자 공지</h2>
							<p><i class="fa-solid fa-angle-right"></i></p>
						</div>
						<div class="line"></div>
						<table>
							<tbody class="admin-info"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			getLoad();
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
			const notifyInfo = $('.notify-info');
			const statsInfo = $('.stats-info');
			const bannerInfo = $('.banner-info');
			const adminInfo = $('.admin-info');
			const notifyContent = ["게시글 신고", "댓글 신고", "리뷰 신고"];
			const statsContent = ["신규 회원", "탈퇴 회원", "신규 게시물", "오늘 방문자수"];
			
			$.ajax({
				url : "${path}/admin/page/home",
				type : "GET",
				success : function(result) {
					const notify = result['notify'];
					const stats = result['stats'];
					const banner = result['banner'];
					const admin = result['admin'];
					
					let notifyData = "";
					let statsData = "";
					let bannerData = "";
					let adminData = "";
					
					inputData(notify, notifyContent, notifyData, notifyInfo);
					inputData(stats, statsContent, statsData, statsInfo);
					
					banner.forEach(list => {
						bannerData += "<tr>";
						bannerData += '<td><a href="${path}/admin/banner/detail?na_id=' + list.na_id + '">' + list.na_title + '</a></td>';
						bannerData += "<td class=text-right>" + formatDate(list.na_start_date) + " ~ " + formatDate(list.na_end_date) + "</td>";
						bannerData += "</tr>";
					});
					
					for(let i=0; i<admin.length; ++i) {
						adminData += "<tr>";
						adminData += "<td>"<c:out value=" + admin[i].acDTO.ac_code + "/>""<c:out value=" + admin[i].notice_admin_title + "/>"</td>";
						adminData += "<td class=text-right>" + admin[i].notice_admin_date + "</td>";
						adminData += "</tr>";
					}
					
					bannerInfo.html(bannerData);
					adminInfo.html(adminData);
				}
			});
		}
		
		function inputData(list, content, info, htmlbody) {
			for(let i=0; i<list.length; ++i) {
				info += "<tr>";
				info += "<td>" + content[i] + "</td>";
				info += "<td class='red'>"<c:out value=" + list[i] + "/>"건</td>";
				info += "</tr>";
			}
			htmlbody.html(info);
		}
	</script>
</body>
</html>




