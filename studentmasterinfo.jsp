<!DOCTYPE html>
<%@ page import="java.io.*,java.util.Date,java.text.SimpleDateFormat,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
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

<body class="mfbg" id="page-top">
  
  
   
      <!-- Breadcrumbs-->
    <ol class="breadcrumb" style="background-color:transparent;">
        <li class="breadcrumb-item">
          <a href="index.html" target="_top">Home</a>
        </li>
        <li class="breadcrumb-item active">Mentoring&nbsp; / &nbsp;Student-Master-Information</li>
	</ol>
     
	
		

		
<div class="container">
<form method="post" action="studentmasterinfo" onsubmit="return validateform()" name="vform" >	 
<!--Student Details-->
<div class="container">
	<div class="row">
	  <div class="col-sm-12 hiding" style="background-color:#DBD8D7;border-radius:10px;height:6%;">
		 <p class="pull-left" style="margin-top:0.4%;font-size:135%;">Student Details</p>
		 <span class="fa fa-close fa-3 hiddenn" style="font-size:1.5em;margin-top:0.8%;float:right;"></span>
	  </div>
	</div>
	<div>
		<div class="row validate" style="margin-top:1%">
			<div class="col-sm-6" id="sname_div">
					<label for="sname"><b>Student Name ( As per SSC )<span class="text-danger">*</span></b></label>
					<input type="text" class="form-control" id="name" placeholder="Enter Student Name" pattern="[A-Za-z]{0,}" required name="sname" title="enter only characters">
					<p style="color:red;"></p>
			</div>
			<div class="col-sm-3" id="regd_div">
					  <label for="regd"><b>Registration No<span class="text-danger">*</span></b></label>
					  <input type="text" class="form-control" id="regdno"  name="regd" value="<%=request.getSession().getAttribute("user_id")%>" style="background-color:white;"  readonly  >
					  <p style="color:red;"></p>
			</div>
			<div class="col-sm-3" id="sex_div">
					  <label for="sex"><b>Gender<span class="text-danger">*</span></b></label>
					  <select class="form-control" id="sex" name="sex" required placeholder="">
						<option hidden>Select</option>
						<option >Male</option>
						<option >Female</option>
						<option >Transgender</option>
					  </select> 
			</div>
		</div><br>
		<div class="row validate">
			<div class="col-sm-3" >
				<label for="year"><b>Academic Year<span class="text-danger">*</span></b></label>
					<select class="form-control" id="year" name="year" required>
						<option hidden>Select</option>
						<option value="2015">2015</option>
			            <option value="2016">2016</option>
			            <option value="2017">2017</option>
			            <option value="2018">2018</option>
					</select> 
			</div>
			<div class="controls input-append date form_date col-sm-3" data-date="" data-date-format="dd-mm-yyyy" data-link-field="DOB" data-link-format="yyyy-mm-dd" >
				<label for="DOB"><b>Date of Birth<span class="text-danger">*</span></b></label>
				<p><input class='form-control' type="text" value="" Style="background-color: white;" placeholder="dd-mm-yyyy" id="dateofbirth" readonly required>
				<span class="add-on" id='id_span'><i class="fa fa-calendar "></i></span></p>
                <div>				
			    <input type="hidden" name="DOB" id="DOB" value=""  />
				</div>
            </div>
			<div class="col-sm-1">
				<label><b>Age<span class="text-danger" value=""  >*</span></b></label>
				  <input class="form-control" name="age" type="text" style="background-color:White;" id="years" maxlength="4" value="" width="10px" readonly >
				  <!-- <input class="form-control" type="text" name="age" maxlength="4" value=""  style="width:20px" id="years">-->
			</div>
			<div class="col-sm-5" >
				   <label><b>Mail ID<span class="text-danger">*</span></b></label>
				   <input type="email" class="form-control" id="email" placeholder="Enter Mail ID" name="mail" title="enter valid email address" required >
				   <p style="color:red;"></p>
			</div>
		</div>
	</div>
