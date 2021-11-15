<%-- 
    Document   : AdminLogout
    Created on : Aug 9, 2019, 7:41:48 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
        session.invalidate();
        %>
        <script>
            function logout()
            {
                window.history.forward();
                window.setTimeout("window.location.href='AdminLogin.jsp'",500);
            }
            </script>
    </head>
    <body onload="logout()">
        
    </body>
</html>
