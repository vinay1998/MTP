import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class subjectmaster_update extends HttpServlet
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
	String regulation=req.getParameter("regulation");
	String dept=req.getParameter("dept");
	int year=Integer.parseInt(req.getParameter("year"));
	int semester=Integer.parseInt(req.getParameter("semester"));
	String subjectname=req.getParameter("subjectname");
	String subjectcode=req.getParameter("subjectcode");
	String subjectabbr=req.getParameter("subjectabbr");
	String maxassign=req.getParameter("maxassign");
	String maxmid=req.getParameter("maxmid");
	String subjectcredits=req.getParameter("subjectcredits");

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



		//ResultSet id = stmt.executeQuery("SELECT Mentor_Mentee_Meeting_ID FROM Student_Mentor_Mentee_Meetings where Student_Code='15071A1245' and Years="+year+" and Semester="+semester+"order by Mentor_Mentee_Meeting_ID desc");
		rs = stmt.executeQuery("SELECT Sub_Code,Sub_Name,Sub_Abbr,Sub_Max_Assign_Marks,Sub_Max_Mid_Marks,Sub_Credits,Sub_ID FROM Subject where Sub_Regulation='"+regulation+"' and Sub_Dept='"+dept+"' and Sub_Year="+year+" and Sub_Semester="+semester+" order by Sub_ID desc");

		//table head code

		out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");
		out.print("<link href='css/bootstrap-date-edit.css' rel='stylesheet'></head>");//datepicker css links
		out.print("<body><form action='subject_update' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");		
		out.print("<div class='col-sm-10'><th><center>Subject Details</center></th></div><div class='col-sm-2'><th></th></div>");	
		out.print("</tr></div></thead><tbody><div class='row'>");
		//table body code

		while(rs.next())
		{
			if(req.getParameter((rs.getString(7)))!=null)
			{
				out.print("<tr class='tbodyrow'><div class='col-sm-10'><td><div class='row'><div class='col-sm-2'><label for='sc'><b>Subject Code:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectcode' type='text' value='"+rs.getString(1)+"' name='subjectcode'></div><div class='col-sm-2'><label for='sn'><b>Subject Name:</b></label></div><div class='col-sm-6'><input class='form-control' id='subjectname' name='subjectname' value='"+rs.getString(2)+"'  type='text'></div></div><br>");
				out.print("<div class='row'><div class='col-sm-2'><label for='sa'><b>Subject Abbr.:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectabbr' name='subjectabbr'  value='"+rs.getString(3)+"' type='text'></div><div class='col-sm-2'><label for='sam'><b>Max Assignment Marks:</b></label></div><div class='col-sm-2'><input class='form-control' id='maxassign' name='maxassign'  value='"+rs.getString(4)+"' type='text'></div><div class='col-sm-2'><label for='mmm'><b>Max Mid Marks:</b></label></div><div class='col-sm-2'><input class='form-control' id='maxmid' name='maxmid' value='"+rs.getString(5)+"' type='text'></div></div><br>");
				out.print("<div class='row'><div class='col-sm-2'><label for='sc'><b>Subject Credits:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectcredits' name='subjectcredits' value='"+rs.getString(6)+"' type='text'></div></div></td><div class='col-sm-2'><td><button type='submit' class='btn btn-primary' name=update value='"+rs.getInt(7)+"'>Update</button></td></div></tr>");			

			}
			else
			{
				out.print("<tr class='tbodyrow'><div class='col-sm-10'><td><div class='row'><div class='col-sm-2'><label for='sc'><b>Subject Code:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectcode' disabled type='text' value='"+rs.getString(1)+"' name='subjectcode'></div><div class='col-sm-2'><label for='sn'><b>Subject Name:</b></label></div><div class='col-sm-6'><input class='form-control' id='subjectname' disabled name='subjectname' value='"+rs.getString(2)+"'  type='text'></div></div><br>");
				out.print("<div class='row'><div class='col-sm-2'><label for='sa'><b>Subject Abbr.:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectabbr' disabled name='subjectabbr'  value='"+rs.getString(3)+"' type='text'></div><div class='col-sm-2'><label for='sam'><b>Max Assignment Marks:</b></label></div><div class='col-sm-2'><input class='form-control' id='maxassign' disabled name='maxassign'  value='"+rs.getString(4)+"' type='text'></div><div class='col-sm-2'><label for='mmm'><b>Max Mid Marks:</b></label></div><div class='col-sm-2'><input class='form-control' id='maxmid' disabled name='maxmid' value='"+rs.getString(5)+"' type='text'></div></div><br>");
				out.print("<div class='row'><div class='col-sm-2'><label for='sc'><b>Subject Credits:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectcredits' name='subjectcredits' disabled value='"+rs.getString(6)+"' type='text'></div></div></td><div class='col-sm-2'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(7)+"'>Edit</button></td></div></tr>");			
						
			}
			       
		}
		out.print("</div></tbody></table><input type=hidden name='regulation' value='"+regulation+"'/><input type=hidden name='dept' value='"+dept+"'/><input type=hidden name='year' value='"+year+"'/><input type=hidden name='semester' value='"+semester+"'/></form>");
		out.print("<script type='text/javascript' src='js/jquery-1.8.3.min.js' charset='UTF-8'></script><script type='text/javascript' src='js/bootstrap-datetimepicker.js' charset='UTF-8'></script></body></html>");//date picker script links

		stmt.close();
		conn.close();
    }
    catch(Exception e)
	  {
		out.print(e);
	
	}
	 
  }
 
}