</div>
<!--Eamcet Details-->
<div class="container" style="margin-top:1.2%">
	<div class="row" >
	  <div class='col-sm-12 hiding' style="background-color:#DBD8D7;border-radius:10px;height:6%;">
		 <p class="pull-left" style="margin-top:0.4%;font-size:135%;">EAMCET Details</p>
		 <span class="fa fa-plus fa-3 hiddenn" style="font-size:1.5em;margin-top:0.8%;float:right;"></span>
	  </div>
	</div>
	<div>
	<div class="row validate" style="margin-top:1%">
	     <div class="col-md-2">
				<b>TS-EAMCET<span class="text-danger">*</span></b>
				<input type="text" class="form-control" id="rank" placeholder="Enter Rank" name="rank" pattern="[0-9]{1,}" required title="Rank doesn't contain characters " >
				<p style="color:red;"></p>
		 </div>
         <div class="col-md-2">
		    <b>Branch <span class="text-danger">*</span></b>
				<select class="form-control" id="dept" title="Choose any option" name="dept" required>
		         	<option hidden>select</option>
			        <option value="CSE">CSE</option>
			        <option value="ECE">ECE</option>
			        <option value="EEE">EEE</option>
			        <option value="EIE">EIE</option>
			        <option value="AE">AE</option>
			        <option value="IT">IT</option>
			        <option value="CE">CE</option>
	                <option value="ME">ME</option>
		        </select>
				<p style="color:red;"></p>
		 </div>
		 <div class="col-md-2">
		    <b>Fee receipt No <span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="rcptno" placeholder="Fee Receipt No" name="rcpt">
		 </div>
		<div class="controls input-append date form_date col-sm-2" data-date="" data-date-format="dd-mm-yyyy" data-link-field="DOJ" data-link-format="yyyy-mm-dd" >
				<label for="DOB"><b>Date of Joining<span class="text-danger">*</span></b></label>
				<p><input class='form-control' type="text" value="" Style="background-color: white;" placeholder="dd-mm-yyyy" id="dateofbirth" readonly required>
				<span class="add-on" id='id_span'><i class="fa fa-calendar "></i></span></p>
                <div>				
			    <input type="hidden" name="dat" id="DOJ" value=""  />
				</div>
            </div>
			
		<div class="col-md-2">
		    <b>Amount <span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="amnt" placeholder="Enter Amount" name="amt" pattern="[1-9][0-9]{,}" title="Only numbers" required>
			<p style="color:red;"></p>
		</div>
		<div class="col-md-2">
					<b>Seat Type <span class="text-danger">*</span></b>
						<select class="form-control" id="stype" name="seattype" title="Choose any option" required>
							<option hidden>select</option>
							<option value="EAMCET">EAMCET</option>
							<option value="NRI">NRI</option>
						</select>
						<p style="color:red;"></p>
		</div>
    </div><br>
	<div class="form-group row validate">
		    <div class="col-md-2">
			    <b>Lateral Student </b>
			    <select class="form-control" id="lstud" name="lstud" title="Choose any option" required>
			        <option hidden>select</option>
			       <option >YES</option>
			      <option >NO</option>
			    </select>
				<p style="color:red;"></p>
			</div>
		<div class="col-md-2">
		    <b>Fees Exempted</b>
		    <select class="form-control" id="exem" name="exempt" title="Choose any option" required>
			    <option hidden>select</option>
			   <option >YES</option>
			   <option >NO</option>
			</select>
			<p style="color:red;"></p>
	    </div>
		<div class="col-md-2">
		    <b>Region <span class="text-danger">*</span></b>
		    <select class="form-control" id="regn" name="region" title="Choose any option" required>
			    <option hidden>select</option>
			   <option value="OU">OU</option>
			    <option value="AU">AU</option>
			    <option value="SVU">SVU</option>
			</select>
			<p style="color:red;"></p>
		</div>
		<div class="col-md-2">
		    <b>Category <span class="text-danger">*</span></b>
			<select class="form-control" id="allot" name="category" title="Choose any option" required>
			    <option hidden>select</option>
			    <option value="OC">OC</option>
			    <option value="BC-A">BC-A</option>
			    <option value="BC-B">BC-B</option>
			    <option value="BC-C">BC-C</option>
			    <option value="BC-D">BC-D</option>
			    <option value="BC-E">BC-E</option>
			    <option value="SC">SC</option>
			    <option value="ST">ST</option>
			    <option value="SPORTS">SPORTS</option>
			    <option value="NCC">NCC</option>
		    	<option value="CAP">CAP</option>
			</select>
			<p style="color:red;"></p>
		</div>
		<div class="col-md-4">
		    <b>Whether in receipt of Scholarship <span class="text-danger">*</span></b>
			<select class="form-control" id="schshp" name="scholarship" title="Choose any option" required>
			    <option hidden>select</option>
			   <option >YES</option>
			    <option>NO</option>
			</select>
			<p style="color:red;"></p>
		</div>
	</div><br>
    <div class="form-group row validate">
		<div class="col-md-2">
		    <b>Medium <span class="text-danger">*</span></b>
			<select class="form-control" id="med" name="med" title="Choose any option" required>
			    <option hidden>select</option>
			    <option value="English">English</option>
			    <option value="Telugu">Telugu</option>
			    <option value="Hindi">Hindi</option>
			</select>
			<p style="color:red;"></p>
		</div>
		<div class="col-md-2">
		    <b>Mother Tongue<span class="text-danger">*</span></b>
			<select class="form-control" id="tong"  name="m_tongue" title='Choose any option' required>
			    <option hidden>select</option>
			     <option value="Telugu">Telugu</option>
			    <option value="Hindi">Hindi</option>
			    <option value="Other">Other</option>
			</select>
			<p style="color:red;"></p>
		</div>
		<div class="col-md-2">
		    <b>Nationality <span class="text-danger">*</span></b>
		    <select class="form-control" name="nation" id="natn" title="Choose any option" required>
			    <option hidden>select</option>
			     <option value="Indian">Indian</option>
			    <option value="Foreign">Foreign</option>
			    <option value="NRI">NRI</option>
			</select>
			<p style="color:red;"></p>
		</div>
		<div class="col-md-2">
		    <b>Religion <span class="text-danger">*</span></b>
			<select class="form-control" id="rlgn" name="religion" title="Choose any option" required>
			    <option hidden>select</option>
			     <option value="Hindu">Hindu</option>
			    <option value="Muslim">Muslim</option>
			    <option value="Christian">Christian</option>
			    <option value="Other">Other</option>
			</select>
			<p style="color:red;"></p>
		</div>
		<div class="col-md-2">
		    <b>Caste <span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="cast" placeholder="Enter Caste" name="cas" title="enter valid caste" pattern="[A-Z][a-z]{,}" required>
			<p style="color:red;"></p>
		</div>
		<div class="col-md-2">
		    <b>Locality<span class="text-danger">*</span></b>
			<select class="form-control" id="local" name="locality" title="Choose any option" required>
		        <option hidden>select</option>
	         	<option value="Local">Local</option>
		        <option value="Non Local">Non Local</option>
		    </select>
			<p style="color:red;"></p>
	    </div>
    </div>
	</div>
