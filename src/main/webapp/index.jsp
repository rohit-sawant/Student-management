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
    <div class="row my-3">
        <div class="col-md-4" onclick="location.href='studentregistration.jsp';">
            <div class="card text-center h-100">
                <div class="card-block">
                    <h4 class="card-title">Student Registration</h4>
                    <h2><i class="fa fa-home fa-3x"></i></h2>
                </div>
               
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center h-100">
                <div class="card-block" onclick="location.href='professorregistration.jsp';">
                    <h4 class="card-title">Professor Registration</h4>
                    <h2><i class="fas fa-chalkboard-teacher fa-3x"></i></h2>
                </div>
                
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center h-100">
                <div class="card-block" onclick="location.href='specialization.jsp';">
                    <h4 class="card-title">Specialization Registration</h4>
                    <h2><i class="fas fa-graduation-cap fa-3x"></i></i></h2>
                </div>
                
            </div>
        </div>
    </div>
    <div class="row my-3">
        <div class="col-md-4">
            <div class="card text-center h-100">
                <div class="card-block" onclick="location.href='classregistration.jsp';">
                    <h4 class="card-title">Class Registration</h4>
                    <h2><i class="fa fa-home fa-3x"></i></h2>
                </div>
                
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center h-100">
                <div class="card-block" onclick="location.href='addstudentforclass.jsp';">
                    <h4 class="card-title">Add Student For Class</h4>
                    <h2><i class="fas fa-chalkboard-teacher fa-3x"></i></h2>
                </div>
                
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center h-100">
                <div class="card-block" onclick="location.href='Attendance.jsp';">
                    <h4 class="card-title">Take Attendance</h4>
                    <h2><i class="fas fa-chalkboard-teacher fa-3x"></i></h2>
                </div>
                
            </div>
        </div>
    </div>
</div>
    	
    	
    	</div>
    </div>

      </body>
</html>