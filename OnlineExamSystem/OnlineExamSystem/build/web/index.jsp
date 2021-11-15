<%-- 
    Document   : index
    Created on : Jul 27, 2019, 3:52:56 PM
    Author     : DELL
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/icon.jpg"/>
        <title>MGCGV Imtehaan</title>
        <%@include file="GeneralLink.html" %>
        <style> .form-control
            {
                margin-bottom: 12px;
            }
            p{
                margin-bottom:px;
                font-family:'Bitter',serif;
                font-size:13px;
                margin-left: 40px;

            }
            
        </style>

        <script>
            $(document).ready(function () {
                $('#slider').fadeslider();
            });
        </script>
        <script>
            function validateData()
            {
                var name, mob, email, status = true;
                var spname, spemail, spmob;
                name = document.getElementById("txtname").value.trim();
                mob = document.getElementById("txtmob").value.trim();
                email = document.getElementById("txtemail").value.trim();
                spname = document.getElementById("spname");
                spmob = document.getElementById("spmob");
                spemail = document.getElementById("spemail");
                spname.innerHTML = "";
                spmob.innerHTML = "";
                spemail.innerHTML = "";
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
                    spemail.innerHTML = "Please Enter E-Mail";
                    status = false;
                }
                return status;
            }
        </SCRIPT>
        <!--validation end-->
        <script>
            var myimages = ["images/gallery/s1.jpg", "images/gallery/s2.jpg", "images/gallery/s3.jpg","images/gallery/s7.jpeg", "images/gallery/s8.jpg", "images/gallery/s9.jpg", "images/gallery/s10.jpg"];
            var imgno = 0;
            function runslider()
            {
                var myslide = document.getElementById("imgslider");
                myslide.src = myimages[imgno];
                imgno++;
                if (imgno == myimages.length)
                    imgno = 0;
                window.setTimeout("runslider()", 3000);
            }

        </script>
        <%@include file="GeneralLink.html" %>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="DBman.DbManager"%>
    </head>
    <body onload="runslider()"
        
        <div class="container-fluid">
            <!--Include Header-->
            <div class="row">
                <div class="col-sm-12">
                    <%@include file="header.html" %>
                    <%@include file="header2.html" %>
                </div>
            </div>

            <!--slider start-->
            <div class="row main" style="min-height: 520px;background-color:silver;">

                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-12" style="min-height: 25px;background-color: white;"></div>
                    </div>
                    <div class="row" style="background-color: white;">      
                        <div id="container-fluid" style="padding-left:25px;">
                            <section>
                                <div id="slider-div">
                                    <div id="slider">
                                        <ul>

                                            <li><img src="images/slider/sl1.jpg" alt="You Belong With Champions." height="550px" width="100%"  class="img-fluid"/></li>
                                            <li><img src="images/slider/sl2.jpg" alt="Prove Yourself to Yourself not Others." height="550px" width="100%" class="img-fluid"/></li>
                                            <li><img src="images/slider/sl3.jpg" alt="Striving for Succes without hard work is like trying to harvest where you haven't Planted." height="550px" width="100%" class="img-fluid"/></li>
                                            <li><img src="images/slider/sl4.jpg" alt="Strength of mind is Exercise not rest."  height="550px"width="100%" class="img-fluid"/></li>
                                            <li><img src="images/slider/sl5.jpg" alt="The journey of a thousand miles starts with a single step." height="550px" width="100%"class="img-fluid"/></li>
                                            <li><img src="images/slider/sl6.jpg" alt="Put Your heart,mind,intellect and soul even to your smallest acts.This is the secret of success." height="550px" width="100%"class="img-fluid"/></li>
                                            <li><img src="images/slider/sl7.jpg" alt="Life has only one Rule-Never Quit." height="550px" width="100%"class="img-fluid"/></li>
                                            <li><img src="images/slider/sl8.jpg" alt="Do something that your future self will thank you for." height="550px" width="100%"class="img-fluid"/></li>
                                            <li><img src="images/slider/sl11.jpg" alt="And the best way to pridict the future is to CREATE it." height="550px"width="100%" class="img-fluid"/></li>
                                            <li><img src="images/slider/sl12.jpg" alt="The greatest test of courage on earth is to bear deafeat without losing heart." height="550px" width="100%"class="img-fluid"/></li>
                                            <li><img src="images/slider/sl14.jpg" alt="Work in silence.Let success makes the noise." height="550px" width="100%"class="img-fluid"/></li>
                                            <li><img src="images/slider/sl15.jpg" alt="Hard Work beats Talent when Talent deosn't Work Hard." height="550px" width="100%"class="img-fluid"/></li>

                                        </ul>
                                    </div>
                                </div>

                            </section>
                        </div>
                    </div>

                    <script src="js/fadeslider.js"></script>
                    <div class="row">
                        <div class="col-sm-12" style="min-height: 25px;background-color: white;"></div>
                    </div>
                </div>
            </div> 
            <!--slider end-->
            <!--end Slider-->
            <div class="row">
                <div class="col-sm-7" style="min-height:300px;">
                    <div class='row'>
                        <div class='col-sm-12'id="about" style='background-color: #499e75;opacity:0.8;padding-top: 10px;padding-bottom: 10px;padding-left:50px;'>
                            <span style="color:black;font-size: 24px;font-family: 'Cinzel',serif;line-height: 50px;font-weight:bold;">Our Story.</span><br>
                            <span style="color:black;font-size: 15px;font-family:serif;line-height: 5px;text-align: justify">
                                One-stop-destination for examination, preparation, recruitment, and more. Specially designed online examination system to solve all your preparation worries. The platform is smooth to use with a translational flow of information.
                            </span><br/><br/>
                            <span style="color:black;font-size: 15px;font-family:serif;line-height: 5px;text-align: justify;">
                                Imtehaan examination module allows you to create exam schedules for a specific year/semester for the students of MGCGV, Chitrakoot. It is a web - application that establishes a network between the organization and applicants.The Organization enters the questions they want in exam.These questions are only displayed to eligible students.The answer inputted by the applicants are then evaluated and thier scores are calculated and saved.This score is then can be accessed by the Admin to determine the passed students or to evaluate their performance.
                            </span><br/><br/>
                            <span style="color:black;font-size: 15px;font-family:serif;line-height: 5px;text-align: justify;">
                                The purpose of online test simulator is to take online test in an efficient manner and no time wasting for checking the paper.
                            </span><br/>
                            <div class="text-right" style="margin-top:20px;">
                                <a  style="font-family: 'Cinzel', serif;color:WHITE;font-size:15px;">KNOW MORE..</A></div>
                        </div>

                    </div>
                </div>
            
                <div class="col-sm-5" id="news" style="background-color:#ffffff;min-height:300px;padding:14px 5px;">
                    <span class="text-center" style="color: #459870;font-size: 22px;font-family: 'Cinzel', serif;line-height: 40px;font-weight:bold;">News and Updates.</span>
                    <marquee behavior="scroll" height="250px;" direction="up" bgcolor="#000" opacity="0.5" style="color:white;font-family: 'Old Standard TT', serif;font-size: 18px;">
                        <%
                            DbManager dm = new DbManager();
                            dm.cmd = "Select * from tbl_notification order by Notification_Id desc";
                            ResultSet rs = dm.DQL();
                            while (rs.next()) {
                                out.println("<ul style='list-style-type:disc;margin-right:10px;'>" + rs.getString("Notification_Msg") + "</ul>");
                            }
                        %>
                    </marquee>
                </div>
            </div>
            <%@include file="MyMotive.jsp"%>
            <!--gallery-->
            <div class="row">
                <div class="col-sm-12">
                    <div class="row" style="background-color:rgba(0,0,0,0.7)">
                        <div class="col-sm-5" id="gallery" style="background-color:white;min-height:400px;padding:14px 20px;justify-content: center;">
                            <span class="text-center" style="color: #459870;font-size: 32px;font-family: 'Cinzel', serif;line-height: 40px;font-weight:bold;"> Our Campus.</span>
                            <img id="imgslider" src="images/gallery/pic1.jpg" width="100%"  style="min-height: 350px;border:20px solid black;padding-top:14px 5px;"/>

                        </div>
                        <div class="col-sm-7" style="background-color:#459870;">
                            <div class="col-sm-12" style="background-color:#111;min-height:400px;margin:14px 5px 14px 5px;padding: 20px;">
                                <div class="row">
                                    <div class="col-sm-12 text-center" >
                                        <span style="color: #fff;font-size: 32px;font-family: 'Cinzel', serif;margin-top: 20px;line-height: 30px;font-weight:bold;">Specifications.</span>
                                    </div></div>    <div class="row"> 
                                    <div class="col-sm-12 text-left">
                                        <ul style="color: #fff;font-size: 18px;font-family:serif;margin-top: 20px;line-height: 10px;list-style-type: none;">
                                            <li><i class="fa fa-check-square-o" style="font-size:20px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Any time Online access can be provided.</li><br>
                                            <li><i class="fa fa-check-square-o" style="font-size:20px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Knowledge is Shared with students.</li><br>
                                            <li><i class="fa fa-check-square-o" style="font-size:20px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Validated Timing of the test.</li><br>
                                            <li><i class="fa fa-check-square-o" style="font-size:20px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Provide Exam Details.</li><br>
                                            <li><i class="fa fa-check-square-o" style="font-size:20px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Event Notification for students.</li><br>
                                            <li><i class="fa fa-check-square-o" style="font-size:20px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Provide best online exam experience in Low Cost.</li><br>
                                            <li><i class="fa fa-check-square-o" style="font-size:20px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Calculate the result of exams automatically.</li><br>
                                            <li><i class="fa fa-check-square-o" style="font-size:20px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Enquiry can be done by students whenever required.</li><br>
                                            <li><i class="fa fa-check-square-o" style="font-size:20px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Data of students is secure.</li><br>
                                            <li><i class="fa fa-check-square-o" style="font-size:20px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Easily accessible from any corner of the world.</li><br>

                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <%@include  file="ContactUs.jsp"%>
                <!--Include Footer-->

                <%@include file="footer.html" %>

            </div>
            
            <!--start Enquiry form-->
            <!--   <span  id="speq" class="btn btn-info" style="z-index:1;position:fixed;top:200px;left:-28px;transform:rotate(-90deg);float:left;"
                      onclick="managePopup()">Enquiry</span>-->
            <!--   <div id="dveq" style=" display: none;background-color: #fcf8e3;width:500px;height: 450px;position:fixed;top:150px;
                    left:350px;border-radius:10px;float:left;padding:8px;">
                   <form action="saveEnquiry.jsp" method="post">
                       <p class="text-center" style="font-weight: bold;margin-top:8px; font-size:20px;margin-bottom: 20px;" >Enter Your Query ?</p>
                       <input type="text" class="form-control" name="name" placeholder="Enter Your Name" style="margin-bottom:8px;"/>
                       <input type="email" class="form-control" name="email" placeholder="Enter Your E. Mail Address"style="margin-bottom: 8px;"/>
                       <input type="number" class="form-control" name="mobno" placeholder="Enter Your Mobile Number"style="margin-bottom:8px;"/>
                       <textarea class="form-control" rows="8" name="message" placeholder="Enter Your Message.."style="margin-bottom:8px;resize:none;"></textarea>
                       <input type="submit" class="btn btn-success form-control" value="Done" style="margin-bottom:8px;"/>
                   </form>-->
            <!--start Enquiry form-->
            <!--button social-->
            <div class="btn-group-vertical"  style="z-index:1;float:left;border-radius:15px 0px 0px 15px;position:fixed;top:140px;left:-8px;">
                <button  id='btng' class="btn btn-primary" style="background-color: whitesmoke;border:0px;color:#459870;">
                    <a  href="https://www.facebook.com/MahatmaGandhiChitrakootGramodayUniversity1/" style="color:#459870;"><i class="fa fa-facebook" style="font-size:24px"></i></a>   
                </button>
                <button  id='btng'class="btn btn-primary" style="background-color: whitesmoke;border:0px;color:#459870;">
                    <a  href="#" style="color:#459870;"><i class="fa fa-google-plus" style="font-size:24px"></i></a>             
                </button>
                <button  id='btng' class="btn btn-primary" style="background-color: whitesmoke;border:0px;color:#459870;">
                    <a  href="https://www.youtube.com/watch?v=JIrI7JBIIiQ" style="color:#459870;"><i class="fa fa-youtube-play" style="font-size:24px"></i></a>              
                </button>
                <button  id='btng' class="btn btn-primary" style="background-color: whitesmoke;border:0px;color:#459870;">
                    <a  href="https://www.instagram.com/explore/.../mgcgv-chitrakoot-satna-m-p/..." style="color:#459870;"><i class="fa fa-instagram" style="font-size:24px"></i></a>              
                </button>
                <button id='btng' class="btn btn-primary" style="background-color: whitesmoke;border:0px;color:#459870;">
                    <a  href="https://twitter.com/mgcgvchitrakoot?lang=en" style="color:#459870;"><i class="fa fa-twitter" style="font-size:24px"></i></a>              
                </button>
            </div>

            </div><!--
            <!--ENQUIRY -->
            <DIV id="dveq" style=" display: none;position:fixed;top:60px;
                 left:300px;float:left;">
                <div class="form-bg">
                    <div class="container" style='width: 650px;height: 700px;'>
                        <div class="row">
                            <div class="col-sm-12">
                                <form class="form-horizontal" action="saveEnquiry.jsp" method="post">
                                    <div class="imgf" style='justify-content: center;' ><img src="images/enqiury/icon.gif"style="width:70%;max-height:60%;padding-left: 130px;margin:0px;" />
                                    </div>
                                    <div class="heading"> Have Some Questions ?</div>
                                    <div class="form-group">
                                        <i class="fa fa-user"></i><input class="form-control" id="txtname" name="name" type="text" placeholder="Your Name"/>
                                        <p class="text-left" id="spname" style="color:red;margin-left: 40px;"></p>
                                    </div>
                                    <div class="form-group">
                                        <i class="fa fa-envelope"></i><input class="form-control" id="txtemail" name="email" type="email" placeholder="Your Email Address">
                                        <p id="spemail"class="text-left" style="color:red;margin-left: 40px;"></p>

                                    </div>
                                    <div class="form-group">
                                        <i class="fa fa-phone"></i><input class="form-control" id="txtmob" name="mobno" type="Number" placeholder="Your Mobile Number">
                                        <p id="spmob" class="text-left" style="color:red;margin-left: 40px;"></p>

                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-group form-control textarea" rows="8" name="message" placeholder="What do you want to Ask..?" required="reqiured" style="margin-bottom:8px;resize:none;"></textarea>                        


                                    </div>

                                    <div class="form-group">
                                        <input type="submit" class="btn btn-default" onclick="return validateData()" value="Ask ?"/>
                                        <span class="form-login">For More Details Contact Us On +07670-265413</span>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </body>

<script>
    function managePopup()
    {
        var dv, sp;
        sp = document.getElementById("speq");
        dv = document.getElementById("dveq");
        var status = dv.style.display.trim();
        if (status == "none")
            dv.style.display = "block";
        else
            dv.style.display = "none";

    }</script>
            </html>