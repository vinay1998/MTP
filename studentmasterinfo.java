import java.io.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class studentmasterinfo extends HttpServlet
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

		
			//html form values section
			//student detais
			String s_name=req.getParameter("sname");
			String roll_no=req.getParameter("regd");
			String gender=req.getParameter("sex");
			int year=Integer.parseInt(req.getParameter("year"));
			String date_of_birth=req.getParameter("DOB");
			String mail_id=req.getParameter("mail");

			//Mentor Details
			String mentor_id1=req.getParameter("mentorid1");
			String from_date1=req.getParameter("fromdate1");
			String mentor_id2=req.getParameter("mentorid2");
			String from_date2=req.getParameter("fromdate2");
			String mentor_id3=req.getParameter("mentorid3");
			String from_date3=req.getParameter("fromdate3");

			//eamcet details
			int rank=Integer.parseInt(req.getParameter("rank"));
			String dept=req.getParameter("dept");
			String rcpt=req.getParameter("rcpt");
			String date_of_join=req.getParameter("dat");
			int amount=Integer.parseInt(req.getParameter("amt"));
			String seat_type=req.getParameter("seattype");
			String exempt=req.getParameter("exempt");
			String lateral=req.getParameter("lstud");
			String region=req.getParameter("region");
			String category=req.getParameter("category");
			String scholarship=req.getParameter("scholarship");
			String medium=req.getParameter("med");
			String mother_tongue=req.getParameter("m_tongue");
			String nation=req.getParameter("nation");
			String religion=req.getParameter("religion");
			String caste=req.getParameter("cas");
			String locality=req.getParameter("locality");

			//tenth details
			String tenth_marks=req.getParameter("tmar");
			String tenth_grade=req.getParameter("tgrd");
			String tenth_percentage=req.getParameter("tpct");
			//inter details
			String inter_marks=req.getParameter("imar");
			String inter_grade=req.getParameter("igrd");
			String inter_percentage=req.getParameter("ipct");
			
			//personal details
			String blood_group=req.getParameter("blood");
			String medical_problem=req.getParameter("prblm");
			String identification_mark1=req.getParameter("mole1");
			String identification_mark2=req.getParameter("mole2");
			String phy_handicapped=req.getParameter("phand");
			//parent details
			String father_name=req.getParameter("fnam");
			String father_phn_no=req.getParameter("fmob");
			String father_profession=req.getParameter("fprfn");
			int income=Integer.parseInt(req.getParameter("incm"));
			String mother_name=req.getParameter("mnam");
			String mother_mobile_no=req.getParameter("mmob");
			String phone_no=req.getParameter("phn");
			String mother_profession=req.getParameter("mprfn");
			//Address
			String parent_address=req.getParameter("adrs");
			String parent_mailid=req.getParameter("pmal");
			String guardian_name=req.getParameter("gnam");
			String guardian_address=req.getParameter("gadrs");
			String guardian_mailid=req.getParameter("gmal");
			String guardian_phn_no=req.getParameter("gphn");
			String guardian_mob_no=req.getParameter("gmob");
			//Family Background
			String community=req.getParameter("community");
			String father_education=req.getParameter("father_education");
			String mother_education=req.getParameter("mother_education");
			String parent_science=req.getParameter("science");
			String father_employment=req.getParameter("father_employment");
			String mother_employment=req.getParameter("mother_employment");			
			//Activities
			String activity=req.getParameter("activity");
			String date_of_activity=req.getParameter("dateofactivity");
			String description=req.getParameter("description");
			String grade=req.getParameter("grade");
			String remarks=req.getParameter("remarks");

			
			if(req.getParameter("save")!=null)
			{
			String sql1 = "INSERT INTO Student_Master_Information(Student_Name,Student_code,Student_Gender,Academic_Year,Date_Of_Birth,Student_Mail_Id,EAMCET_ECET,Branch,Fee_Deposit_Receipt_No,Receipt_Date,Receipt_Amount,Seat_Type,Is_Lateral_Student,Fees_Exempted,Region,Allotment_Category,Receipt_Of_Scholarship,Medium,Mother_Tongue,Nationality,Religion_Optional,Caste_Optional,Local_NonLocal,X_Class_Total_Marks,X_Class_Grade_Obtained,X_Class_Division_Perc,Inter_Total_Marks,Inter_Grade_Obtained,Inter_Division_Perc,Blood_Group,Any_Medical_Problem,Physically_Handicapped,Identification_Marks_1,Identification_Marks_2,Fathers_Name,Fathers_Mobile,Fathers_Profession,Family_Annual_Income,Mothers_Name,Mothers_Mobile,Phone_No,Mothers_Profession,Parents_Address,Parents_Mail_Id,Local_Guardian_Name,Local_Guardian_Address,Local_Guardian_Mail_Id,Local_Guardian_Phone_No,Local_Guardian_Mobile,Students_Home_Community,Fathers_Highest_Education,Mothers_Highest_Education,Parents_Trained_Science,Fathers_Employment,Mothers_Employment,Created_On,Mentor1_ID,From_Date1,Mentor2_ID,From_Date2,Mentor3_ID,From_Date3) ";
			String sql2 = "VALUES('"+s_name+"','"+roll_no+"','"+gender+"',"+year+",'"+date_of_birth+"','"+mail_id+"',"+rank+",'"+dept+"','"+rcpt+"','"+date_of_join+"',"+amount+",'"+seat_type+"','"+lateral+"','"+exempt+"','"+region+"','"+category+"','"+scholarship+"','"+medium+"','"+mother_tongue+"','"+nation+"','"+religion+"','"+caste+"','"+locality+"'";
			String sql3 = ",'"+tenth_marks+"','"+tenth_grade+"','"+tenth_percentage+"','"+inter_marks+"','"+inter_grade+"','"+inter_percentage+"','"+blood_group+"','"+medical_problem+"','"+phy_handicapped+"','"+identification_mark1+"','"+identification_mark2+"','"+father_name+"','"+father_phn_no+"','"+father_profession+"',"+income+",'"+mother_name+"','"+mother_mobile_no+"','"+phone_no+"','"+mother_profession+"',";
			String sql4 = "'"+parent_address+"','"+parent_mailid+"','"+guardian_name+"','"+guardian_address+"','"+guardian_mailid+"','"+guardian_phn_no+"','"+guardian_mob_no+"','"+community+"','"+father_education+"','"+mother_education+"','"+parent_science+"','"+father_employment+"','"+mother_employment+"','"+sqlTime+"','"+mentor_id1+"','"+from_date1+"','"+mentor_id2+"','"+from_date2+"','"+mentor_id3+"','"+from_date3+"')";
			int i=stmt.executeUpdate(sql1+sql2+sql3+sql4);

			String sql5 = "Insert into Student_Activities_Prizes(Activity,Student_Code,Date_Of_Activity,Description_Of_Activity,Grade_Activity,Remarks,Created_On) Values ('"+activity+"','"+roll_no+"','"+date_of_activity+"','"+description+"','"+grade+"','"+remarks+"','"+sqlTime+"')";
			int j=stmt.executeUpdate(sql5);
			out.print("<html><body><script>alert('Records Inserted');location='student_update.jsp';</script></body></html>");
		    res.sendRedirect("index.html");
			}
			
			if(req.getParameter("update")!=null)
			{
				String sql1 = "UPDATE Student_Master_Information SET Student_Name='"+s_name+"',Student_Gender='"+gender+"',Academic_Year="+year+",Date_Of_Birth='"+date_of_birth+"',Student_Mail_Id='"+mail_id+"',EAMCET_ECET="+rank+",Branch='"+dept+"',Fee_Deposit_Receipt_No='"+rcpt+"',Receipt_Date='"+date_of_join+"',Receipt_Amount="+amount+",Seat_Type='"+seat_type+"',Is_Lateral_Student='"+lateral+"',Fees_Exempted='"+exempt+"',Region='"+region+"',Allotment_Category='"+category+"',Receipt_Of_Scholarship='"+scholarship+"',Medium='"+medium+"',Mother_Tongue='"+mother_tongue+"',Nationality='"+nation+"',Religion_Optional='"+religion+"',Caste_Optional='"+caste+"',Local_NonLocal='"+locality+"'";
				String sql2= ",X_Class_Total_Marks='"+tenth_marks+"',X_Class_Grade_Obtained='"+tenth_grade+"',X_Class_Division_Perc='"+tenth_percentage+"',Inter_Total_Marks='"+inter_marks+"',Inter_Grade_Obtained='"+inter_grade+"',Inter_Division_Perc='"+inter_percentage+"',Blood_Group='"+blood_group+"',Any_Medical_Problem='"+medical_problem+"',Physically_Handicapped='"+phy_handicapped+"',Identification_Marks_1='"+identification_mark1+"',Identification_Marks_2='"+identification_mark2+"',";
				String sql3="Fathers_Name='"+father_name+"',Fathers_Mobile='"+father_phn_no+"',Fathers_Profession='"+father_profession+"',Family_Annual_Income="+income+",Mothers_Name='"+mother_name+"',Mothers_Mobile='"+mother_mobile_no+"',Phone_No='"+phone_no+"',Mothers_Profession='"+mother_profession+"',Parents_Address='"+parent_address+"',Parents_Mail_Id='"+parent_mailid+"',Local_Guardian_Name='"+guardian_name+"',Local_Guardian_Address='"+guardian_address+"',Local_Guardian_Mail_Id='"+guardian_mailid+"',Local_Guardian_Phone_No='"+guardian_phn_no+"',Local_Guardian_Mobile='"+guardian_mob_no+"',Students_Home_Community='"+community+"',Fathers_Highest_Education='"+father_education+"',Mothers_Highest_Education='"+mother_education+"',Parents_Trained_Science='"+parent_science+"',Fathers_Employment='"+father_employment+"',Mothers_Employment='"+mother_employment+"',Updated_On='"+sqlTime+"'";
				String sql4=",Mentor1_ID='"+mentor_id1+"',From_Date1='"+from_date1+"',Mentor2_ID='"+mentor_id2+"',From_Date2='"+from_date2+"',Mentor3_ID='"+mentor_id3+"',From_Date3='"+from_date3+"'  where Student_Code='"+roll_no+"'";
			    int i=stmt.executeUpdate(sql1+sql2+sql3+sql4);

				String sql5=" Update Student_Activities_Prizes SET Activity='"+activity+"',Date_Of_Activity='"+date_of_activity+"',Description_Of_Activity='"+description+"',Grade_Activity='"+grade+"',Remarks='"+remarks+"',Updated_On='"+sqlTime+"' where Student_Code='"+roll_no+"'";
				int j=stmt.executeUpdate(sql5);
				out.print("<html><body><script>alert('Records Updated');location='student_update.jsp';</script></body></html>");
				res.sendRedirect("student_update.jsp");
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