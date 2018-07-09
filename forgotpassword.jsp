<%@ page import="java.io.*,java.util.Date,java.text.SimpleDateFormat,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<%


	//global object declaration section
    Connection conn = null;
	Statement stmt = null;
	ResultSet rs=null;
	response.setContentType("text/html");

	//date calculation
	java.util.Date date=new java.util.Date();
	java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());


	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String dbURL = "jdbc:sqlserver://10.45.29.254;DatabaseName=VNR_Students_Record";
    String user = "sa";
    String pass = "vnrvjiet1@3";
    conn = DriverManager.getConnection(dbURL, user, pass);
	stmt = conn.createStatement();

	if(request.getParameter("next")!=null)
	{
		String user_id = request.getParameter("user_id");
		String aadhar_card_number=request.getParameter("aadhar_card_number");
			
			
		ResultSet aadhar=stmt.executeQuery("Select Login_Aadhar from Login where Login_UserId='"+user_id+"'");
		if(aadhar.isBeforeFirst())
		{
			aadhar.next();
			if(aadhar.getString(1).equals(aadhar_card_number))
			{
				request.getSession().setAttribute("aadhar_number",aadhar.getString(1));
				response.sendRedirect("forgot_recoverpassword.jsp");	
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
	else if(request.getParameter("reset")!=null)
	{
		String new_password = request.getParameter("new_password");
		String aadhar_card_number=request.getParameter("aadhar_card_number");
			
		stmt.executeUpdate("Update Login set Login_Password='"+new_password+"', Updated_On='"+sqlTime+"' where Login_Aadhar='"+aadhar_card_number+"'");
		response.sendRedirect("login.html");
	}
		
	stmt.close();
	conn.close();

%>