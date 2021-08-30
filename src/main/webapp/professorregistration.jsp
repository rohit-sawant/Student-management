<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.List"%>
<%@page import="com.entities.Specialization"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>

 <%@page import="javax.servlet.ServletException,javax.servlet.*,com.helper.FactoryProvider,org.hibernate.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Professor Registration</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<div class="container">

			<h3 class="text-center">Professor Registration</h3>
			<form action="SaveProfessor" method="post"
				class="p-3 border border-dark">
				<div class="form-row">
					<div class="form-group col-6">
						<label for="name">Name</label> <input required name="name"
							type="text" class="form-control" id="name"
							placeholder="Enter your name...">
					</div>
					<div class="form-group col-6">
						<label for="email">Email</label> <input required name="email"
							type="email" class="form-control" id="email"
							placeholder="Enter your email...">
					</div>

					<div class="form-group col-6">
						<label for="age">Age</label> <input required name="age"
							type="number" class="form-control" id="age"
							placeholder="Enter your age...">
					</div>
					<div class="form-group col-6">
						<label for="contact">Contact</label> <input required
							name="contact" type="number" class="form-control" id="contact"
							placeholder="Enter your contact number...">
					</div>
					<div class="form-group col-6">
						<label for="specialization">Specialization</label> <select
							id="specialization" name="specialization" class="form-control"
							required>
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


				</div>
				<div class="container text-center">
					<button type="submit" class="btn btn-primary">Add</button>

				</div>
			</form>
		</div>


	</div>
	</div>
	<script type="text/javascript">
$(document).ready(function(){
	console.log("page is ready . . .");
})
</script>
</body>
</html>