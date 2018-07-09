<%@ page import="java.io.*,java.util.Date,java.text.SimpleDateFormat,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<%
//global object declaration section
    Connection conn = null;
	Statement mentor_stmt = null;
	Statement mentee_stmt = null;
	response.setContentType("text/html");
	

	//jdbc logic section

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String dbURL = "jdbc:sqlserver://10.45.29.254;DatabaseName=VNR_Students_Record";
        String user = "sa";
        String pass = "vnrvjiet1@3";
		String mentor_id="";
        String from_date="";
		conn = DriverManager.getConnection(dbURL, user, pass);
		mentee_stmt = conn.createStatement();
		mentor_stmt = conn.createStatement();
		ResultSet mentee_rs=mentee_stmt.executeQuery("select EAMCET_ECET,Branch,Mentor1_ID,Mentor2_ID,Mentor3_ID,From_Date1,From_Date2,From_Date3 from Student_Master_Information where Student_Code='"+(String)request.getSession().getAttribute("user_id")+"'");
		mentee_rs.next();
		if(mentee_rs.getString(5)!=null)
		{
		mentor_id=mentee_rs.getString(5);
		}
		else if(mentee_rs.getString(4)!=null)
		{
		mentor_id=mentee_rs.getString(4);	
		}
		else{
		mentor_id=mentee_rs.getString(3);		
		}
		
		if(mentee_rs.getString(8)!=null)
		{
		from_date=mentee_rs.getString(8);
		}
		else if(mentee_rs.getString(7)!=null)
		{
		from_date=mentee_rs.getString(7);	
		}
		else{
		from_date=mentee_rs.getString(6);		
		}
		mentor_stmt = conn.createStatement();
		
		
		ResultSet mentor_rs=mentor_stmt.executeQuery("select Staff_Name,Date_Of_Birth,Designation,Academic_Qualification,Papers_National,Papers_International,Conferences_National,Conferences_International,Memberships_Of_Prof_Bodies,Consultations,Research_Interests,Other_Interests from Staff_Master where Staff_Code='"+mentor_id+"'");
		mentor_rs.next();
		
		
%><!--DOCTYPE html-->
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
<!--===============================================================================================-->  
  


</head>


