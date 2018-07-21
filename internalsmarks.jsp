<%@ page import="java.io.*,java.util.Date,java.text.SimpleDateFormat,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>VNR VJIET-MTP </title>
  
  
  <!--=====================================CSS links===============================================-->
  <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css" >
  <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css"  type="text/css">
  <link rel="stylesheet" href="vendor/datatables/dataTables.bootstrap4.css" >
  <link rel="stylesheet" href="css/sb-admin.css" >
  <link rel="stylesheet" href="css\bootstrap.min.css">
  <link rel="stylesheet" href="css\bootstrap-grid.css">
  <link rel="stylesheet" href="css\bootstrap-grid.min.css">
  <link rel="stylesheet" href="css\bootstrap-reboot.css">
  <link rel="stylesheet" href="css\bootstrap-reboot.min.css">
  <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
  <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
  <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
  <!-- table css -->
  <link rel="stylesheet" type="text/css" href="css/util.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <link rel="icon" href="img/vnrvjiet.jpg" type="image/png" />
  <!--===============================================================================================--> 

</head>
<body class="mfbg" id="page-top">



    <!-- Breadcrumbs-->
    <ol class="breadcrumb" style="background-color:transparent;">
        <li class="breadcrumb-item">
          <a href="index.jsp" target="_top">Home</a>
        </li>
        <li class="breadcrumb-item active" >Mentoring&nbsp; / &nbsp;Internal Marks</li>
    </ol>	
	
	
	<!-- main content-->
	<div class="container">	  
	  <form action="internalmarks" method="post"  target="display_frame">		
		<div class="container-table100">
			<div class="container">
				<div class="form-group">
					<div class="row">
						<div class="col-sm-2">
							<label for="rollno "><b>Roll No.:</b></label>
							<input class="form-control" name="rollno" id="rollno" type="text" value="<%=(String)request.getSession().getAttribute("user_id")%>"  style="background-color:white;"  readonly>
						</div>
						<div class="col-sm-4">
							<label for="studentname"><b>Student Name:</b></label>
							<input class="form-control" id="studentname" type="text" value="<%=(String)request.getSession().getAttribute("user_name")%>"  style="background-color:white;"  readonly>
						</div>
						<div class="col-sm-2">
							<label for="year"><b>Year:</b></label>
							<select class="form-control subsearch" name="year" id="year">
								<option hidden>Select</option>
								<option value='1' >I</option>
								<option value='2' >II</option>
								<option value='3' >III</option>
								<option value='4' >IV</option>
							</select>
						</div>
						<div class="col-sm-2">
							<label for="semester"><b>Semester:</b></label>
							<select class="form-control subsearch" name="semester" id="semester">
								<option hidden>Select</option>
								<option value='1' >I</option>
								<option value='2' >II</option>
							</select>
						</div>
						<div class="col-sm-2">
							<br/>
							<button type="submit" class="btn btn-primary" name="proceed" id="search" disabled>Proceed</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="embed-responsive embed-responsive-1by1">
			<iframe class="embed-responsive-item" src="empty.html" name="display_frame"></iframe>
		</div>
	</form> 
	</div>	
	
	<!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
<!--=====================================Script links==============================================-->
	
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
	
    <script src="js/bootstrap.bundle.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>  
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="js/sb-admin.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/sb-admin-datatables.min.js"></script>
    <script src="js/sb-admin-charts.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
    
	<!--new links-->
<!--===============================================================================================-->

<!--========================================Scripts================================================-->
	<script type="text/javascript">
	    		//year semester disable
	var rollno= $("#rollno").val();
	  var year=rollno.substr(0,2);<!-- string -->
	  year=parseInt(year);
	  
	  var d = new Date();  
      var present_year = d.getFullYear();<!-- year format 2018-->
	  var present_month = d.getMonth() ; //month method returns '0' for 'January'
	  //alert(d);
	   present_year=present_year%1000;<!-- 18 -->
	 
	   var diff=present_year-year + 1;
	   var t=$('#year > option').last().val() ; 
	   if(present_month >= 5)//enabling from june(5) month 
	   {
	     diff=diff+1;
	     //alert(diff);
	   }
	 while(diff<=t)
	 {
		 $('#year > option:nth-child('+(diff+1)+') ').prop('style','cursor:not-allowed');
		 $('#year > option:nth-child('+(diff+1)+') ').prop( "disabled", true );
	     diff=diff+1;
	 }
	 var temp = t - $('#year > option[disabled]').length ;			 
	 $('#year').change(function(){
		if($(this).val()==temp)
		{
		  $('#semester option').last().prop("disabled",true);
		}
		else
		{
		  $('#semester option').last().prop("disabled",false);
		}
	 });	
	//-----
	</script>
<!--===============================================================================================-->


</body>

</html>