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
<link rel="stylesheet" href="${path}/resources/admin/css/home.css" />
</head>
<body>
	<jsp:include page="./common/nav.jsp"/>
	<jsp:include page="./common/aside.jsp"/>
	<div class="container">
		<div class="chart-wrap">
			<div class="chartTitle">
				<h2>일일 방문자&amp;게시물</h2>
			</div>
			<div class="visitChart">
				<canvas id="visitChart"></canvas>
			</div>
		</div>
		<div class="home-wrap">
			<div class="home-stats-wrap">
				<div class="home-info" onclick="goLink('${path }/admin/notification/board')">
					<div class="home-title-wrap">
						<h2 class="home-title">신고 접수</h2>
						<div class="home-notify home-table"></div>
					</div>
				</div>
				<div class="home-info" onclick="goLink('${path }/admin/enquiry/contactUs')">
					<div class="home-title-wrap">
						<h2 class="home-title">1대1 문의</h2>
						<div class="home-contact-us home-table"></div>
					</div>
				</div>
				<div class="home-info" onclick="goLink('${path }/admin/board/sale')">
					<div class="home-title-wrap">
						<h2 class="home-title">신규 게시물</h2>
						<div class="home-new-board home-table"></div>
					</div>
				</div>
				<div class="home-info" onclick="goLink('${path }/admin/user/list')">
					<div class="home-title-wrap">
						<h2 class="home-title">신규 회원</h2>
						<div class="home-new-user home-table"></div>
					</div>
				</div>
				<div class="home-info" onclick="goLink('${path }/admin/user/withdrawalList')">
					<div class="home-title-wrap">
						<h2 class="home-title">탈퇴 회원</h2>
						<div class="home-out-user home-table"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="home-list-container">
			<div class="home-list-wrap">
				<div class="home-info">
					<div class="home-title board-title">
						<h2>배너 관리</h2>
						<p><i class="fa-solid fa-angle-right"></i></p>
					</div>
					<div class="line"></div>
					<table>
						<tbody class="banner-info"></tbody>
					</table>
				</div>
			</div>
			<div class="home-list-wrap">
				<div class="home-info">
					<div class="home-title board-title">
						<h2>관리자 공지</h2>
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
	<script type="text/javascript">
		$(document).ready(function() {
			$('.nav-home').css('backgroundColor', 'rgb(240,240,240)');
			$('.nav-home i, .nav-home span').css('color', '#22007F');
			getHome();

			var visitContext = document.getElementById('visitChart').getContext('2d');
			var visitChart, visitConfig;

			$.ajax({
				url : "${path}/admin/stats/stats/stats",
				type : "GET",
				success : function(re) {
					list = [
						re['dayL'], re['dayV'], re['dayN']
					];

					visitConfig = {
						type: 'line',
					    data: { 
					        labels: list[0],
					        datasets: [
					            {
					                label: '오늘 방문자수',
					                lineTension: 0,
					                fill: false,
					                data: list[1],
					                backgroundColor: 'rgba(54, 162, 235, 0.2)',
					                borderColor: 'rgba(54, 162, 235, 0.2)',
					                borderWidth: 1
					            },
					            {
					                label: '신규 게시물수',
					                lineTension: 0,
					                fill: false,
					                data: list[2],
					                backgroundColor: 'rgba(255, 99, 132, 0.2)',
					                borderColor: 'rgba(255, 99, 132, 0.2)',
					                borderWidth: 1
					            }
					        ]
					    },
					    options: {
					    	maintainAspectRatio: false,
					        scales: {
					            yAxes: [
					                {
					                    ticks: {
					                        beginAtZero: true
					                    }
					                }
					            ]
					        }
					    }
					}

					visitChart = new Chart(visitContext, visitConfig);
				}
			});
		});

		function goLink(link) {
			location.href = link;
		}
		
		function formatDate(date) {
		    let d = new Date(date);
		    let month = '' + (d.getMonth() + 1);
		    let day = '' + d.getDate();
		    let year = d.getFullYear();
		    
		    if (month.length < 2) month = '0' + month; 
		    if (day.length < 2) day = '0' + day; 
		    
		    return [year, month, day].join('-');
		}
		
		function getHome() {
			const nofity = $('.home-notify');
			const newUser = $('.home-new-user');
			const contactUs = $('.home-contact-us');
			const newBoard = $('.home-new-board');
			const outUser = $('.home-out-user');
			const bannerInfo = $('.banner-info');
			const adminInfo = $('.admin-info');
			const notifyContent = ["게시글 신고", "댓글 신고", "리뷰 신고"];
			const statsContent = ["신규 회원", "탈퇴 회원", "신규 게시물", "오늘 방문자수"];
			
			$.ajax({
				url : "${path}/admin/home/home",
				type : "GET",
				success : function(result) {
					const notify = result['notify'];
					const stats = result['stats'];
					const banner = result['banner'];
					const admin = result['admin'];
					
					let notifyCnt = 0;
					let notifyData = "";
					let newUserData = "";
					let contactUsData = "";
					let newBoardData = "";
					let outUserData = "";
					let bannerData = "";
					let adminData = "";
					
					for(let i=0; i<notify.length; ++i) {
						notifyCnt += notify[i];
					}
					
					notifyData += '<div>' + notifyCnt + '</div>';
					newUserData += '<div>' + stats[0] + '</div>';
					contactUsData = '<div>' + stats[1] + '</div>';
					newBoardData += '<div>' + stats[2] + '</div>';
					outUserData += '<div>' + stats[3] + '</div>';
					
					for(let i=0; i<banner.length; ++i) {
						let dDay = Math.ceil((new Date().getTime() - new Date(banner[i].na_end_date).getTime()) / (1000*60*60*24));
						bannerData += "<tr>";
						bannerData += '<td><a href="${path}/admin/banner/detail?na_id=' + banner[i].na_id + '">' + banner[i].na_title + '</a></td>';
						bannerData += "<td class=text-right><span class='d-day'>D" + dDay + "</span>" + formatDate(banner[i].na_start_date) + " ~ " + formatDate(banner[i].na_end_date) + "</td>";
						bannerData += "</tr>";
						
						if(i >= 4) break;
					}

					for(let i=0; i<admin.length; ++i) {
						adminData += "<tr>";
						adminData += "<td><a href=${path}/admin/admin/detail?notice_admin_id="+ admin[i].notice_admin_id +">"+ admin[i].acDTO.ac_code + " " + admin[i].notice_admin_title +"</a></td>";
						adminData += "<td class=text-right>" + formatDate(admin[i].notice_admin_date) + "</td>";
						adminData += "</tr>";
						
						if(i >= 4) break;
					}
					
					nofity.html(notifyData);
					newUser.html(newUserData);
					contactUs.html(contactUsData);
					newBoard.html(newBoardData);
					outUser.html(outUserData);
					bannerInfo.html(bannerData);
					adminInfo.html(adminData);
				},
				error : function(result) {
					alert(result.responseJSON.code + "\n" + result.responseJSON.message);
				}
			});
		}
	</script>
</body>
</html>




