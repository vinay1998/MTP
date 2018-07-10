import java.io.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class subjectmaster extends HttpServlet
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

			
			String sql1 = "INSERT INTO Subject(Sub_Regulation,Sub_Dept,Sub_Year,Sub_Semester,Sub_Code,Sub_Name,Sub_Abbr,Sub_Max_Assign_Marks,Sub_Max_Mid_Marks,Sub_Credits,Created_On) VALUES('"+regulation+"','"+dept+"',"+year+","+semester+",'"+subjectcode+"','"+subjectname+"','"+subjectabbr+"','"+maxassign+"','"+maxmid+"','"+subjectcredits+"','"+sqlTime+"')";
			
			stmt.executeUpdate(sql1);

		
			String sql2 = "SELECT Sub_Code,Sub_Name,Sub_Abbr,Sub_Max_Assign_Marks,Sub_Max_Mid_Marks,Sub_Credits,Sub_ID FROM Subject where Sub_Regulation='"+regulation+"' and Sub_Dept='"+dept+"' and Sub_Year="+year+" and Sub_Semester="+semester+" order by Sub_ID desc";
			rs = stmt.executeQuery(sql2);

			out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

			out.print("<body class='sfbg'><form action='subjectupdate' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
					
			out.print("<div class='col-sm-10'><th><center>Subject Details</center></th></div><div class='col-sm-2'><th></th></div>");	
						
			out.print("</tr></div></thead><tbody><div class='row'>");	
			while(rs.next())
			{
				out.print("<tr class='tbodyrow'><div class='col-sm-10'><td><div class='row'><div class='col-sm-2'><label for='sc'><b>Subject Code:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectcode' disabled type='text' value='"+rs.getString(1)+"' name='subjectcode'></div><div class='col-sm-2'><label for='sn'><b>Subject Name:</b></label></div><div class='col-sm-6'><input class='form-control' id='subjectname' disabled name='subjectname' value='"+rs.getString(2)+"'  type='text'></div></div><br>");
				out.print("<div class='row'><div class='col-sm-2'><label for='sa'><b>Subject Abbr.:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectabbr' disabled name='subjectabbr'  value='"+rs.getString(3)+"' type='text'></div><div class='col-sm-2'><label for='sam'><b>Max Assignment Marks:</b></label></div><div class='col-sm-2'><input class='form-control' id='maxassign' disabled name='maxassign'  value='"+rs.getString(4)+"' type='text'></div><div class='col-sm-2'><label for='mmm'><b>Max Mid Marks:</b></label></div><div class='col-sm-2'><input class='form-control' id='maxmid' disabled name='maxmid' value='"+rs.getString(5)+"' type='text'></div></div><br>");
				out.print("<div class='row'><div class='col-sm-2'><label for='sc'><b>Subject Credits:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectcredits' name='subjectcredits' disabled value='"+rs.getString(6)+"' type='text'></div></div></td><div class='col-sm-2'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(7)+"'>Edit</button></td></div></tr>");			
			
			}
			out.print("</div></tbody></table><input type=hidden name='regulation' value='"+regulation+"'/><input type=hidden name='dept' value='"+dept+"'/><input type=hidden name='year' value='"+year+"'/><input type=hidden name='semester' value='"+semester+"'/></form></body class='sfbg'></html>");

			

		}
		else if(req.getParameter("update")!=null)
		{
			//values from hidden text

			String regulation=req.getParameter("regulation");
			String dept=req.getParameter("dept");
			int year=Integer.parseInt(req.getParameter("year"));
			int semester=Integer.parseInt(req.getParameter("semester"));

			//updated values
			String subjectname=req.getParameter("subjectname");
			String subjectcode=req.getParameter("subjectcode");
			String subjectabbr=req.getParameter("subjectabbr");
			String maxassign=req.getParameter("maxassign");
			String maxmid=req.getParameter("maxmid");
			String subjectcredits=req.getParameter("subjectcredits");

			String row_id=req.getParameter("update");//update button value was set as id in update class
			
	
			stmt.executeUpdate("UPDATE Subject SET Sub_Code = '"+subjectcode+"',Sub_Name = '"+subjectname+"',Sub_Abbr = '"+subjectabbr+"',Sub_Max_Assign_Marks = '"+maxassign+"',Sub_Max_Mid_Marks = '"+maxmid+"',Sub_Credits = '"+subjectcredits+"' WHERE Sub_ID = '"+row_id+"';");

		
			String sql2 = "SELECT Sub_Code,Sub_Name,Sub_Abbr,Sub_Max_Assign_Marks,Sub_Max_Mid_Marks,Sub_Credits,Sub_ID FROM Subject where Sub_Regulation='"+regulation+"' and Sub_Dept='"+dept+"' and Sub_Year="+year+" and Sub_Semester="+semester+" order by Sub_ID desc";
			rs = stmt.executeQuery(sql2);

			out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

			out.print("<body class='sfbg'><form action='subjectupdate' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
					
			out.print("<div class='col-sm-10'><th><center>Subject Details</center></th></div><div class='col-sm-2'><th></th></div>");	
						
			out.print("</tr></div></thead><tbody><div class='row'>");	
			while(rs.next())
			{	
				out.print("<tr class='tbodyrow'><div class='col-sm-10'><td><div class='row'><div class='col-sm-2'><label for='sc'><b>Subject Code:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectcode' disabled type='text' value='"+rs.getString(1)+"' name='subjectcode'></div><div class='col-sm-2'><label for='sn'><b>Subject Name:</b></label></div><div class='col-sm-6'><input class='form-control' id='subjectname' disabled name='subjectname' value='"+rs.getString(2)+"'  type='text'></div></div><br>");
				out.print("<div class='row'><div class='col-sm-2'><label for='sa'><b>Subject Abbr.:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectabbr' disabled name='subjectabbr'  value='"+rs.getString(3)+"' type='text'></div><div class='col-sm-2'><label for='sam'><b>Max Assignment Marks:</b></label></div><div class='col-sm-2'><input class='form-control' id='maxassign' disabled name='maxassign'  value='"+rs.getString(4)+"' type='text'></div><div class='col-sm-2'><label for='mmm'><b>Max Mid Marks:</b></label></div><div class='col-sm-2'><input class='form-control' id='maxmid' disabled name='maxmid' value='"+rs.getString(5)+"' type='text'></div></div><br>");
				out.print("<div class='row'><div class='col-sm-2'><label for='sc'><b>Subject Credits:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectcredits' name='subjectcredits' disabled value='"+rs.getString(6)+"' type='text'></div></div></td><div class='col-sm-2'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(7)+"'>Edit</button></td></div></tr>");			
					
			}
			out.print("</div></tbody></table><input type=hidden name='regulation' value='"+regulation+"'/><input type=hidden name='dept' value='"+dept+"'/><input type=hidden name='year' value='"+year+"'/><input type=hidden name='semester' value='"+semester+"'/></form></body class='sfbg'></html>");

			
		}

		else if(req.getParameter("search")!=null)
		{
			//HTML form values
			String regulation=req.getParameter("regulation");
			String dept=req.getParameter("dept");
			int year=Integer.parseInt(req.getParameter("year"));
			int semester=Integer.parseInt(req.getParameter("semester"));
			String subjectname=req.getParameter("subjectname");
			String subjectcode=req.getParameter("subjectcode");
			String subjectabbr=req.getParameter("subjectabbr");
			String maxassign=req.getParameter("maxassign");
			String maxmid=req.getParameter("maxmid");
			String maxpoints=req.getParameter("maxpoints");
			String subjectcredits=req.getParameter("subjectcredits");


			String sql2 = "SELECT Sub_Code,Sub_Name,Sub_Abbr,Sub_Max_Assign_Marks,Sub_Max_Mid_Marks,Sub_Credits,Sub_ID FROM Subject where Sub_Regulation='"+regulation+"' and Sub_Dept='"+dept+"' and Sub_Year="+year+" and Sub_Semester="+semester+" order by Sub_ID desc";
			rs = stmt.executeQuery(sql2);
			if(rs.isBeforeFirst())
			{

				out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

				out.print("<body class='sfbg'><form action='subjectupdate' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
				
				out.print("<div class='col-sm-10'><th><center>Subject Details</center></th></div><div class='col-sm-2'><th></th></div>");	
						
				out.print("</tr></div></thead><tbody><div class='row'>");	
				while(rs.next())
				{	
				out.print("<tr class='tbodyrow'><div class='col-sm-10'><td><div class='row'><div class='col-sm-2'><label for='sc'><b>Subject Code:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectcode' disabled type='text' value='"+rs.getString(1)+"' name='subjectcode'></div><div class='col-sm-2'><label for='sn'><b>Subject Name:</b></label></div><div class='col-sm-6'><input class='form-control' id='subjectname' disabled name='subjectname' value='"+rs.getString(2)+"'  type='text'></div></div><br><div class='row'><div class='col-sm-2'><label for='sa'><b>Subject Abbr.:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectabbr' disabled name='subjectabbr'  value='"+rs.getString(3)+"' type='text'></div><div class='col-sm-2'><label for='sam'><b>Max Assignment Marks:</b></label></div><div class='col-sm-2'><input class='form-control' id='maxassign' disabled name='maxassign'  value='"+rs.getString(4)+"' type='text'></div><div class='col-sm-2'><label for='mmm'><b>Max Mid Marks:</b></label></div><div class='col-sm-2'><input class='form-control' id='maxmid' disabled name='maxmid' value='"+rs.getString(5)+"' type='text'></div></div><br><div class='row'><div class='col-sm-2'><label for='sc'><b>Subject Credits:</b></label></div><div class='col-sm-2'><input class='form-control' id='subjectcredits' name='subjectcredits' disabled value='"+rs.getString(6)+"' type='text'></div></div></td><div class='col-sm-2'><td><button type='submit' class='btn btn-primary' name='"+rs.getInt(7)+"'>Edit</button></td></div></tr>");			
							
				}
				
				out.print("</div></tbody></table><input type=hidden name='regulation' value='"+regulation+"'/><input type=hidden name='dept' value='"+dept+"'/><input type=hidden name='year' value='"+year+"'/><input type=hidden name='semester' value='"+semester+"'/></form></body class='sfbg'></html>");
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