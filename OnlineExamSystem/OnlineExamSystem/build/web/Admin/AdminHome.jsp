<%-- 
    Document   : AdminHome
    Created on : Aug 7, 2019, 6:26:20 AM
    Author     : DELL
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="AdminLink.html"%>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="AdminHeader.jsp" %>  
            <div class="row" style="min-height: 600px;">
                <div class="col-sm-12">
                    <%@include file="upload.jsp" %> 
                </div>
            </div> 
       
        <%@include file="AdminFooter.html"%>   
    </div> 
</body>
</html>