</div>

<!--Academic Details-->
<div class="container" style="margin-top:1.2%">
	<div class="row">
	  <div class='col-sm-12 hiding' style="background-color:#DBD8D7;border-radius:10px;height:5%;">
		 <p class="pull-left" style="margin-top:0.4%;font-size:135%;">Academic Details</p>
		 <span class="fa fa-plus fa-3 hiddenn" style="font-size:1.5em;margin-top:0.8%;float:right;"></span>
	  </div>
	</div>
	<div>
		<div class="form-group row validate" style="margin-top:1%">
			<div class="col-md-6"><h5><b>Tenth Details</b></h5>
			</div>
			<div class="col-md-6"><h5><b>Intermediate Details</b></h5><br>
			</div>
			<div class="col-md-2">
				<b>Total Marks<span class="text-danger">*</span></b>
				<input type="text" class="form-control" id="tmrks" placeholder="Total Marks" name="tmar"  title="enter max. Grade(eg:-'10')" required>
				<p style="color:red;"></p>
			</div>
			<div class="col-md-2">
				<b>Marks/Grade<span class="text-danger">*</span></b>
				<input type="text" class="form-control" id="tgrad" placeholder="Enter Marks/Grade" name="tgrd" pattern="[0-9]+\.[0-9]+|[10]" title="Invalid grade,(eg:-'9.5' or '10')" required>
				<p style="color:red;"></p>
			</div>
			<div class="col-md-2">
				<b>Percentage<span class="text-danger">*</span></b>
				<input type="text" class="form-control" id="tprct" placeholder="Enter 10th Percent" name="tpct" pattern="[1-9][0-9]|[100]" title="enter valid % (eg:-'97' )" required>
				<p style="color:red;"></p>
			</div>
			<div class="col-md-2">
				<b>Total Marks<span class="text-danger">*</span></b>
				<input type="text" class="form-control" id="imrks" placeholder="Total Marks" name="imar" pattern="[1-9][0-9]{2,}" title="enter max. Grade(eg:-'10')" required>
			</div>
			<div class="col-md-2">
				<b>Marks/Grade<span class="text-danger">*</span></b>
				<input type="text" class="form-control" id="igrad" placeholder="Enter Marks/Grade" name="igrd" required>
			</div>
			<div class="col-md-2">
				<b>Percentage<span class="text-danger">*</span></b>
				<input type="text" class="form-control" id="iprct" placeholder="Enter 12th Percentage" title="enter valid % (eg:-'97')" required name="ipct">
				<p style="color:red;"></p>
			</div>
	    </div>
	</div>
