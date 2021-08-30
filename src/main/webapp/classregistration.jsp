<%@page import="java.util.List"%>
<%@page import="com.entities.Specialization"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="javax.servlet.ServletException,javax.servlet.*,com.helper.FactoryProvider,org.hibernate.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Registration</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<div class="container">

			<h3 class="text-center">Class Registration</h3>
			<form action="SaveClass" method="post"
				class="p-3 border border-dark" id="myform" name="myform">
				<div class="form-row">
					<div class="form-group col-6" >
						<label for="name">Name</label> <input required name="name"
							type="text" class="form-control" id="name"
							placeholder="Enter class name...">
					</div>
					<div class="form-group col-6" style="display:none">
						<label for="num_of_students">Number of Students</label> <input required name="num_of_students"
							type="number" class="form-control" id="num_of_students"
							placeholder="Enter number of students... " value=0>
					</div>
					<div class="form-group col-6">
						<label for="date">Date</label> <input required name="date"
							type="text" class="form-control" id="date"
							placeholder="Enter your Date...">
					</div>
				
				
				<div class="form-group col-6">
						<label for="specialization">Specialization</label> 
						<select id="specialization"
							name="specialization" class="form-control" required>
							<option value="" selected>Select specialization</option>
							<%
				Session session1 = FactoryProvider.getSessionFactory().openSession();
				Transaction transaction = session1.beginTransaction();
				Query q = session1.createQuery("FROM Specialization");
		    	List<Specialization> listofSpecializations = q.list();
		    	for(Specialization s :listofSpecializations){
		    		%>
		    		<option value=<%=s.getSpecialization_id() %>><%=s.getSpecialization_name() %></option>
		    		<% 
		    	}
				transaction.commit();
				session1.close();
				%>
						</select>
					</div>
					
				<div class="form-group col-6">
				<label for="professor">Professor</label> 
						<select id="professor"
							name="professor" class="form-control" required>
							<option value="" selected>Select professor</option>
							</select>
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
				
				<div class="container text-center">
					<button type="submit" class="btn btn-primary">Add</button>

				</div>
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
	$("#specialization").on('change',function(){
		console.log("inside specialization");
		 
		var specialization_id = $("#specialization").val();
		$.ajax({
			url:"getProfessorForClassReg.jsp",
			data:{"id":specialization_id},
			type:"POST",
			success:function(data){
				console.log(data);
				$("#professor").html(data);
				
			}
		});
	});

});
</script>
	
</body>
</html>