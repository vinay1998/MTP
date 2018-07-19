<%@ page import="java.io.*,java.util.Date,java.text.SimpleDateFormat,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>student matrixing</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="js\bootstrap.bundle.js"></script>
  <script src="js\bootstrap.bundle.min.js"></script>
  <script src="js\bootstrap.js"></script>
  <script src="js\bootstrap.min.js"></script>
</head>
<body class="mfbg" id="page-top" >

	<!-- Breadcrumbs-->
		<ol class="breadcrumb" style="background-color:transparent;">
			<li class="breadcrumb-item">
				<a href="index.jsp" target="_top">Home</a>
			</li>
        <li class="breadcrumb-item active">Student Matrixing</li>
      </ol>
	
	
	<form>
		<div class="container">
			<div class="form-group">
				<div class="row">            
					<div class="col-sm-2">
						<label for="rollno"><b>Roll No.:</b></label>
						<input class="form-control" name="rollno" id="rollno" type="text" value="<%=(String)request.getSession().getAttribute("user_id")%>"  style="background-color:white;" readonly>
					</div>
					<div class="col-sm-4">
						<label for="studentname"><b>Student Name:</b></label>
						<input class="form-control" id="id_studentname" type="text" value="<%=(String)request.getSession().getAttribute("user_name")%>"  style="background-color:white;" readonly> 
					</div>
					<div class="col-sm-2">
						<label for="year"><b>Year:</b></label>
						<select class="form-control subsearch" name="year" id="year">
							<option hidden>Select</option>
							<option value="1">I</option>
							<option value="2">II</option>
							<option value="3">III</option>
							<option value="4">IV</option>
						</select>
					</div>
					<div class="col-sm-2">
						<label for="semester"><b>Semester:</b></label>
						<select class="form-control subsearch" name="semester" id="semester">
							<option hidden>Select</option>
							<option value="1">I</option>
							<option value="2">II</option>
						</select>
					</div>
					<div class="col-sm-2">
						<button type="submit" class="btn btn-primary" name="msearch" id="msearch" title="Choose Year and Semester to enable">Search</button>						
					</div>
				</div>
			</div>
			<br/>
			<table class="table table-hover">
				<thead >
					<div class="row">
						<tr class="table100-head theadrow">
							<div class="col-sm-1"></div>
							<div class="col-sm-4"><th><center>Name of Student Met</center></th></div>
							<div class="col-sm-2"><th><center>Date</center></th></div>
							<div class="col-sm-4"><th><center>Comments</center></th></div>
							<div class="col-sm-1"></div>
						</tr>
					</div>
				</thead>
				<tbody>
					<tr >
						<div class="row">
							<div class="col-sm-1"></div>
							<div class="col-sm-4"><td><input class="form-control" id="signplacement" type="text"><br></td></div>
							<div class='col-sm-2'>
								<td>
									<div class="controls input-append date form_date subsave-date" data-date="" data-date-format="dd-mm-yyyy" data-link-field="dateofvisit" data-link-format="yyyy-mm-dd">
										<p><input class=' form-control' type="text" value="" Style="background-color: white;" placeholder="dd-mm-yyyy" id="id_datevisit" readonly>
										<span class="add-on" id='idspan'><i class="fa fa-calendar "></i></span></p>	
									</div>
									<input type="hidden" name="datevisit" id="datevisit" value=""  />
								</td>
							</div>
							<div class="col-sm-4"><td><textarea class="form-control" rows="3" cols="70" id="comments"></textarea><p id="comments_text">0/1000</p></td></div>
							<div class="col-sm-1"></div>
						</div>
					</tr>						
				</tbody>
			</table>
		    <center>
				<button type="submit" class="btn btn-primary">Save</button>
				<button type="reset" class="btn btn-info">Reset</button>
			</center>
		</div>
	</form>
	
	
	
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){  
			$('#comments').on("input",function(){
				$('#comments_text').text('/1000');
				if($('#comments').val().length <= 1000)
				{
					$('#comments_text').text($('#comments').val().length+'/1000');
				}
			});
		});
	</script>
</body>
</html>