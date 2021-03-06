import java.io.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class cca_activities extends HttpServlet
{
  public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
  {

	//global object declaration section
    Connection conn = null;
	Statement stmt = null;
	Statement stmt2 = null;
	ResultSet rs = null;
	ResultSet row_id = null;
	PrintWriter out = res.getWriter();
	res.setContentType("text/html");
	
	//html form values section
	int year=Integer.parseInt(req.getParameter("year"));
	String roll_no=req.getParameter("rollno");
	String cca=req.getParameter("cca1");
	String interests=req.getParameter("interests1");

	//calculating current date section
	long millis=System.currentTimeMillis();  
    java.sql.Date date=new java.sql.Date(millis);


	//jdbc logic section
	try
    {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String dbURL = "jdbc:sqlserver://10.45.29.254;DatabaseName=VNR_Students_Record";
        String user = "sa";
        String pass = "vnrvjiet1@3";
        conn = DriverManager.getConnection(dbURL, user, pass);
		stmt = conn.createStatement();
		stmt2 = conn.createStatement();

		//html common part html head complete part and body starting part
		out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'><link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.1.0/css/regular.css' integrity='sha384-avJt9MoJH2rB4PKRsJRHZv7yiFZn8LrnXuzvmZoD3fh1aL6aM6s0BBcnCvBe6XSD' crossorigin='anonymous'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");
		out.print("<body class='sfbg'>");
		out.print("<form action='ccaactivities' target='_self'>");
		
		if(req.getParameter("save")!=null)
		{
			String activity=req.getParameter("cca1");
			ResultSet activity_check = stmt.executeQuery("SELECT count(CCA_Activity) FROM CCA_Activities where CCA_Activity='"+activity+"' and CCA_Year="+year+" and CCA_Rollno='"+roll_no+"'");
			activity_check.next();
			
			if(activity_check.getInt(1)==0)//checking activity to allow only one activity for one time  for each student
			{
			 stmt.executeUpdate("INSERT INTO CCA_Activities(CCA_Rollno,CCA_Year,CCA_Activity,CCA_Interest,Created_On) VALUES('"+roll_no+"',"+year+",'"+cca+"','"+interests+"','"+date+"')");
			}
			else
			{
				
				out.print("<h4>Info related to "+activity+" is already inserted.To change the data press Edit.</h4>");
			}
		}
		
		if(req.getParameter("edit")!=null)
		{
			rs = stmt.executeQuery("SELECT CCA_Activity,CCA_Interest FROM CCA_Activities where CCA_Year="+year+" and CCA_Rollno='"+roll_no+"'order by CCA_ID desc");
			row_id = stmt2.executeQuery("SELECT CCA_ID from CCA_Activities where CCA_Year="+year+" and CCA_Rollno='"+roll_no+"'order by CCA_ID desc");
			
			out.print("<table class='table table-condensed' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");	
			out.print("<div class='col-sm-4'><th>CCA Activity</th></div><div class='col-sm-7'><th>Interests and Participation</th></div><div class='col-sm-1'><th></th></div>");				
			out.print("</tr></div></thead>");//table head close
			
			//table body logic starts
			out.print("<tbody><div class='row'>");	
			
			while(rs.next())
			{	
				row_id.next();
				if(Integer.parseInt(req.getParameter("edit"))==row_id.getInt(1))
					out.print("<tr class='tbodyrow'><div class='col-sm-4'><td><input class='form-control' type=text name='cca1' value='"+rs.getString(1)+"'></td></div><div class='col-sm-7'><td><textarea class='form-control' rows='4' cols='100' name='interests1'>"+rs.getString(2)+"</textarea></td></div><div class='col-sm-1'><td><button type='submit' class='btn btn-success' name='update' value="+row_id.getInt(1)+"><i class='far fa-check-circle' style='font-size:25px;'></i></button></td></div></tr>");
				else		
					out.print("<tr class='tbodyrow'><div class='col-sm-4'><td>"+rs.getString(1)+"</td></div><div class='col-sm-7'><td><form><textarea class='form-control' rows='4' cols='100' disabled>"+rs.getString(2)+"</textarea></form></td></div><div class='col-sm-1'><td><button disabled type='submit' class='btn btn-primary btn-sm' name='edit'><span class='glyphicon glyphicon-pencil' style='font-size:25px;'></span></button></td></div></tr>");
				
			}
			
			out.print("</div></tbody></table>");
		}
		
		
		if(req.getParameter("update")!=null)
		{			
			stmt.executeUpdate("UPDATE CCA_Activities SET CCA_Activity='"+cca+"', CCA_Interest='"+interests+"' WHERE CCA_ID="+Integer.parseInt(req.getParameter("update")) );
		}


		if(req.getParameter("search")!=null || req.getParameter("save")!=null || req.getParameter("update")!=null)
		{
			rs = stmt.executeQuery("SELECT CCA_Activity,CCA_Interest FROM CCA_Activities where CCA_Year="+year+" and CCA_Rollno='"+roll_no+"'order by CCA_ID desc");
			
			if(rs.isBeforeFirst())
			{
				row_id = stmt2.executeQuery("SELECT CCA_ID from CCA_Activities where CCA_Year="+year+" and CCA_Rollno='"+roll_no+"'order by CCA_ID desc");
				
				out.print("<table class='table table-condensed' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
				out.print("<div class='col-sm-4'><th>CCA Activity</th></div><div class='col-sm-7'><th>Interests and Participation</th></div><div class='col-sm-1'><th></th></div>");	
				out.print("</tr></div></thead><tbody><div class='row'>");	
				
				while(rs.next())
				{	
					row_id.next();
					out.print("<tr class='tbodyrow'><div class='col-sm-4'><td><p>"+rs.getString(1)+"</p></td></div><div class='col-sm-7'><td><form><textarea class='form-control' rows='4' cols='100' style='background-color:white' disabled>"+rs.getString(2)+"</textarea></form></td></div><div class='col-sm-1'><td><button type='submit' class='btn btn-primary btn-sm' name='edit' value="+row_id.getInt(1)+"><span class='glyphicon glyphicon-pencil' style='font-size:25px;'></span></button></td></div></tr>");
							
				}
				out.print("</div></tbody></table>");
			}
			else
			{
				out.print("<p>Sorry!no records to display. Add records....</p>");
			
			}

		}
		out.print("<input type='hidden' name='year' value='"+year+"'/><input type=hidden name='rollno' value='"+roll_no+"'/>");//hidden values
		out.print("</form>");
		out.print("</body></html>");
		
		stmt.close();
		stmt2.close();
		conn.close();
    }
    catch(Exception e)
	{
		out.print(e);
	
	}
	 
  }
 
}