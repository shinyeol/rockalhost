<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rock All Host에 오신걸 환영합니다.</title>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<script>
google.load("visualization","1", {
	"packages":["corechart"]
});
google.setOnLoadCallback(drawChart);

function drawChart() {
	var jsonData = $.ajax({
		url: "${path}/chart/b_area.do",
		dataType: "json",
		async: false
	}).responseText;
	console.log(jsonData);
	
	var data = new google.visualization.DataTable(jsonData);
	console.log("데이터 테이블:"+data);
	
	var chart=new google.visualization.PieChart(
			document.getElementById("chart_div"));
	
	chart.draw(data, {
		title: "지역별 밴드수",
		width: 800,
		height: 800
	});
}
</script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
<%@ include file="../admin/admin_nav.jsp" %>
<%@ include file="b_sidebar.jsp" %>

	<div class="container" style="margin-top: -100px;">
	<h2>지역별 밴드 수</h2>
		<div id="chart_div"></div>
		<button id="btn" type="button" onclick="drawChart()">새로고침</button>
	</div>
</body>
</html>