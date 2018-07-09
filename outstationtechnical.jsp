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

<body class="mfbg" id="page-top">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb" style="background-color:transparent;">
        <li class="breadcrumb-item">
          <a href="index.html" target="_top">Home</a>
        </li>
        <li class="breadcrumb-item active" >ECA & CCA&nbsp; / &nbsp;Outstation Technical Visits</li>
      </ol>
      <!-- main content-->
	  
		
	<div class="container">
		<form action="outstationtechnicalvisits"  method="post" name="form1" onsubmit="document.form1.target='display_frame';return true;">	
		<div class="form-group">
			<div class="row">
				<div class="col-sm-2">
				</div>
				<div class="col-sm-2">
					<label for="rollno"><b>Roll No.:</b></label>
					<input class="form-control" name="rollno" id="rollno" type="text" value="<%=(String)request.getSession().getAttribute("user_id")%>"  style="background-color:white;" readonly>
				</div>
				<div class="col-sm-4">
					<label for="studentname"><b>Student Name:</b></label>
					<input class="form-control" id="id_studentname" type="text" value="<%=(String)request.getSession().getAttribute("user_name")%>"  style="background-color:white;" readonly>
				</div>
				<div class="col-sm-2">
					<label for="year"><b>Year:</b></label>
					<select class="form-control subsearch" id="year" name="year">
						<option value="Select" hidden>Select</option>
						<option value ="1" id="1">I</option>
						<option value ="2" id="2">II</option>
						<option value ="3" id="3">III</option>
						<option value ="4" id="4">IV</option>
					</select>
				</div>
				<div class="col-sm-2">
					<br>
					<button type="submit" class="btn btn-primary" name="search" id="search" disabled>Search</button>
				</div>
				<div class="col-sm-1">
				</div>
			</div></div>
			<h3>Add Record</h3>
			<div class="row">
			<div class="wrap-table100">
				<div class="table100">
			<table class="table table-hover" id='data'>
				<thead>
					<div class="row">	
						<tr class="table100-head theadrow">
							<div class="col-sm-3"><th ><center>Name of the Industry visited</center></th></div>
							<div class="col-sm-2"><th ><center>Date of visit</center></th></div>
							<div class="col-sm-4"><th ><center>Learning points</center></th></div>
							<div class="col-sm-3"><th ><center>Action plan</center></th></div>
						</tr>
					</div>
				</thead>
				<tbody>
					<div class="row">
						<tr class="tbodyrow">
							<div class='col-sm-3'><td><textarea class='form-control subsave-area' rows='2' cols='50' maxlength="100" name='nameoftheindustryvisited' id='id_nameoftheindustryvisited' ></textarea><p id="max-name">0/100</p></td></div>
							<div class='col-sm-2'>
								<td>
									<div class="controls input-append date form_date" data-date="" data-date-format="dd-mm-yyyy" data-link-field="id_date" data-link-format="yyyy-mm-dd">
										<p><input class=' form-control subsave-date' type="text" value="" Style="background-color: white;" placeholder="dd-mm-yyyy" id="id_dateofinteraction"readonly>
										<span class="add-on" id="id_span"><i class="fa fa-calendar "></i></span></p>	
									</div>
									<input type="hidden" name="dateofvisit" id="id_date" value="" />
								</td>
							</div>
							<div class='col-sm-3'><td><textarea class='form-control subsave-area' rows='2' cols='50' name='learningpoints' id='id_learningpoints' maxlength="2000" ></textarea><p id="max-learning">0/2000</p></td></div>
							<div class='col-sm-3'><td><textarea class='form-control subsave-area' rows='2' cols='50' name='actionplan' id='id_actionplan' maxlength="2000" ></textarea><p id="max-action">0/2000</p></td></div>		
							<textarea id="id_nameoftheindustryvisited1" name='nameoftheindustryvisited1' style='display:none'></textarea>
							<textarea id="id_learningpoints1" name='learningpoints1' style='display:none'></textarea>
							<textarea id="id_actionplan1" name='actionplan1' style='display:none'></textarea>
						</tr>     
					</div>
				</tbody>	
			</table>
			
			<center>
				<button type="submit" class="btn btn-primary" name="save" id="save" disabled onclick="document.getElementById('id_nameoftheindustryvisited').value = '';document.getElementById('id_dateofinteraction').value= '';document.getElementById('id_learningpoints').value = '';document.getElementById('id_actionplan').value = '';document.getElementById('max-name').innerHTML = '0/100';document.getElementById('max-learning').innerHTML = '0/100';document.getElementById('max-action').innerHTML = '0/100';">Save</button>
				<button type="button" class="btn btn-info" onclick="document.getElementById('id_nameoftheindustryvisited').value = '';document.getElementById('id_dateofinteraction').value= '';document.getElementById('id_learningpoints').value = '';document.getElementById('id_actionplan').value = '';document.getElementById('max-name').innerHTML = '0/100';document.getElementById('max-learning').innerHTML = '0/100';document.getElementById('max-action').innerHTML = '0/100';">Reset</button>
			</center><br/>
			<h3>View Records</h3>
			<div class="embed-responsive embed-responsive-16by9" style="background-color:transparent;">
				<iframe class="embed-responsive-item" src="empty.html" name="display_frame"></iframe>
			</div>
			</div>
			</div>
		</div>
		</form>
		</div>
		
		<!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
	
      
      
      
      
    

