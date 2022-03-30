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
					<colgroup>
						<col width="50%"/>
						<col width="50%"/>
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">
								<span>일별 통계</span>
								<span class="dailyChart">차트 보기</span>
							</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<table class="common-table weeklyCnt">
					<colgroup>
						<col width="50%"/>
						<col width="50%"/>
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">
								<span>주별 통계</span>
								<span class="weeklyChart">차트 보기</span>
							</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<table class="common-table monthlyCnt">
					<colgroup>
						<col width="50%"/>
						<col width="50%"/>
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">
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
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('.nav-stats').css('backgroundColor', 'rgb(240,240,240)');
		$('.nav-stats i, .nav-stats span').css('color', '#22007F');
		$('aside li:nth-child(2)').css('backgroundColor', 'rgb(240,240,240)');
		$('aside li:nth-child(2) .menuHover').css('color', '#22007F');
	
		var userContext = document.getElementById('userChart').getContext('2d');
		var userChart,list, userConfig;
		
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
			
			userConfig.data.labels = list1;
			userDataset[0].data = list2;
			userDataset[1].data = list3;
			
			userChart.update();
		}
		
		function tableData(userCounts, label, data1, data2) {
			let userCount = userCounts;
			let userData = '';
			
			let newUser = 0;
			let withUser = 0;
			
			for(let i=0; i<label.length; ++i) {
				newUser += data1[i];
				withUser += data2[i];
			}
			
			userData += '<tr>';
			userData += '<td>판매</td>';
			userData += '<td>커뮤니티</td>';
			userData += '</tr>';
			
			userData += '<tr>';
			userData += '<td>'+ newUser +'</td>';
			userData += '<td>'+ withUser +'</td>';
			userData += '</tr>';
			
			userCount.html(userData);
		}
		
		$.ajax({
			url : "${path}/admin/stats/stats/board",
			type : "GET",
			success : function(re) {
				list = [
					re['dayL'], re['sDayN'], re['cDayN'], re['weekL'], re['sWeekN'], re['cWeekN'], re['monthL'], re['sMonthN'], re['cMonthN']
				];
				
				tableData($('.dailyCnt tbody'), re['dayL'], re['sDayN'], re['cDayN']);
				tableData($('.weeklyCnt tbody'), re['weekL'], re['sWeekN'], re['cWeekN']);
				tableData($('.monthlyCnt tbody'), re['monthL'], re['sMonthN'], re['cMonthN']);
				
				userConfig = {
					type: 'line',
				    data: {
				        labels: list[0],
				        datasets: [
				            {
				                label: '판매글',
				                lineTension: 0,
				                data: list[1],
				                backgroundColor: 'rgba(54, 162, 235, 0.2)',
				                borderColor: 'rgba(54, 162, 235, 0.2)',
				                borderWidth: 1
				            },
				            {
				                label: '커뮤니티',
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

				userChart = new Chart(userContext, userConfig);
				
			}
		});
	</script>
</body>
</html>








