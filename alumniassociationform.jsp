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
  <link rel="stylesheet" href="css\bootstrap.css">
  <link rel="stylesheet" href="css\bootstrap-grid.css">
  <link rel="stylesheet" href="css\bootstrap-grid.min.css">
  <link rel="stylesheet" href="css\bootstrap-reboot.css">
  <link rel="stylesheet" href="css\bootstrap-reboot.min.css">
  <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
  <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
  <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
  <link rel="stylesheet" type="text/css" href="css/util.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <link rel="icon" href="images/icons/favicon.ico" type="image/png" />
  <!--date css links-->
  <link href="css/bootstrap-date-edit.css" rel="stylesheet">
  <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<!--===============================================================================================-->  
  


</head>

<body  id="page-top">
  
  
      <!-- Breadcrumbs-->
      <ol class="breadcrumb" style="background-color:transparent;">
        <li class="breadcrumb-item">
          <a href="index.jsp">Home</a>
        </li>
        <li class="breadcrumb-item active">Alumni Association Form</li>
      </ol>
	  
	  
      <!-- main content-->

	<form method="post" action="alumniassociationform">
		<div class="form-group">
			<div class="container">
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-2">
					<label for="rollno"><b>Roll No.:</b></label>
					<input class="form-control" id="rollno" type="text" name="rollno" value="<%=(String)request.getSession().getAttribute("user_id")%>"  style="background-color:white;"  readonly>
				</div>	
				<div class="col-sm-4">
					<label for="studentname"><b>Name of the Student:</b></label>
					<input class="form-control" id="studentname" name="studentname" type="text" value="<%=(String)request.getSession().getAttribute("user_name")%>"  style="background-color:white;"  readonly>
				</div>
				<div class="col-sm-2">
				<label for="rollno"><b>Branch:</b></label>
				<select class="form-control" id="dept" title="Choose any option" name="dept" required>
		         	<option hidden>select</option>
			        <option>CSE</option>
			        <option>ECE</option>
			        <option>EEE</option>
			        <option>EIE</option>
			        <option>AE</option>
			        <option>IT</option>
			        <option>CE</option>
	                <option>ME</option>
		        </select>
				</div>
				
				
				<div class="col-sm-3">
					<!--<img src="cinqueterre.jpg" class="img-thumbnail" id="photo" name="photo" alt="Photograph">-->
				</div>
			</div><br>
			
			<div class="row">
			<div class="col-sm-1"></div>
				
				<div class="col-sm-2">
					<label for="studentname"><b>Telephone Number:</b></label>
					<input class="form-control" id="telno" name="telno" type="text">
					
				</div>
				<div class="col-sm-2">
					<label for="studentname"><b>Phone Number:</b></label>
					<input class="form-control" id="phoneno" name="phoneno" type="text">
					
				</div>
				<div class="col-sm-4">
					<label for="rollno"><b>Email Id:</b></label>
					<input class="form-control" id="email" name="email" type="text">
				</div>
				
				
				
			</div><br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-5">
					<label for="studentname"><b>Permanent Address:</b></label>
					<textarea class="form-control" rows="2" cols="90" id="permanant" name="permanant"></textarea>
					
				</div>
				<div class="col-sm-5">
					<label for="rollno"><b>Present Address:</b></label>
					<textarea class="form-control" rows="2" cols="90" id="present" name="present"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div>
			<br>
			
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-5">
					<label for="studentname"><b>Career Planning:</b></label>
					<textarea class="form-control" rows="2" cols="90" id="careerplan" name="careerplan"></textarea>
					
				</div>
				<div class="col-sm-5">
					<label for="rollno"><b>Company Name (recruited with):</b></label>
					<textarea class="form-control" rows="2" cols="90" id="companyname" name="companyname"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div>
			<br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div style='color:dodgerblue;'class="col-sm-8"><label for="rollno"><h6><b>Two References of known persons with Address and Telephone number</b></h6></label>
              
					
				</div>
				<div class="col-sm-5">
				</div>
				
				
			</div>
			
			<br>

			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-5">
					<label for="studentname"><b>Reference 1:</b></label>
					<textarea class="form-control" rows="2" cols="90" id="ref1" name="ref1"></textarea>
					
				</div>
				<div class="col-sm-5">
					<label for="rollno"><b>Reference 2:</b></label>
					<textarea class="form-control" rows="2" cols="90" id="ref2" name="ref2"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div> <br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div style='color:dodgerblue;'class="col-sm-8"><label for="rollno"><h6><b>Suggestions for improvement of the Institute in areas of :</b></h6></label>
              
					
				</div>
				<div class="col-sm-5">					
				</div>
				
			</div><br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-2">
					<label for="studentname"><b>Academics:</b></label>
				</div>
				<div class="col-sm-8">
					<textarea class="form-control" rows="2" cols="110" id="academics" name="academics"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div> <br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-2">
					<label for="studentname"><b>CCA:</b></label>
				</div>
				<div class="col-sm-8">
					<textarea class="form-control" rows="2" cols="110" id="cca" name="cca"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div><br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-2">
					<label for="studentname"><b>ECA:</b></label>
				</div>
				<div class="col-sm-8">
					<textarea class="form-control" rows="2" cols="110" id="eca" name="eca"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div><br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-2">
					<label for="studentname"><b>Sports:</b></label>
				</div>
				<div class="col-sm-8">
					<textarea class="form-control" rows="2" cols="110" id="sports" name="sports"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div> <br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-2">
					<label for="studentname"><b>Training:</b></label>
				</div>
				<div class="col-sm-8">
					<textarea class="form-control" rows="2" cols="110" id="training" name="training"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div> <br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-2">
					<label for="studentname"><b>Placements:</b></label>
				</div>
				<div class="col-sm-8">
					<textarea class="form-control" rows="2" cols="110" id="placements" name="placements"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div> <br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-2">
					<label for="studentname"><b>Student Services:</b></label>
				</div>
				<div class="col-sm-8">
					<textarea class="form-control" rows="2" cols="110" id="studentservices" name="studentservices"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div> <br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-2">
					<label for="studentname"><b>Others:</b></label>
				</div>
				<div class="col-sm-8">
					<textarea class="form-control" rows="2" cols="110" id="others" name="others"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div><br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div style='color:dodgerblue;'class="col-sm-8"><label for="rollno"><h6><b>Possible Areas of Contribution as Alumini :</b></h6></label>
              
					
				</div>
				<div class="col-sm-5">					
				</div>
				
			</div><br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-3">
					<label for="studentname"><b>Finding placements for Junior Students</b></label>
				</div>
				<div class="col-sm-7">
					<textarea class="form-control" rows="2" cols="90" id="findplacement" name="findplacement"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div><br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-3">
					<label for="studentname"><b>Scholarship</b></label>
				</div>
				<div class="col-sm-7">
					<textarea class="form-control" rows="2" cols="90" id="scholarship" name="scholarship"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div><br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-3">
					<label for="studentname"><b>Seminars(during visits)</b></label>
				</div>
				<div class="col-sm-7">
					<textarea class="form-control" rows="2" cols="90" id="seminars" name="seminars"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div><br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-3">
					<label for="studentname"><b>Mentoring(e-channels)</b></label>
				</div>
				<div class="col-sm-7">
					<textarea class="form-control" rows="2" cols="90" id="mentoring" name="mentoring"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div><br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-3">
					<label for="studentname"><b>Final Year Projects<br>(Ideas for projects /<br>Implementation Assistance-<br>Guidance)</b></label>
				</div>
				<div class="col-sm-7">
					<textarea class="form-control" rows="4" cols="90" id="projects" name="projects"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div><br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-3">
					<label for="studentname"><b>Projects to Research and<br>Consultancy Cell(RCC)</b></label>
				</div>
				<div class="col-sm-7">
					<textarea class="form-control" rows="2" cols="90" id="rcc" name="rcc"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div><br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-3">
					<label for="studentname"><b>Assistance in Infrastructure / Facilities:</b></label>
				</div>
				<div class="col-sm-7">
					<textarea class="form-control" rows="2" cols="90" id="infrastructure" name="infrastructure"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div><br>
			
			<div class="row">
				<div class="col-sm-1">
				</div>
				<div class="col-sm-3">
					<label for="studentname"><b>Others:</b></label>
				</div>
				<div class="col-sm-7">
					<textarea class="form-control" rows="2" cols="90" id="others" name="others"></textarea>
				</div>
				<div class="col-sm-1">
				</div>
				
			</div><br>
			
			
			</div><br>
			
		<center>
				<button type="submit" class="btn btn-primary" id="save" name="save">Save</button>
				<button type="reset" class="btn btn-info" id="reset" name="reset">Reset</button>
			</center>
			
			</div>
			
			</form>
  
    
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    
    <!--=====================================Script links==============================================-->
	<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
    <script src="js\bootstrap.bundle.js"></script>
    <script src="js\bootstrap.bundle.min.js"></script>
    <script src="js\bootstrap.js"></script>
    <script src="js\bootstrap.min.js"></script>
	<script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>  
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="js/sb-admin.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script src="js/main.js"></script>
	<!--date scripts links-->
	<script type="text/javascript" src="js/jquery-1.8.3.min.js" charset="UTF-8"></script>
	<!--<script type="text/javascript" src="js/bootstrap-date.min.js"></script>-->
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	<!--new links-->
<!--===============================================================================================-->
<script type="text/javascript">
    $(document).ready(function(){
        $(".add").click(function(){
			table=$('#data tr');
			var count=(table.length/2)+1;
            var markup = "<tr><div class='col-sm-4'><td name='s-no'><center>"+count+"</center></td></div><div class='col-sm-1'><td name='date'><center><input class='form-control' id='dateofvisit' type='date'></center></td></div><div class='col-sm-4'><td name='topics-discussed'><textarea class='form-control' rows='2' cols='70' id='Topics Discussed'></textarea></td></div><div class='col-sm-3'><td name='remarks'><textarea class='form-control' rows='2' cols='70' id='remarks'></textarea></td></div><tr>";
            $(".table tbody").append(markup);
        });
     
     var rollno= "15071A1201"<!--$("#rollno").val();-->
	 var year=rollno.substr(0,2);<!-- string -->
	 year=parseInt(year)<!--int-->
	 
	 var d = new Date();
     var present_year = d.getFullYear();<!-- year format 2018-->
	 present_year=present_year%1000;<!-- 18 -->
	 var diff=present_year-year;
	 if(diff===1)
	 {
	   $( "#2" ).prop( "disabled", true );   
	   $( "#3" ).prop( "disabled", true );   
	   $( "#4" ).prop( "disabled", true );   
	 }
	 else if(diff===2)
	 {
	   $( "#3" ).prop( "disabled", true );   
	   $( "#4" ).prop( "disabled", true );  
	 }
	 else if(diff===3)
	 {
	    $( "#4" ).prop( "disabled", true );  
	 }
	 else if(diff==4)
	 {
	    
	 }   	

		$('.form_date').datetimepicker({
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
        
    });    
</script>



</body>
</html>
	
