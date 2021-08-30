
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
List<Map<Object,Object>> barChartList = new ArrayList<Map<Object,Object>>();
Session session1 = FactoryProvider.getSessionFactory().openSession();

String sql;
sql ="SELECT COUNT(professor.specialization) as count,specialization.specialization_name FROM `professor` INNER JOIN specialization ON specialization.specialization_id = professor.specialization GROUP BY professor.specialization";
NativeQuery query  = session1.createSQLQuery(sql);
List<Object[]> list = query.list();
int sum=0;
for(Object[] student:list) {
	Integer i = ((BigInteger) student[0]).intValue();
	sum= sum +i;
}

for(Object[] student:list) {
	Integer i = ((BigInteger) student[0]).intValue();
	map = new HashMap<Object,Object>();
	map.put("label", (String)student[1]); 
	map.put("y",Math.round(((i*100f)/(double)sum))); 
	barChartList.add(map);
}
 
session1.close();

String dataPoints = gsonObj.toJson(barChartList);
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
		
			<div class="container border">
			<div id="chartContainer" style="height: 370px; width: 100%;">
				</div>
			</div>
			
		</div>


	</div>
	<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	animationEnabled: true,
	exportFileName: "Specialization of Professor",
	exportEnabled: true,
	title:{
		text: "Specialization of Professor"
	},
	data: [{
		type: "pie",
		showInLegend: true,
		legendText: "{label}",
		toolTipContent: "{label}: <strong>{y}%</strong>",
		indexLabel: "{label} {y}%",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
 
chart.render();
 
}
</script>
</body>
</html>