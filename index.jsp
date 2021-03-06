

<%@ page import="java.io.*,java.util.Date,java.text.SimpleDateFormat,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>

<%
	//global object declaration section
    Connection conn = null;
	Statement stmt = null;
	ResultSet user_name=null;
	response.setContentType("text/html");
	

	//jdbc logic section

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String dbURL = "jdbc:sqlserver://10.45.29.254;DatabaseName=VNR_Students_Record";
        String user = "sa";
        String pass = "vnrvjiet1@3";
        conn = DriverManager.getConnection(dbURL, user, pass);
		stmt = conn.createStatement();
		
		String user_id = (String)request.getSession().getAttribute("user_id");
		if(user_id==null)
			response.sendRedirect("login.jsp");
		user_name=stmt.executeQuery("select Student_Name from Student_Master_Information where Student_Code='"+user_id+"'");
		user_name.next();
		request.getSession().setAttribute("user_name",user_name.getString(1));
		
		stmt.close();
		conn.close();
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>VNR VJIET-MTP</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link href="css/media-query.css" rel="stylesheet">
  <style>
	body {
		overflow: hidden;
		height:100%;
		background-image: url("img/background.jpg") ;
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
	}

	
	iframe {
	     	border :1px solid black;
			border-style: outset;
			-webkit-border-radius: 12px; 
			-moz-border-radius: 12px; 
			border-radius: 12px;
			box-shadow: 1px -4px 9px 4px #5E5C58;
				
    }		
	.content-wrapper{
	    	-webkit-border-radius: 12px; 
			-moz-border-radius: 12px; 
			border-radius: 12px;	
	}	 
	  

.preloader-1 {
  margin: 150px auto 0;
  margin-top: 250px;
  margin-left: 45%;
  width: 606px;
  height: 12px;
}


.preloader-1 .line {
  width: 2px;
  height: 20px;
  background: #fff;
  margin: 0 1px;
  display: inline-block;
  animation: opacity-1 1000ms infinite ease-in-out;
}


.preloader-1 .line-1{ animation-delay: 800ms; }
.preloader-1 .line-2{ animation-delay: 600ms; }
.preloader-1 .line-3{ animation-delay: 400ms; }
.preloader-1 .line-4{ animation-delay: 200ms; }
.preloader-1 .line-6{ animation-delay: 200ms; }
.preloader-1 .line-7{ animation-delay: 400ms; }
.preloader-1 .line-8{ animation-delay: 600ms; }
.preloader-1 .line-9{ animation-delay: 800ms; }

@keyframes opacity-1 { 
  0% { 
    opacity: 1;
  }
  50% { 
    opacity: 0;
  }
  100% { 
    opacity: 1;
  }  
}

@keyframes opacity-2 { 
  0% { 
    opacity: 1;
    height: 15px;
  }
  50% { 
    opacity: 0;
    height: 12px;
  }
  100% { 
    opacity: 1;
    height: 15px;
  }  
}
</style>

</head>

