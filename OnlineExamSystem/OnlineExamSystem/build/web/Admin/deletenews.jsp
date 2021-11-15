<%@page import="DBman.DbManager"%>
<%
    int nid;
    String result;
    nid=Integer.parseInt(request.getParameter("nid"));
    DbManager dm=new DbManager();
    dm.cmd="Delete from Tbl_Notification where Notification_Id='"+nid+"'";
    boolean status=dm.DML();
    if(status==true)
    result="Notification deleted Successfully.";
    else
    result="Unable to delete Notification.";
    out.print("<script>alert('"+result+"');window.location.href='ManageNotification.jsp';</script>");
%>
