<%@page import="DBman.Crytography"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBman.DbManager"%>
<%
    String userid,userpass;
    userid=request.getParameter("adminid");
    userpass=request.getParameter("pass");
    Crytography cg= new Crytography();
    userpass=cg.encryptMyData(userpass);
    DbManager dm=new DbManager();
    dm.cmd="Select *from Tbl_Login where UserId='"+userid+"' and Pass='"+userpass+"' and Utype='ADMIN'";
    ResultSet rs=dm.DQL();
    boolean status=false;
    while(rs.next())
    {
        status=true;
        break;
    }
    String msg="";
    if(status==true)
    {
        session.setAttribute("adminid",userid);
        out.print("<script>window.location.href='AdminHome.jsp';</script>");
    }
    else
    {
        out.print("<script>alert('Invalid UserId or Password. ');window.location.href='AdminLogin.jsp';</script>");
    }
%>