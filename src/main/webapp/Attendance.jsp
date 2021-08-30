<%@page import="org.hibernate.Transaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
		<%@page import="java.util.List"%>
<%@page import="com.entities.Class"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<div class="container">

			<h3 class="text-center">Attendance</h3>
			<form action="SaveAttendance" method="post"
				class="p-3 border border-dark" id="myform">
				<div class="form-row">
				<div class="form-group col-6">
						<label for="class">Class</label> <select
							id="class" name="class" class="form-control"
							required>
							<option value="" selected>Select Class</option>
							<%
						Session session1 = FactoryProvider.getSessionFactory().openSession();
						Query q = session1.createQuery("FROM Class");
				    	List<Class> listofClasses = q.list();
				    	for(Class c :listofClasses){
				    		%>
									<option value=<%=c.getClass_id() %>><%=c.getClass_name() %></option>
									<% 
				    	}
						session1.close();
				%>
						</select>
					</div>
					<div class="form-group col-6">
						<label for="date">Date</label> <input required name="date"
							type="text" class="form-control" id="date"
							placeholder="Enter your Date...">
					</div>
					<div class="form-group col-6">
					<label for="time">Timing</label> 
						<select id="time"
							name="time" class="form-control" required>
							<option value="" selected>Select Timing</option>
							<%
							int i=0;
							while(i<24)
							{
								%>
								<option value="<%=i+":00"%>"><%=i+":00"%></option>
								
								<option value="<%=i+":30"%>"><%=i+":30"%></option>
								<% 
							i += 1;
							}
							%>
							</select>
				</div>
					<div class="form-group col-6">
						<label for="title">Name of the subject</label> <input required name="name"
							type="text" class="form-control" id="name"
							placeholder="Enter your subject... ">
					</div>
				
				</div>
				<div class="container">
					<div class="row">
						<div class="col-12">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th scope="col">Select Student</th>
										<th scope="col">Student Name</th>

									</tr>
								</thead>
								<tbody id="tbody">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="container text-center">
					<button type="submit" class="btn btn-primary">Add</button>

				</div>
			</form>
		</div>


	</div>
	<script type="text/javascript">
$(document).ready(function(){
	console.log("page is ready . . .")
	  $("#date").datepicker();
	
	/*$("#myform").on('submit',function(event){
		console.log("inside submit")
		event.preventDefault();
		var f =$(this).serialize();
		console.log(f);
		
	});*/
	$("#class").on('change',function(){
		console.log("inside class");
		 
		var class_id = $("#class").val();
		$.ajax({
			url:"getStudentForAttendance.jsp",
			data:{"id":class_id},
			type:"POST",
			success:function(data){
				console.log(data);
				$("#tbody").html(data);
				
			}
		});
	});

});
</script>
</body>
</html>