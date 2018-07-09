<%@ page import="java.io.*,java.util.Date,java.text.SimpleDateFormat,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<% 

	//global object declaration section
    Connection conn = null;
	Statement stmt = null;
	Statement date_st=null;
	ResultSet rs=null;
	ResultSet rs1=null;
	response.setContentType("text/html");
	String staffid="12345";
	

	//jdbc logic section

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String dbURL = "jdbc:sqlserver://10.45.29.254;DatabaseName=VNR_Students_Record";
        String user = "sa";
        String pass = "vnrvjiet1@3";
        conn = DriverManager.getConnection(dbURL, user, pass);
		stmt = conn.createStatement();
		date_st = conn.createStatement();

		
		String sql= "select Staff_Name,Staff_Code,convert(varchar,Date_Of_Birth,105),Branch,Address,Blood_Group,Mobile,Academic_Qualification,Landline_no,Designation,Papers_National,Papers_International,Conferences_National,Conferences_International,Memberships_Of_Prof_Bodies,Consultations,Research_Interests,Other_Interests,Training from Staff_Master where Staff_Code='"+staffid+"'";
		
		String sql2="select Date_Of_Birth from Staff_Master where Staff_Code='"+staffid+"'";
		rs1=date_st.executeQuery(sql2);
		
		rs=stmt.executeQuery(sql);
		rs1.next();
		rs.next();
		if(rs==null)
			out.print("no details filled");
		
%>

