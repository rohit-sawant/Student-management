<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    
    <title>Home</title>
    <%@include file="all_js_css.jsp" %>
  </head>
  <body>
    <div class="container-fluid p-0 m-0">
    	<%@include file="navbar.jsp" %>
    	<div class="container">

			<h3 class="text-center">Specialization Registration</h3>
			<form action="SaveSpecialization" method="post"
				class="p-3 border border-dark">
				<div class="form-row">
					<div class="form-group col-12">
						<label for="name">Name</label> <input required name="name"
							type="text" class="form-control" id="name"
							placeholder="Enter your name...">
					</div>
					

					
				</div>
				<div class="container text-center">
					<button type="submit" class="btn btn-primary">Add</button>

				</div>
			</form>
		</div>


	</div>
	</div>
    	
    	
    	
    	</div>
    </div>

      </body>
</html>