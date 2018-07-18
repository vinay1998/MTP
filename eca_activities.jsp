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
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css"  type="text/css">
  <link rel="stylesheet" href="vendor/datatables/dataTables.bootstrap4.css" >
  <link href="css/sb-admin.css" rel="stylesheet">
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
    <!--modal--->
  <link href="css/jquery.modal.css" rel="stylesheet">
<!--===============================================================================================-->  
  
</head>

<body id="page-top">
<!-- Breadcrumbs-->
      <ol class="breadcrumb" style="background-color:transparent;">
        <li class="breadcrumb-item">
          <a href="index.jsp" target="_top">Home</a>
        </li>
        <li class="breadcrumb-item active">ECA & CCA&nbsp; / &nbsp;ECA Activities</li>
      </ol>
	  
<!-- main content-->
	<div class="container">
		<form action="ecaactivities" method="post" target="display_frame">
		<div class="form-group">
			<div class="row">
				<div class="col-sm-2">
				</div>
				<div class="col-sm-2">
					<label for="rollno"><b>Roll No.:</b></label>
					<input class="form-control" id="rollno" name="rollno" type="text" value="<%=(String)request.getSession().getAttribute("user_id")%>"  style="background-color:white;" readonly>
				</div>
				<div class="col-sm-3">
					<label for="studentname"><b>Student Name:</b></label>
					<input class="form-control" id="id_studentname" name="studentname" type="text" value="<%=(String)request.getSession().getAttribute("user_name")%>"  style="background-color:white;" readonly>
				</div>
				<div class="col-sm-2">
					<label for="year"><b>Year:</b></label>
					<select class="form-control subsearch" id="year" name="year">
						<option value="Select" hidden>Select</option>
						<option value ="1" id='1'>I</option>
						<option value ="2" id='2'>II</option>
						<option value ="3" id='3'>III</option>
						<option value ="4" id='4'>IV</option>
					</select>
				</div>
				
				<div class="col-sm-2">
					<br>
					<button type="submit" class="btn btn-primary" name="search" id="search" disabled title="Choose Year and Semester to enable">Search</button>
				</div>
				<div class="col-sm-2">
				</div>
			</div>
		</div>
			
			<h3>Add Record</h3>
			<table class="table table-hover" id='data'>
				<thead>
					<div class="row">					
						<tr class="table100-head theadrow">
							<div class="col-sm-2"><th><center>ECA Activity</center></th></div>
							<div class="col-sm-8"><th><center>Interests and Participation</center></th></div>
							
						</tr>
					</div>
				</thead>
				<tbody>
					<div class="row">
						<tr class="tbodyrow">
							<div class="col-sm-2">
								<td>
									<input type="hidden" id='eca1' name="eca1">
									<select class="form-control subsave-drop" id="eca" name="eca_activities">
											<option hidden>Select</option>
											<option  id='1'>Literary Activities</option>
											<option id='2'>Music Activities</option>
											<option  id='3'>Performing Arts</option>
											<option  id='4'>Creative Arts</option>
											<option  id='5'>Sintillashunz</option>
											<option  id='6'>Games & Sports</option>
											<option  id='7'>NSS</option>
											<option  id='8'>Celebrations</option>
											<option id='9'>Other Activities</option>
									</select>
								</td>
							</div>
							<div class="col-sm-8">
								<td><textarea class="form-control subsave-area normal" rows="2" cols="70" id="interests" name="interests" maxlength="2000"></textarea><p id="max_interests">0/2000</p></td>
							</div>
							<textarea id="id_interests1" name="interests1" style='display:none'></textarea>
						</tr>
					</div>	
					</tbody>
					</table>
					<center>
						<button type="submit" class="btn btn-primary" name="save" id="save" disabled title=""  onclick="document.getElementById('eca').value = 'Select';document.getElementById('interests').value= '';document.getElementById('max_interests').innerHTML = '0/1000';">Save</button>
						<button type="reset" class="btn btn-info" onclick="document.getElementById('eca').value = 'Select';document.getElementById('interests').value= '';document.getElementById('max_interests').innerHTML = '0/1000';">Reset</button>
					</center>		
				<br>
				<h3>View Records</h3>
				<div class="embed-responsive embed-responsive-16by9" style="background-color:transparent;">
					<iframe class="embed-responsive-item" src="empty.html" name="display_frame" style="background-color:transparent;"></iframe>
				</div>		
		
	</form>
	</div>
	
	
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
	
	<!--date scripts links-->
	<script type="text/javascript" src="js/jquery-1.8.3.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/bootstrap-date.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	<!--new links-->
	<!--auto textarea size-->
	<script src='js/jquery.autosize.js' charset="UTF-8"></script>
	<!--modal-->
	<script src='js/jquery.modal.js' charset="UTF-8"></script>
	<!---->
	<script src="js/main.js"></script>
<!--===============================================================================================-->
<script type="text/javascript">
    $(document).ready(function(){
	
	    $('#eca').click(function(){
         $('#eca1').val($('#eca').val()); 
        });
    
	
		
		
	
		$('#interests').on("input",function(){
			$('#max_remarks').text('/2000');
				if($('#interests').val().length <= 2000)
				{
					$('#max_interests').text($('#interests').val().length+'/2000');
				}
		});
	
		$('#interests').on("keyup keydown mouseup mousedown",function(){
			$('#id_interests1').text($('#interests').val());
		});
	
		
		
		
					
	var rollno= "15071A1201"<!--$("#id_rollno").val();-->
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
    
    });    
</script>


</body>

</html>

