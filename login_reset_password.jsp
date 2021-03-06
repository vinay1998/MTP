<%@ page import="java.io.*,java.util.Date,java.text.SimpleDateFormat,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Reset Password</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="img/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/css/util.css">
	<link rel="stylesheet" type="text/css" href="Login/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100 bg-success ">
			<div class="wrap-login100 ">
				<div class="container">
							<center><h2><b>Reset Password</b></h2></center>
						</font>
					</span><br><br>
					<form action="reset_password">
						<div class="container">
							<div class="form-group">
								<div class="row">
									<div class="col-sm-4">
										<label for="Aadhar Card Number "><b>Aadhar Card Number</b></label>
									</div>
									<div class="col-sm-1">
										<b>:</b>
									</div>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="aadhar_card_number" name="aadhar_card_number"  value="<%=request.getSession().getAttribute("aadhar_number")%>"  Style="background-color:white;" readonly>
									</div>
								</div><br>
								<div class="row">
									<div class="col-sm-4">
										<label for="New Password "><b>New Password</b></label>
									</div>
									<div class="col-sm-1">
										<b>:</b>
									</div>
									<div class="col-sm-5">
										<input class="form-control" id="New_Password" name="new_password" type="text">
									</div>
								</div><br>
								<div class="row">
									<div class="col-sm-4">
										<label for="Re - Enter Password "><b>Re-Enter Password</b></label>
									</div>
									<div class="col-sm-1">
										<b>:</b>
									</div>
									<div class="col-sm-5">
										<input class="form-control" id="re_enter_password" name="re_enter_password" type="text">
									</div>
								</div><br>
								<center><button type="submit" class="btn btn-primary" name="reset_pass">Reset Password</button></center>					
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
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