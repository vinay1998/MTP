<%@ page import="java.io.*,java.util.Date,java.text.SimpleDateFormat,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>

<%
	
	//global object declaration section
		Connection conn = null;
		Statement stmt = null;
		response.setContentType("text/html");
	
	//reading values from html form
		String user_id=request.getParameter("user_id");
		String old_password=request.getParameter("old_pass");
		String new_password=request.getParameter("new_pass");
	
	

	//jdbc logic section
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String dbURL = "jdbc:sqlserver://10.45.29.254;DatabaseName=VNR_Students_Record";
        String user = "sa";
        String pass = "vnrvjiet1@3";
		
		conn = DriverManager.getConnection(dbURL, user, pass);
		stmt = conn.createStatement();
		
		ResultSet old_pass=stmt.executeQuery("Select Login_Password from Login where Login_UserId='"+user_id+"' ");
		
		old_pass.next();
		
		if(old_pass.getString(1).equals(old_password))
		{
			stmt.executeUpdate("Update Login set Login_Password='"+new_password+"' where Login_UserId='"+user_id+"' ");
			out.print("<html><body style='background-color:rgba(255,255,255,0.5)'><h2>Password changed Successfully</h2><body></html>");
		}
		else
		{
			out.print("<html><body style='background-color:rgba(255,255,255,0.5)'><h2>Invalid Old Password</h2><body></html>");
		}
		stmt.close();
		conn.close();
%>









