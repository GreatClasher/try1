<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="GeneralLink.html"%>
        <style>
            .form-control
            {
                margin-bottom: 20px;
            }
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
var name,pass,status=true;
var spname,sppass;
name=document.getElementById("txtname").value.trim();
pass=document.getElementById("txtpass").value.trim();
spname=document.getElementById("spname");
sppass=document.getElementById("sppass");
spname.innerHTML="";
sppass.innerHTML="";
//VALIDATE USERID
if(name.length==0)
{spname.innerHTML="Please enter USER ID.";
status=false;
}
//to validate password...
if(pass.length==0)
{sppass.innerHTML="Please enter Password.";
status=false;
}
return status;
}
</script>
    </head>
    <body class="n">
          <div class="form-bg">
    <div class="container">
        <div class="row" style="min-height: 70px;">
                    <button class="btn btn-default" style="border-radius:50%;height: 40px;margin-top: 10px;background-color: transparent;border:0px;"><a href="index.jsp" style="color:black;font-weight: bold;">
                <i class="fa fa-angle-double-left" style="font-size:36px"></i>
                </a></button>
        </div>
        <div class="row" >
            <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <form class="form-horizontal" action='processLogin.jsp'method="post">
                        <div class="login_bg" style="background-image: url('images/login/g.gif');margin-top: 0px;padding-top: 0px;max-height: 250px;">

                            <div class="heading" style="padding-top:220px;font-size:40px;color:white;"> Log IN ! To Execute This Plan..</div> 
                        </div>

                        <div class="form-group">
                            <i class="fa fa-user"></i><input type="text" id="txtname" name="uid" class="form-control"
                                                             placeholder="Enter User Id or Registration Number ." required="required;" />
                      <p class="text-left" id="spname" style="color:red;margin-left: 40px;"></p>

                        </div>
                        <div class="form-group">
                            <i class="fa fa-lock"></i><input class="form-control"id="txtpass" name="pass" type="password" placeholder="Enter Your Password" required="required"/>
                                                                    <p id="sppass" class="text-left" style="color:red;margin-left: 40px;"></p>
                        </div>
                        <div class="form-group">
                            <button type="submit" value="login" onclick="return validateData()" class="btn btn-default">Log In</button>
                            <span class="form-login"> <a href="forgotpass.jsp" style="color:red;text-decoration:none;font-size: 20px;">Forgot Password ?</a></span>


                        </div>
                        <div class="form-group" >
                            <span class="form-login" style="font-size:20px;">Don't Have account ? <a href="Candidate.jsp" style="text-decoration: none;">Register Today!</a></span>
                        </div>
                    </form>
                </div>
            <div class="col-sm-2"></div>
    </div>
          
              <div class="row" style="min-height: 70px;"></div>
      </div>
          </div>
    
</body>
</html>