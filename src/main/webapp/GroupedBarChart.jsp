
<%@page import="org.hibernate.query.NativeQuery"%>
<%@page import="com.entities.Student"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> barChartListmale = new ArrayList<Map<Object,Object>>();
List<Map<Object,Object>> barChartListFemale = new ArrayList<Map<Object,Object>>();
Session session1 = FactoryProvider.getSessionFactory().openSession();

String sql;
sql="SELECT class.class_name,COUNT(CASE WHEN Gender='male' THEN 1 END) AS Male,COUNT(CASE WHEN Gender='female' THEN 1 END) AS Female,student.gender,class_student.class_id FROM `class_student` INNER JOIN student ON student.stud_id = class_student.student_id INNER JOIN class on class.class_id = class_student.class_id GROUP BY class_student.class_id";
NativeQuery query  = session1.createSQLQuery(sql);
List<Object[]> list = query.list();


for(Object[] student:list) {
	Integer m = ((BigInteger) student[1]).intValue();
	Integer f = ((BigInteger) student[2]).intValue();
	map = new HashMap<Object,Object>();
	map.put("label", (String)student[0]); 
	map.put("y",m); 
	barChartListmale.add(map);
	map = new HashMap<Object,Object>();
	map.put("label", (String)student[0]); 
	map.put("y",f);
	barChartListFemale.add(map); 
}
 
session1.close();

String dataPoints1 = gsonObj.toJson(barChartListmale);
String dataPoints2 = gsonObj.toJson(barChartListFemale);
%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>Home</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
			<h1 class="text-center">Grouped Bar Chart</h1>
			<div class="container border">
			<div id="chartContainer" style="height: 370px; width: 100%;">
				</div>
			</div>
			
		</div>


	</div>
	<script type="text/javascript">
	window.onload = function() { 
		 
		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled: true,
			theme: "dark1",
			title: {
				text: "Number of males and females in a class"
			},
			axisY: {
				title: "",
				includeZero: true
			},
			toolTip: {
				shared: true
			},
			legend: {
				cursor: "pointer",
				itemclick: toggleDataSeries
			},
			data: [{
				type: "column",
				name: "Male",
				yValueFormatString: "#0 Male",
				showInLegend: true,
				dataPoints: <%out.print(dataPoints1);%>
			}, {
				type: "column",
				name: "Female",
				yValueFormatString: "#0 Females",
				showInLegend: true,
				dataPoints: <%out.print(dataPoints2);%>
			}]
		});
		chart.render();
		 
		function toggleDataSeries(e) {
			if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
				e.dataSeries.visible = false;
			}
			else {
				e.dataSeries.visible = true;
			}
			chart.render();
		}
		 
		}
</script>
</body>
</html>