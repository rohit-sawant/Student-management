<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>

<%@page import="com.entities.*"%>
<%@page import="com.entities.Specialization"%>
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

			<h3 class="text-center">Add Students for Class</h3>
			<form action="AddStudentToClass" method="post"
				class="p-3 border border-dark" id="myform">
				<div class="form-row">
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
							for (Specialization s : listofSpecializations) {
							%>
							<option value=<%=s.getSpecialization_id()%>><%=s.getSpecialization_name()%>
							</option>
							<%
							}
							transaction.commit();
							session1.close();
							%>
						</select>
					</div>
					<div class="form-group col-6">
						<label for="class">Class</label> <select id="class" name="class"
							class="form-control" required>
							<option value="" selected>Select class</option>
						</select>
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
		$(document).ready(function() {
			console.log("page is ready . . .")
/*		$("#myform").on('submit',function(event){
		console.log("inside submit")
		event.preventDefault();
		var f =$(this).serialize();
		console.log(f);
		
	});*/
			$("#specialization").on('change', function() {
				console.log("inside specialization");

				var specialization_id = $("#specialization").val();
				$.ajax({
					url : "getClassForAddStudentForClass.jsp",
					data : {
						"id" : specialization_id
					},
					type : "POST",
					success : function(data) {
						console.log(data);
						$("#class").html(data);

					}
				});
			});
			$("#specialization").on('change', function() {
				console.log("inside table");

				var specialization_id = $("#specialization").val();
				$.ajax({
					url : "getStudentForAddStudentForClass.jsp",
					data : {
						"id" : specialization_id
					},
					type : "POST",
					success : function(data) {
						console.log(data);
						$("#tbody").html(data);

					}
				});
			});

		});
	</script>
</body>
</html>