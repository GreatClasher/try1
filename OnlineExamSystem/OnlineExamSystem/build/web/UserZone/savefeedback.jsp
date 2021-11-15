<%@page import="DBman.DbManager"%>
<%@page import="java.util.Date"%>
<%
String topic=request.getParameter("ftopic");
String message=request.getParameter("fmessage");
int star=Integer.parseInt(request.getParameter("fstar"));
Date dt=new Date();
String rdt=dt.getDate()+"/"+dt.getMonth()+"/"+dt.getYear()+"-"+dt.getHours()+":"+dt.getMinutes()+":"+dt.getSeconds();
String uid=session.getAttribute("UserId").toString();
DbManager dm= new DbManager();
dm.cmd="Insert into Tbl_Feedback(Topic,Message,SubmittedBy,StarRating,SubmittedOn) values('"+topic+"','"+message+"','"+uid+"','"+star+"','"+rdt+"')";	
boolean status=dm.DML();
if (status==true)
{
out.print("Thanks For Your Valueable FeedBack");
}
else
{
    out.print("Sorry ! We are unable to save your Feedback");
}
%>