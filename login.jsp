<%@ page import="java.io.*,java.util.Date,java.text.SimpleDateFormat,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<%
	
	Connection conn = null;
	
	
	Statement College_Stmt = null;
	Statement Course_Stmt = null;
	Statement Staff_Stmt = null;
	Statement Dept_Stmt = null;
	
	
	ResultSet College_Code = null;
	ResultSet Course_Code = null;
	ResultSet Staff_Code = null;
	ResultSet Dept_No = null;
	
	//jdbc logic section

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String dbURL = "jdbc:sqlserver://10.45.29.254;DatabaseName=VNR_Students_Record";
        String user = "sa";
        String pass = "vnrvjiet1@3";
		
        conn = DriverManager.getConnection(dbURL, user, pass);
		
		College_Stmt = conn.createStatement();
		Course_Stmt = conn.createStatement();
		Staff_Stmt = conn.createStatement();
		Dept_Stmt = conn.createStatement();
		
		College_Code = College_Stmt.executeQuery("Select College_Code from Miscellaneous where College_Code IS NOT NULL");
		Course_Code = Course_Stmt.executeQuery("Select Course_Code from Miscellaneous where Course_Code IS NOT NULL");
		Staff_Code = Staff_Stmt.executeQuery("Select Staff_Code from Miscellaneous where Staff_Code IS NOT NULL");
		Dept_No = Dept_Stmt.executeQuery("Select Dept_No from Department where Dept_No IS NOT NULL");
		
		while(College_Code.next())
		{
			College_Code.getString(1);
		}
		while(Course_Code.next())
		{
			Course_Code.getString(1);
		}
		while(Staff_Code.next())
		{
			Staff_Code.getString(1);
		}
		while(Dept_No.next())
		{
			Dept_No.getString(1);
		}
		
		College_Stmt.close();
		Course_Stmt.close();
		Staff_Stmt.close();
		Dept_Stmt.close();
		conn.close();
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
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
		<div class="container-login100 ">
			<div class="wrap-login100 ">
				
				<div class="login100-pic js-tilt" data-tilt>
					<img src="img/vnr logo.png" alt="VNRVJIET_LOGO">
				</div>
				<form action="login" class="login100-form validate-form">
					<span class="login100-form-title">
						<font color="#000000">
							<h2>MTP Login</h2>
						</font>
					</span>
					<center><b>
						<input type="radio" name="user_type" id="user_type" value="Mentee"> Mentee &nbsp;&nbsp;&nbsp;
						<input type="radio" name="user_type" id="user_type" value="Mentor"> Mentor &nbsp;&nbsp;&nbsp;
						<input type="radio" name="user_type" id="user_type" value="Admin"> Admin &nbsp;&nbsp;&nbsp;
					</b></center><br>

					<div class="wrap-input100 validate-input" data-validate = "User ID should be max of 10 characters.">
						<input class="input100" type="text" name="user_id" id="user_id" placeholder="User ID">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="user_password" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button type="submit" name="login" class="login100-form-btn" id="login">
							Login
						</button>
					</div>

					<div class="text-center p-t-12">
						<b><span class="txt1">
							Forgot&nbsp;&nbsp;
						</span>
						<a class="txt2" href="forgotpassword.html">
							<u>Username / Password?</u>
						</a></b>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="Login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Login/vendor/bootstrap/js/popper.js"></script>
	<script src="Login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="Login/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.2
		})
		
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>