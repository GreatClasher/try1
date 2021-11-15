<%-- 
    Document   : AdminHome
    Created on : Aug 7, 2019, 6:26:20 AM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBman.DbManager"%>
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
                <div class="col-sm-2"></div>
                <div  class='col-sm-8'>
                    <h1 class="text-center" style="color:#164f84;font-family: serif;margin-top: 100px;">Feedback Management.</h1>
                    <hr/>
                    <table id="tbl" border="1px solid #164f84" style="width: 100%;font-size: 15px;margin-top: 100px;">
                        <tr style='background-color:#164f84;color:white;'>
                            <th>SNo</th>
                            <TH>Topic</TH>
                            <th>Message</th>
                            <th>Rating</th>
                            <th>Submitted By</th>
                            <th>Date</th>
                            <th>Delete</th>
                        </tr>
                        <tr> <%    DbManager dbm = new DbManager();
                                dbm.cmd = "select * from tbl_feedback";
                                int x=1;
                                ResultSet rs=dbm.DQL();
                                while(rs.next())
                                {
                            %>
                        <tr>
                            <td><%= x%></td>
                            <td><%= rs.getString("Topic")%></td>
                            <td><%= rs.getString("Message")%></td>
                            <td><%= rs.getString("SubmittedBy")%></td>
                            <td><%= rs.getString("StarRating")%></td>
                            <td><%= rs.getString("SubmittedOn")%></td>
                            <td><a href="feeddel.jsp?fid=<%= rs.getString("FeedbackId")%>">Delete</a></td>
                        </tr>
                        <%x++;}%>
                    </table>
                    
                </div> 
                <div class='col-sm-2'></div>
            </div>
                            <%@include file="AdminFooter.html"%>   

        </div> 
   </body>
</html>
