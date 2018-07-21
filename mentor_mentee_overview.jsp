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
          <a href="index.jsp" target="_top">Home</a>
        </li>
        <li class="breadcrumb-item active">Mentoring&nbsp; / &nbsp;Mentor - Mentee Overview</li>
    </ol>
	  
    <!-- main content-->	
	<div class="container">	
	<form action="mentor_mentee_overview"  method="post" name="form1" target="display_frame">	
		<div class="form-group">
			<div class="row">				
				<div class="col-sm-2">
				</div>
				<div class="col-sm-2">
					<label for="rollno"><b>Roll No.:</b></label>
					<input class="form-control" name="rollno"  id="rollno" type="text" value="<%=(String)request.getSession().getAttribute("user_id")%>"  style="background-color:white;"  readonly>
				</div>
				<div class="col-sm-4">
					<label for="studentname"><b>Student Name:</b></label>
					<input class="form-control" id="id_studentname" type="text" value="<%=(String)request.getSession().getAttribute("user_name")%>" style="background-color:white;"  readonly >
				</div>
				<div class="col-sm-2">
					<br/>
					<button type="submit" class="btn btn-primary" name="search" id="search" title="Choose Year and Semester to enable">Search</button>
				</div>
				<div class="col-sm-2">
				</div>
				<br/><br/>
			</div>
		</div>
		<br/>
		<h3>Add Record</h3>
		<table class="table table-hover" id='data'>
			<thead>
				<div class="row">	
					<tr class="table100-head theadrow">
						<div class="col-sm-2">
							<th ><center>Date</center></th>
						</div>
						<div class="col-sm-5">
							<th><center>Topics Discussed</center></th>
						</div>
						<div class="col-sm-5">
							<th><center>Remarks</center></th>
						</div>
						
					</tr>
				</div>				
			</thead>
			<tbody >
				<tr class="tbodyrow">
					<div class="row">
						<div class='col-sm-2'>
							<td>
								<div class="controls input-append date form_date" data-date="" data-date-format="dd-mm-yyyy" data-link-field="id_date" data-link-format="yyyy-mm-dd">
									<p><input class="form-control subsave-date" type="text" value="" Style="background-color: white;" placeholder="dd-mm-yyyy" id="id_dateofinteraction"readonly>
									<span class="add-on"><i class="fa fa-calendar "></i></span></p>	
								</div>
								<input type="hidden" name="dateofinteraction" id="id_date" value="" />
							</td>
						</div>
						<div class="col-sm-5"><td name='topics_discussed'><textarea class="form-control normal subsave-area" rows="2" id="topics_discussed"></textarea><p id="max_topics">0/1000</p></td>
						</div>
						<div class="col-sm-5"><td name='remarks'><textarea class="form-control normal subsave-area" rows="2" id="remarks"></textarea><p id="max_remarks">0/1000</p></td>
						</div>

					</div>
					<textarea id="topicsdiscussed1" name="topics1" style='display:none'></textarea>
					<textarea id="remarks1" name="remarks1" style='display:none'></textarea>
				</tr>
			</tbody>
		</table>
		<center>
			<button type="submit" class="btn btn-primary" name="save" id="save" disabled title="fill above fields to enable" onclick="document.getElementById('id_date1').value = '';document.getElementById('topics_discussed').value= '';document.getElementById('remarks').value= '';document.getElementById('max_topics').innerHTML = '0/1000';document.getElementById('max_remarks').innerHTML = '0/1000';">
				Save
			</button> 
			<button type="button" onclick="document.getElementById('id_date1').value = '';document.getElementById('topics_discussed').value= '';document.getElementById('remarks').value= '';document.getElementById('max_topics').innerHTML = '0/1000';document.getElementById('max_remarks').innerHTML = '0/1000';" class="btn btn-info">
				Reset
			</button>
				
		</center>
		<br/>
		<h3>View Records</h3>
		<div class="embed-responsive embed-responsive-16by9">
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
 <script type="text/javascript">
    $(document).ready(function(){
	
			//$('#search').prop('style','cursor:not-allowed;');
			$('#save').prop('style','cursor:not-allowed;');
			
        $(".add").click(function(){
			table=$('#data tr');
			var count=(table.length/2)+1;
            var markup = "<tr><div class='col-sm-4'><td name='s-no'><center>"+count+"</center></td></div><div class='col-sm-1'><td name='date'><center><input class='form-control' id='dateofvisit' type='date'></center></td></div><div class='col-sm-4'><td name='topics-discussed'><textarea class='form-control' rows='2' cols='70' id='Topics Discussed'></textarea></td></div><div class='col-sm-3'><td name='remarks'><textarea class='form-control' rows='2' cols='70' id='remarks'></textarea></td></div><tr>";
            $(".table tbody").append(markup);
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

		
	
	$('#topics_discussed').on("input",function(){
			$('#max_topics').text('/1000');
				if($('#topics_discussed').val().length <= 1000)
				{
					$('#max_topics').text($('#topics_discussed').val().length+'/1000');
				}
		});
		
		$('#remarks').on("input",function(){
			$('#max_remarks').text('/1000');
				if($('#remarks').val().length <= 1000)
				{
					$('#max_remarks').text($('#remarks').val().length+'/1000');
				}
		});
	
	$('#topics_discussed').on("keyup keydown mouseup mousedown",function(){
			$('#topicsdiscussed1').text($('#topics_discussed').val());
		});
		
		$('#remarks').on("keyup keydown mouseup mousedown",function(){
			$('#remarks1').text($('#remarks').val());
		});
		
	
        
    });    
</script>



</body>
</html>
	
