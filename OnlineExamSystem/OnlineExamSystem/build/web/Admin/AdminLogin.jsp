<%-- 
    Document   : AdminLogin
    Created on : Aug 7, 2019, 5:13:03 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            input{
                font-family: serif;
                width:93%;
                font-size:18px;
                margin-top: 10px;
               padding: 15px;
               height:30px;
               border:4px solid #11406a;
            }
        </style>
    </head>
    <body>
        <div style="margin:150px auto;padding:20px;width:550px;height:350px;border:4px solid #11406a;box-shadow: 15% 15% 15%;">
            <h2 style="text-align: center;font-family:serif;color:#11406a;">Admin Login</h2> 
            <hr/>
            <form action="alogin.jsp" method="post">
                <input type="text" name="adminid" required="required" placeholder="Admin Id " />
                <br><br>
                <input type="password" name="pass" required="required" placeholder="Enter Your Password" />
                <br><br>
                <input type="submit" value="Login" style="background-color: #11406a;color:white;height:50px;width:100%;"/>
            </form>
        </div>
    </body>
</html>
