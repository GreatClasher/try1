<%@page import="DBman.SMSSender"%>
<%@page import="DBman.DbManager"%>
<%@page import="java.util.Date"%>
<%
String name,email,mob,msg,dt;
name=request.getParameter("name");
email=request.getParameter("email");
mob=request.getParameter("mobno");
msg=request.getParameter("message");
Date d=new Date();
dt=d.getDate()+"/"+d.getMonth()+"/"+d.getYear()+"-"+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
DbManager dm= new DbManager();
dm.cmd="Insert into tbl_enquiry(Name,Email_Id,Mobile_No,Message,EnquiryDT) values('"+name+"','"+email+"','"+mob+"','"+msg+"','"+dt+"')";
boolean status=dm.DML();
if (status==true)
{
    String res="Hi "+name+",Thanks for enquiry. We will contact you shortly .\n Regards- \n Team Imtehaan";
    SMSSender ss=new SMSSender();
    ss.SendMySMS(mob, res);
    msg="Thanks for your enquiry.";
}
else
{
    msg="Sorry! We are unable to save your enquiry .";
}
out.print("<script>alert('"+msg+"');window.location.href='index.jsp';</script>");
%>