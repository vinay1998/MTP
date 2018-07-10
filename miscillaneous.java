import java.io.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class miscillaneous extends HttpServlet
{
  public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
  {

	//global object declaration section
    Connection conn = null;
	Statement stmt = null;
	ResultSet rs=null;
	PrintWriter out = res.getWriter();
	res.setContentType("text/html");
	
	

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

		if(req.getParameter("save")!=null)
		{

			//html form values section
			String clgcode=req.getParameter("clgcode");
			String coursecode=req.getParameter("coursecode");
			String deptcode=req.getParameter("deptcode");
			
			String sql1 = "INSERT INTO Miscellaneous(College_Code,Course_Code,Staff_Code,Created_On) VALUES('"+clgcode+"','"+coursecode+"','"+deptcode+"','"+sqlTime+"')";
			
			stmt.executeUpdate(sql1);
		
			String sql2 = "SELECT College_Code,Course_Code,Staff_Code,Miscellaneous_ID FROM Miscellaneous order by Miscellaneous_ID desc";
			rs = stmt.executeQuery(sql2);

			out.print("<html><head><link rel='stylesheet' href='css\bootstrap.css'><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

			out.print("<body class='sfbg'><form action='misupdate' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
					
			out.print("<div class='col-sm-3'><th><center>College Code</center></th></div><div class='col-sm-3'><th><center>Course Code</center></th></div><div class='col-sm-3'><th><center>Staff Code</center></th></div><div class='col-sm-3'><th></th></div>");	
						
			out.print("</tr></div></thead><tbody><div class='row'>");	
			while(rs.next())
			{
				if((rs.getString(1)==null) && (rs.getString(3)==null))
					out.print("<tr class='tbodyrow'><div class='col-sm-3'><td><p></p></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(2)+"' /></center></td></div><div class='col-sm-3'><td></td></div><div class='col-sm-3'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(4)+"'>Edit</button></td></div></tr>");			
				else
					out.print("<tr class='tbodyrow'><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(1)+"' /></center></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(2)+"' /></center></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(3)+"' /></center></td></div><div class='col-sm-3'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(4)+"'>Edit</button></td></div></tr>");			
			}
			out.print("</div></tbody></table></form></body class='sfbg'></html>");
			
			
			}
		else if(req.getParameter("update")!=null)
		{
			//values from hidden text
			//updated values
			String clgcode=req.getParameter("clgcode1");
			String coursecode=req.getParameter("coursecode1");
			String deptcode=req.getParameter("deptcode1");
			
			String misc_id=req.getParameter("update");//update button value was set as id in update class
			
	
			stmt.executeUpdate("UPDATE Miscellaneous SET College_Code = '"+clgcode+"',Course_Code = '"+coursecode+"',Staff_Code = '"+deptcode+"' WHERE Miscellaneous_ID = '"+misc_id+"' ;");
					
			String sql2 = "SELECT College_Code,Course_Code,Staff_Code,Miscellaneous_ID FROM Miscellaneous order by Miscellaneous_ID desc";
			rs = stmt.executeQuery(sql2);

			out.print("<html><head><link rel='stylesheet' href='css\bootstrap.css'><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

			out.print("<body class='sfbg'><form action='misupdate' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
					
			out.print("<div class='col-sm-3'><th><center>College Code</center></th></div><div class='col-sm-3'><th><center>Course Code</center></th></div><div class='col-sm-3'><th><center>Staff Code</center></th></div><div class='col-sm-3'><th></th></div>");	
						
			out.print("</tr></div></thead><tbody><div class='row'>");	
			while(rs.next())
			{
				if((rs.getString(1)==null) && (rs.getString(3)==null))
					out.print("<tr class='tbodyrow'><div class='col-sm-3'><td></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(2)+"' /></center></td></div><div class='col-sm-3'><td></td></div><div class='col-sm-3'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(4)+"'>Edit</button></td></div></tr>");			
				else
					out.print("<tr class='tbodyrow'><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(1)+"' /></center></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(2)+"' /></center></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(3)+"' /></center></td></div><div class='col-sm-3'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(4)+"'>Edit</button></td></div></tr>");			

			}
			out.print("</div></tbody></table></form></body class='sfbg'></html>");

			
		}

		else if(req.getParameter("search")!=null)
		{
			//HTML form values
			
			String sql2 = "SELECT College_Code,Course_Code,Staff_Code,Miscellaneous_ID FROM Miscellaneous order by Miscellaneous_ID desc";
			rs = stmt.executeQuery(sql2);

			if(rs.isBeforeFirst())
			{

			out.print("<html><head><link rel='stylesheet' href='css\bootstrap.css'><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

			out.print("<body class='sfbg'><form action='misupdate' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
					
			out.print("<div class='col-sm-3'><th><center>College Code</center></th></div><div class='col-sm-3'><th><center>Course Code</center></th></div><div class='col-sm-3'><th><center>Staff Code</center></th></div><div class='col-sm-3'><th></th></div>");	
						
			out.print("</tr></div></thead><tbody><div class='row'>");	
			while(rs.next())
			{
				if((rs.getString(1)==null) && (rs.getString(3)==null))
					out.print("<tr class='tbodyrow'><div class='col-sm-3'><td></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(2)+"' /></center></td></div><div class='col-sm-3'><td></td></div><div class='col-sm-3'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(4)+"'>Edit</button></td></div></tr>");			
				else
					out.print("<tr class='tbodyrow'><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(1)+"' /></center></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(2)+"' /></center></td></div><div class='col-sm-3'><td><center><input  class='form-control' type='text' disabled value='"+rs.getString(3)+"' /></center></td></div><div class='col-sm-3'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(4)+"'>Edit</button></td></div></tr>");			

			}
			out.print("</div></tbody></table></form></body class='sfbg'></html>");
			}
			else
			{
				out.print("<p>Sorry!no records to display. Please add records....</p>");
			
			}

		}
		stmt.close();
		conn.close();
    }
    catch(Exception e)
	{
		out.print(e);
	
	}
	 
  }
 
}