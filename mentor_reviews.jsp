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
  <!--modal--->
  <link href="css/new-modal.css" rel="stylesheet">
<!--===============================================================================================-->  

  
</head>
<body class="mfbg" id="page-top">

      <!-- Breadcrumbs-->
      <ol class="breadcrumb" style="background-color:transparent;">
        <li class="breadcrumb-item">
          <a href="index.jsp" target="_top">Home</a>
        </li>
        <li class="breadcrumb-item active">Mentoring&nbsp; / &nbsp;Mentor Reviews</li>
      </ol>	
	
<div class="container">
	<form name="form1" onsubmit="document.form1.target='display_frame';return true;" method='post' action="mentor_reviews">
		<div class="container-table100">
		<div class="container">
		<div class="form-group">
			<div class="row">
				<div class="col-sm-2">
					<label for="rollno"><b>Roll No.:</b></label>
					<input class="form-control" id="rollno" name="rollno" type="text" value="<%=request.getSession().getAttribute("user_id")%>" readonly style="background-color:'white';">
				</div>
				<div class="col-sm-4">
					<label for="studentname"><b>Student Name:</b></label>
					<input class="form-control" id="studentname" type="text"  value="<%=(String)request.getSession().getAttribute("user_name")%>" readonly style="background-color:'white';" >
				</div>
				 <div class="col-sm-2">
					<label for="year"><b>Year:</b></label>
					<select class="form-control subsearch" id="year" name="year" >
						<option id='0' hidden >select</option>
						<option id='1' value='1'>I</option>
						<option id='2' value='2'>II</option>
						<option id='3' value='3'>III</option>
						<option id='4' value='4'>IV</option>
					</select>
				</div>
				<div class="col-sm-2">
					<label for="semester"><b>Semester:</b></label>
					<select class="form-control subsearch" id="semester" name="semester">
						<option hidden>select</option>
						<option value='1'>I</option>
						<option value='2'>II</option>
					</select>
				</div>
				<div class="col-sm-2">
				      <br><button type="submit" class="btn btn-primary" name="search" id='search' disabled title="Choose Year and Semester to enable">Search</button>
				</div>
				
			</div>
		</div><br><br>
			<h3>Add Record</h3>
			<div class="row">
			      <div class="wrap-table100">
				      <div class="table100">
			              <table class="table table-hover" id="data">
				             <thead>
					             <div class="row">

					                 <tr class="table100-head theadrow">
										<div class="col-sm-1">
								            <th><center>Date</center></th>
							            </div>
							            <div class="col-sm-4">
								              <th><center>Subject Discussed</center></th>
							             </div>
							             <div class="col-sm-4">
								              <th><center>Suggestions/Conclusions</center></th>
							             </div>
							             <div class="col-sm-3">
								             <th><center>Remarks</center></th>
							             </div>
						             </tr>
		               			 </div>
	            			 </thead>
				<tbody>
					
					<div class='row'>
					     <tr class='tbodyrow'>
						     <div class='col-sm-1'>
								<td>
									<div class="controls input-append date form_date " data-date="" data-date-format="dd-mm-yyyy" data-link-field="dateofvisit" data-link-format="yyyy-mm-dd">
										<p><input class=' form-control subsave-date' type="text" value="" Style="background-color: white;" placeholder="dd-mm-yyyy" id="id_dateofvisit" readonly>
										<span class="add-on" id='id_span'><i class="fa fa-calendar "></i></span></p>	
									</div>
									<input type="hidden" name="dateofvisit" id="dateofvisit" value=""  />
								</td>
							</div>
							<div class='col-sm-4'><td><textarea class='form-control normal subsave-area' rows='2' cols='36' name='subjectdiscussed' id='subjectdiscussed' maxlength="1000" Style="background-color:white" data-toggle="modal" onclick="openLoginModal();" readonly></textarea><p id="max_sub_diss">0/1000</p></td></div>
							<div class='col-sm-4'><td><textarea class='form-control normal subsave-area' rows='2' cols='36' name='suggestion_conclusion' id='suggestion_conclusion' maxlength="1000" Style="background-color:white" data-toggle="modal" onclick="openLoginModal();" readonly></textarea><p id="max_sugg">0/1000</p></td></div>
							<div class='col-sm-3'><td><textarea class='form-control normal subsave-area' rows='2' cols='36' name='remarks' id='remarks' maxlength="1000" Style="background-color:white" data-toggle="modal" onclick="openLoginModal();" readonly></textarea><p id="max_remarks">0/1000</p></td></div>
							 
						</tr>
					</div>
					
				</tbody>

			</table>
			<center>
				<button type="submit" class="btn btn-primary" disabled id='save' name='save' title="fill above fields to enable">Save</button>
				<button type="button" onclick="document.getElementById('id_dateofvisit').value = '';document.getElementById('subjectdiscussed').value = '';document.getElementById('remarks').value= '';document.getElementById('suggestion_conclusion').value= '';document.getElementById('max_remarks').innerHTML = '0/100';document.getElementById('max_sugg').innerHTML = '0/100';document.getElementById('max_sub_diss').innerHTML = '0/100';" class="btn btn-info">Reset</button>
			</center>
			<h3>View Records</h3>
			<div class="embed-responsive embed-responsive-16by9">
			      <iframe class="embed-responsive-item" src="empty.html" name="display_frame"></iframe>  
			</div>
		</div>
		</div>
		</div>
	   </div>
	   </div>
	  
	</form>