</div>

<!--Personal Details-->
<div class="container" style="margin-top:1.2%">
	<div class="row">
	  <div class='col-sm-12 hiding' style="background-color:#DBD8D7;border-radius:10px;height:6%;">
		 <p class="pull-left" style="margin-top:0.4%;font-size:135%;">Personal Details</p>
		 <span class="fa fa-plus fa-3 hiddenn" style="font-size:1.5em;margin-top:0.8%;float:right;"></span>
	  </div>
	</div>
	<div>
	<div class="form-group row validate" style="margin-top:1%">
		<div class="col-md-3">
			<b>Blood Group <span class="text-danger">*</span></b>
			<select class="form-control" name="blood" id="blood" title="Choose any option" required>
			<option hidden>select</option>
			<option value="A+">A+</option>
		<option value="A-">A-</option>
		<option value="B+">B+</option>
		<option value="B-">B-</option>
		<option value="O+">O+</option>
		<option value="O-">O-</option>
		<option value="AB+">AB+</option>
		<option value="AB-">AB-</option>
			</select>
			<p style="color:red"></p>
		</div>
		<div class="col-md-5">
		    <b>Medical Problem</b>
			<input type="text" class="form-control" id="prblm" placeholder="Enter if any" value="No"name="prblm">
		</div>
		<div class="col-md-4">
		    <b>Physically Handicapped</b>
			<input type="text" class="form-control" id="phandp" placeholder="Enter if any" value="No" name="phand">
		</div>
		</div>
		<div class="form-group row validate" style="margin-top:1%">
		<div class="col-md-6">
		    <b>Identification Mark 1 <span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="mole1" placeholder="Enter Identification mark 1" name="mole1">
		</div>
		<div class="col-md-6">
		    <b>Identification Mark 2 <span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="mole2" placeholder="Enter Identification mark 2" name="mole2">
		</div>
	</div> 
	</div>
