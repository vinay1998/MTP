<%@ page import="java.io.*,java.util.Date,java.text.SimpleDateFormat,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<% 

	//global object declaration section
    Connection conn = null;
	Statement stmt = null;
	Statement date_st = null;
	Statement date_activity_st=null;
	Statement activity_st=null;
	ResultSet rs=null;
	ResultSet rs2=null;
	response.setContentType("text/html");
	String sno="15071A1245";
	

	//jdbc logic section

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String dbURL = "jdbc:sqlserver://10.45.29.254;DatabaseName=VNR_Students_Record";
        String user = "sa";
        String pass = "vnrvjiet1@3";
        conn = DriverManager.getConnection(dbURL, user, pass);
		stmt = conn.createStatement();
		date_st=conn.createStatement();
		String sql= "select Student_Name,Student_Code,EAMCET_ECET,Branch from Student_Master_Information where Student_Code='"+sno+"'";
		rs=stmt.executeQuery(sql);
		
		String sql2="select Staff_name,Date_Of_Birth,Designation,Academic_Qualification,Papers_National,Papers_International,Conferences_National,Conferences_International, Memberships_Of_Prof_Bodies,Consultations,Research_Interests,Other_Interests from Staff_Master where Staff_Code in (select Mentor_ID from Student_Master_Information where Student_Code='"+sno+"'";

		rs2=date_st.executeQuery(sql2);
		

		rs2.next();
		rs.next();
		if(rs==null)
			out.print("no details filled");
		
%>
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
<!--===============================================================================================-->  
  


</head>


<body>

    <div class="container-fluid"><br>
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">Mentoring&nbsp; / &nbsp;Mentor-Mentee Information</li>
      </ol>
      <!-- main content-->
	  <!--h1> <font color="dodgerblue"><center>ECA Activities</center></font>
	</h1>-->
	<form method="post" action="mentormenteeinformation">
		<div class="container-table100">
		<div class="container">
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
					<input class="form-control" id="studentname" value="<%=rs.getString(1)%>" type="text">
				</div>
				<div class="col-sm-2">
					<label for="rollno"><b>Roll No:</b></label>
					<input class="form-control" id="rollno" value="<%=rs.getString(2)%>" type="text">
				</div>
				<div class="col-sm-2">
					<label for="studentname"><b>TS EAMCET Rank:</b></label>
					<input class="form-control" id="studentname" value="<%=rs.getString(3)%>" type="text">
				</div>
				<div class="col-sm-2">
					<label for="studentname"><b>Branch:</b></label>
					<input class="form-control" id="studentname" value="<%=rs.getString(4)%>" type="text">
				</div>
				
				</div>
			</div><br></td>
			</tr>
			<tr class="tbodyrow">
			<td>
			<h3 style="color:dodgerblue;"><center>Mentor Information</center></h3><br>
			<div class="row">

				<div style='text-align:right;'class="col-sm-2">
					<label for="from"><b>Period:&nbsp;From:</b></label>
				</div>
				<div style='text-align:right;' class="col-sm-3">
					<input class="form-control" id="from" type="text" placeholder="dd-mm-yyyy">
				</div>
				<div  style='text-align:right;'class="col-sm-3">
					<label for="age"><b>To:</b></label>
				</div>
				<div class="col-sm-3">
					<input class="form-control" id="age" type="text" placeholder="dd-mm-yyyy">
				</div>
			</div>	<br>
			<div class="row">
				<div style='text-align:right;' class="col-sm-2">
					<label for="designation"><b>  Name:</b></label>
				</div>
				<div class="col-sm-3">
					<input class="form-control" id="name" value="<%=rs2.getString(1)%>" type="text" >
				</div>
				<div style='text-align:right;'class="col-sm-2">
					<label for="dob"><b> Date of Birth:</b></label>
				</div>
				<div class="col-sm-2">
					<input class="form-control" id="dob" value="<%=rs2.getString(2)%>" type="text">
				</div>
				<div style='text-align:right;'class="col-sm-1">
					<label for="age"><b> Age:</b></label>
				</div>
				<div class="col-sm-1">
					<input class="form-control" id="age" type="text">
				</div>
			</div><br>
			<div class="row">

				
				<div style='text-align:right;' class="col-sm-2">
					<label for="designation"><b>Designation:</b></label>
				</div>
				<div class="col-sm-3">
					<input class="form-control" id="age" value="<%=rs2.getString(3)%>" type="text">
				</div>
				<div style='text-align:right;'class="col-sm-3">
					<label for="qualification"><b>Academic Qualification:</b></label>
				</div>
				<div class="col-sm-3">
					<input class="form-control" id="qualification" value="<%=rs2.getString(4)%>" type="text">
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
							<th><div><label for="comment"><strong>National</strong></label><textarea class="form-control" rows="3" id="ambition" value="<%=rs2.getString(5)%>"></textarea></div></th>
							<th><div><label for="comment"><strong>International</strong></label><textarea class="form-control" rows="3" id="goals" value="<%=rs2.getString(6)%>"></textarea></div></th>
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
							<td><div><label for="comment"><strong>National</strong></label><textarea class="form-control" rows="3" id="strengths&enhancement" value="<%=rs2.getString(7)%>"></textarea></div></td>
							<td><div><label for="comment"><strong>International</strong></label><textarea class="form-control" rows="3" id="weakness&corrections" value="<%=rs2.getString(8)%>"></textarea></div></td>
						</div>
					</tr>
					</tbody>
					</table><br>
			<div class="row">
				<div class="col-sm-6">
					<label for="studentname"><b>Memberships of Professional Bodies:</b></label>
					<textarea class="form-control" rows="3" id="goals" value="<%=rs2.getString(9)%>"></textarea>
				</div>
				<div class="col-sm-6">
					<label for="consultations"><b>Consultations:</b></label>
					<textarea class="form-control" rows="3" id="goals" value="<%=rs2.getString(10)%>"></textarea>
				</div>
			</div><br>
			
			<div class="row">
				<div class="col-sm-6">
					<label for="studentname"><b>Research Interests:</b></label>
					<textarea class="form-control" rows="3" id="goals" value="<%=rs2.getString(11)%>"></textarea>
				</div>
				<div class="col-sm-6">
					<label for="studentname"><b>Other Interests:</b></label>
					<textarea class="form-control" rows="3" id="goals" value="<%=rs2.getString(12)%>"></textarea>
				</div>
			</div>	
			
			</td></tr></tbody></table>
		</div>
	</form>
	</br></br>
      
      
      
      
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="Login\login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
	</div>
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

