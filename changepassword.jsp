<%@ page import="java.io.*,java.util.Date,java.text.SimpleDateFormat,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
<!--===============================================================================================-->  


</head>
<body class="mfbg" id="page-top">


	<!-- Breadcrumbs-->
      <ol class="breadcrumb" style="background-color:transparent;">
        
        <li class="breadcrumb-item active" >Change Password</li>
      </ol>
	  
	  
	  
	<div class="container">
		<form method="post" action="changepassword_save.jsp">
			<div class="form-group">
				<div class="row">
					<div class="col-sm-4">
						<label for="old_pass "><b>Old Password</b></label>
					</div>
					<div class="col-sm-1">
						<b>:</b>
					</div>
					<div class="col-sm-5">
						<input class="form-control" id="old_pass" name="old_pass" type="text">
					</div>
				</div><br>
				<div class="row">
					<div class="col-sm-4">
						<label for="new_pass "><b>New Password</b></label>
					</div>
					<div class="col-sm-1">
						<b>:</b>
					</div>
					<div class="col-sm-5">
						<input class="form-control" id="new_pass" name="new_pass" type="text">
					</div>
				</div><br>
				<div class="row">
					<div class="col-sm-4">
						<label for="re_pass "><b>Re - Enter Password</b></label>
					</div>
					<div class="col-sm-1">
						<b>:</b>
					</div>
					<div class="col-sm-5">
						<input class="form-control" id="re_pass" name="re_pass" type="text">
					</div>
				</div><br>
				<center><button type="submit" class="btn btn-primary" name="save" id="save">Save</button></center>					
			</div>
			<input class="form-control" id="user_id" name="user_id" type="hidden" value="<%=(String)request.getSession().getAttribute("user_id")%>">
		</form>
	</div>

	<!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
		
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.2
		})
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>