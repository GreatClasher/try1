<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="icon" href="../images/icon.jpg"/>
        <title>Change Password.</title>
        <!--%@include file="UserLinks.html"%-->
        <style>
            input{
                font-family: serif;
                width:93%;
                font-size:18px;
               height:30px;
               border:4px solid #11406a;
            }
           
        </style>
        <%@include file="AdminLink.html"%>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="AdminHeader.jsp" %>  
            <div class="row" style="min-height: 600px;background-color: white;">
            <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <form action="changep.jsp" method="post">
                            <h1 class="text-center" style="color:#164f84;font-family: serif;margin-top: 100px;"> Change Password </h1> 
                        <hr/>
                        
                           <input  name="pass" type="password" placeholder="Enter Your Password" required="required" style='margin-bottom: 30px;height:50px;font-family: serif;padding: 4px;'/>
                       
                        
                           <input  name="npass" type="password" placeholder="Enter Your New Password" required="required" style='margin-bottom: 30px;height:50px;font-family: serif;padding: 4px;'/>
                       
                       
                            <input  name="cpass" type="password" placeholder="Enter Your Confirm Password" required="required" style='margin-bottom: 30px;height:50px;font-family: serif;padding: 4px;'/>
                       
                        <div class="col-sm-6">
                                                <input type="submit" value="Save Changes" class="btn btn-success form-control" style="background-color:#11406a;border:0px;padding: 4px; "/>
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="reset" value="Clear all" class="btn btn-danger form-control"  style="background-color:white;color:#11406a;border:3px solid #11406a;padding: 4px;"/>   
                                            </div>
                    </form>
                </div>
            <div class="col-sm-2"></div>
    </div>
 <%@include file="AdminFooter.html"%>   
    </div> 
</body>
</html>