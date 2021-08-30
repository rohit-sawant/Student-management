
<%@page import="com.entities.Student"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		<div class="container">

			<h3 class="text-center">Student Bar chart</h3>
			<form action="SaveClass" method="post" class="p-3 border border-dark"
				id="myform" name="myform">
				<div class="form-row">
					<div class="form-group col-12">
						<label for="student">student</label> <select
							id="student" name="student" class="form-control"
							required>
							<option value="" selected>Select Student</option>
							<%
							Session session1 = FactoryProvider.getSessionFactory().openSession();
							Transaction transaction = session1.beginTransaction();
							Query q = session1.createQuery("FROM Student");
					    	List<Student> listofStudents = q.list();
					    	for(Student s :listofStudents){
					    		%>
										<option value=<%=s.getStud_id() %>><%=s.getName() %></option>
										<% 
					    	}
							transaction.commit();
							session1.close();
							%>
						</select>
					</div>





				</div>
				
			</form>
			<div class="container">
			<div id="chartContainer" style="height: 370px; width: 100%;">
				</div>
			</div>
			
		</div>


	</div>
	<script type="text/javascript">
$(document).ready(function(){
	function myfunction(dataPoints) { 
		 console.log("inside function");
		var chart = new CanvasJS.Chart("chartContainer", {
			title: {
				text: "Frequency of Attendance"
			},
			axisX: {
				title: "Classes"
			},
			axisY: {
				title: "Frequency",
				includeZero: true
			},
			data: [{
				type: "column",
				yValueFormatString: "#,##0 presenty",
				dataPoints: dataPoints
			}]
		});
		chart.render();
		 
		}
	console.log("page is ready . . .")
	  $("#date").datepicker();
	
	/*$("#myform").on('submit',function(event){
		console.log("inside submit")
		event.preventDefault();
		var f =$(this).serialize();
		console.log(f);
		
	});*/
	$("#student").on('change',function(){
		console.log("inside student");
		 
		var student = $("#student").val();
		$.ajax({
			url:"getBarChartDatapoints.jsp",
			data:{"id":student},
			type:"POST",
			success:function(data){
				console.log(data);
				myfunction(jQuery.parseJSON(data));
			}
		});
	});

});
</script>
</body>
</html>