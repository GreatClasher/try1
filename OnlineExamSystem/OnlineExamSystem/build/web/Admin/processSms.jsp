<%@page import="DBman.SMSSender"%>
<%
String mob,msg,result;
mob=request.getParameter("mob");
msg=request.getParameter("msg");
SMSSender ss=new SMSSender();
boolean status=ss.SendMySMS(mob, msg);
if(status==true)
result="SMS sent SUCCESSFULLY.";
else
result="Unable to send SMS";
out.print("<script>alert('"+result+"');window.location.href='SendSMS.jsp';</script>");
%>
