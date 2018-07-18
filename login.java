import java.io.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class login extends HttpServlet
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

		if(req.getParameter("login")!=null)
		{
			String user_type = req.getParameter("user_type");
			String user_id = req.getParameter("user_id");
			String user_password=req.getParameter("user_password");
			
			
			ResultSet details=stmt.executeQuery("Select Login_Aadhar,Login_Password from Login where Login_UserId='"+user_id+"' and Login_Type='"+user_type+"'");
			if(details.isBeforeFirst())
			{
				details.next();
				if(details.getString(1).equals(user_password) && details.getString(1).equals(details.getString(2)))
				{
					req.getSession().setAttribute("aadhar_number",details.getString(1));
					res.sendRedirect("login_reset_password.jsp");
				}
				else if(details.getString(2).equals(user_password))
				{
					req.getSession().setAttribute("user_id",user_id);
					if(user_type.equals("Mentee"))
						res.sendRedirect("index.jsp");
					else if(user_type.equals("Mentor"))
						out.print("mentor");
					else if(user_type.equals("Admin"))
						res.sendRedirect("adminlogin.jsp");
				}
				else
				{
					out.print("<h4 >Authentication failed<br/>Enter valid ID and PASSWORD</h4>");
				}
			}
			else
			{
				out.print("<h4>No Record to validate</h4>");
			}
		}
		stmt.close();
		conn.close();
    }
	catch(NullPointerException npe)
	{
	}
    catch(Exception e)
	{
		out.print(e);
	}
	 
  }

  
}