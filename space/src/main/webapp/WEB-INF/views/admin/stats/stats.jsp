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
	<jsp:include page="../common/noticeAside.jsp"/>
	<div class="container home-container">
		<jsp:include page="../common/noticeLink.jsp"/>
		<div class="list-wrap">
			<div class="userChart">
				<canvas id="myChart"></canvas>
			</div>
			<div class="userChart">
				<canvas id="myChart2"></canvas>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$.ajax({
			url : "${path}/admin/page/stats/stats",
			type : "GET",
			success : function(result) {
				var list = [result['monthNew'], result['monthWd'], result['dailyVisit']];
				getChart(list[0], list[1], list[2]);
			}
		});
	
		function getChart(list1, list2, list3) {
			var context = document.getElementById('myChart').getContext('2d');
			var myChart = new Chart(context, {
			    type: 'line',
			    data: {
			        labels: [
			            '1','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월','1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월','6월','7월','8월','9월','10월','11월','12월'
			        ],
			        datasets: [
			            {
			                label: '신규 회원',
			                fill: true,
			                lineTension: 0,
			                data: list1,
			                backgroundColor: 'rgba(54, 162, 235, 0.2)',
			                borderWidth: 1
			            },
			            {
			                label: '탈퇴 회원',
			                fill: true,
			                lineTension: 0,
			                data: list2,
			                backgroundColor: 'rgba(255, 99, 132, 0.2)',
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
			});
			
			var context2 = document.getElementById('myChart2').getContext('2d');
			var myChart2 = new Chart(context2, {
			    type: 'line',
			    data: { 
			        labels: [
			            '1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
			        ],
			        datasets: [
			            {
			                label: '탈퇴 회원',
			                fill: true,
			                lineTension: 0,
			                data: list2,
			                backgroundColor: 'rgba(255, 99, 132, 0.2)',
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
			});
		}
	</script>
</body>
</html>