</div>
</br></br></br>      

<!-- Modal -->
 <div class="modal fade login" id="loginModal">
   <div class="modal-dialog login animated">
	  <div class="modal-content">
		 <div class="modal-header">
			<h4 class="modal-title"></h4>
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		</div>
		<div class="modal-body">  
			<div class="box">
				<div class="form loginBox">
					<textarea rows='7' cols='38' style="width:100%" id='modal_val'></textarea><p id="aliyas"></p><br>
					<button class="btn btn-success" id='modal_ok' data-dismiss="modal"> Ok</button>  &nbsp;
					<button type="button" class="btn btn-danger btn-default" data-dismiss="modal"> Cancel</button>
				</div>
			</div>
		</div>	
	  </div>
   </div>
 </div>
 <!--modal ending-->
  <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
   
	


 <!--=====================================Script links==============================================-->
		<!--modal-->
	<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="js/new-modal.js" type="text/javascript"></script>
	<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
    <script src="js\bootstrap.bundle.js"></script>
    <script src="js\bootstrap.bundle.min.js"></script>
    <script src="js\bootstrap.js"></script>
    <script src="js\bootstrap.min.js"></script>
	<!--<script src="vendor/jquery/jquery.min.js"></script>-->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>  
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="js/sb-admin.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	
	<!--date scripts links-->

	<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	
	
	
	<!--auto textarea size-->
	<script src='js/jquery.autosize.js' charset="UTF-8"></script>
	
	<!---->
	<script src="js/main.js"></script>
<!--===============================================================================================-->

<script type="text/javascript">
   
   $(document).ready(function(){
     $("#subjectdiscussed").click(function(){
        $('#modal_val').val($("#subjectdiscussed").val());
		$('#modal_val').attr('maxlength',$("#subjectdiscussed").attr('maxlength'));
        $('h4').text('Subject Discussed');
		$('#aliyas').text($('#max_sub_diss').text());
        $('#modal_val').attr('placeholder','write about Subject Discussed');
        $('#modal_ok').click(function(){
                   if($('h4').text()=='Subject Discussed')
               {
                   $("#subjectdiscussed").val($('#modal_val').val());
				   $("#subjectdiscussed").focus();
				   $('#max_sub_diss').text($('#aliyas').text());
               }
        });
    });
    
    $("#suggestion_conclusion").click(function(){
        $('#modal_val').val($("#suggestion_conclusion").val());
		$('#modal_val').attr('maxlength',$("#suggestion_conclusion").attr('maxlength'));
        $('h4').text('Suggestions & Conclusions');
		$('#aliyas').text($('#max_sugg').text());
        $('#modal_val').attr('placeholder','write about Suggestions & Conclusions');
        $('#modal_ok').click(function(){
               if($('h4').text()=='Suggestions & Conclusions')
               {
                 $("#suggestion_conclusion").val($('#modal_val').val());
				 $("#suggestion_conclusion").focus();
				 $('#max_sugg').text($('#aliyas').text());
               }
        });
    });
   
    $("#remarks").click(function(){
        $('#modal_val').val($("#remarks").val());
		$('#modal_val').attr('maxlength',$("#remarks").attr('maxlength'));
        $('h4').text('Remarks');
		$('#aliyas').text($('#max_remarks').text());
        $('#modal_val').attr('placeholder','write about Remarks');
        $('#modal_ok').click(function(){
               if($('h4').text()=='Remarks')
               {
                 $("#remarks").val($('#modal_val').val());
				 $("#remarks").focus();
				 $('#max_remarks').text($('#aliyas').text());
               }
        });
    });
     
	     
     $('#remarks,#subjectdiscussed,#suggestion_conclusion,#modal_val').on("input",function(){
		 if($('#remarks').val().length <= 1000)
		 {
		     $('#max_remarks').text($('#remarks').val().length+'/1000');
		 }
		 if($('#subjectdiscussed').val().length <= 1000)
          {
                $('#max_sub_diss').text($('#subjectdiscussed').val().length+'/1000');
          }
		  if($('#suggestion_conclusion').val().length <= 1000)
          {
		      $('#max_sugg').text($('#suggestion_conclusion').val().length+'/1000');
          }
		  if($('#modal_val').val().length <= 1000)
		{ 
		  $('#aliyas').text($('#modal_val').val().length+'/1000');
		}
       });
	
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
	
  </script>

</body>

</html>