<body id="page-top">

    
      <!-- Breadcrumbs-->
      <ol class="breadcrumb" style="background-color:transparent">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">Mentoring&nbsp; / &nbsp;Mentor-Mentee Information</li>
      </ol>
      <!-- main content-->
	  
	<div class="container">
	<form method="post" action="mentormenteeinformation">
		
		
		<table class="table table-hover">
		<thead>
			
		</thead>
		<tbody>
		<tr class="tbodyrow">
		<td>
		<h3 style="color:dodgerblue;"><center>Mentee Information</center></h3><br>
		<div class="form-group">
			<div class="row">
			<div class="col-sm-1">
					
				</div>
				<div class="col-sm-4">
					<label for="rollno"><b>Name:</b></label>
					<input class="form-control" id="studentname" type="text" value="<%=(String)request.getSession().getAttribute("user_name")%> style="background-color:white;" readonly>
				</div>
				<div class="col-sm-2">
					<label for="rollno"><b>Roll No:</b></label>
					<input class="form-control" id="rollno" value="<%=(String)request.getSession().getAttribute("user_id")%>"type="text" style="background-color:white;" readonly>
				</div>
				<div class="col-sm-2">
					<label for="studentname"><b>TS EAMCET Rank:</b></label>
					<input class="form-control" id="studentname" value="<%=mentee_rs.getString(1)%>" type="text" style="background-color:white;" readonly>
				</div>
				<div class="col-sm-2">
					<label for="studentname"><b>Branch:</b></label>
					<input class="form-control" id="studentname" value="<%=mentee_rs.getString(2)%>" type="text" style="background-color:white;" readonly>
				</div>
				
				</div>
			</div><br></td>
			</tr>
			<tr class="tbodyrow">
			<td>
			<h3 style="color:dodgerblue;"><center>Mentor Information</center></h3><br>
			
			<div class="row">
				<div style='text-align:right;' class="col-sm-2">
					<label for="designation"><b>  Name:</b></label>
				</div>
				<div class="col-sm-3">
					<input class="form-control" id="name" value="<%=mentor_rs.getString(1)%>" type="text" style="background-color:white;" readonly >
				</div>
				<div style='text-align:right;' class="col-sm-2">
					<label for="designation"><b>  Staff ID:</b></label>
				</div>
				<div class="col-sm-3">
					<input class="form-control" id="name" value="<%=mentor_id%>" type="text" style="background-color:white;" readonly >
				</div>
				
			</div><br>
			<div class="row">

				
				<div style='text-align:right;' class="col-sm-2">
					<label for="designation"><b>Designation:</b></label>
				</div>
				<div class="col-sm-3">
					<input class="form-control" id="designation" value="<%=mentor_rs.getString(3)%>" type="text"  style="background-color:white;" readonly>
				</div>
				<div style='text-align:right;'class="col-sm-3">
					<label for="qualification"><b>Academic Qualification:</b></label>
				</div>
				<div class="col-sm-3">
					<input class="form-control" id="qualification" value="<%=mentor_rs.getString(4)%>" type="text" style="background-color:white;" readonly>
				</div>
				
			</div><br>
			<div class="row">

				<div style='text-align:right;'class="col-sm-2">
					<label for="from"><b>&nbsp;From:</b></label>
				</div>
				<div style='text-align:right;' class="col-sm-3">
					<input class="form-control" id="from" type="text" value="<%=from_date%>" placeholder="dd-mm-yyyy"  style="background-color:white;" readonly>
				</div>
				<div style='text-align:right;'class="col-sm-2">
					<label for="dob"><b> Date of Birth:</b></label>
				</div>
				<div class="col-sm-2">
					<input class="form-control" id="dob" value="<%=mentor_rs.getString(2)%>" type="text" style="background-color:white;" readonly>
				</div>
				<div style='text-align:right;'class="col-sm-1">
					<label for="age"><b> Age:</b></label>
				</div>
				<div class="col-sm-1">
					<input class="form-control" id="age" type="text" value="" style="background-color:white;" readonly>
				</div>
			</div>	
			<br>
			<table class="table table-hover">
				<thead>
					<tr>
					
					</tr>
				</thead>
				<tbody>
					<tr class="tbodyrow"><td style='font-size: 18px;color: #000;line-height: 1.2;font-weight: unset;'colspan='2'><center><strong>Papers Published</strong></center></th></tr>
					<tr>
						<div class="row">
							<th><div><label for="comment"><strong>National</strong></label><textarea class="form-control" rows="3" id="ambition"  style="background-color:white;" readonly><%=mentor_rs.getString(5)%></textarea></div></th>
							<th><div><label for="comment"><strong>International</strong></label><textarea class="form-control" rows="3" id="goals"  style="background-color:white;" readonly><%=mentor_rs.getString(6)%></textarea></div></th>
						</div>
					</tr>	
					</tbody>
				<thead>
					<tr>
					<th style='font-size: 18px;color: #000;line-height: 1.2;font-weight: unset;'colspan='2'><center><b>Conferences Attended</b></center></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<div class="row">
							<td><div><label for="comment"><strong>National</strong></label><textarea class="form-control" rows="3" id="strengths&enhancement"  style="background-color:white;" readonly><%=mentor_rs.getString(7)%></textarea></div></td>
							<td><div><label for="comment"><strong>International</strong></label><textarea class="form-control" rows="3" id="weakness&corrections"  style="background-color:white;" readonly><%=mentor_rs.getString(8)%></textarea></div></td>
						</div>
					</tr>
					</tbody>
					</table><br>
			<div class="row">
				<div class="col-sm-6">
					<label for="studentname"><b>Memberships of Professional Bodies:</b></label>
					<textarea class="form-control" rows="3" id="goals" style="background-color:white;" readonly><%=mentor_rs.getString(9)%></textarea>
				</div>
				<div class="col-sm-6">
					<label for="consultations"><b>Consultations:</b></label>
					<textarea class="form-control" rows="3" id="goals"  style="background-color:white;" readonly><%=mentor_rs.getString(10)%></textarea>
				</div>
			</div><br>
			
			<div class="row">
				<div class="col-sm-6">
					<label for="studentname"><b>Research Interests:</b></label>
					<textarea class="form-control" rows="3" id="goals" style="background-color:white;" readonly><%=mentor_rs.getString(11)%></textarea>
				</div>
				<div class="col-sm-6">
					<label for="studentname"><b>Other Interests:</b></label>
					<textarea class="form-control" rows="3" id="goals" style="background-color:white;" readonly><%=mentor_rs.getString(12)%></textarea>
				</div>
			</div>	
			
			</td></tr></tbody></table>
		
	</form>
	</div>
	
      
      
      
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    
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
  	
<!--========================================Scripts================================================-->

<script type="text/javascript">
    $(document).ready(function(){
        $(".add").click(function(){
			var markup="<tr><div class='col-sm-1'><td><select class='form-control' id='year'><option>Select</option><option id='11'>I</option><option id='22'>II</option><option id='33'>III</option><option id='44'>IV</option></select></td></div><div class='col-sm-2'><td><textarea class='form-control' rows='2' cols='50' id='nameoftheindustryvisited'></textarea></td></div><div class='col-sm-2'><td><input class='form-control' id='dateofinteraction' type='date'></td></div><div class='col-sm-4'><td><textarea class='form-control' rows='2' cols='90' id='learningpoints'></textarea></td></div><div class='col-sm-3'><td><textarea class='form-control' rows='2' cols='33' id='actionplan'></textarea></td></div>		</tr>     ";
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
	   $( "#22" ).prop( "disabled", true );   
	   $( "#33" ).prop( "disabled", true );   
	   $( "#44" ).prop( "disabled", true );   
	   $( "#2" ).prop( "disabled", true );   
	   $( "#3" ).prop( "disabled", true );   
	   $( "#4" ).prop( "disabled", true );   
	 }
	 else if(diff===2)
	 { $( "#33" ).prop( "disabled", true );   
	   $( "#44" ).prop( "disabled", true );   
	   $( "#3" ).prop( "disabled", true );   
	   $( "#4" ).prop( "disabled", true );  
	 }
	 else if(diff===3)
	 {     
	    $( "#44" ).prop( "disabled", true );   
	    $( "#4" ).prop( "disabled", true );  
	 }
	 else if(diff==4)
	 {
	    
	 }  
        
    });    
</script>

</body>

</html>
