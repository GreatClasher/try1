<%@page import="java.sql.ResultSet"%>
<%@page import="DBman.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="AdminLink.html"%>
        <style>
           table span{
                color:blue;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="AdminHeader.jsp" %>  
            <div class="row" style="min-height: 600px;">
                <div class="col-sm-1"></div>
                <div class='col-sm-10'>
                    <h1 class="text-center" style="color:#164f84;font-family: serif;margin-top: 100px;">Candidate's Profile.</h1>
                    <hr/>
                    <table style='width:100%;padding: 15px;background-color:white;' border="4px">
                        <tr>
                            <th colspan="4" class='text-center'>Candidate Details</th>
                            <th>Delete</th>
                        </tr>
                        <%
                        DbManager dm=new DbManager();
                        dm.cmd="Select * from candidate_registration order by Roll_No desc";
                        ResultSet rs=dm.DQL();
                        int sno=1;
                        while(rs.next())
                        {
                             %>
                            <tr>
                                <td colspan="4">
                                    <table width="100%" border="1">
                                        <tr>
                                            <td class="text-center">
                                                <img src="../Userpics/<%=rs.getString("Profile_Pic_Path")%>" style="width:80px;height:80px;margin:5px;"/>
                                            </td>
                                            <td>
                                                <span>SNo: </span><%=sno%>
                                            </td>
                                            <td>
                                                <span>Roll No: </span><%=rs.getString("Roll_No")%>
                                            </td>
                                             <td>
                                                <span>Name: </span><%=rs.getString("Name")%>
                                            </td>
                                             <td>
                                                 <span>Fathers Name: </span><%=rs.getString("Fathers_Name")%>
                                            </td>
                                        </tr>
                                        <tr>
                                             <td>
                                                 <span>Gender: </span><%=rs.getString("Gender")%>
                                             </td>
                                             <td>
                                                 <span>Date_of_Birth: </span><%=rs.getString("Date_of_Birth")%>
                                             </td>
                                            <td>
                                                 <span>Department: </span><%=rs.getString("Department")%>
                                             </td> 
                                              <td>
                                                 <span>Course: </span><%=rs.getString("Course")%>
                                             </td> 
                                        </tr>
                                        <tr>
                                            <td>
                                                 <span>Course: </span><%=rs.getString("Semester")%>
                                             </td>
                                             <td>
                                                 <span>Email_Id: </span><%=rs.getString("Email_Id")%>
                                             </td><td>
                                                 <span>Mobile_No: </span><%=rs.getString("Mobile_No")%>
                                             </td><td>
                                                 <span>Date_of_Registration: </span><%=rs.getString("Date_of_Registration")%>
                                             </td>
                                            
                                        </tr>
                                        <tr>
                                            <td colspan="4">Address: </span><%=rs.getString("Address")%></td>
                                        </tr>
                                    </table>
                                </td>
                                <td>  <a href="DeleteUser.jsp?uid=<%=rs.getString("Roll_No")%>">Delete</a>
                                </td>
                                
                        <%sno++;}
                        %>
                    </table>
                </div>
                <div class='col-sm-1'></div>
                </div>
          
       
        <%@include file="AdminFooter.html"%>   
    </div> 
</body>
</html>