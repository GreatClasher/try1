<%@page import="DBman.SMSSender"%>
<%@page import="DBman.DbManager"%>
<%@page import="DBman.Crytography"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="DBman.Renamefile"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
    String filepath=request.getRealPath("//Userpics");
    Renamefile rf=new Renamefile();
    MultipartRequest mr=new MultipartRequest(request, filepath, 20000000,rf );
    String Name,Fathers_Name,Date_of_Birth,Gender,Department,Course,Email_Id,Mobile_No,Address,Pic_Name,Pass,UserCode,Message;
    int Semester;
    Name=mr.getParameter("Name");
    Fathers_Name=mr.getParameter("Fathers_Name");
    Date_of_Birth=mr.getParameter("Date_of_birth");
    Gender=mr.getParameter("Gender");
    Department=mr.getParameter("Department");
    Course=mr.getParameter("Course");
    Semester=Integer.parseInt(mr.getParameter("Semester"));
    Email_Id=mr.getParameter("Email_Id");
    Mobile_No=mr.getParameter("Mobile_No");
    Address=mr.getParameter("Address");
    Pic_Name=rf.MyFileName;
    Pass=mr.getParameter("Pass");
    UserCode=mr.getParameter("usercode");
   //captcha check
   DbManager dm=new DbManager();
   Date dt=new Date();
   String rdt=dt.getDate()+"-"+dt.getMonth()+"-"+dt.getYear()+" "+dt.getHours()+":"+dt.getMinutes()+":"+dt.getSeconds();
   String captcha=session.getAttribute("captcha").toString();
   if(captcha.equals(UserCode))
   { 
       dm.cmd="Insert into candidate_registration(Name,Fathers_Name,Date_of_Birth,Gender,Department,Course,Semester,Email_Id,Mobile_No,Address,Profile_Pic_Path,Date_of_Registration)"
               +" values('"+Name+"','"+Fathers_Name+"','"+Date_of_Birth+"','"+Gender+"','"+Department+"','"+Course+"','"+Semester+"','"+Email_Id+"','"+Mobile_No+"','"+Address+"','"+Pic_Name+"','"+rdt+"')";
   
boolean status=dm.DML();
if(status==true)
{
    dm.cmd="select Max(Roll_No) as rno from candidate_registration";
    ResultSet rs=dm.DQL();
    String uid="";
    while(rs.next())
    {
        uid=rs.getString("rno");
    }
    Crytography cg=new Crytography();
    String ePass=cg.encryptMyData(Pass);
    dm.cmd="Insert into Tbl_Login values('"+uid+"','"+ePass+"','USER')";
    
    status=dm.DML();
    
        if(status==true)
        {
            Message="You are Registered Successfully. Your UserId Id: "+uid+" and Your Password is: "+Pass;
            SMSSender ss=new SMSSender();
            String ms="Hi "+Name+" ,Thanks to joining Imtehaan. Your Login Id is:"+uid+" and Your Password is: "+Pass+"\nRegards - Imtehaan Association of Mahatma Gandhi Chitrakoot Gramodaya Vishwavidyalaya";
            ss.SendMySMS(Mobile_No, ms);
        }
        else
        {
        Message="Registration Failed!"+"Unable to set Login details.";
        }
    }

else{
            Message="Sorry ! due to some technical errors,we are unable to register your account";
}
   }
else
{
 Message="Invalid Captcha Code! Registration Failed! Please try Again";    
}
out.print("<script>"+"alert('"+Message+"');"+"window.location.href='Candidate.jsp';</script>");

%>