</div>

<!--Parent Details-->
<div class="container" style="margin-top:1.2%">
	<div class="row">
	  <div class='col-sm-12 hiding' style="background-color:#DBD8D7;border-radius:10px;height:6%;">
		 <p class="pull-left" style="margin-top:0.4%;font-size:135%;">Parent Details</p>
		 <span class="fa fa-plus fa-3 hiddenn" style="font-size:1.5em;margin-top:0.8%;float:right;"></span>
	  </div>
	</div>
	<div>
	<div class="form-group row" style="margin-top:1%">
	    <div class="col-md-3" >
		    <b>Father's Name<span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="fname" placeholder="Enter Father Name" name="fnam">
		</div>
	    <div class="col-md-3">
		    <b>Father's Mobile Number<span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="fphnm" placeholder="Enter Phone" name="fmob">
		</div>
	    <div class="col-md-3">
		    <b>Father's Profession <span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="fprfsn" placeholder="Enter Profession" name="fprfn">
		</div>
	    <div class="col-md-3">
		    <b>Annual Income<span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="fincome" placeholder="Enter Amount" name="incm">
		</div> 
	</div>
	<div class="form-group row" style="margin-top:1%">
	    <div class="col-md-3">
		    <b>Mother's Name<span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="mname" placeholder="Enter Mother Name" name="mnam">
		</div>
		<div class="col-md-3">
		    <b>Mother's Mobile Number<span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="mmobile" placeholder="Enter Amount" name="mmob">
		</div>
		<div class="col-md-3">
		    <b>Phone Number <span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="phn" placeholder="Enter Phone/Landline " name="phn">
		</div>
		<div class="col-md-3">
		    <b>Mother's Profession <span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="mprfsn" placeholder="Enter Profession" name="mprfn">
		</div>
		
	</div>  
    </div>    
</div>


<!--Address-->
<div class="container" style="margin-top:1.2%">
	<div class="row" style="margin-top:1%">
	  <div class='col-sm-12 hiding' style="background-color:#DBD8D7;border-radius:10px;height:6%;">
		 <p class="pull-left" style="margin-top:0.4%;font-size:135%;">Address</p>
		 <span class="fa fa-plus fa-3 hiddenn" style="font-size:1.5em;margin-top:0.8%;float:right;"></span>
	  </div>
	</div>
	<div>
		<div class="row">
	    <div class="col-md-8">
		    <b>Parent Address <span class="text-danger">*</span></b>
			<!--<input type="text" class="form-control" id="address" placeholder="Enter Address" name="adrs">-->
			<textarea class="form-control" id="address" placeholder="Enter Address..." name="adrs"> </textarea>
		</div>
	    <div class="col-md-4">
		    <b>Parent Mail ID</b>
			<input type="text" class="form-control" id="pmail" placeholder="Enter Parent Mail" name="pmal">
		</div>
	</div><br>
    <div class="row">
	    <div class="col-md-4">
		    <b>Local Guardian's Name <span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="gname" placeholder="Enter Name" name="gnam">
		</div>
	    <div class="col-md-8">
		    <b>Local Guardian's Address <span class="text-danger">*</span></b>
			<textarea class="form-control" id="gaddress" placeholder="Enter Address..." name="gadrs"> </textarea>
		</div>
	</div><br>
	<div class="row">
	    <div class="col-md-4">
		    <b>Local Guardian's Mail ID</b>
			<input type="text" class="form-control" id="ggmail" placeholder="Enter Mail " name="gmal">
		</div>
    <div class="col-md-4">
		    <b>Local Guardian's Phone Number <span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="mphnm" placeholder="Enter Phone" name="gphn">
		</div>
	<div class="col-md-4">
		    <b>Local Guardian's Mobile Number<span class="text-danger">*</span></b>
			<input type="text" class="form-control" id="gmobile" placeholder="Enter Mobile" name="gmob">
		</div>    
	</div>
	</div>
