<%@page import="DBman.Crytography"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidate Registration</title>
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
        <!--ajax--to--refresh--captcha--img-->
        <script>
            $(document).ready(function () {
                $("#imgrefresh").click(function () {
                    $.get("HumanDetection", null, function () {
                        $("#imgcaptcha").attr("src", "http://localhost:8084/OnlineExamSystem/HumanDetection");
                    })
                })
            })
        </script>

        <!--validation-->
        <script>
            function validateData()
            {
                var name, fname, mob, email, pass, cpass, status = true;
                var spname, spfname, spemail, spmob, sppass, spcpass;
                name = document.getElementById("txtname").value.trim();
                fname = document.getElementById("txtfname").value.trim();
                mob = document.getElementById("txtmob").value.trim();
                email = document.getElementById("txtemail").value.trim();
                pass = document.getElementById("txtpass").value.trim();
                cpass = document.getElementById("txtcpass").value.trim();
                spname = document.getElementById("spname");
                spfname = document.getElementById("spfname");
                spmob = document.getElementById("spmob");
                spemail = document.getElementById("spemail");
                sppass = document.getElementById("sppass");
                spcpass = document.getElementById("spcpass");
                spname.innerHTML = "";
                spmob.innerHTML = "";
                spemail.innerHTML = "";
                sppass.innerHTML = "";
                spcpass.innerHTML = "";
//to validate name....
                if (name.length == 0)
                {
                    spname.innerHTML = "Please enter Name.";
                    status = false;
                } else if (name.length < 3)
                {
                    spname.innerHTML = "Please enter a Valid Name";
                    status = false;
                }
//to validate fathers name
                if (fname.length == 0)
                {
                    spfname.innerHTML = "Please enter your Father's Name.";
                    status = false;
                } else if (name.length < 3)
                {
                    spname.innerHTML = "Please enter a Valid Name";
                    status = false;
                }
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
//to validate email
                if (email.length == 0)
                {
                    spemail.innerHTML = "Please Enter Email";
                    status = false;
                }
//to validate password...
                if (pass.length == 0)
                {
                    sppass.innerHTML = "Please enter Password.";
                    status = false;
                }

                if (cpass.length == 0)
                {
                    spcpass.innerHTML = "Please Confirm your Password.";
                    status = false;
                } else if (pass.length < 8)
                {
                    sppass.innerHTML = "Password length must be minimum of 8 Characters.";
                    status = false;
                }
                if (pass != cpass)
                {
                    spcpass.innerHTML = "Both Password must be Same.";
                    status = false;
                }
                return status;
            }
        </SCRIPT>
        <!--validation end-->
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="header.html"%>
            <%@include file="header2.html" %>
            <div class="form-bg">
                <div class="row " style="background: #00b09b;  /* fallback for old browsers */
                     background: -webkit-linear-gradient(to left, #96c93d, #00b09b);  /* Chrome 10-25, Safari 5.1-6 */
                     background: linear-gradient(to left, #96c93d, #00b09b); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                     ">
                    <div class="col-sm-12" >
                        <div class="row">
                            <div class="col-sm-12" style="min-height: 40px;">
                                <button class="btn btn-default" style="border-radius:50%;height: 40px;margin-top: 10px;background-color: transparent;border:0px;"><a href="index.jsp" style="color:black;font-weight: bold;">
                                        <i class="fa fa-angle-double-left" style="font-size:36px"></i>
                                    </a></button></div>
                        </div>

                        <!--%
                         Crytography cg=new Crytography();
                         String et=cg.encryptMyData("MyKSSCKT");
                         out.print(et);
                         %-->
                        <div class="row formdes">
                            <div class="col-sm-1">

                            </div>
                            <div class="col-sm-10 reg" >
                                <h1 class="text-center rh">
                                    Register Today !</h1><h2 class="text-center ru">to start your Journey from the Window of Stars ..<h2>

                                        <form class="form-horizontal" style="padding:20px;"action="saveRegistration.jsp" method="post" enctype="Multipart/form-data">
                                            <div class="form-group">
                                                <i class="fa fa-user" style="font-size:28px;"></i>
                                                <input type="text" name="Name" id="txtname" class="form-control" style=" color: rgba(0,0,0,0.4);" placeholder="Enter Your Name"/>
                                                <p class="text-left" id="spname" style="color:red;margin-left: 40px;"></p>
                                            </div>

                                            <div class="form-group">
                                                <i class="fa fa-male" style="font-size:28px;"></i>
                                                <input type="text" id='txtfname' name="Fathers_Name"style=" color: rgba(0,0,0,0.4);" class="form-control" placeholder="Enter Your Father's Name"/>
                                                <p class="text-left" id="spfname" style="color:red;margin-left: 40px;"></p>

                                            </div>
                                            <div class="form-group"> 
                                                <i class="fa fa-calendar" style="font-size:28px;"></i>
                                                <input type="date" name="Date_of_birth" class="form-control" required="required" placeholder="Enter Your Date_of_Birth (mm-dd-yy)"
                                                       style=" color: rgba(0,0,0,0.4);
                                                       font-size: 15px;
                                                       font-family: 'Bitter', serif;
                                                       text-transform: uppercase;"  required="required"/> 
                                                <p class="text-info text-left">Please ,Enter your Valid Date of Birth.</p>  
                                            </div>
                                            <div class="form-group form-control" style=" color: rgba(0,0,0,0.4);
                                                 font-size: 15px;
                                                 font-family: 'Bitter', serif;
                                                 text-transform: uppercase;" ><i class="fa fa-male" style="font-size:28px;"></i>Gender:&nbsp;&nbsp;
                                                <input type="radio" name="Gender" value="male" style=" color: rgba(0,0,0,0.4);
                                                       font-size: 15px;
                                                       font-family: 'Bitter', serif;
                                                       text-transform: uppercase;">male:&nbsp;&nbsp;
                                                <input type="radio" name="Gender" value="female" style=" color: rgba(0,0,0,0.4);
                                                       font-size: 15px;
                                                       font-family: 'Bitter', serif;
                                                       text-transform: uppercase;">Female:&nbsp;&nbsp;
                                            </div>
                                            <div class="form-group" >

                                                <select name="Department" class="form-control"
                                                        style=" color: rgba(0,0,0,0.4);
                                                        font-size: 15px;
                                                        font-family: 'Bitter', serif;
                                                        text-transform: uppercase;
                                                        font-weight:bold;"
                                                        >
                                                    <option value="">Your Department</option>
                                                    <option value="1">Management</option>
                                                    <option value="2">Art</option>
                                                    <option value="3">Science and Environment</option>
                                                    <option value="4">Food Technology</option>
                                                    <option value="5">Agriculture</option> 
                                                    <option value="6">Medical</option> 
                                                </select>
                                                <select name="Course" class="form-control"
                                                        style=" color: rgba(0,0,0,0.4);
                                                        font-size: 15px;
                                                        font-family: 'Bitter', serif;
                                                        text-transform: uppercase;
                                                        font-weight:bold;">
                                                    <option value="">Your Course</option>
                                                    <option value="1">B.tech</option>
                                                    <option value="2">B.Pharma</option>
                                                    <option value="3">B.Sc</option>
                                                    <option value="4">B.Com</option>
                                                    <option value="5">BFA</option>
                                                    <option value="6">BCA</option>
                                                </select>
                                                <select name="Semester" class="form-control"
                                                        style=" color: rgba(0,0,0,0.4);
                                                        font-size: 15px;
                                                        font-family: 'Bitter', serif;
                                                        text-transform: uppercase;
                                                        font-weight:bold;">
                                                    <option value="">Your Semester</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <i class="fa fa-envelope"  style="font-size:28px;"></i>
                                                <input type="email" id="txtemail" style=" color: rgba(0,0,0,0.4);" name="Email_Id" class="form-control" placeholder=" Enter your Email Address"/>
                                                <p id="spemail"class="text-left" style="color:red;margin-left: 40px;"></p>

                                            </div>


                                            <div class="form-group">
                                                <i class="fa fa-phone"  style="font-size:28px;"></i>
                                                <input type="number" id="txtmob" name="Mobile_No" class="form-control" placeholder="Enter your mobile number"/>
                                                <p id="spmob" class="text-left" style="color:red;margin-left: 40px;"></p>
                                            </div>

                                            <div class="form-group"  style="font-size:28px;">
                                                <i class="fa fa-address-card" style="font-size:28px;"></i>
                                                <textarea name="Address" required="required" class="form-control" row="4" style="resize: none;"placeholder=" Enter your address...."/></textarea>
                                                <p class="text-info text-left">Please ,Enter your Current Address with PinCode.</p>  

                                            </div>
                                            <div class="form-group">
                                                <i class="fa fa-file-image-o" style="font-size:28px;"></i>
                                                <input type="file" name="upic" class="form-control" required="required"
                                                       style=" color: rgba(0,0,0,0.4);
                                                       font-size: 15px;
                                                       font-family: 'Bitter', serif;
                                                       text-transform: uppercase;"/>
                                            </div>
                                            <div class="form-group">
                                                <i class="fa fa-key" style="font-size:28px;"></i>
                                                <input type="password" style=" color: rgba(0,0,0,0.4);" id="txtpass" name="Pass" class="form-control" placeholder="Enter the password" required="required"/>
                                                <p id="sppass" class="text-left" style="color:red;margin-left: 40px;"></p>
                                            </div>

                                            <div class="form-group">
                                                <i class="fa fa-check-square-o" style="font-size:28px;"></i>
                                                <input type="password"style=" color: rgba(0,0,0,0.4);" id="txtcpass" name="cpass" class="form-control" placeholder="Enter the  comfirm password" required="required"/>
                                                <p id="spcpass" class="text-left" style="color:red;margin-left: 40px;"></p>

                                            </div>

                                            <div class="form-control"style="height:30px;">
                                                <img  id="imgcaptcha" src="http://localhost:8084/OnlineExamSystem/HumanDetection"/>
                                                <i id="imgrefresh"src="images/logo.jpg" class="fa fa-refresh" style="width:50px;height: 40px;cursor: pointer;font-size: 30px;color:black;" title="Ref code"></i>                      
                                            </div>
                                            <div class="form-group">
                                                <i class='fa fa-barcode' style='font-size:28px'></i>
                                                <input type="text" style=" color: rgba(0,0,0,0.4);" required name="usercode" class="form-control" placeholder=" Enter the Captcha Code" required="required"/>
                                                <p class="text-info text-left">Please ,Enter Above Given Captcha Code.</p>  

                                            </div>
                                            <div class='row' style='margin-bottom: 50px;'>
                                            <div class="col-sm-6 form-group">
                                                <input type="submit" value="Register now" onclick="return validateData()" class="btn btn-success form-control" style="
                                                       height:40px;background-color:green;"/>
                                            </div>
                                            <div class="col-sm-6 form-group">
                                                <input type="reset" value="clear all" class="btn btn-danger form-control"  style="
                                                       background-color:red;height:40px;"/>   
                                            </div></div>
                                        </form> 
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                       
                                            <%@include file="footer.html" %>
                                        </div>
                                        </div>
                                        </body>
                                        </html>
