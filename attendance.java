import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class attendance extends HttpServlet
{
  public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
  {

	//global object declaration section
    Connection conn = null;
	Statement stmt = null;
	ResultSet rs=null;
	PrintWriter out = res.getWriter();
	res.setContentType("text/html");
	
	//variables for internal code
	int subject_count=0;
	ResultSet subject_code=null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	ResultSet month_types = null;
	ResultSet attendance = null;


	//html form values section
	int year=Integer.parseInt(req.getParameter("year"));
	int semester=Integer.parseInt(req.getParameter("semester"));
	String roll_no=req.getParameter("rollno");
	

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
		stmt2 = conn.createStatement();
		stmt3 = conn.createStatement();

		//common html head part SubjectName
		out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");
		out.print("<body class='sfbg'>");
		out.print("<form action='attendance' name='' target='_self'>");

		
		if(req.getParameter("proceed")!=null || req.getParameter("update")!=null || req.getParameter("save")!=null)
		{
			
			//==============================================displaying insert table  logic starts===============================================================

			//table head logic
			subject_code=stmt.executeQuery("select Sub_Abbr from Subject where Sub_Year='"+year+"' and Sub_Semester='"+semester+"';");
			
			out.print("<table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'><div class='col-sm-3'><th>Month</th></div>");					
			while(subject_code.next())
			{	
				out.print("<div class='col-sm-1'><th>"+subject_code.getString(1)+"</th></div>");
				subject_count++;
			}
			out.print("</tr></div></thead><tbody><div class='row'>");	
			//table head logic end


			//table body with input fields to read marks - logic  start 
			out.print("<tr class='tbodyrow'><div class='col-sm-1'><td><select class='form-control' name='month'><option hidden>Select</option><option value='JAN'>JAN</option><option value='FEB'>FEB</option><option value='MAR'>MAR</option><option value='APR'>APR</option><option value='MAY'>MAY</option><option value='JUN'>JUN</option><option value='JUL'>JUL</option><option value='AUG'>AUG</option><option value='SEP'>SEP</option><option value='OCT'>OCT</option><option value='NOV'>NOV</option><option value='DEC'>DEC</option></select></td></div>");//drop down menu to select month
			for(int j=1;j<=subject_count;j++)
			{
				out.print("<div class='col-sm-1'><td><input type='text' class='form-control' name='Subject_"+j+"'/></td></div>");
			}		
			out.print("</tr></div></tbody></table><br/><center><button type='submit' class='btn btn-primary' name='save'>Save</button></center><br/>");

			//displaying insert table logic ends================================================================================================================
		}


		if(req.getParameter("update")!=null)
		{
			String update_month_type=req.getParameter("update");
			subject_code=stmt.executeQuery("select Sub_Abbr from Subject where Sub_Year="+year+" and Sub_Semester="+semester);
			while(subject_code.next())
			{
				stmt2.executeUpdate("UPDATE Student_Attendance SET Attendance = '"+req.getParameter(subject_code.getString(1))+"' , Updated_On = '"+sqlTime+"' where Years="+year+" and Semester="+semester+" and Months='"+update_month_type+"' and Student_Code='"+roll_no+"' and Subject='"+subject_code.getString(1)+"';");
			}
		}


		if(req.getParameter("save")!=null)
		{
			//variable declaration
			String month_value=req.getParameter("month");
			
	
			ResultSet month_check = stmt.executeQuery("select count(Months) from Student_Attendance where Years="+year+" and Semester="+semester+" and Months='"+month_value+"' and Student_Code='"+roll_no+"' ");
			month_check.next();
			if(month_check.getInt(1)==0)//checking month to allow only one month for one time  for each student
			{
				//insertion logic
				Enumeration paramNames=req.getParameterNames();//getting all names from html page
				subject_code=stmt2.executeQuery("select Sub_Abbr from Subject where Sub_Year="+year+"and Sub_Semester="+semester);//getting all subject codes
				
				//loop to insert subject code along with marks
				//variables used in loop
				String paramName;
				String[] paramValues;
				String paramValue_subjectmarks;
				
				
				for(int i=0;i<=subject_count;i++)
				{
					paramName = (String)paramNames.nextElement();
					paramValues = req.getParameterValues(paramName);

					// Read single valued data
					if (paramValues.length == 1 && i!=0)//i!=0 --- to eliminate month value and start from subject values
					{
						subject_code.next();
						stmt3.executeUpdate("insert into Student_Attendance(Student_Code,Years,Semester,Months,Subject,Attendance,Created_On) values('"+roll_no+"',"+year+","+semester+",'"+month_value+"','"+subject_code.getString(1)+"','"+paramValues[0]+"','"+sqlTime+"')");
					}	
				}
				out.print("<h4>Attendance Inserted</h4>");
			}
			else
			{
				out.print("<h4>"+month_value+" month attendance is already inserted.Click edit to update attendance</h4>");
			
			}
	    }




		if(req.getParameter("proceed")!=null || req.getParameter("update")!=null || req.getParameter("save")!=null)
		{

			//=============================================displaying entered marks table logic starts=============================================================

			month_types=stmt.executeQuery("select distinct Months from Student_Attendance where Years="+year+" and Semester="+semester+" and Student_Code='"+roll_no+"' ;");
			if(month_types.isBeforeFirst())
			{

			//displaying table head with subjects loading dynamically ----start
			subject_code=stmt2.executeQuery("select Sub_Abbr from Subject where Sub_Year="+year+" and Sub_Semester="+semester);
			
			out.print("<table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'><div class='col-sm-3'><th>Month</th></div>");
			while(subject_code.next())
			{	
				out.print("<div class='col-sm-1'><th>"+subject_code.getString(1)+"</th></div>");
				subject_count++;//to get subject count, which is used to print blank marks in table
			}
			out.print("<div class='col-sm-1'><th> </th></div>");//for edit button blank head
			out.print("</tr></div></thead>");	
			//-----subjects diplaying end Types


			//displayng table body with attendance for each month ---- start
			out.print("<tbody>");
			
			while(month_types.next())
			{	
				out.print("<div class='row'><tr class='tbodyrow'><div class='col-sm-1'><td>"+month_types.getString(1)+"</td></div>");
				attendance=stmt2.executeQuery("select Attendance from Student_Attendance where Years="+year+" and Semester="+semester+" and Months='"+month_types.getString(1)+"' and Student_Code='"+roll_no+"' ;");
				while(attendance.next())
				{
					out.print("<div class='col-sm-1'><td>"+attendance.getString(1)+"</td></div>");
				}
				out.print("<div class='col-sm-1'><td><button type='submit' class='btn btn-primary' name='edit' value='"+month_types.getString(1)+"'>Edit</button></td></div>");
				out.print("</tr></div>");		
			}
			
			out.print("</tbody></table>");
			//displaying attendance for each month  ---- end
			
			
			//displaying entered attendance table logic ends==========================================================================================================
			}
		}



		//==========================================================edit logic===================================================================================


		
		if(req.getParameter("edit")!=null )
		{
			//displaying table head with subjects loading dynamically ----start
			subject_code=stmt.executeQuery("select Sub_Abbr from Subject where Sub_Year="+year+" and Sub_Semester="+semester);
			
			out.print("<table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'><div class='col-sm-3'><th>Month</th></div>");
			while(subject_code.next())
			{	
				out.print("<div class='col-sm-1'><th>"+subject_code.getString(1)+"</th></div>");
				subject_count++;//to get subject count, which is used to print blank marks in table
			}
			out.print("<div class='col-sm-1'><th> </th></div>");//for edit or update button blank head
			out.print("</tr></div></thead>");	
			//-----subjects diplaying end


			//displayng table body with attendance for each month ---- start
			out.print("<tbody>");
			month_types=stmt.executeQuery("select distinct Months from Student_Attendance where Years="+year+" and Semester="+semester+" and Student_Code='"+roll_no+"' ;");
			while(month_types.next())
			{
				out.print("<div class='row'><tr class='tbodyrow'><div class='col-sm-1'><td>"+month_types.getString(1)+"</td></div>");
				attendance=stmt2.executeQuery("select Attendance from Student_Attendance where Years="+year+" and Semester="+semester+" and Months='"+month_types.getString(1)+"' and Student_Code='"+roll_no+"' ;");
				subject_code=stmt3.executeQuery("select Sub_Abbr from Subject where Sub_Year="+year+" and Sub_Semester="+semester);
				if(month_types.getString(1).equals(req.getParameter("edit")))
				{
					while(attendance.next())
					{
						subject_code.next();
						out.print("<div class='col-sm-1'><td><input class='form-control' type='text' name='"+subject_code.getString(1)+"' value='"+attendance.getString(1)+"'/></td></div>");
					}
					out.print("<div class='col-sm-1'><td><button type='submit' class='btn btn-primary' name='update' value='"+month_types.getString(1)+"'>update</button></td></div>");
				}
				else
				{
					while(attendance.next())
					{
						out.print("<div class='col-sm-1'><td>"+attendance.getString(1)+"</td></div>");
					}
					out.print("<div class='col-sm-1'><td><button type='submit' class='btn btn-primary' name='edit' value='"+month_types.getString(1)+"' disabled>Edit</button></td></div>");
				}
				out.print("</tr></div>");
			}
		}

		//edit logic end==============================================================================================================================================
			
			
		//common html body tags
		out.print("<input type='hidden' name='subject_count' value='"+subject_count+"'/><input type='hidden' name='year' value='"+year+"'/><input type='hidden' name='semester' value='"+semester+"'/><input type=hidden name='rollno' value='"+roll_no+"'/>");//hidden values
		out.print("</form>");
		out.print("</body></html>");
		
		//clsoing section
		stmt.close();
		stmt2.close();
		stmt3.close();
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