</div>

<!--Family Background-->
<div class="container" style="margin-top:1.2%">
	<div class="row" >
	  <div class='col-sm-12 hiding' style="background-color:#DBD8D7;border-radius:10px;height:6%;">
		 <p class="pull-left" style="margin-top:0.4%;font-size:135%;">Family Background</p>
		 <span class="fa fa-plus fa-3 hiddenn" style="font-size:1.5em;margin-top:0.8%;float:right;"></span>
	  </div>
	</div>
	<div>
		<div class="row" style="margin-top:1%">
		<div class="col-sm-2" >
	        <label for="year"><b>Home Community<span class="text-danger">*</span></b></label>
		        <select class="form-control" id="home" name="community">
			        <option hidden>select</option>
			        <option value="Rural">Rural</option>
			        <option value="Small Town">Small Town</option>
			        <option value="Sub Urban">Sub Urban</option>
			        <option value="Urban">Urban</option>
		        </select> 
        </div>
        <div class="col-sm-2" >
	        <label for="year"><b>Father's Education<span class="text-danger">*</span></b></label>
		        <select class="form-control" id="fedu" name="father_education">
			        <option hidden>select</option>
			       <option value="Advanced Degree">Advanced Degree</option>
			        <option value="Bachelor Degree">Bachelor Degree</option>
			        <option value="Attended College">Attended College</option>
			        <option value="Never Attended College">Never Attended College</option>
		        </select>
        </div>
        <div class="col-sm-2" >
	        <label for="year"><b>Mother's Education<span class="text-danger">*</span></b></label>
		        <select class="form-control" id="medu" name="mother_education">
			        <option hidden>select</option>
			       <option value="Advanced Degree">Advanced Degree</option>
			        <option value="Bachelor Degree">Bachelor Degree</option>
			        <option value="Attended College">Attended College</option>
			        <option value="Never Attended College">Never Attended College</option>
		        </select>
        </div>
	    <div class="col-sm-2" >
	        <label for="year"><b>Parents Trained in Science<span class="text-danger">*</span></b></label>
		        <select class="form-control" id="pts" name="science">
			        <option hidden>select</option>
			        <option value="Both">Both</option>
			        <option value="Mother">Mother</option>
			        <option value="Father">Father</option>
			        <option value="Neither">Neither</option>
		        </select> 
        </div>
        <div class="col-sm-2" >
	        <label for="year"><b>Father's Employment<span class="text-danger">*</span></b></label>
		        <select class="form-control" id="femp" name="father_employment">
			        <option hidden>select</option>
			        <option value="Self">Self</option>
			        <option value="Service">Service</option>
			        <option value="Business">Business</option>
			        <option value="Other">Any Other</option>
		        </select>
        </div>
        <div class="col-sm-2">
	        <label for="year"><b>Mother's Employment<span class="text-danger">*</span></b></label>
		        <select class="form-control" id="memp" name="mother_employment">
			        <option hidden>select</option>
			        <option value="outside job">Had an outside job</option>
			        <option value="home">Stayed at home</option>
			        <option value="Student">Student</option>
			        <option value="other">Any Other</option>
		        </select> 
        </div>
    </div>
	</div>
</div>


