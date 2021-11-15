<%-- 
    Document   : delRes
    Created on : Aug 11, 2019, 8:26:44 AM
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
        <%
        DbManager dbm= new DbManager();
        dbm.cmd="truncate table res";
        boolean status=dbm.DML();
        if(status==true)
        {%>
        <script>alert("Records Deleted Successfully!");window.location="res.jsp";</script>   
       <% }
else
{
%>
<script>alert("Unable to delete records");.window.location="res.jsp";</script>
<%}
        %>
    </body>
</html>
