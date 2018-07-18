import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class departmentmaster_update extends HttpServlet
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
	String deptcode=req.getParameter("deptcode");
	String deptname=req.getParameter("deptname");
	String deptno=req.getParameter("deptno");
	//int sections=Integer.parseInt(req.getParameter("sections"));
	

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
		int count=1;

		rs = stmt.executeQuery("SELECT Dept_No,Dept_Code,Dept_Name,Dept_Sections,Dept_ID FROM Department order by Dept_ID desc");

		//table head code
			out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");
			out.print("<link href='css/bootstrap-date-edit.css' rel='stylesheet'><link href='css/bootstrap-datetimepicker.min.css' rel='stylesheet'></head>");//datepicker css links
			out.print("<body class='sfbg'><form action='department_update' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");		
			out.print("<div class='col-sm-1'><th><center>Department Number</center></th></div><div class='col-sm-6'><th><center>Department Name</center></th></div><div class='col-sm-1'><th><center>Department Code</center></th></div><div class='col-sm-1'><th><center>Sections</center></th></div><div class='col-sm-2'><th></th></div>");	
			out.print("</tr></div></thead><tbody><div class='row'>");
		//table body code

		while(rs.next())
		{

			if(req.getParameter((rs.getString(5)))!=null)
			{
					out.print("<tr class='tbodyrow'><div class='col-sm-1'><td><center><input type='text' name='deptno' value='"+rs.getString(1)+"' /></center></td></div><div class='col-sm-6'><td><center><textarea rows='4' name='deptname'>"+rs.getString(3)+"</textarea></center></td></div><div class='col-sm-1'><td><center><input type='text' name='deptcode' value='"+rs.getString(2)+"' /></center></td></div><div class='col-sm-1'><td><center><input type='text' name='sections' value='"+rs.getInt(4)+"' /></center></td></div><div class='col-sm-2'><td><button type='submit' class='btn btn-primary' name='update' value='"+rs.getInt(5)+"'>Update</button></td></div></tr>");			

			}
			else
			{
					out.print("<tr class='tbodyrow'><div class='col-sm-1'><td><center><input type='text' disabled value='"+rs.getString(1)+"' /></center></td></div><div class='col-sm-6'><td><center><textarea rows='4' disabled>"+rs.getString(3)+"</textarea></center></td></div><div class='col-sm-1'><td><center><input type='text' disabled value='"+rs.getString(2)+"' /></center></td></div><div class='col-sm-1'><td><center><input type='text' disabled value='"+rs.getInt(4)+"' /></center></td></div><div class='col-sm-2'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(5)+"' disabled>Edit</button></td></div></tr>");			
			
			}
			
       
		}
			out.print("</div></tbody></table></form>");
			//out.print("<script type='text/javascript' src='js/jquery-1.8.3.min.js' charset='UTF-8'></script><script type='text/javascript' src='js/bootstrap-datetimepicker.js' charset='UTF-8'></script>");//date picker script links
			out.print("</body></html>");

		stmt.close();
		conn.close();
	}

	 catch(Exception e)
	  {
		out.print(e);
	
	}

  }
}

