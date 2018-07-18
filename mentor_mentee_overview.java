import java.io.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class mentor_mentee_overview extends HttpServlet
{
  public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
  {

	//global object declaration section
    Connection conn = null;
	Statement stmt = null;
	ResultSet rs=null;
	PrintWriter out = res.getWriter();
	res.setContentType("text/html");
	
	//html form values section
	
	String roll_no=req.getParameter("rollno");
	String dateofinteraction=req.getParameter("dateofinteraction");
	String topics_discussed=req.getParameter("topics1");
	String remarks=req.getParameter("remarks1");

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
			
			String sql1 = "INSERT INTO Student_Mentor_Mentee_Overview_Events(Student_Code,Overview_Date,Topics_Discussed,Remarks,Created_On) VALUES('"+roll_no+"','"+dateofinteraction+"','"+topics_discussed+"','"+remarks+"','"+sqlTime+"')";
			stmt.executeUpdate(sql1);

			String sql2 = "SELECT convert(varchar,Overview_Date,105),Topics_Discussed,Remarks,Student_Mentee_Overview_Events_ID FROM Student_Mentor_Mentee_Overview_Events where Student_Code='"+roll_no+"' order by Student_Mentee_Overview_Events_ID desc";
			rs = stmt.executeQuery(sql2);

			out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'><link rel='stylesheet' type='text/css' href='fonts/font-awesome-4.7.0/css/font-awesome.min.css'><link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.1.0/css/regular.css' integrity='sha384-avJt9MoJH2rB4PKRsJRHZv7yiFZn8LrnXuzvmZoD3fh1aL6aM6s0BBcnCvBe6XSD' crossorigin='anonymous'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

			out.print("<body class='sfbg'><form action='mmo_update' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
					
			out.print("<div class='col-sm-3'><th>Date</th></div><div class='col-sm-3'><th>Topics Discussed</th></div><div class='col-sm-4'><th>Remarks</th></div><div class='col-sm-2'><th></th></div>");	
						
			out.print("</tr></div></thead><tbody><div class='row'>");		


			while(rs.next())
			{	
				out.print("<tr class='tbodyrow'><div class='col-sm-3'><td>"+rs.getString(1)+"</td></div><div class='col-sm-3'><td><textarea class='form-control' rows='4' cols='50' disabled>"+rs.getString(2)+"</textarea></td></div><div class='col-sm-4'><td><textarea class='form-control' rows='4' cols='50' disabled>"+rs.getString(3)+"</textarea></td></div><div class='col-sm-2'><td><button type='submit' class='btn btn-primary btn-sm' name='"+rs.getInt(4)+"'><span class='glyphicon glyphicon-pencil' style='font-size:25px;'></span></button></td></div></tr>");			
			
			}
			out.print("</div></tbody></table><input type=hidden name='rollno1' value='"+roll_no+"'/></form></body></html>");

			

		}

		else if(req.getParameter("update")!=null)
		{
			//values from hidden text


			//updated values
			String dateofinteraction1=req.getParameter("dateofinteraction_1");
			String topics_discussed1=req.getParameter("topics_discussed_1");
			String remarks1=req.getParameter("remarks_1");
			String row_id=req.getParameter("update");//update button value was set as id in update class
			
	
			stmt.executeUpdate("UPDATE Student_Mentor_Mentee_Overview_Events SET Overview_Date = '"+dateofinteraction1+"',Topics_Discussed = '"+topics_discussed1+"',Remarks = '"+remarks1+"' WHERE Student_Mentee_Overview_Events_ID = '"+row_id+"' ;");

		
			String sql2 = "SELECT convert(varchar,Overview_Date,105),Topics_Discussed,Remarks,Student_Mentee_Overview_Events_ID FROM Student_Mentor_Mentee_Overview_Events where Student_Code='"+roll_no+"' order by Student_Mentee_Overview_Events_ID desc";
			rs = stmt.executeQuery(sql2);

			out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'><link rel='stylesheet' type='text/css' href='fonts/font-awesome-4.7.0/css/font-awesome.min.css'><link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.1.0/css/regular.css' integrity='sha384-avJt9MoJH2rB4PKRsJRHZv7yiFZn8LrnXuzvmZoD3fh1aL6aM6s0BBcnCvBe6XSD' crossorigin='anonymous'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

			out.print("<body class='sfbg'><form action='mmo_update' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
					
			out.print("<div class='col-sm-3'><th>Date</th></div><div class='col-sm-3'><th>Topics Discussed</th></div><div class='col-sm-4'><th>Remarks</th></div><div class='col-sm-2'><th></th></div>");	
						
			out.print("</tr></div></thead><tbody><div class='row'>");	
			
			while(rs.next())
			{	
				out.print("<tr class='tbodyrow'><div class='col-sm-3'><td>"+rs.getString(1)+"</td></div><div class='col-sm-3'><td><textarea class='form-control' rows='4' cols='50' disabled>"+rs.getString(2)+"</textarea></td></div><div class='col-sm-4'><td><textarea class='form-control' rows='4' cols='50' disabled>"+rs.getString(3)+"</textarea></td></div><div class='col-sm-2'><td><button type='submit' class='btn btn-primary btn-sm' name='"+rs.getInt(4)+"'><span class='glyphicon glyphicon-pencil' style='font-size:25px;'></span></button></td></div></tr>");								
			
			}
			out.print("</div></tbody></table><input type=hidden name='rollno1' value='"+roll_no+"'/></form></body></html>");

		}


		else if(req.getParameter("search")!=null)
		{

			String sql2 = "SELECT convert(varchar,Overview_Date,105),Topics_Discussed,Remarks,Student_Mentee_Overview_Events_ID FROM Student_Mentor_Mentee_Overview_Events where Student_Code='"+roll_no+"' order by Student_Mentee_Overview_Events_ID desc";
			rs = stmt.executeQuery(sql2);
			if(rs.isBeforeFirst())
			{

				out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'><link rel='stylesheet' type='text/css' href='fonts/font-awesome-4.7.0/css/font-awesome.min.css'><link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.1.0/css/regular.css' integrity='sha384-avJt9MoJH2rB4PKRsJRHZv7yiFZn8LrnXuzvmZoD3fh1aL6aM6s0BBcnCvBe6XSD' crossorigin='anonymous'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");

			out.print("<body class='sfbg'><form action='mmo_update' target='_self'><table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'>");
					
			out.print("<div class='col-sm-3'><th>Date</th></div><div class='col-sm-3'><th>Topics Discussed</th></div><div class='col-sm-4'><th>Remarks</th></div><div class='col-sm-2'><th></th></div>");	
						
			out.print("</tr></div></thead><tbody><div class='row'>");	
			
			while(rs.next())
				{	
					out.print("<tr class='tbodyrow'><div class='col-sm-3'><td>"+rs.getString(1)+"</td></div><div class='col-sm-3'><td><textarea class='form-control' rows='4' cols='50' disabled>"+rs.getString(2)+"</textarea></td></div><div class='col-sm-4'><td><textarea class='form-control' rows='4' cols='50' disabled>"+rs.getString(3)+"</textarea></td></div><div class='col-sm-2'><td><button type='submit' class='btn btn-primary btn-sm' name='"+rs.getInt(4)+"'><span class='glyphicon glyphicon-pencil' style='font-size:25px;'></span></button></td></div></tr>");								
				}
			out.print("</div></tbody></table><input type=hidden name='rollno1' value='"+roll_no+"'/></form></body></html>");
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