import java.io.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class departmentmaster extends HttpServlet
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
			String deptcode=req.getParameter("deptcode");
			String deptname=req.getParameter("deptname");
			String deptno=req.getParameter("deptno");
			int sections=Integer.parseInt(req.getParameter("sections"));
			
			String sql1 = "INSERT INTO Department(Dept_No,Dept_Code,Dept_Name,Dept_Sections,Created_On) VALUES('"+deptno+"','"+deptcode+"','"+deptname+"',"+sections+",'"+sqlTime+"')";
			
			stmt.executeUpdate(sql1);

		
			String sql2 = "SELECT Dept_No,Dept_Code,Dept_Name,Dept_Sections,Dept_ID FROM Department order by Dept_ID desc";
			rs = stmt.executeQuery(sql2);

			out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

			out.print("<body><form action='deptupdate' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
					
			out.print("<div class='col-sm-1'><th><center>Department Number</center></th></div><div class='col-sm-6'><th><center>Department Name</center></th></div><div class='col-sm-1'><th><center>Department Code</center></th></div><div class='col-sm-1'><th><center>Sections</center></th></div><div class='col-sm-2'><th></th></div>");	
						
			out.print("</tr></div></thead><tbody><div class='row'>");	
			while(rs.next())
			{
					out.print("<tr class='tbodyrow'><div class='col-sm-1'><td><center><input type='text' disabled value='"+rs.getString(1)+"' /></center></td></div><div class='col-sm-6'><td><center><textarea rows='4' disabled>"+rs.getString(3)+"</textarea></center></td></div><div class='col-sm-1'><td><center><input type='text' disabled value='"+rs.getString(2)+"' /></center></td></div><div class='col-sm-1'><td><center><input type='text' disabled value='"+rs.getInt(4)+"' /></center></td></div><div class='col-sm-2'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(5)+"'>Edit</button></td></div></tr>");			
			}
			out.print("</div></tbody></table></form></body></html>");

			

		}
		else if(req.getParameter("update")!=null)
		{
			//values from hidden text
			//updated values
			String deptcode1=req.getParameter("deptcode");
			String deptname1=req.getParameter("deptname");
			String deptno1=req.getParameter("deptno");
			int sections1=Integer.parseInt(req.getParameter("sections"));

			String row_id=req.getParameter("update");//update button value was set as id in update class
			
	
			stmt.executeUpdate("UPDATE Department SET Dept_No = '"+deptno1+"',Dept_Code = '"+deptcode1+"',Dept_Name = '"+deptname1+"',Dept_Sections = '"+sections1+"' WHERE Dept_ID = '"+row_id+"' ;");

		
			String sql2 = "SELECT Dept_No,Dept_Code,Dept_Name,Dept_Sections,Dept_ID FROM Department order by Dept_ID desc";
			rs = stmt.executeQuery(sql2);

			out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

			out.print("<body><form action='deptupdate' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
					
			out.print("<div class='col-sm-1'><th><center>Department Number</center></th></div><div class='col-sm-6'><th><center>Department Name</center></th></div><div class='col-sm-1'><th><center>Department Code</center></th></div><div class='col-sm-1'><th><center>Sections</center></th></div><div class='col-sm-2'><th></th></div>");	
						
			out.print("</tr></div></thead><tbody><div class='row'>");	
			while(rs.next())
			{	
					out.print("<tr class='tbodyrow'><div class='col-sm-1'><td><center><input type='text' disabled value='"+rs.getString(1)+"' /></center></td></div><div class='col-sm-6'><td><center><textarea rows='4' disabled>"+rs.getString(3)+"</textarea></center></td></div><div class='col-sm-1'><td><center><input type='text' disabled value='"+rs.getString(2)+"' /></center></td></div><div class='col-sm-1'><td><center><input type='text' disabled value='"+rs.getInt(4)+"' /></center></td></div><div class='col-sm-2'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(5)+"'>Edit</button></td></div></tr>");			
					
			}
			out.print("</div></tbody></table></form></body></html>");

			
		}

		else if(req.getParameter("search")!=null)
		{
			//HTML form values
			
			String sql2 = "SELECT Dept_No,Dept_Code,Dept_Name,Dept_Sections,Dept_ID FROM Department order by Dept_ID desc";
			rs = stmt.executeQuery(sql2);
			if(rs.isBeforeFirst())
			{

				out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

				out.print("<body><form action='deptupdate' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
				
				out.print("<div class='col-sm-1'><th><center>Department Number</center></th></div><div class='col-sm-6'><th><center>Department Name</center></th></div><div class='col-sm-1'><th><center>Department Code</center></th></div><div class='col-sm-1'><th><center>Sections</center></th></div><div class='col-sm-2'><th></th></div>");	
						
				out.print("</tr></div></thead><tbody><div class='row'>");	
				while(rs.next())
				{	
					out.print("<tr class='tbodyrow'><div class='col-sm-1'><td><center><input type='text' disabled value='"+rs.getString(1)+"' /></center></td></div><div class='col-sm-6'><td><center><textarea rows='4' disabled>"+rs.getString(3)+"</textarea></center></td></div><div class='col-sm-1'><td><center><input type='text' disabled value='"+rs.getString(2)+"' /></center></td></div><div class='col-sm-1'><td><center><input type='text' disabled value='"+rs.getInt(4)+"' /></center></td></div><div class='col-sm-2'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(5)+"'/>Edit</button></td></div></tr>");			
							
				}
				
				out.print("</div></tbody></table></form></body></html>");
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