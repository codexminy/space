<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/link.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="styleSheet" href="${path }/resources/admin/css/stats.css">
</head>
<body>
	<jsp:include page="../common/nav.jsp"/>
	<jsp:include page="../common/aside.jsp"/>
	<div class="container home-container">
		<jsp:include page="../common/subLink.jsp"/>
		<div class="stats-container">
			<div class="count-wrap">
				<table class="common-table dailyCnt">
					<thead>
						<tr>
							<th colspan="3">
								<span>일별 통계</span>
								<span class="dailyChart">차트 보기</span>
							</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<table class="common-table weeklyCnt">
					<thead>
						<tr>
							<th colspan="3">
								<span>주별 통계</span>
								<span class="weeklyChart">차트 보기</span>
							</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<table class="common-table monthlyCnt">
					<thead>
						<tr>
							<th colspan="3">
								<span>월별 통계</span>
								<span class="monthlyChart">차트 보기</span>
							</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
			<div class="stats-wrap">
				<div class="userChart">
					<canvas id="userChart"></canvas>
				</div>
<!-- 				<div class="userChart"> -->
<%-- 					<canvas id="visitChart"></canvas> --%>
<!-- 				</div> -->
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('.nav-stats').css('backgroundColor', 'rgb(240,240,240)');
		$('.nav-stats i, .nav-stats span').css('color', '#22007F');
		$('aside li:nth-child(1)').css('backgroundColor', 'rgb(240,240,240)');
		$('aside li:nth-child(1) .menuHover').css('color', '#22007F');
	
		var userContext = document.getElementById('userChart').getContext('2d');
// 		var visitContext = document.getElementById('visitChart').getContext('2d');
		var userChart, visitChart, list, userConfig, visitConfig;
		
		$('.dailyChart').on('click', () => {
			updateChart(list[0], list[1], list[2]);
		});
		
		$('.weeklyChart').on('click', () => {
			updateChart(list[3], list[4], list[5]);
		});

		$('.monthlyChart').on('click', () => {
			updateChart(list[6], list[7], list[8]);
		});

		function updateChart(list1, list2, list3) {
			var userDataset = userConfig.data.datasets;
// 			var visitDataset = visitConfig.data.datasets;
			
			userConfig.data.labels = list1;
			userDataset[0].data = list2;
			userDataset[1].data = list3;
			
			visitConfig.data.labels = list1;
// 			visitDataset[0].data = list4;
			
			userChart.update();
// 			visitChart.update();
		}

		function tableData(userCounts, label, data1, data2) {
			let userCount = userCounts;
			let userData = '';
			
			let newUser = 0;
			let withUser = 0;
// 			let visit = 0;
			
			for(let i=0; i<label.length; ++i) {
				newUser += data1[i];
				withUser += data2[i];
// 				visit += data3[i];
			}
			
			userData += '<tr>';
			userData += '<td>신규 회원</td>';
			userData += '<td>탈퇴 회원</td>';
// 			userData += '<td>방문자수</td>';
			userData += '</tr>';
			
			userData += '<tr>';
			userData += '<td>'+ newUser +'</td>';
			userData += '<td>'+ withUser +'</td>';
// 			userData += '<td>'+ visit +'</td>';
			userData += '</tr>';
			
			userCount.html(userData);
		}
		
		$.ajax({
			url : "${path}/admin/stats/stats/stats",
			type : "GET",
			success : function(re) {
				list = [
					re['dayL'], re['dayN'], re['dayW'], re['weekL'], re['weekN'],
					re['weekW'], re['monthL'], re['monthN'], re['monthW'],
				];

				tableData($('.dailyCnt tbody'), re['dayL'], re['dayN'], re['dayW']);
				tableData($('.weeklyCnt tbody'), re['weekL'], re['weekN'], re['weekW']);
				tableData($('.monthlyCnt tbody'), re['monthL'], re['monthN'], re['monthW']);

				userConfig = {
					type: 'bar',
				    data: {
				        labels: list[0],
				        datasets: [
				            {
				                label: '신규 회원',
				                lineTension: 0,
				                data: list[1],
				                backgroundColor: 'rgba(54, 162, 235, 0.2)',
				                borderColor: 'rgba(54, 162, 235, 0.2)',
				                borderWidth: 1
				            },
				            {
				                label: '탈퇴 회원',
				                lineTension: 0,
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

				visitConfig = {
					type: 'line',
				    data: { 
				        labels: list[0],
				        datasets: [
				            {
				                label: '방문자수',
				                lineTension: 0,
				                data: list[3],
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

				userChart = new Chart(userContext, userConfig);
// 				visitChart = new Chart(visitContext, visitConfig);
			}
		});
	</script>
</body>
</html>








