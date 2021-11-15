<%@page import="DBman.Crytography"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBman.DbManager"%>
<%
    String userid,userpass;
    userid=request.getParameter("uid");
    userpass=request.getParameter("pass");
    Crytography cg= new Crytography();
    userpass=cg.encryptMyData(userpass);
    DbManager dm=new DbManager();
    dm.cmd="Select *from Tbl_Login where UserId='"+userid+"' and Pass='"+userpass+"' and Utype='USER'";
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
        session.setAttribute("UserId",userid);
        out.print("<script>window.location.href='UserZone/Welcome.jsp';</script>");
    }
    else
    {
        out.print("<script>alert('Invalid UserId or Password. ');window.location.href='Login.jsp';</script>");
    }
%>