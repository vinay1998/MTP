import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class mentor_reviews_update extends HttpServlet
{
  public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
  {

	//global object declaration section
    Connection conn = null;
	Statement stmt = null;
	Statement stmt_date = null;
	ResultSet rs=null;
	ResultSet rs_date=null;
	PrintWriter out = res.getWriter();
	res.setContentType("text/html");
	
	//html form values section
	int year=Integer.parseInt(req.getParameter("year"));
	int semester=Integer.parseInt(req.getParameter("semester"));
	String roll_no=req.getParameter("rollno");
	String subject_discussed=req.getParameter("subjectdiscussed");
	String date_of_visit=req.getParameter("dateofvisit");
	String remarks=req.getParameter("remarks");
	String suggestion_conclusion=req.getParameter("suggestion_conclusion");

	//date calculation
	java.util.Date date=new java.util.Date();
	java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
	

	//jdbc logic section
	try
    {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String dbURL = "jdbc:sqlserver://10.45.29.254;DatabaseName=VNR_Students_Record";
        String user = "sa";
        String pass = "vnrvjiet1@3";
        conn = DriverManager.getConnection(dbURL, user, pass);
		stmt = conn.createStatement();
		stmt_date = conn.createStatement();


		String sql2 = "SELECT convert(varchar,Discussed_Date,105),Subject_Discussed,Suggestions,Remarks,Mentor_Reviews_ID FROM Mentor_Reviews where Years="+year+" and Student_Code='"+roll_no+"' and Semester="+semester+" order by Mentor_Reviews_ID desc";
		rs = stmt.executeQuery(sql2);
			
		//to get database date format
		rs_date = stmt_date.executeQuery("SELECT Discussed_Date FROM Mentor_Reviews where Years="+year+"  and Student_Code='"+roll_no+"' and Semester="+semester+" order by Mentor_Reviews_ID desc");

	//table head code
	out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.1.0/css/regular.css' integrity='sha384-avJt9MoJH2rB4PKRsJRHZv7yiFZn8LrnXuzvmZoD3fh1aL6aM6s0BBcnCvBe6XSD' crossorigin='anonymous'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");
	out.print("<link href='css/bootstrap-date-edit.css' rel='stylesheet'><link href='css/bootstrap-datetimepicker.min.css' rel='stylesheet'></head>");//datepicker css links	
	out.print("<body class='sfbg'><form action='mentor_reviews' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");						
	out.print("<div class='col-sm-3'><th>Date</th></div><div class='col-sm-3'><th>Subject Discussed</th></div><div class='col-sm-3'><th>Suggestions/Conclusions</th></div><div class='col-sm-3'><th>Remarks</th></div><div class='col-sm-1'><th></th></div>");						
	out.print("</tr></div></thead>");	

	//table body code

		while(rs.next())
		{
			rs_date.next();

			if(req.getParameter(String.valueOf(rs.getInt(5)))!=null)
			{
				out.print("<tbody><div class='row'>");
				out.print("<tr class='tbodyrow'><div class='col-sm-2'><td><div class='controls input-append date form_date' data-date='' data-date-format='dd-mm-yyyy' data-link-field='id_date' data-link-format='yyyy-mm-dd'><p><input class=' form-control' type='text' value='"+rs.getString(1)+"' Style='background-color: white;' placeholder='dd-mm-yyyy' id='id_dateofvisit'readonly><span class='add-on'><i class='fa fa-calendar'></i></span></p></div><input type='hidden' value='"+rs_date.getString(1)+"' name='dateofvisit' id='id_date' value=''/></td></div><div class='col-sm-2'><td><textarea class='form-control' name='subjectdiscussed' style='background-color:white' rows='5' cols='25'  >"+rs.getString(2)+"</textarea></td>");
				out.print("<div class='col-sm-3'><td><textarea class='form-control' style='background-color:white' name='suggestion_conclusion' rows='5' cols='35'  >"+rs.getString(3)+"</textarea></td></div><div class='col-sm-3'><td><textarea class='form-control' style='background-color:white' name='remarks' rows='5' cols='35' >"+rs.getString(4)+"</textarea></td></div>");
				out.print("<div class='col-sm-1'><td><button type='submit' class='btn btn-success' name='update' value="+rs.getInt(5)+"><i class='far fa-check-circle' style='font-size:25px;'></i></button></td></div></tr></div></tbody>");			

			}
			else
			{
				out.print("<tr class='tbodyrow'><div class='col-sm-3'><td><p>"+rs.getString(1)+"</p></td></div><div class='col-sm-2'><td><textarea class='form-control' style='background-color:white' rows='5' cols='25'  disabled>"+rs.getString(2)+"</textarea></td></div><div class='col-sm-3'><td><textarea class='form-control' style='background-color:white' rows='5' cols='35'  disabled>"+rs.getString(3)+"</textarea></td></div><div class='col-sm-3'><td><textarea class='form-control' style='background-color:white' rows='5' cols='35' disabled>"+rs.getString(4)+"</textarea></td></div><div class='col-sm-1'><td><button disabled type='submit' class='btn btn-primary btn-sm' name='"+rs.getInt(5)+"'><span class='glyphicon glyphicon-pencil' style='font-size:25px;'></span></button></td></div></tr>");			
			
			}
			
       
		}
		out.print("</div></tbody></table><input type=hidden name='year' value='"+year+"'/><input type=hidden name='rollno' value='"+roll_no+"'/><input type=hidden name='semester' value='"+semester+"'/></form>");
			out.print("<script type='text/javascript' src='js/jquery-1.8.3.min.js' charset='UTF-8'></script><script type='text/javascript' src='js/bootstrap-datetimepicker.js' charset='UTF-8'></script>");//date picker script links
			out.print("<script>$('.form_date').datetimepicker({weekStart: 1,todayBtn:  1,autoclose: 1,todayHighlight: 1,startView: 2,minView: 2,forceParse: 0,endDate:'+0d'});</script></body></html>");//date pcker js

		stmt_date.close();
		stmt.close();
		conn.close();
    }
    catch(Exception e)
	  {
		out.print(e);
	
	}
	 
  }
 
}