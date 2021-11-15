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
        <%@ include file="AdminLink.html"%>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="AdminHeader.jsp" %>  
            <div class="row" style="min-height: 600px;">
                <div class="col-sm-2"></div>
                <div  class='col-sm-9'>
                    <h1 class="text-center" style="color:#164f84;font-family: serif;margin-top: 100px;">Result.</h1>
                    <hr/>
                    <table id="tbl" border="1px solid #164f84" style="width: 100%;font-size: 15px;margin-top: 80px;">
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
                    <h5><a href='delRes.jsp' style="text-decoration: none;color:#164f84;font-size: 15px;">Delete All Records</a></h5><br>
                    <center> <button class="btn btn-info"style="align:right;border:0px;background-color:#164f84;width: 200px;margin-bottom: 80px;"><a href='printres.jsp' style="text-decoration: none;color:white;">Print</a></button>
                    </center></div> 
                <div class='col-sm-1'></div>
            </div>
        </div> 

        <%@include file="AdminFooter.html"%>   
    </div> 
</body>
</html>
