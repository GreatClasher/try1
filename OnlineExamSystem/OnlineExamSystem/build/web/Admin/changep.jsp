<%@page import="java.sql.ResultSet"%>
<%@page import="DBman.Crytography"%>
<%@page import="DBman.DbManager"%>
<%
String pass,npass,cpass,msg="";
pass=request.getParameter("pass");
npass=request.getParameter("npass");
cpass=request.getParameter("cpass");
if(npass.equals(cpass))
{
    DbManager dm=new DbManager();
    Crytography cg=new Crytography();
    String eoldpass,enewpass,dbpass="";
    eoldpass=cg.encryptMyData(pass);
    enewpass=cg.encryptMyData(npass);
    String uid=session.getAttribute("adminid").toString();
    dm.cmd="Select Pass from Tbl_Login where UserId='"+uid+"'";
    ResultSet rs=dm.DQL();
    while(rs.next())
        dbpass=rs.getString("pass");
    if(dbpass.equals(eoldpass))
    {
    dm.cmd="UPDATE Tbl_Login set Pass='"+enewpass+"' where UserId='"+uid+"' and Pass='"+eoldpass+"'";
    boolean status=dm.DML();
    if(status==true)
    { msg="Password Changed Successfully";
    }else
    {   msg="Invalid Current Password";
       }}
else
    {  msg="Invalid password";
}}
else
{ msg="New Password Has Been Updated";
}
out.print("<script>alert('"+msg+"');window.location.href='ChangePassword.jsp';</script>");

%>