<!--=====================================Script links==============================================-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	<script type="text/javascript" src="js/bootstrap-date.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<!--new links-->
<!--===============================================================================================-->

<!--========================================Scripts================================================-->
<script type="text/javascript">
	$(document).ready(function(){ 
	
		$('#search').prop('style','cursor:not-allowed;');
		$('#save').prop('style','cursor:not-allowed;');
	
     $('#id_nameoftheindustryvisited,#id_learningpoints,#id_actionplan').on("input",function ()  {
		
		if($('#id_nameoftheindustryvisited').val().length <= 100)
		{
		  $('#max-name').text($('#id_nameoftheindustryvisited').val().length+'/100');
		}
		if($('#id_learningpoints').val().length <= 2000)
		{
		  $('#max-learning').text($('#id_learningpoints').val().length+'/2000');
		}
		if($('#id_actionplan').val().length <= 2000)
		{
		  $('#max-action').text($('#id_actionplan').val().length+'/2000');
		}
       });
	
	 $("#year").on('mouseup mousedown keyup keydown',function(){  
		   if($('#year').val()!='Select')
			{
				$('#search').attr('disabled',false);
				$('#search').prop('style','cursor:pointer;');
    	    }
			else
			{
			    $('#search').attr('disabled',true);
				$('#search').prop('style','cursor:not-allowed;');
			}
	    });
		
		$('#save,#id_nameoftheindustryvisited,#id_dateofinteraction,#id_date,#id_learningpoints,#id_actionplan,#year').on('keyup keydown mouseup mousedown',function(){
			 if($('#id_nameoftheindustryvisited').val() && $('#id_learningpoints').val() && $('#id_actionplan').val() && $('#id_dateofinteraction').val() && $('#year').val()!='Select')
			 {
					$('#save').attr('disabled',false);
					$('#save').prop('style','cursor:pointer;');
			 }
			 else
			 {
			      $('#save').attr('disabled',true);
				  $('#save').prop('style','cursor:not-allowed;');
			 }
	    });	
		
	
	$('#id_nameoftheindustryvisited').on("keyup keydown mouseup mousedown",function(){
			$('#id_nameoftheindustryvisited1').text($('#id_nameoftheindustryvisited').val());
		});
		
		$('#id_learningpoints').on("keyup keydown mouseup mousedown",function(){
			$('#id_learningpoints1').text($('#id_learningpoints').val());
		});
		
		$('#id_actionplan').on("keyup keydown mouseup mousedown",function(){
			$('#id_actionplan1').text($('#id_actionplan').val());
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
	 
	<!--date script-->
	$('.form_date').datetimepicker({
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
 </script>
<!--===============================================================================================-->
</script>
</body>

</html>

