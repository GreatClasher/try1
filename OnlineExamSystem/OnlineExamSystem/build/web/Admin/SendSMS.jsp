<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="AdminLink.html" %>
        <style>

            p{
                margin-bottom:px;
                font-family:'Bitter',serif;
                font-size:13px;
                margin-left: 40px;

            }
        </style>
        <script>
            function validateData()
            {
                var mob, status = true;
                var spmob;
                mob = document.getElementById("txtmob").value.trim();
                spmob = document.getElementById("spmob");
                spmob.innerHTML = "";
//validate mobile no....
                if (mob.length == 0)
                {
                    spmob.innerHTML = "Please enter Mobile Number.";
                    status = false;
                } else if (mob.length == 10)
                {
                    var ch = mob.charCodeAt(0);//to get ASCII VALUE OF NOS 0 -9
                    if (ch >= 54 && ch <= 57)
                    {
                    } else
                    {
                        spmob.innerHTML = "Invalid Indian Mobile Number";
                        status = false;
                    }
                } else
                {
                    spmob.innerHTML = "Invalid Mobile Number";
                    status = false;
                }
                return status;
            }
        </SCRIPT>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="AdminHeader.jsp"%> 
            <!---start send sms-->
            <div class="row" style="min-height: 600px;">
                <div class="col-sm-2"></div>
                <div class="col-sm-8" style="background-color: white;">
                    <h1 class="text-center" style="color:#164f84;font-family: serif;margin-top: 100px;">Send Your Message.</h1><hr/>
                    <form action="processSms.jsp"method="post">
                        <input type="number" value="<%=request.getParameter("mob")%>"name="mob" id="txtmob" placeholder="Mobile number" class="form-control" style="border:2px solid #164f84"/><br/>
                        <p id="spmob" class="text-left" style="color:red;margin-left: 40px;"></p>
                        <textarea name="msg" class="form-control"rows="4" placeholder="Type your sms here" style="border:2px solid #164f84"/></textarea><br/>
                        <input type="submit" value="Send SMS" class="btn btn-info" onclick="return validateData()" style="background-color: #164f84;color:white;border:0px;width: 200px;"/>
                    </form>

                </div>
                <div class="col-sm-2"></div>
            </div>
            <%@include file="AdminFooter.html" %>
        </div>
    </body>
</html>
