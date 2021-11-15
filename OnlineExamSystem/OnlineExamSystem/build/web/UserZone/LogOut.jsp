<%
session.invalidate();
%>
<html>
    <head>
        <script>
            function keepMeLogout()
            {
                window.history.forward();
                window.setTimeout("window.location.href='../Login.jsp';",300);
            }
            </script>
    </head>
    <body onload='keepMeLogout()'>
        
    </body>
</html>