<!-- Extra Curricular Activities, Prizes / Awards-->
<div class="container" style="margin-top:1.2%">
	<div class="row" >
	  <div class='col-sm-12 col-xs-12 hiding' style="background-color:#DBD8D7;border-radius:10px;height:6%;">
		 <p class="pull-left" style="margin-top:0.4%;font-size:135%;">Extra Curricular Activities, Prizes / Awards</p>
		 <span class="fa fa-plus fa-3 hiddenn " style="font-size:1.5em;margin-top:0.8%;float:right;"></span>
	  </div>
	</div>
	<div>
	 <div class="row">
				<table class="table table-hover">
		  <thead>
		    <tr>
		        
					<th>
					    <div>
						    <label for="comment">Activity
							</label>
						</div>
					</th>
					
					<th>
					    <div>
						    <label for="comment">Date of Activity
							</label>
						</div>
					</th>
					<th>
					    <div>
						    <label for="comment">Description of Activity
							</label>
						</div>
					</th>
					<th>
					    <div>
						    <label for="comment">Grade Activity
							</label>
						</div>
					</th>
					<th>
					    <div>
						    <label for="comment">Remarks
							</label>
						</div>
					</th>
				
			</tr>
	      </thead>
            
        <tbody> 	
            <tr>
		       
					<th>
					    <div>  
					        <label for="comment">
						        <input type="text" class="form-control" id="f41"  name="activity">
							</label>
						</div>
				    </th>
					<th>
					    <div class="controls input-append date form_date " data-date="" data-date-format="dd-mm-yyyy" data-link-field="DOA" data-link-format="yyyy-mm-dd" >
				<p><input class='form-control' name="Dateofactivity" type="text" value="" Style="background-color: white;" placeholder="dd-mm-yyyy" id="dateofbirth" readonly required>
				<span class="add-on" id='id_span'><i class="fa fa-calendar "></i></span></p>
                <div>				
			    <input type="hidden" name="dateofactivity" id="DOA" value=""  />
				</div>
            </div>
				    </th>
					<th>
					    <div>  
					        <label for="comment">
						        <input type="text" class="form-control" id="f43"  name="description">
							</label>
						</div>
				    </th>
					<th>
					    <div>  
					        <label for="comment">
						       <input type="text" class="form-control" id="f44"  name="grade">
							</label>
						</div>
				    </th>
					<th>
					    <div>  
					        <label for="comment">
						        <input type="text" class="form-control" id="f45"  name="remarks">
							</label>
						</div>
				    </th>
		       
			</tr>			
		</tbody>
	</table>
	
      </div>
	  
	</div>
	
</div>
<center style="margin-top:3%">
		    <button type="submit" name="save" id="std-save" class="btn btn-primary  active">Save</button>
		    <button type="reset" class="btn btn-info  margin-left:1%">Reset</button>
	  </center>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
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

    $('.hiding').each(function(){
		$(this).parent().next().hide();
	});
	$('.hiding:first').parent().next().show();
	
	$('.hiddenn').click(function(){
	   // alert('a'+$(this).offset().top);
        if($(this).hasClass('fa-close'))
		{
		      $(this).removeClass('fa-close');
		      $(this).addClass('fa-plus');
		      $(this).parent().parent().next().hide();
		}
		else
		{
			$(this).removeClass('fa-plus');
			$(this).addClass('fa-close');
			$(this).parent().parent().next().show();
		}
		//alert('a'+$(this).offset().top);
		$('body').animate({
          scrollTop: $(this).offset().top
        }, 1500);
	});
    $('.hiddenn').click(function(){
		//alert('a'+$(this).offset().top);
		
	});
$("#std-save").click(function(){
	$('.hiding').each(function(){
		$(this).parent().next().show();
	});
});
	
    $('.validate > div > select').blur(function(){
		if($(this).val()=='select')//for invalid
        {
        	//alert('invalid');
          $(this).css("border","1px solid red");
		  var x=$(this).attr('title');
		  $(this).next().text(x);
        }
		else
		{
			//alert('valid');
			$(this).css("border","");
		    $(this).next().text('');
		}
	});

	$('.validate > div > input').blur(function(){
		if ($(this).is(":invalid")) //for invalid
        {
        	//alert('invalid');
          $(this).css("border","1px solid red");
		  var x=$(this).attr('title');
		  $(this).next().text(x);
        }
		else
		{
			//alert('valid');
			$(this).css("border","");
		    $(this).next().text('');
		}
	});
	


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

  </script>
<!--===============================================================================================-->
 
  
	
</body>

</html>
