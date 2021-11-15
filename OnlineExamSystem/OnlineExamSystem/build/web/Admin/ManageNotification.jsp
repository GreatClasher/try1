<%@page import="java.sql.ResultSet"%>
<%@page import="DBman.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="AdminLink.html" %>
        <script>
            $(document).ready(function(){
               $("#tbl tr:first").css("background-color","#164f84");
            });
        </script>
    </head>
    <body>
       <div class="container-fluid">
         <%@include file="AdminHeader.jsp"%>
         <div class="row">
         <div class="col-sm-2"></div>
         <div class="col-sm-8" style="min-height: 550px;background-color:#fff;">
             <!---start notification---->
             <div class="row" style="justify-content: center;">
             <div class="col-sm-9" style="background-color: white;padding: 15px;min-height: 250px;">
                 <h1 class="text-center" style="color:#164f84;font-family: serif;margin-top: 100px;">Manage News & Updates.</h1><hr/>
                 <form action="addnews.jsp"method="post">
                 
                 <textarea name="msg" class="form-control"rows="4" placeholder="Type your Message Here" style="border:3px solid #164f84; "/></textarea><br/>
                 <center><input type="submit" value="Save Notification" class="btn btn-info" style="border:0px;background-color:#164f84;color:white;"/>
                 </center>
                 </form>
                 <div class="col-sm-3"></div>
             </div>
            
             </div>
             <!---end notification---->
             <table class="tbl" border="1px solid #164f84" style="background-color:white;width:100%;">
                 <tr>
                     <th>Sno.</th>
                     <th>Notification Msg</th>
                     <th>DateTime</th>
                     <th>Delete</th>
                     </tr>
                     <%
                     DbManager dm=new DbManager();
                     dm.cmd="SELECT *from Tbl_Notification order by Notification_Id desc";
                     ResultSet rs=dm.DQL();
                     int sno=1;
                     while(rs.next())
                     { %>
                     <tr>
                         <td><%=sno%></td>
                          <td><%=rs.getString("Notification_Msg") %></td>
                           <td><%=rs.getString("Notification_DT") %></td>
                           <td><a href="deletenews.jsp?nid=<%=rs.getString("Notification_Id") %>">Remove</a></td>
                            </tr>
                            <%
                            sno++;
                            }
                            %>
                            </table>
         </div>
                            <div class="col-sm-2"></div>
         </div>
    <%@include file="AdminFooter.html" %>
    </div>
    </body>
</html>
