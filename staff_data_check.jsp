<%@ page import="java.io.*,java.util.Date,java.text.SimpleDateFormat,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<%


	//global object declaration section
    Connection conn = null;
	Statement stmt = null;
	ResultSet rs=null;
	response.setContentType("text/html");
	

	//jdbc logic section

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String dbURL = "jdbc:sqlserver://10.45.29.254;DatabaseName=VNR_Students_Record";
        String user = "sa";
        String pass = "vnrvjiet1@3";
        conn = DriverManager.getConnection(dbURL, user, pass);
		stmt = conn.createStatement();
		
			String sql2 = "SELECT Staff_Code FROM Mentor_Faculty_HOD_Lecturer where Staff_Code='12345'";
			rs = stmt.executeQuery(sql2);
		if(rs.isBeforeFirst())
			{
		     response.sendRedirect("editstaff.jsp");
			}
		else{
			 response.sendRedirect("staffmaster.html");
		    }
		
%>
