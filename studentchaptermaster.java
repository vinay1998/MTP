import java.io.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class studentchaptermaster extends HttpServlet
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
			int count=1;

			if(req.getParameter("save")!=null)
			{
				//html form values section
				String studentchapter=req.getParameter("studentchapter");
				
				String sql1 = "INSERT INTO Student_Chapter(Student_Chapter_Name,Created_On) VALUES('"+studentchapter+"','"+sqlTime+"')";
				stmt.executeUpdate(sql1);

				String sql2 = "SELECT Student_Chapter_Name,Student_Chapter_ID FROM Student_Chapter order by Student_Chapter_ID desc";
				rs = stmt.executeQuery(sql2);

				out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

				out.print("<body class='sfbg'><form action='update2' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
						
				out.print("<div class='col-sm-2'><th>S.No</th></div><div class='col-sm-7'><th><center>Student Chapters</center></th></div><div class='col-sm-2'><th></th></div>");	
							
				out.print("</tr></div></thead><tbody><div class='row'>");	
				while(rs.next())
				{	
					out.print("<tr class='tbodyrow'><div class='col-sm-2'><td>"+(count++)+"</td></div><div class='col-sm-7'><td><center><input type='text' disabled value='"+rs.getString(1)+"' /></center></td></div><div class='col-sm-2'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(2)+"'>Edit</button></td></div></tr>");			
				
				}
				out.print("</div></tbody></table></form></body class='sfbg'></html>");
			}

			else if(req.getParameter("update")!=null)
			{
				
				//updated values
				String studentchapter2=req.getParameter("studentchapter1");
				String row_id=req.getParameter("update");//update button value was set as id in update class
				
		
				stmt.executeUpdate("UPDATE Student_Chapter SET Student_Chapter_Name='"+studentchapter2+"' WHERE Student_Chapter_ID = '"+row_id+"' ;");

			
				String sql2 = "SELECT Student_Chapter_Name,Student_Chapter_ID FROM Student_Chapter order by Student_Chapter_ID desc";
				rs = stmt.executeQuery(sql2);

				out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

				out.print("<body class='sfbg'><form action='update2' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
						
				out.print("<div class='col-sm-2'><th>S.No</th></div><div class='col-sm-7'><th><center>Student Chapters</center></th></div><div class='col-sm-2'><th></th></div>");	
							
				out.print("</tr></div></thead><tbody><div class='row'>");	
				while(rs.next())
				{	
					out.print("<tr class='tbodyrow'><div class='col-sm-2'><td>"+(count++)+"</td></div><div class='col-sm-7'><td><center><input type='text' disabled value='"+rs.getString(1)+"' /></center></td></div><div class='col-sm-2'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(2)+"'>Edit</button></td></div></tr>");			
				
				}
				out.print("</div></tbody></table></form></body class='sfbg'></html>");

				
			}

			else if(req.getParameter("search")!=null)
			{
			//HTML form values
			String studentchapter=req.getParameter("studentchapter");

			String sql2 = "SELECT Student_Chapter_Name,Student_Chapter_ID FROM Student_Chapter order by Student_Chapter_ID desc";
			rs = stmt.executeQuery(sql2);
			if(rs.isBeforeFirst())
			{

				out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

				out.print("<body class='sfbg'><form action='update2' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
				
				out.print("<div class='col-sm-2'><th>S.No</th></div><div class='col-sm-7'><th><center>Student Chapters</center></th></div><div class='col-sm-2'><th></th></div>");	
						
				out.print("</tr></div></thead><tbody><div class='row'>");	
				while(rs.next())
				{	
					out.print("<tr class='tbodyrow'><div class='col-sm-2'><td>"+(count++)+"</td></div><div class='col-sm-7'><td><center><input type='text' disabled value='"+rs.getString(1)+"' /></center></td></div><div class='col-sm-2'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(2)+"'>Edit</button></td></div></tr>");			
							
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
