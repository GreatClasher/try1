<%@page import="DBman.DbManager"%>
<%@page import="java.util.Date"%>
<%
String msg,result,ndt;
msg=request.getParameter("msg");
Date dt=new Date();
ndt=dt.getDate()+"/"+dt.getMonth()+"/"+dt.getYear()+"-"+dt.getHours()+":"+dt.getMinutes()+":"+dt.getSeconds();
DbManager dm=new DbManager();
dm.cmd="Insert into Tbl_Notification(Notification_Msg,Notification_DT) values('"+msg+"','"+ndt+"')";
boolean status=dm.DML();
if(status==true)
result="Notification saved Successfully";
else
result="Unable to save Notification";
out.print("<script>alert('"+result+"');window.location.href='ManageNotification.jsp';</script>");
%>
