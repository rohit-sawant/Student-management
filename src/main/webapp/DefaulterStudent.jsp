<%@page import="org.hibernate.Transaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
		<%@page import="java.util.List"%>
<%@page import="com.entities.Class"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    
    <title>Default Students list</title>
    <%@include file="all_js_css.jsp" %>
  </head>
  <body>
    
<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<div class="container">

			<h3 class="text-center">Defaulter List</h3>
			<form  method="post"
				class="p-3 border border-dark" id="myform">
				<div class="form-row">
				<div class="form-group col-12">
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
					
				
				
				</div>
				<table class="table table-bordered display nowrap" id="mytable" >
								<thead>
									<tr>
										<th scope="col">Student id</th>
										<th scope="col">Student Name</th>
										<th scope="col">Class Name</th>
										<th scope="col">Professor Name</th>
										<th scope="col">Professor Contact</th>
									</tr>
								</thead>
								<tbody id="tbody">
									
								</tbody>
							</table>
				
			</form>
			
		</div>
		

	</div>
	<script type="text/javascript">
$(document).ready(function(){
	console.log("page is ready . . .")

	 
	$("#class").on('change',function(){
		console.log("inside class");
		 
		var class_id = $("#class").val();
		$.ajax({
			url:"getDefaultStudentList.jsp",
			data:{"id":class_id},
			type:"POST",
			success:function(data){
				console.log(data);
				$("#tbody").html(data);
				  $('#mytable').DataTable( {
					  "bPaginate":false,
				        dom: 'Bfrtip',
				        buttons: [
				             'excel', 'pdf', 'print'
				        ]
				    } );
			}
		});
	});

});
</script>
      </body>
</html>