import java.io.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class staffmaster extends HttpServlet
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
			String staffname = req.getParameter("staffname");
			String staffid = req.getParameter("staffid");
			String DOB=req.getParameter("DOB");
			String dept=req.getParameter("dept");
			String address=req.getParameter("address");
			String blood=req.getParameter("blood");
			String mobile=req.getParameter("mobile");
			String qualification=req.getParameter("qualification");
			String landline=req.getParameter("landline");
			String designation=req.getParameter("designation");
			String paper_national=req.getParameter("paper_national");
			String paper_international=req.getParameter("paper_international");
			String conference_national=req.getParameter("conference_national");
			String conference_international=req.getParameter("conference_international");
			String professionalbodies=req.getParameter("professionalbodies");
			String consultations=req.getParameter("consultations");
			String research=req.getParameter("research");
			String otherinterests=req.getParameter("otherinterests");
			String trainingaccess=req.getParameter("trainingaccess");

			stmt.executeUpdate("insert into Staff_Master(Staff_Name,Staff_Code,Date_Of_Birth,Dept,Address,Blood_Group,Mobile,Academic_Qualification,Landline_no,Designation,Papers_National,Papers_International,Conferences_National,Conferences_International,Memberships_Of_Prof_Bodies,Consultations,Research_Interests,Other_Interests,Training,Created_On) values('"+staffname+"','"+staffid+"','"+DOB+"','"+dept+"','"+address+"','"+blood+"','"+mobile+"','"+qualification+"','"+landline+"','"+designation+"','"+paper_national+"','"+paper_international+"','"+conference_national+"','"+conference_international+"','"+professionalbodies+"','"+consultations+"','"+research+"','"+otherinterests+"','"+trainingaccess+"','"+sqlTime+"')");
			out.print("<html><body><script>Records Inserted</script></body></html>");
			res.sendRedirect("editstaff.jsp");
		}
		if(req.getParameter("update")!=null)
		{
			String staffname = req.getParameter("staffname");
			String staffid = req.getParameter("staffid");
			String DOB=req.getParameter("DOB");
			String dept=req.getParameter("dept");
			String address=req.getParameter("address");
			String blood=req.getParameter("blood");
			String mobile=req.getParameter("mobile");
			String qualification=req.getParameter("qualification");
			String landline=req.getParameter("landline");
			String designation=req.getParameter("designation");
			String paper_national=req.getParameter("paper_national");
			String paper_international=req.getParameter("paper_international");
			String conference_national=req.getParameter("conference_national");
			String conference_international=req.getParameter("conference_international");
			String professionalbodies=req.getParameter("professionalbodies");
			String consultations=req.getParameter("consultations");
			String research=req.getParameter("research");
			String otherinterests=req.getParameter("otherinterests");
			String trainingaccess=req.getParameter("trainingaccess");

			stmt.executeUpdate("update Staff_Master set Staff_Name='"+staffname+"',Staff_Code='"+staffid+"',Date_Of_Birth='"+DOB+"',Dept='"+dept+"',Address='"+address+"',Blood_Group='"+blood+"',Mobile='"+mobile+"',Academic_Qualification='"+qualification+"',Landline_no='"+landline+"',Designation='"+designation+"',Papers_National='"+paper_national+"',Papers_International='"+paper_international+"',Conferences_National='"+conference_national+"',Conferences_International='"+conference_international+"',Memberships_Of_Prof_Bodies='"+professionalbodies+"',Consultations='"+consultations+"',Research_Interests='"+research+"',Other_Interests='"+otherinterests+"',Training='"+trainingaccess+"',Updated_On='"+sqlTime+"' where Staff_Code='"+staffid+"'");
			out.print("<html><body><script>Records Updated</script></body></html>");
			res.sendRedirect("editstaff.jsp");
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