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
  
<style>

</style>

</head>

<body class="mfbg" id="page-top">
  
      <!-- Breadcrumbs-->
      <ol class="breadcrumb" style="background-color:transparent;">
        <li class="breadcrumb-item">
          <a href="index.html" target="_top">Home</a>
        </li>
        <li class="breadcrumb-item active" >Mentoring&nbsp; / &nbsp;Mentor-Mentee-Meetings</li>
      </ol>
<div class="container"  >	
		<form action="mentor_mentee_meetings"  method="post" name="form1" target="display_frame">	
		<div class="form-group">
			<div class="row">
				
		
				<div class="col-sm-2">
					<label for="rollno"><b>Roll No.:</b></label>
					<input class="form-control" name="rollno"  id="rollno" type="text" value="<%=(String)request.getSession().getAttribute("user_id")%>"  style="background-color:white;"  readonly>
				</div>
				<div class="col-sm-4">
					<label for="studentname"><b>Student Name:</b></label>
					<input class="form-control" id="id_studentname" type="text" value="<%=(String)request.getSession().getAttribute("user_name")%>" style="background-color:white;"  readonly >
				</div>
				<div class="col-sm-2">
					<label for="year"><b>Year:</b></label>
					<select class="form-control subsearch" name="year" id="year">
						<option hidden>Select</option>
						<option value="1">I</option>
						<option value="2">II</option>
						<option value="3">III</option>
						<option value="4">IV</option>
					</select>
				</div>
				<div class="col-sm-2">
					<label for="semester"><b>Semester:</b></label>
					<select class="form-control subsearch" name="semester" id="semester">
						<option hidden>Select</option>
						<option value="1">I</option>
						<option value="2">II</option>
					</select>
				</div>
				<div class="col-sm-2">
					<br/>
					<button type="submit" class="btn btn-primary" name="search" id="search" disabled>Search</button>
				</div>
				<br/><br/>
				
			</div></div><br/>
			<h3>Add Record</h3>
			<table class="table " id='data' >
				<thead>
					<div class="row">	
						<tr class="table100-head theadrow">
							<div class="col-sm-2"><th><center>Date of Interaction</center></th></div>
							<div class="col-sm-9"><th><center>Remarks / Advice / Guidance</center></th></div>
						</tr>
					</div>						
				</thead>
				<tbody>
					<div class="row">
						<tr class="tbodyrow">
							<div class='col-sm-2'>
								<td>
									<div class="controls input-append date form_date" data-date="" data-date-format="dd-mm-yyyy" data-link-field="id_date" data-link-format="yyyy-mm-dd">
										<p><input class="form-control subsave-date" type="text" value="" Style="background-color: white;" placeholder="dd-mm-yyyy" id="id_dateofinteraction"readonly>
										<span class="add-on"><i class="fa fa-calendar "></i></span></p>	
									</div>
									<input type="hidden" name="dateofinteraction" id="id_date" value="" />
								</td>
							</div>
							<div class='col-sm-9'><td><textarea class="form-control normal subsave-area" rows='2' cols='70' name='remarks' id="id_remarks" maxlength="1000"></textarea><p id="max_remarks">0/1000</p></td></div>
						</tr>
					</div>
				</tbody>
			</table>
			<br/>
			<center>
			<button type="submit" class="btn btn-primary" name="save" id="save" disabled>Save</button> 
			<button type="button" onclick="document.getElementById('id_dateofinteraction').value = '';document.getElementById('id_remarks').value= '';document.getElementById('max_remarks').innerHTML = '0/1000'" class="btn btn-info ">Reset</button>
			</center>
			
			<h3>View Records</h3>
			<div class="embed-responsive embed-responsive-1by1" >
				<iframe class="embed-responsive-item"  src="empty.html" name="display_frame"></iframe>
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
	
	<!--date scripts links-->
	<script type="text/javascript" src="js/jquery-1.8.3.min.js" charset="UTF-8"></script>
	<!--<script type="text/javascript" src="js/bootstrap-date.min.js"></script>-->
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    
	<!--new links-->
	<!--auto textarea size-->
	<script src='js/jquery.autosize.js' charset="UTF-8"></script>
	<!--modal-->
	<script src='js/jquery.modal.js' charset="UTF-8"></script>
<!--===============================================================================================-->
  	
<!--========================================Scripts================================================-->
	<script type="text/javascript">
	
  //   $(document).ready(function(){  
	   $('#id_remarks').on("input",function(){
		   $('#max_remarks').text('/1000');
		   if($('#id_remarks').val().length <= 1000)
		  {
		     $('#max_remarks').text($('#id_remarks').val().length+'/1000');
		  }
       });


	  var rollno= $("#rollno").val();//$("#rollno").val();
	  var year=rollno.substr(0,2);<!-- string -->
	  year=parseInt(year);
	  
	  var d = new Date();  
      var present_year = d.getFullYear();<!-- year format 2018-->
	  var present_month = d.getMonth() ; //month method returns '0' for 'January'
	 
	   present_year=present_year%1000;<!-- 18 -->
	 
	   var diff=present_year-year + 1;
	   var t=$('#year > option').last().val() ; 
	   if(present_month >= 5)//enabling from june(5) month 
	   {
	     diff=diff+1;
	     alert(diff);
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

  </script>
<!--===============================================================================================-->
 
  
	
</body>

</html>
