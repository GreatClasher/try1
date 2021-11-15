<%-- 
    Document   : feeddel
    Created on : Aug 11, 2019, 9:13:46 AM
    Author     : DELL
--%>

<%@page import="DBman.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String fid = request.getParameter("fid");
            DbManager dbm = new DbManager();
            dbm.cmd = "Delete from tbl_feedback where FeedbackId='" + fid + "'";
            boolean status = dbm.DML();
            if (status == true) {%>
        <script>alert("Record Deleted Successfully.");window.location = "ManageFeedback.jsp";</script>
        <%} else {%>
        <script>alert("Unable to delete Records.");</script>
        <%}%>          
    </body>
</html>
