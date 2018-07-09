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
 
 
<body>
      <!-- Breadcrumbs-->
      <ol class="breadcrumb" style="background-color:transparent;">
        <li class="breadcrumb-item">
          <a href="index.html" target="_top">Home</a>
        </li>
        <li class="breadcrumb-item active">ECA & CCA&nbsp; / &nbsp;CCA Activities</li>
      </ol>
	  
	  
	  
	  
      <!-- main content-->
	<div class="container">
	<form action="ccaactivities" method="post" target="display_frame">
		<div class="container-table100">
		<div class="container">
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
			</div></div>
			
			<h3>Add Record</h3>
			<table class="table table-hover" id='data'>
				<thead>
					<div class="row">					
						<tr class="table100-head theadrow">
							<div class="col-sm-2"><th><center>CCA Activity</center></th></div>
							<div class="col-sm-8"><th><center>Interests and Participation</center></th></div>
						</tr>
					</div>
				</thead>
				<tbody>
					<div class="row">
						<tr class="tbodyrow">
							<div class="col-sm-2">
								<td>
									<input type="hidden" id='cca1' name="cca1">
									<select class="form-control " id="cca" name="cca">
										<option hidden>Select</option>
										<option id='sc'>Student Chapter</option>
										<option id='da'>Department Association</option>
										<option id='vector'>Vector</option>
										<option id='con'>Convergence</option>
										<option id='rcc'>Research & Consultancy Cell(RCC)Works</option>
										<option id='other'>Other Student Club Activities</option>
									</select><br>
									<select class="form-control" id="studentchapter"><option hidden>Select</option>
										<option>CSI</option>
										<option>IEEE</option>
										<option>ISOI</option>
										<option>ISTE</option>
										<option>VLSI</option>
									</select>
                                    <select class="form-control" id="deptassociation"><option hidden>Select</option>
										<option>CSE</option>
										<option>IT</option>
										<option>CE</option>
										<option>ECE</option>
										<option>ME</option>
										<option>EIE</option>
										<option>AE</option>
										<option>EEE</option>
									</select>
								</td>
							</div>
							<div class="col-sm-8">
								<td><textarea class="form-control normal" rows="2" cols="70" id="interests" name="interests" maxlength="2000"></textarea><p id="max_interests">0/2000</p></td>
							</div>
							<textarea id="id_interests1" name='interests1' style='display:none'></textarea>
						</tr>
						</div>	
					</tbody>
				</table>
				
				<center><button type="submit" class="btn btn-primary" name="save" id="save" disabled title="fill above fields to enable" title="fill above fields to enable" onclick="document.getElementById('deptassociation').style.display='none';document.getElementById('studentchapter').style.display='none';document.getElementById('cca').value = 'Select';document.getElementById('deptassociation').value='Select';document.getElementById('studentchapter').value='Select';document.getElementById('interests').value= '';document.getElementById('max_interests').innerHTML = '0/1000';">
										Save
									</button>
									<button type="button" class="btn btn-info" onclick="document.getElementById('deptassociation').style.display='none';document.getElementById('studentchapter').style.display='none';document.getElementById('cca').value = 'Select';document.getElementById('deptassociation').value='Select';document.getElementById('studentchapter').value='Select';document.getElementById('interests').value= '';document.getElementById('max_interests').innerHTML = '0/1000';">
										Reset
									</button></center>
				<h3>View Records</h3>
				<div class="embed-responsive embed-responsive-1by1" style="background-color:transparent;">
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
	<script src="js/main.js"></script>
	<!--date scripts links-->
	<script type="text/javascript" src="js/jquery-1.8.3.min.js" charset="UTF-8"></script>
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
	
	    $('#studentchapter,#deptassociation').click(function(){
		 if($('#cca').val() == 'Student Chapter' && $('#studentchapter').val()!='Select')
        { 
        	$('#cca1').val($('#cca').val()+'->'+$('#studentchapter').val()); 
        }
        if($('#cca').val() == 'Department Association' && $('#deptassociation').val()!='Select')
        {
        	$('#cca1').val($('#cca').val()+'->'+$('#deptassociation').val());  
        }
        });
		
		
		$('#studentchapter').hide();
        $('#deptassociation').hide();
        $('#cca').change(function(){
    	if($('#cca').val()=='Student Chapter')
        {   
			$('#cca1').val($('#cca').val()); 
        	$('#studentchapter').show();
            $('#deptassociation').hide();
        }
        else if($('#cca').val()=='Department Association')
        {   
			$('#cca1').val($('#cca').val()); 
        	$('#deptassociation').show();
            $('#studentchapter').hide();
        }
		else
        { 
        	$('#deptassociation').hide();
            $('#studentchapter').hide();
			$('#cca1').val($('#cca').val());
        }
        
        });
    
	
		
		$('#save').prop('style','cursor:not-allowed;');
	
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
		

		
		$('#save,#interests,#cca,#year,#studentchapter,#deptassociation').on('keyup keydown mouseup mousedown',function(){
		     if($('#cca').val()=='Student Chapter')
			 {  
				 if($('#interests').val() && $('#year').val()!='Select' && $('#studentchapter').val()!='Select')
				 { 
						$('#save').attr('disabled',false);
						$('#save').prop('style','cursor:pointer;');
						$('#save').prop('title', 'Click me to Save Records');
				 }
				 else 
				 {
					  $('#save').attr('disabled',true);
					  $('#save').prop('style','cursor:not-allowed;');
					  $('#save').prop('title', 'Enable me by filling above fields');
				 }
			 }
			 else if($('#cca').val()=='Department Association')
			 {  
				if($('#interests').val() && $('#year').val()!='Select' && $('#deptassociation').val()!='Select')
				 {
						$('#save').attr('disabled',false);
						$('#save').prop('style','cursor:pointer;');
						$('#save').prop('title', 'Click me to Save Records');
				 }
				 else 
				 {
					  $('#save').attr('disabled',true);
					  $('#save').prop('style','cursor:not-allowed;');
					  $('#save').prop('title', 'Enable me by filling above fields');
				 }
			 }
			 else if($('#cca').val()!='Select')
			 {
			     if($('#interests').val() && $('#cca').val()!='Select' && $('#year').val()!='Select')
				 {
						$('#save').attr('disabled',false);
						$('#save').prop('style','cursor:pointer;');
						$('#save').prop('title', 'Click me to Save Records');
				 }
				 else
				 {
					  $('#save').attr('disabled',true);
					  $('#save').prop('style','cursor:not-allowed;');
					  $('#save').prop('title', 'Enable me by filling above fields');
				 }
			 }
			 if(!($('#interests').val() && $('#cca').val()!='Select' && $('#year').val()!='Select'))
			 {
			      $('#save').attr('disabled',true);
				  $('#save').prop('style','cursor:not-allowed;');
				  $('#save').prop('title', 'Enable me by filling above fields');
			 }
			 else
			 {

			 }
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
    
    $('.dropdown-submenu a.test').on("click", function(e){
        $(this).next('ul').toggle();
        e.stopPropagation();
        e.preventDefault();
        $('p').text($(this).text()+' \\');
    });
    $("#1").click(function(){
            $('p').append($(this).text());
    });
    $("#11").click(function(){
            $('p').text($(this).text());
    });
   // two-level dropdown
   
	$('#studentchapter').hide();
    $('#deptassociation').hide();
    $('#cca').change(function(){
    	if($('#cca').val()=='Student Chapter')
        {
        	$('#studentchapter').show();
            $('#deptassociation').hide();
        }
        else if($('#cca').val()=='Department Association')
        {
        	$('#deptassociation').show();
            $('#studentchapter').hide();
        }
        
        });
   

});  
</script>



</body>

</html>
