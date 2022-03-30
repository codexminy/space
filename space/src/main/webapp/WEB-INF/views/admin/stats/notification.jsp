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
						<col width="33%"/>
						<col width="33%"/>
						<col width="33%"/>
					</colgroup>
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
					<colgroup>
						<col width="33%"/>
						<col width="33%"/>
						<col width="33%"/>
					</colgroup>
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
					<colgroup>
						<col width="33%"/>
						<col width="33%"/>
						<col width="33%"/>
					</colgroup>
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
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('.nav-stats').css('backgroundColor', 'rgb(240,240,240)');
		$('.nav-stats i, .nav-stats span').css('color', '#22007F');
		$('aside li:nth-child(3)').css('backgroundColor', 'rgb(240,240,240)');
		$('aside li:nth-child(3) .menuHover').css('color', '#22007F');
	
		var userContext = document.getElementById('userChart').getContext('2d');
		var userChart,list, userConfig;
		
		$('.dailyChart').on('click', () => {
			updateChart(list[0], list[1], list[2], list[3]);
		});
		
		$('.weeklyChart').on('click', () => {
			updateChart(list[4], list[5], list[6], list[7]);
		});

		$('.monthlyChart').on('click', () => {
			updateChart(list[8], list[9], list[10], list[11]);
		});

		function updateChart(list1, list2, list3) {
			var userDataset = userConfig.data.datasets;
			
			userConfig.data.labels = list1;
			userDataset[0].data = list2;
			userDataset[1].data = list3;
			
			userChart.update();
		}
		
		function tableData(userCounts, label, data1, data2, data3) {
			let userCount = userCounts;
			let userData = '';
			
			let newUser = 0;
			let withUser = 0;
			let visitUser = 0;
			
			for(let i=0; i<label.length; ++i) {
				newUser += data1[i];
				withUser += data2[i];
				visitUser += data3[i];
			}
			
			userData += '<tr>';
			userData += '<td>게시글</td>';
			userData += '<td>댓글</td>';
			userData += '<td>리뷰</td>';
			userData += '</tr>';
			
			userData += '<tr>';
			userData += '<td>'+ newUser +'</td>';
			userData += '<td>'+ withUser +'</td>';
			userData += '<td>'+ visitUser +'</td>';
			userData += '</tr>';
			
			userCount.html(userData);
		}
		
		$.ajax({
			url : "${path}/admin/stats/stats/notification",
			type : "GET",
			success : function(re) {
				list = [
					re['dayL'], re['bDayN'], re['cDayN'], re['rDayN'], re['weekL'], re['bWeekN'], re['cWeekN'],
					re['rWeekN'], re['monthL'], re['bMonthN'], re['cMonthN'], re['rMonthN']
				];

				tableData($('.dailyCnt tbody'), re['dayL'], re['bDayN'], re['cDayN'], re['rDayN']);
				tableData($('.weeklyCnt tbody'), re['weekL'], re['bWeekN'], re['cWeekN'], re['rWeekN']);
				tableData($('.monthlyCnt tbody'), re['monthL'], re['bMonthN'], re['cMonthN'], re['rMonthN']);
				
				userConfig = {
					type: 'bar',
				    data: {
				        labels: list[0],
				        datasets: [
				            {
				                label: '게시글',
				                lineTension: 0,
				                data: list[1],
				                backgroundColor: 'rgba(54, 162, 235, 0.2)',
				                borderColor: 'rgba(54, 162, 235, 0.2)',
				                borderWidth: 1
				            },
				            {
				                label: '댓글',
				                lineTension: 0,
				                data: list[2],
				                backgroundColor: 'rgba(255, 99, 132, 0.2)',
				                borderColor: 'rgba(255, 99, 132, 0.2)',
				                borderWidth: 1
				            },
				            {
				                label: '리뷰',
				                lineTension: 0,
				                data: list[3],
				                backgroundColor: 'rgba(255, 205, 86, 0.2)',
				                borderColor: 'rgba(255, 205, 86, 0.2)',
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