<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
<body class="fixed-nav  bg-success" style="background-color: #ffffff;" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-success fixed-top" id="mainNav">
	<img src="img/vnrvjiet.jpg" class="img-responsive" alt="VNR VJIET" height="3%" width="3%">&nbsp;&nbsp;&nbsp;
    <a class="navbar-brand" href="index.html">VNR Vignana Jyothi Institute of Engineering and Technology - MTP</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" data-spy="scroll" id="navbarResponsive" >
		
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion" style="overflow-y:auto;" height='100%'>
	  
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="index.html">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Dashboard</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Mentoring">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages" data-parent="#exampleAccordion">
            <i class="fa fa-users"></i>
            <span class="nav-link-text">Mentoring</span>
          </a>	
          <ul class="sidenav-second-level collapse" id="collapseExamplePages">
            <li>
              <a href="mentor_mentee.html">Mentor - Mentee</a>
            </li>
			<li>
              <a href="mentor_mentee_overview.html">Mentor - Mentee Overview</a>
            </li>
            <li>
              <a href="record_of_mentor_mentee_meetings.html">Mentor - Mentee Meetings</a>
            </li>
            <li>
              <a href="studentmasterinfo.html">Student Master Information</a>
            </li>
            <li>
              <a href="swot_analysis.html">SWOT Analysis</a>
            </li>
			<li>
              <a href="attendance.html">Attendance</a>
            </li>
			<li>
              <a href="mentor_reviews.html">Mentor Reviews</a>
            </li>
			<li>
              <a href="internalsmarks.html">Internal Marks</a>
            </li>
			<li>
              <a href="semesterendexaminationresult.html">Semester Marks</a>
            </li>
			<li>
              <a href="internalassessmentrecord.html">Marks Report</a>
            </li>
          </ul>
        </li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="ECA & CCA">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
            <i class="fa fa-futbol-o"></i>
            <span class="nav-link-text">ECA & CCA</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseComponents">
            <li>
              <a href="industrialvisit.html">Industrial Visits</a>
            </li>
            <li>
              <a href="outstationtechnical.html">Outstation Technical Visits</a>
            </li>
			<li>
              <a href="summertraining.html">Summer Training Visits</a>
            </li>
			<li>
              <a href="cca_activities.html">CCA Activities</a>
            </li>
			<li>
              <a href="eca_activities.html">ECA Activities</a>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Training & Placement">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti" data-parent="#exampleAccordion">
            <i class="fa fa-handshake-o"></i>
            <span class="nav-link-text">Training & Placement</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseMulti">
            <li>
              <a href="#">Cultivate Right Attitude</a>
            </li>
            <li>
              <a href="#">Soft Skills</a>
            </li>
            <li>
              <a href="#">Campus Interview Training</a>
            </li>
			<li>
              <a href="#">Campus Interview Training Review</a>
            </li>
            <li>
              <a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti2">Assessment Report</a>
              <ul class="sidenav-third-level collapse" id="collapseMulti2">
                <li>
                  <a href="#">Mock Aptitude Test</a>
                </li>
                <li>
                  <a href="#">Mock Interviews</a>
                </li>
              </ul>
            </li>
			<li>
              <a href="#">Semester End Self Assessment Report</a>
            </li>
			<li>
              <a href="#">Eligibility for Placements</a>
            </li>
          </ul>
        </li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="departmentmaster">
          <a class="nav-link" href="departmentmaster.html">
            <i class="fa fa-fw fa-user-circle"></i>
            <span class="nav-link-text">Student Matrixing</span>
          </a>
        </li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="departmentmaster">
          <a class="nav-link" href="myjourney.html">
            <i class="fa fa-fw fa-road"></i>
            <span class="nav-link-text">My Journey</span>
          </a>
        </li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="departmentmaster">
          <a class="nav-link" href="departmentmaster.html">
            <i class="fa fa-fw fa-file-text"></i>
            <span class="nav-link-text">Alumni Association Form</span>
          </a>
        </li>
      </ul>
	  <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-envelope"></i>
            <span class="d-lg-none">Messages
              <span class="badge badge-pill badge-primary">12 New</span>
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="messagesDropdown">
            <h6 class="dropdown-header">New Messages:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>David Miller</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>Jane Smith</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>John Doe</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all messages</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-bell"></i>
            <span class="d-lg-none">Alerts
              <span class="badge badge-pill badge-warning">6 New</span>
            </span>
            <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="alertsDropdown">
            <h6 class="dropdown-header">New Alerts:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-danger">
                <strong>
                  <i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all alerts</a>
          </div>
        </li>
        <li class="nav-item">
          <form class="form-inline my-2 my-lg-0 mr-lg-2">
            <div class="input-group">
              <input class="form-control" type="text" placeholder="Search for...">
              <span class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </form>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="content-wrapper">
    <div class="container">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">Mentoring&nbsp; / &nbsp;Staff Master</li>
      </ol>
	   <!-- main content-->
	  <!--h1> <font color="dodgerblue"><center>Staff Master</center></font>
	</h1>--<br>-->
	
		<form method="post" action="staffmaster">
			<div class="container-table100">
				<div class="container">
					<table class="table table">
						<thead>
						</thead>
						<tbody>
							<tr>
								<td><br>
									<div class="form-group">
									<div class="row">
										<div class="col-sm-4">
										<label for="staffname"><b>Staff Name <span class="text-danger">*</span></b></label>
										<input class="form-control" id="staffname" name="staffname" type="text" value="<%=rs.getString(1)%>">
										</div>
										<div class="col-sm-2">
										<label for="staffid"><b>Staff Id <span class="text-danger">*</span></b></label>
										<input class="form-control" id="staffid" name="staffid" value="<%=rs.getString(2)%>" type="text">
										</div>
										<div class="controls input-append date form_date col-sm-2" data-date="" data-date-format="dd-mm-yyyy" data-link-field="DOB" data-link-format="yyyy-mm-dd" >
										<label for="DOB"><b>Date of Birth<span class="text-danger">*</span></b></label>
										<p><input class='form-control' type="text" value="<%=rs.getString(3)%>" Style="background-color: white;" placeholder="dd-mm-yyyy" id="dateofbirth" readonly required>
										<span class="add-on" id='id_span'><i class="fa fa-calendar "></i></span></p>
										<div>				
										<input type="hidden" name="DOB" id="DOB" value="<%=rs1.getString(1)%>"  />
										</div>
										</div>			
													
										<div class="col-sm-1">
											<label><b>Age<span class="text-danger">*</span></b></label>
											   <input class="form-control" type="text" name="age" maxlength="7" value=""  readonly maxlength="1"  id="years" style="background-color:white;">
										</div>
										<div class="col-sm-2">
										<label for="department"><b>Department <span class="text-danger">*</span></b></label>
										<select class="form-control" id="dept" name="dept">
											<option value="<%=rs.getString(4)%>" hidden><%=rs.getString(4)%></option>
											<option value="CSE" id='1'>CSE</option>
											<option value="IT" id='2'>IT</option>
											<option value="ECE" id='3'>ECE</option>
											<option value="EEE" id='4'>EEE</option>
											<option value="ME" id='5'>ME</option>
											<option value="CIVIL" id='6'>CIVIL</option>
											<option value="EIE" id='7'>EIE</option>
											<option value="AE" id='8'>AE</option>
										</select>
										</div>
									</div>
									</div>
								</td>
							</tr>
							<tr>							
							<td><br>			
								<div class="row">
									<div style='text-align:right;' class="col-sm-2">
										<label for="address"><b>Address <span class="text-danger">*</span> : </b></label>
									</div>
									<div class="col-sm-4">
										<textarea class="form-control" rows="3" id="address" name="address"><%=rs.getString(5)%></textarea>
									</div>
									<div style='text-align:right;' class="col-sm-2"><b>Blood Group <span class="text-danger">*</span> : </b></div>
									<div class="col-sm-4">
										<select class="form-control" id="blood" name="blood">
											<option value="<%=rs.getString(6)%>" hidden><%=rs.getString(6)%></option>
											<option value="A+">A+</option>
											<option value="A-">A-</option>
											<option value="B+">B+</option>
											<option value="B-">B-</option>
											<option value="O+">O+</option>
											<option value="O-">O-</option>
											<option value="AB+">AB+</option>
											<option value="AB-">AB-</option>
										</select>
									</div>
								</div><br>
								<div class="row">			
									<div style='text-align:right;' class="col-sm-2">
										<label for="mobile"><b>Mobile No <span class="text-danger">*</span> :</b></label>
									</div>
								<div class="col-sm-4">
									<input class="form-control" id="mobile" name="mobile" type="text" value="<%=rs.getString(7)%>">
								</div>
								<div style='text-align:right;'class="col-sm-2">
									<label for="qualification"><b>Qualification <span class="text-danger">*</span> :</b></label>
								</div>
								<div class="col-sm-4">
									<input class="form-control" id="qualification" name="qualification" type="text" value="<%=rs.getString(8)%>">
								</div>
								
								</div>
								<br>
								<div class="row">

									
									<div style='text-align:right;' class="col-sm-2">
										<label for="landline"><b>Landline No  :</b></label>
									</div>
									<div class="col-sm-4">
										<input class="form-control" id="landline" name="landline" type="text" value="<%=rs.getString(9)%>">
									</div>
									<div style='text-align:right;'class="col-sm-2">
										<label for="qualification"><b>Designation <span class="text-danger">*</span> :</b></label>
									</div>
									<div class="col-sm-4">
										<input class="form-control" id="designation" name="designation" type="text" value="<%=rs.getString(10)%>">
									</div>
									
								</div>
								<br>
							</td></tr>
							<table class="table table-striped">
								<thead>
									<tr>
									
									</tr>
								</thead>
								<tbody>
									<tr class="tbodyrow">
										<th style='font-size: 18px;color: #33A8FF;line-height: 1.2;font-weight: unset;'colspan='2'>
										<center><strong>Papers Published</strong></center>
										</th>
									</tr>
									<tr>
										<div class="row">
											<td><div><label for="comment"><strong>National</strong></label>
											<textarea class="form-control" rows="3" id="paper_national" name="paper_national"><%=rs.getString(11)%></textarea></div></td>
											<td><div><label for="comment"><strong>International</strong></label>
											<textarea class="form-control" rows="3" id="paper_international" name="paper_international"><%=rs.getString(12)%></textarea></div></td>
										</div>
									</tr>	
									<tr class="tbodyrow">
										<th style='font-size: 18px;color: #33A8FF;line-height: 1.2;font-weight: unset;'colspan='2'>
										<center><b>Conferences Attended</b></center></th>
									</tr>
									<tr>
										<div class="row">
											<td><div><label for="comment"><strong>National</strong></label>
											<textarea class="form-control" rows="3" id="national1" name="conference_national"><%=rs.getString(13)%></textarea></div></td>
											<td><div><label for="comment"><strong>International</strong></label>
											<textarea class="form-control" rows="3" id="international1" name="conference_international"><%=rs.getString(14)%></textarea></div></td>
										</div>
									</tr>
								</tbody>
							</table><br>
							<div class="row">
							<div style='text-align:right;' class="col-sm-3">
									<label for="studentname"><b>Memberships of Professional Bodies<span class="text-danger">*</span> :</b></label>
								</div>
							<div class="col-sm-3">
									<textarea class="form-control" rows="5" id="professionalbodies" name="professionalbodies"><%=rs.getString(15)%></textarea>
								</div>
								<div style='text-align:right;'class="col-sm-2">
									<label for="consultations"><b>Consultations <span class="text-danger">*</span> :</b></label>
								</div>
								<div class="col-sm-4">
									<textarea class="form-control" rows="5" id="consultations" name="consultations"><%=rs.getString(16)%></textarea>
								</div>
							</div><br>
							<div class="row">
							<div style='text-align:right;'class="col-sm-3">
									<label for="studentname"><b>Research Interests <span class="text-danger">*</span> :</b></label>
								</div>
								<div class="col-sm-3">
									<textarea class="form-control" rows="5" id="research" name="research"><%=rs.getString(17)%></textarea>
								</div>
								<div style='text-align:right;'class="col-sm-2">
									<label for="studentname"><b>Other Interests <span class="text-danger">*</span> :</b></label>
								</div>
								<div class="col-sm-4">
									<textarea class="form-control" rows="5" id="otherinterests" name="otherinterests"><%=rs.getString(18)%></textarea>
								</div>
							</div>	
							
							</td></tr>
						</tbody>
						</table>
						<br>
						<!--<div class="row">								
								<div style='text-align:right;' class="col-sm-2">
									<label for="acessreqd"><b>Lab Incharge <span class="text-danger">*</span> :</b></label>
								</div>
								<div class="col-sm-2">
									<select class="form-control" id="labincharge" name="labincharge">
										<option value="no">No</option>
										<option value="yes">Yes</option>
									</select>

								</div>
								<div style='text-align:right;' class="col-sm-2">
									<label for="designation"><b>If Yes Lab No</b></label>
								</div>
								<div class="col-sm-1">
									<input class="form-control" id="labno" name="labno" type="text">
								</div>
								<div style='text-align:right;'class="col-sm-2">
									<label for="qualification"><b>If Yes Lab Name</b></label>
								</div>
								<div class="col-sm-3">
									<textarea class="form-control" rows="1" id="labname" name="labname"></textarea>
								</div>
								
							</div><br>-->
							<div class="row">
								<div style='text-align:right;'class="col-sm-4">
									<label for="acessreqd"><b>Training/Placement Acess Required <span class="text-danger">*</span> : </b></label>
								</div>
								<div class="col-sm-2">
									<select class="form-control" id="trainingaccess" name="trainingaccess">
										<option value="No">No</option>
										<option value="Yes">Yes</option>
									</select>
								</div>
							</div><br><br>
						<center>
								<button type="submit" class="btn btn-primary" name="update">Update</button>
								<button type="reset" class="btn btn-info" id="reset" name="reset">Reset</button>
							</center><br><br>
						</div>
						</div>
					</form>
					</div>
					
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
              <span aria-hidden="true">�</span>
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
	<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	<!--new links-->
<!--===============================================================================================-->
<script type="text/javascript">
    $(document).ready(function(){
	<!--date script-->
	$('.form_date').datetimepicker({
        language:  'en',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('#dateofbirth').on('change',function(){
       
       var today = new Date();
	   var curr_date = today.getDate();
	   var curr_month = today.getMonth() + 1;
	   var curr_year = today.getFullYear();
	   
	   var dob = new Date($('#DOB').val());
	    var birth_date = dob.getDate();
	   var birth_month = dob.getMonth() + 1;
	   var birth_year = dob.getFullYear();
	   var x=0;
	   if (curr_month == birth_month && curr_date >= birth_date)
	   { 
	     x=curr_year-birth_year;
	   }
	   else if (curr_month == birth_month && curr_date < birth_date)
	   {
	     x=curr_year-birth_year-1;
	   }
	   else if (curr_month > birth_month)
	   { 
	     x=curr_year-birth_year;
	   }
	   else if (curr_month < birth_month)
	   {
	     x=curr_year-birth_year-1;
		 if(x==-1)
		 {
		    x=0;
		 }
	   }
	   $('#years').val(x);
   });
  });
</script>


</body>

</html>

					