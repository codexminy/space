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
</head>
<body>
	<jsp:include page="../common/nav.jsp"/>
	<jsp:include page="../common/aside.jsp"/>
	<div class="container home-container">
		<jsp:include page="../common/subLink.jsp"/>
		<div class="list-wrap">
			<div class="stats-container">
				<div class="count-wrap">
					<table class="dailyUserCount">
						<tbody></tbody>
					</table>
					<table class="dailyVisitCount">
						<tbody></tbody>
					</table>
					<table class="weeklyUserCount">
						<tbody></tbody>
					</table>
					<table class="weeklyVisitCount">
						<tbody></tbody>
					</table>
					<table class="monthlyUserCount">
						<tbody></tbody>
					</table>
					<table class="monthlyVisitCount">
						<tbody></tbody>
					</table>
					<div class="daily">일별통계보기</div>
					<div class="weekly">주별통계보기</div>
					<div class="monthly">월별통계보기</div>
				</div>
				<div class="stats-wrap">
					<div class="userChart">
						<canvas id="userChart"></canvas>
					</div>
					<div class="userChart">
						<canvas id="visitChart"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var userContext = document.getElementById('userChart').getContext('2d');
		var visitContext = document.getElementById('visitChart').getContext('2d');
		var userChart, visitChart, list, userConfig, visitConfig;
		
		$('.daily').on('click', () => {
			updateChart(list[0], list[1], list[2], list[3]);
		});
		
		$('.weekly').on('click', () => {
			updateChart(list[4], list[5], list[6], list[7]);
		});

		$('.monthly').on('click', () => {
			updateChart(list[8], list[9], list[10], list[11]);
		});

		function updateChart(list1, list2, list3, list4) {
			var userDataset = userConfig.data.datasets;
			var visitDataset = visitConfig.data.datasets;
			
			userConfig.data.labels = list1;
			userDataset[0].data = list2;
			userDataset[1].data = list3;
			
			visitConfig.data.labels = list1;
			visitDataset[0].data = list4;
			
			userChart.update();
			visitChart.update();
		}

		function tableData(userCounts, visitCounts, label, data1, data2, data3) {
			let userCount = userCounts;
			let visitCount = visitCounts;
			
			let userData = '';
			let visitData = '';
			
			let newUser = 0;
			let withUser = 0;
			let visit = 0;
			
			for(let i=0; i<label.length; ++i) {
				newUser += data1[i];
				withUser += data2[i];
				visit += data3[i];
			}
			
			userData += '<tr>';
			userData += '<td>'+ newUser +'</td>';
			userData += '<td>'+ withUser +'</td>';
			userData += '<tr>';
			
			visitData += '<tr>';
			visitData += '<td>'+ visit +'</td>';
			visitData += '<tr>';
			
			userCount.html(userData);
			visitCount.html(visitData);
		}
		
		$.ajax({
			url : "${path}/admin/page/stats/stats",
			type : "GET",
			success : function(re) {
				list = [
					re['dayL'], re['dayN'], re['dayW'], re['dayV'], re['weekL'], re['weekN'],
					re['weekW'], re['weekV'], re['monthL'], re['monthN'], re['monthW'], re['monthV']
				];

				tableData($('.dailyUserCount tbody'), $('.dailyVisitCount tbody'), re['dayL'], re['dayN'], re['dayW'], re['dayV']);
				tableData($('.weeklyUserCount tbody'), $('.weeklyVisitCount tbody'), re['weekL'], re['weekN'], re['weekW'], re['weekV']);
				tableData($('.monthlyUserCount tbody'), $('.monthlyVisitCount tbody'), re['monthL'], re['monthN'], re['monthW'], re['monthV']);

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
				visitChart = new Chart(visitContext, visitConfig);
			}
		});
	</script>
</body>
</html>








