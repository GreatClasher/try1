<%@page import="DBman.DbManager"%>
<%
String uid,msg;
uid=request.getParameter("uid");
DbManager db=new DbManager();
db.cmd="Delete from candidate_registration where Roll_No='"+uid+"'";
boolean status=db.DML();
if(status==true)
{
    msg="User Record Deleted successfully.";
}
else
{
msg="Unable to delete user record";
}
out.print("<script>alert('"+msg+"');window.location.href='CandidateProfile.jsp';</script>");
%>