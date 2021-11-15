<%-- 
    Document   : res
    Created on : Aug 10, 2019, 8:04:01 PM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBman.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body onload='print()'>
        <div class="container-fluid">
            <div class="row" style="min-height: 600px;">
                <div class="col-sm-2"></div>
                <div  class='col-sm-8'>
                    <h1 class="text-center" style="color:#164f84;font-family: serif;margin-top: 100px;">Result.</h1>
                    <table id="tbl" border="1px solid #164f84" style="width: 100%;font-size: 15px;">
                        <tr style='background-color:#164f84;color:white;'>
                            <th>User Id</th>
                            <TH>Name</TH>
                            <th>Obtained Marks</th>
                            <th>Incorrect Answers</th>
                            <th>Total Marks.</th>
                            <th>Answers.</th>
                        <tr> <%    DbManager dbm = new DbManager();
                                dbm.cmd = "select * from candidate_registration right join res on candidate_registration.Roll_No=res.ID";
                                ResultSet rs=dbm.DQL();
                                while(rs.next())
                                {
                            %>
                        <tr>
                            <td><%= rs.getString("ID")%></td>
                            <td><%= rs.getString("candidate_registration.Name")%></td>
                            <td><%= rs.getString("obtain")%></td>
                            <td><%= rs.getString("incorrect")%></td>
                            <td><%= rs.getString("total")%></td>
                            <td><%= rs.getString("answer")%></td>
                        </tr>
                        <%}%>
                    </table>
                    
                </div> 
                <div class='col-sm-2'></div>
            </div>
        </div> 
    </div> 
</body>
</html>
