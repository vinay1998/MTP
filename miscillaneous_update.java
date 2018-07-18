import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class miscillaneous_update extends HttpServlet
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
	String clgcode=req.getParameter("clgcode");
	String coursecode=req.getParameter("coursecode");
	String deptcode=req.getParameter("deptcode");

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
//		int count=1;

		rs = stmt.executeQuery("SELECT College_Code,Course_Code,Staff_Code,Miscellaneous_ID FROM Miscellaneous order by Miscellaneous_ID desc");

		//table head code
			out.print("<html><head><link rel='stylesheet' href='css\bootstrap.css'><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

			out.print("<body class='sfbg'><form action='misupdate1' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
					
			out.print("<div class='col-sm-3'><th><center>College Code</center></th></div><div class='col-sm-3'><th><center>Course Code</center></th></div><div class='col-sm-3'><th><center>Staff Code</center></th></div><div class='col-sm-3'><th></th></div>");	
						
			out.print("</tr></div></thead><tbody><div class='row'>");	
		//table body class='sfbg' code

		while(rs.next())
		{

			if(req.getParameter((rs.getString(4)))!=null)
			{
				if((rs.getString(1)==null) && (rs.getString(3)==null))
					out.print("<tr class='tbodyrow'><div class='col-sm-3'><td></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' value='"+rs.getString(2)+"' name='coursecode1'/></center></td></div><div class='col-sm-3'><td></td></div><div class='col-sm-3'><td><button type='submit' class='btn btn-primary' name='update' value='"+rs.getString(4)+"'>Update</button></td></div></tr>");			
				else
					out.print("<tr class='tbodyrow'><div class='col-sm-3'><td><center><input  class='form-control' type='text' name='clgcode1' value='"+rs.getString(1)+"' /></center></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' value='"+rs.getString(2)+"' name='coursecode1'/></center></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' value='"+rs.getString(3)+"' name='deptcode1' /></center></td></div><div class='col-sm-3'><td><button type='submit' class='btn btn-primary' name='update' value='"+rs.getString(4)+"'>Update</button></td></div></tr>");			

			}
			else
			{
				if((rs.getString(1)==null) && (rs.getString(3)==null))
					out.print("<tr class='tbodyrow'><div class='col-sm-3'><td></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(2)+"' name='coursecode1' /></center></td></div><div class='col-sm-3'><td></td></div><div class='col-sm-3'><td><button type='submit' class='btn btn-primary' disabled name='"+rs.getString(4)+"'>Edit</button></td></div></tr>");			
				else
					out.print("<tr class='tbodyrow'><div class='col-sm-3'><td><center><input  class='form-control' type='text' name='clgcode1' disabled value='"+rs.getString(1)+"' /></center></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(2)+"' name='coursecode1' /></center></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(3)+"' name='deptcode1' /></center></td></div><div class='col-sm-3'><td><button type='submit' class='btn btn-primary' disabled name='"+rs.getString(4)+"'>Edit</button></td></div></tr>");			

			}
			
       
		}
		out.print("</div></tbody></table></form></body class='sfbg'></html>");
		stmt.close();
		conn.close();
	}

	 catch(Exception e)
	  {
		out.print(e);
	
	}

  }
}

