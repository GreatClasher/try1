<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/jquery-3.4.1.min.js" type="text/javascript"></script>

        <title>UserZone-Imtehaan</title>
        <%@include file="UserLinks.html"%>
        <style>
            .rating{
                width:25px;
                height:25px;
                cursor: pointer;
            }
        </style>
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
        <script>
            $(document).ready(function () {
                $(".rating").click(function () {
                    var star = $(this).attr("data-star");
                    $(".rating").each(function (x) {
                        if (x < star)
                            $(this).attr("src", "../images/ratingstar/st2.png");
                        else
                            $(this).attr("src", "../images/ratingstar/st1.png");
                    });
                    $("#star").val(star);
                });

                //to save reveiw or feedback by using ajax
                $("#btnsave").click(function () {
                    topic = $("#topic").val();
                    message = $("#message").val();
                    starrating = $("#star").val();
                    var mydata = {ftopic: topic, fmessage: message, fstar: starrating};
                    $.get("savefeedback.jsp", mydata, function (res) {
                        $("#topic").val("");
                        $("#message").val("");
                        $(".rating").attr("src", "../images/ratingstar/st1.png");
                        alert(res);
                    });
                });
            });
        </script>
        <script type="text/javascript">
            //code for count down autosubmit.....
            function auto_submit()
            {
                window.setTimeout("document.myQp.submit()", 1200002);
                window.setTimeout(function () {
                    alert("Ooops! Time up..... ");
                }, 1200002);
            }
     // set minutes
            var mins = 20;

     // calculate the seconds (don't change this! unless time progresses at a different speed for you...)
            var secs = mins * 60;
            function countdown() {
                setTimeout('Decrement()', 1000);
            }
            function Decrement() {
                if (document.getElementById) {
                    minutes = document.getElementById("minutes");
                    seconds = document.getElementById("seconds");
                    // if less than a minute remaining
                    if (seconds < 59) {
                        seconds.value = secs;
                    } else {
                        minutes.value = getminutes();
                        seconds.value = getseconds();
                    }
                    secs--;
                    setTimeout('Decrement()', 1000);
                }
            }
            function getminutes() {
                // minutes is seconds divided by 60, rounded down
                mins = Math.floor(secs / 60);
                return mins;
            }
            function getseconds() {
                // take mins remaining (as seconds) away from total seconds remaining
                return secs - Math.round(mins * 60);
            }
        </script>
    </head>
    <body onload="auto_submit()">

        <div class="container-fluid">
            <%@include  file="uheader.jsp"%>
            <div class="row main" style="min-height: 650px;background-color:#FFF;">
                <div class='col-sm-2'></div>
                <div class="col-sm-8">
                    <form action="../result" method="post" name="myQp">  <h1 class="text-center" style="font-family:'Cinzel',serif;font-weight: bold;margin-top: 50px;margin-bottom: 20px;color:#00aa54;">MGCGV Examination.</h1>
                        <hr/>
                        <%                        DbManager dbm = new DbManager();
                            dbm.cmd = "Select * from qp";
                            ResultSet rs = dbm.DQL();
                            int count = 1;
                            while (rs.next()) {
                        %>
                        <label>QN.<%=count%>:<%= rs.getString(2)%></label><br><br>
                        <label>A.<input type="radio" name="<%=count%>" value="A"/><%= rs.getString(3)%></label><br>
                        <label> B.<input type="radio" name="<%=count%>" value="B"/><%= rs.getString(4)%></label><br>
                        <label> C.<input type="radio" name="<%=count%>" value="C"/><%= rs.getString(5)%></label><br>
                        <label>D.<input type="radio" name="<%=count%>" value="D"/><%= rs.getString(6)%></label><br><BR><BR>
                            <%count++;
                                }
                            %>
                        <input type="submit" value="Submit" class="btn btn-success" style="margin-top: 40px;margin-bottom: 100px;font-size: 20px;width:200px;border:0px;background-color:#00aa54;color:white;font-family: 'Cinzel',serif;margin-left: 600px;"/>
                    </form>
                    <script>
                        countdown();
                    </script>
                </div>
                <div class="col-sm-2" style="justify-content: center;">
                    <span id="timer">
                        <input id="minutes"type="text" style="width: 35px; height:35px; border: none; font-size:30px;"><span style="font-size:40px;">:</span><input id="seconds" type="text" style="width: 35px; border: none; background-color:none; font-size:30px;">
                    </span>
                </div>
            </div>
            <%@include file="UserFooter.html"%>
        </div>

        <div id="dveq" style=" display: none;background: #43C6AC;  /* fallback for old browsers */
             background: -webkit-linear-gradient(to right, #191654, #43C6AC);  /* Chrome 10-25, Safari 5.1-6 */
             background: linear-gradient(to right, #191654, #43C6AC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
             ;width:500px;height: 450px;position:fixed;top:120px;
             left:350px;border-radius:10px;float:left;padding:8px;">

            <p class="text-center" style="font-weight: bold;margin-top:20px; font-size:30px;margin-bottom: 20px;font-family: 'Cinzel',serif;color:white;" >
                Before You Go..</p>
            <p class="text-center" style="margin-top:20px; font-size:26px;margin-bottom: 20px;font-family: 'Almendra SC',serif;color:white;" >
                Please Enter Your FEEDBACK</p>
            <input id="topic" type="text" class="form-control" name="topic" placeholder="Enter your topic" style="margin-bottom:8px;background-color: #FFFFFF;color:#09243f;"/>
            <textarea id="message" class="form-control" rows="4" name="message" placeholder="Enter Your Feedback Message.."style="margin-bottom:8px;resize:none;background-color: #FFFFFF;color:#09243f;"></textarea>
            <p<p class="text-center" style="margin-top:20px; font-size:16px;margin-bottom: 20px;font-family: 'Almendra SC',serif;color:white;" >
                ..We would Love to Know..How was your Experience with Imtehaan..</p>
            <div class="dvstar" style="margin-bottom:8px;resize:none;justify-content: center;margin-bottom: 20px;">
                <img data-star="1" class="rating" src="../images/ratingstar/st1.png"/>
                <img data-star="2" class="rating" src="../images/ratingstar/st1.png"/>
                <img data-star="3" class="rating" src="../images/ratingstar/st1.png"/>
                <img data-star="4" class="rating" src="../images/ratingstar/st1.png"/>
                <img data-star="5" class="rating" src="../images/ratingstar/st1.png"/>
                <input type="hidden" id="star" name="star"/>
            </div>
            <input type="Submit" class="form-control" id="btnsave"value="Save Feedaback" style="margin-bottom: 8px;font-family: 'Cinzel',serif;COLOR:#09243f;font-size: 20PX;border:0px;background-color: white;"/>
        </div>

    </body>
</html>