<body class="mfbg" id="page-top"  >

	<%
		
			response.setHeader("Pragma","no-cache"); 
			response.setHeader("Cache-Control","no-store"); 
			response.setHeader("Expires","0"); 
			response.setDateHeader("Expires",-1);	
		
	%>

	
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark  fixed-top" id="mainNav">
	<img src="img/vnrvjiet.jpg" class="img-responsive" alt="VNR VJIET" height="3%" width="3%">&nbsp;&nbsp;&nbsp;
    <a class="navbar-brand nothide" href="index.jsp">VNR Vignana Jyothi Institute of Engineering and Technology - MTP</a>
	<a class="navbar-brand hide" href="index.jsp">VNR VJIET - MTP</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse " id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion" style="overflow-y:auto;">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="construction_page.html" target="pages">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Dashboard</span>
          </a>
        </li>
		<li class="nav-item " data-toggle="tooltip" data-placement="right" title="Student Master Information" style="padding-top:1em;padding-bottom:1em;">
				  <a class="nav-link-sub hover-color" href="student_data_check.jsp" target="pages"  >
					<i class="fa fa-vcard-o "></i>
					<span class="nav-link-text " >Student Master Information</span>
				  </a>
		</li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Mentoring">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages" data-parent="#exampleAccordion">
			<i class="fa fa-users"></i>
            <span class="nav-link-text">Mentoring</span>
          </a>	
          <ul class="sidenav-second-level collapse" id="collapseExamplePages">

			 <li>
              <a href="mentor_mentee_information.jsp" target="pages">Mentor - Mentee Information</a>
            </li>
			<li>
              <a href="mentor_mentee_overview.jsp" target="pages">Mentor - Mentee Overview</a>
            </li>
            <li>
              <a href="mentor_mentee_meetings.jsp" target="pages">Mentor - Mentee Meetings</a>
            </li>
            <li>
              <a href="swot_analysis.jsp" target="pages">SWOT Analysis</a>
            </li>
			<li>
              <a href="attendance.jsp" target="pages">Attendance</a>
            </li>
			
			<li>
              <a href="mentor_reviews.jsp" target="pages">Mentor Reviews</a>
            </li>
			<li>
              <a href="internalsmarks.jsp" target="pages">Internal Marks</a>
            </li>
			<li>
              <a href="semestermarks.jsp" target="pages">Semester Marks</a>
            </li>
			<li>
              <a href="marksreport.jsp" target="pages">Marks Report</a>
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
              <a href="industrialvisits.jsp" target="pages">Industrial Visits</a>
            </li>
            <li>
              <a href="outstationtechnical.jsp" target="pages">Outstation Technical Visits</a>
            </li>
			<li>
              <a href="summertraining.jsp" target="pages">Summer Training Visits</a>
            </li>
			<li>
              <a href="cca_activities.jsp" target="pages">CCA Activities</a>
            </li>
			<li>
              <a href="eca_activities.jsp" target="pages">ECA Activities</a>
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
              <a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti1">Grooming Sessions</a>
              <ul class="sidenav-third-level collapse" id="collapseMulti1">
				<li>
				  <a href="cultivaterightattitude.html" target="pages">Cultivate Right Attitude</a>
				</li>
				<li>
				  <a href="softskills.html" target="pages">Soft Skills</a>
				</li>
              </ul>
            </li>
            <li>
              <a href="campusinterviewtraining.html" target="pages">Campus Interview Training</a>
            </li>
			<li>
              <a href="campusinterviewtrainingreview.html" target="pages">Campus Interview Training Review</a>
            </li>
            <li>
              <a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti2" target="pages">Assessment Report</a>
              <ul class="sidenav-third-level collapse" id="collapseMulti2">
                <li>
                  <a href="mockaptitudetest.html" target="pages">Mock Aptitude Test</a>
                </li>
                <li>
                  <a href="mockinterviews.html" target="pages">Mock Interviews</a>
                </li>
              </ul>
            </li>
			<li>
              <a href="selfassessmentreport.html" target="pages">Semester End Self Assessment Report</a>
            </li>
			<li>
              <a href="eligibility_placements.html" target="pages">Eligibility for Placements</a>
            </li>
          </ul>
        </li>
		<li class="nav-item " data-toggle="tooltip" data-placement="right" title="Student Matrixing" style="padding-top:1em;padding-bottom:1em;">
				  <a class="nav-link-sub hover-color" href="student_matrixing.jsp" target="pages"  >
					<i class="fa fa-fw fa-user-circle "></i>
					<span class="nav-link-text " >Student Matrixing</span>
				  </a>
		</li>
		<li class="nav-item " data-toggle="tooltip" data-placement="right" title="My Journey" style="padding-top:1em;padding-bottom:1em;">
				  <a class="nav-link-sub hover-color" href="construction_page.html" target="pages"  >
					<i class="fa fa-fw fa-road "></i>
					<span class="nav-link-text " >My Journey</span>
				  </a>
		</li>
		<li class="nav-item " data-toggle="tooltip" data-placement="right" title="Alumni Association Form" style="padding-top:1em;padding-bottom:1em;">
				  <a class="nav-link-sub hover-color" href="alumniassociationform.jsp" target="pages"  >
					<i class="fa fa-fw fa-file-text "></i>
					<span class="nav-link-text " >Alumni Association Form</span>
				  </a>
		</li>
		<li class="nav-item " data-toggle="tooltip" data-placement="right" title="Change Password" style="padding-top:1em;padding-bottom:1em;">
				  <a class="nav-link-sub hover-color" href="changepassword.jsp" target="pages"  >
					<i class="fa fa-edit "></i>
					<span class="nav-link-text " >Change Password</span>
				  </a>
		</li>
      </ul>
      <ul class="navbar-nav sidenav-toggler" >
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
        <li class="nav-item" id="main-search">
          <form class="form-inline my-2 my-lg-0 mr-lg-2">
            <div class="input-group">
              <input class="form-control" list="search-pages" type="text" placeholder="Search for..." id="list">
                    <datalist id="search-pages" class="datalist" >
						
					</datalist>
	   
	   
				<span class="input-group-append">
                <a target="pages"><button class="btn btn-primary btn-lg" type="button"id="page-search">
                  <i class="fa fa-search"></i>
                </button></a>
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

  <div class="content-wrapper" style="padding-top:0.2%;padding-right:.8%;padding-left:.8%;padding-down:.5%;background-color:transparent;">
	  <div class="preloader-1" id="preloader-1">
	  <div style="color:white">Loading</div>
	  <span class="line line-1"></span>
	  <span class="line line-2"></span>
	  <span class="line line-3"></span>
	  <span class="line line-4"></span>
	  <span class="line line-5"></span>
	  <span class="line line-6"></span>
	  <span class="line line-7"></span>
	  <span class="line line-8"></span>
	  <span class="line line-9"></span>
	</div>

	<br/><br/><br/>
	<div class="container-fluid contents" id="frame" style="position:relative;max-width:100%">
      <iframe class="" src="construction_page.html" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;" frameborder="0" name="pages" id="pages" ></iframe>
	</div>
  </div>
    
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
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="logout.jsp">Logout</a>
          </div>
        </div>
      </div>
    </div>
	</div>
	
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="js/sb-admin-datatables.min.js"></script>
    <script src="js/sb-admin-charts.min.js"></script>
  </div>
  <script>
    function div_height() {
		var height = $(window).height();
		var divheight = (90 * height) / 100;
		divheight = parseInt(divheight) + 'px';
		$("#frame").css('height',divheight);
    }
	$(document).ready(function() {
		//alert($("#navbarResponsive").height());
		div_height();
		$(window).bind('resize', div_height);
	});
	
	//preloader when we try to load new page to iframe
	 $('a[target="pages"]').click(function(){
		$('#preloader-1').show();
		$('#preloader-2').show();	 
		$('.contents').hide();
	    setTimeout(function(){    //remove this line
			  $('#preloader-1').hide();
			  $('#preloader-2').hide();
			  $('.contents').show();
			  },1000);//remove this line
	    });
	//------------

	//links pages when search button is clicked----------
 	var flag=1;
	$("#page-search").on("click",function(e){
		 //alert("a"+$("#page-search").parent().attr("href")+"a");
		 if(flag==1)
		 { //alert("yes");
		  e.preventDefault();
		  $("#exampleAccordion > li > a > span , #exampleAccordion > li > ul > li > a").each(function(){
			//alert($(this).text()+' '+$("#list").val());
				if($("#list").val() == $(this).text())
				{
				  //alert("yes");
				   if($(this).attr("href"))
				   {
					$("#page-search").parent().attr("href",$(this).attr("href"));
				   }
				   else
				   {
					 $("#page-search").parent().attr("href",$(this).parent().attr("href"));
				   }		   
					// alert("-"+$("#page-search").parent().attr("href"));
                    flag=0;					
					document.getElementById("page-search").click();
					 
				}
			});
		 }
		 else
		 {
		   flag=1;
		 }
	});
	$("#exampleAccordion > li > a > span , #exampleAccordion > li > ul > li > a").each(function(){
		$('#search-pages').append('<option value="'+$(this).text()+'"></option>')
	});
	$('#search-pages').find('option[value="Dashboard"]').remove();
	$('#search-pages').find('option[value="Mentoring"]').remove();
	$('#search-pages').find('option[value="ECA & CCA"]').remove();
	$('#search-pages').find('option[value="Training & Placement"]').remove();
	
	$('#search-pages > option').each(function(){
		$(this).attr('disabled', 'disabled');
	});
	
	$('#list').keyup(function() {
        if (!$(this).value) {
			$('#search-pages > option').each(function(){
				$(this).attr('disabled', 'disabled');
			});        
        }
    });
	
	$('#list').on("input",function(){
		$('#search-pages > option').each(function(){
			$(this).removeAttr('disabled');
		});
	});
	
  </script>
</body>

</html>
