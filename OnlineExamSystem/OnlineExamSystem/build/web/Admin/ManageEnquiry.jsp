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
             $("#tbl tr:odd").css("background-color","white");
              $("#tbl tr:even").css("background-color","silver");
               $("#tbl tr:first").css("background-color","#164f84");
               $("#tbl tr:first").css("color","white");
               $(".spquery").click(function(){
                   var ntr=$(this).parents("tr").next();
                   ntr.fadeToggle(2000);
                   
               });
             
            });
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="AdminHeader.jsp" %>
            <div class='row' style='min-height: 600px;'>
            <div class="col-sm-2"></div>
            <div class="col-sm-8" >
                
        <!--start Enquiry-->
        <h2 class="text-center" style="color:#164f84;font-family: serif;margin-top: 100px;"> Enquiry Management </h2><hr/>
        <table id="tbl" border="1px solid #164f84" style="width: 100%;font-size: 15px;">
            <tr>
                <th> Sno.</th>  
                 <th> Name</th> 
                  <th> Email Id</th> 
                   <th> Mobile No.</th> 
                   <th> Asked On</th>
                 <th> Revert</th>
                 <th>View Details</th>
                  
            </tr>
            <% 
              DbManager dm=new DbManager();
               dm.cmd="SELECT * from tbl_enquiry order by EnquiryId desc";
               ResultSet rs=dm.DQL();
               int x=1;
               while(rs.next())
               {
                   %>
                   <tr>
                       <td> <%=x%></td>
                       <td><%=rs.getString("Name")%></td>
                       <td><%=rs.getString("Email_Id")%></td>
                       <td><%=rs.getString("Mobile_No")%></td>
                       <td><%=rs.getString("EnquiryDT")%></td>
                       <td> <a href="SendSMS.jsp?mob=<%=rs.getString("Mobile_No")%>"> Reply</a> </td>
                       <td> <span class="spquery" style="cursor:pointer;"> View Query </span></td>
                           
                   </tr>
                   <tr class="trmsg" style="display:none;">
                       <td colspan="7"> <span style="color:green;font-size: 17px;"> Query </span> 
                           <%=rs.getString("Message")%> </td>
                       
                   </tr>
                   <%
                       x++;
               }
               
            %>
        </table>
            </div>
        <div class='col-sm-1'></div>
            </div>
         <!--end Enquiry-->

        
        <%@include file="AdminFooter.html" %>
    </div>
    </body>
</html>
