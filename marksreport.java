import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class marksreport extends HttpServlet
{
  public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
  {

	//global object declaration section
    Connection conn = null;
	Statement stmt = null;
	Statement marks_statement = null;
	ResultSet rs=null;
	PrintWriter out = res.getWriter();
	res.setContentType("text/html");

	//variables for internal code
	String[] exam_types = new String[6];
	exam_types[0] = "MID-1" ;
	exam_types[1] = "Assignment-1";
	exam_types[2] = "MID-2";
	exam_types[3] = "Assignment-2";
	exam_types[4] = "Average";
	exam_types[5] = "Semester";

	int i,j,subject_count=0;
	
	
	//html form values section
	int year=Integer.parseInt(req.getParameter("year"));
	int semester=Integer.parseInt(req.getParameter("semester"));
	String roll_no=req.getParameter("rollno");
	
	//created on date calculation
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

		if(req.getParameter("proceed")!=null)//if block only for proceed button
		{

			//displaying table head with subjects loading dynamically----start
			ResultSet subject_code=stmt.executeQuery("select Sub_Abbr from Subject where Sub_Year="+year+" and Sub_Semester="+semester);
			out.print("<html><head><link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'><link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'></head><link href='vendor/datatables/dataTables.bootstrap4.css' rel='stylesheet'><link href='css/sb-admin.css' rel='stylesheet'><link rel='stylesheet' type='text/css' href='css/main.css'><link rel='stylesheet' type='text/css' href='css/util.css'>");
			out.print("<body class='sfbg'><form action='marksreportedit' target='_self'>");
			out.print("<table class='table table-hover' id='data'><thead><div class='row'><tr class='table100-head theadrow'><div class='col-sm-3'><th>Exam Type</th></div>");
			while(subject_code.next())
			{	
				out.print("<div class='col-sm-1'><th>"+subject_code.getString(1)+"</th></div>");
				subject_count++;//to get subject count, which is used to print blank marks in table
		
			}
			out.print("</tr></div></thead><tbody>");	
			//-----subjects diplaying end




			//displayng marks for each exam type ---- start
			marks_statement=conn.createStatement();
			for(i=0;i<4;i++)
			{	
				out.print("<div class='row'><tr class='tbodyrow'><div class='col-sm-1'><td>"+exam_types[i]+"</td></div>");
				ResultSet marks=marks_statement.executeQuery("select Marks from Internal_Marks where Years="+year+" and Semester="+semester+" and Types='"+exam_types[i]+"' and Student_Code='"+roll_no+"' ;");
				if(marks.next())//using if-else because to print marks if they exist and if marks don't exist then we should print blank values
				{
					out.print("<div class='col-sm-1'><td>"+marks.getString(1)+"</td></div>");//printing outside whileloop because if 'if-condition' is true then sem_marks points to first row and without printing if we run whileloop condition then sem_marks points to 2nd row so atlast we do not find first row  
					while(marks.next())
					{
						out.print("<div class='col-sm-1'><td>"+marks.getString(1)+"</td></div>");
					}
				}
				else
				{
					// this block is to replace empty values
					for(j=0;j<subject_count;j++)
					{
						out.print("<div class='col-sm-1'><td></td></div>");
					}
					out.print("</tr></div>");
				}			
			}
			//displaying marks for each exam type ---- end




			
			//average mid marks calculating and displaying  ---- start
			out.print("<div class='row'><tr class='tbodyrow'><div class='col-sm-1'><td>"+exam_types[4]+"</td></div>");

			Statement mid1_stmt = conn.createStatement();
			Statement mid2_stmt = conn.createStatement();
			Statement assign1_stmt = conn.createStatement();
			Statement assign2_stmt = conn.createStatement();

			ResultSet mid1=mid1_stmt.executeQuery("select Marks from Internal_Marks where Years="+year+" and Semester="+semester+" and Types='MID-1' and Student_Code='"+roll_no+"' ;");
			ResultSet mid2=mid2_stmt.executeQuery("select Marks from Internal_Marks where Years="+year+" and Semester="+semester+" and Types='MID-2' and Student_Code='"+roll_no+"' ;");
			ResultSet assign1=assign1_stmt.executeQuery("select Marks from Internal_Marks where Years="+year+" and Semester="+semester+" and Types='Assignment-1' and Student_Code='"+roll_no+"' ;");
			ResultSet assign2=assign2_stmt.executeQuery("select Marks from Internal_Marks where Years="+year+" and Semester="+semester+" and Types='Assignment-2' and Student_Code='"+roll_no+"' ;");

			int result,loop_count=0,mid1_total,mid2_total;
			
			while(mid1.next() && mid2.next() && assign1.next() && assign2.next())
			{
				loop_count++;
				
				if(Integer.parseInt(mid1.getString(1))!=-1 && Integer.parseInt(assign1.getString(1))!=-1)
				{
					if(Integer.parseInt(mid2.getString(1))!=-1 && Integer.parseInt(assign2.getString(1))!=-1)
					{
						if(  (Integer.parseInt(mid1.getString(1))+Integer.parseInt(assign1.getString(1)))  > (Integer.parseInt(mid2.getString(1))+Integer.parseInt(assign2.getString(1)))  )
						{//if mid1 greater than mid2

							//calculate 80% from mid1 and 20% from mid2
							mid1_total=((Integer.parseInt(mid1.getString(1))+Integer.parseInt(assign1.getString(1)))*80)/100;
							mid2_total=((Integer.parseInt(mid2.getString(1))+Integer.parseInt(assign2.getString(1)))*20)/100;
							result=mid1_total + mid2_total;
						}
						else
						{//if mid1 less than mid2

							//calculate 20% from mid1 and 80% from mid2
							mid1_total=((Integer.parseInt(mid1.getString(1))+Integer.parseInt(assign1.getString(1)))*20)/100;
							mid2_total=((Integer.parseInt(mid2.getString(1))+Integer.parseInt(assign2.getString(1)))*80)/100;
							result=mid1_total + mid2_total;
						}
						out.print("<div class='col-sm-1'><td>"+result+"</td></div>");

					}
					else
					{
						out.print("<div class='col-sm-1'><td></td></div>");
					}
				}
				else
				{
					out.print("<div class='col-sm-1'><td></td></div>");
				}
	
			}
			while(loop_count!=subject_count)
			{
				loop_count++;
				out.print("<div class='col-sm-1'><td></td></div>");
			}
			out.print("</tr></div>");
			mid1_stmt.close();
			mid2_stmt.close();
			assign1_stmt.close();
			assign2_stmt.close();
			//average mid marks diplaying ---- end





			//semsester marks diplaying ---- start
			out.print("<div class='row'><tr class='tbodyrow'><div class='col-sm-1'><td>"+exam_types[5]+"</td></div>");
			ResultSet sem_marks=marks_statement.executeQuery("select Marks  from Student_Semester_Marks where Years="+year+" and Semester="+semester+" and Student_Code='"+roll_no+"' ;");
			if(sem_marks.next())//using if-else because to print marks if they exist and if marks don't exist then we should print blank values
			{
				out.print("<div class='col-sm-1'><td>"+sem_marks.getString(1)+"</td></div>");//printing outside whileloop because if 'if-condition' is true then sem_marks points to first row and without printing if we run whileloop condition then sem_marks points to 2nd row so atlast we do not find first row  
				while(sem_marks.next())
				{
					out.print("<div class='col-sm-1'><td>"+sem_marks.getString(1)+"</td></div>");
				}
			}
			else
			{
				for(j=0;j<subject_count;j++)
				{
					out.print("<div class='col-sm-1'><td></td></div>");
				}
				out.print("</tr></div>");
			}	
			//semester marks displaying ---- end




            //html closing tags
			out.print("</tbody></table>");
			out.print("<input type=hidden name='year' value='"+year+"'/><input type=hidden name='semester' value='"+semester+"'/><input type=hidden name='rollno' value='"+roll_no+"'/>");//hidden values for next page
			out.print("</form></body></html>");

		}
		
		stmt.close();
		marks_statement.close();
		conn.close();
    }
    catch(Exception e)
	{
		out.print(e);
	
	}
	 
  }
 
}