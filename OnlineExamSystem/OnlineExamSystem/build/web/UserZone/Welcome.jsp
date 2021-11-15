<%-- 
    Document   : Welcome
    Created on : Aug 3, 2019, 7:48:24 PM
    Author     : DELL
--%>

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
            .l{
                font-family: serif;
                line-height: 20px;
                font-size: 20px;
                margin: 20px;
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
            $(document).ready(function() {
            $(".rating").click(function (){
            var star = $(this).attr("data-star");
            $(".rating").each(function(x){
            if (x<star)
                    $(this).attr("src", "../images/ratingstar/st2.png");
            else
                    $(this).attr("src", "../images/ratingstar/st1.png");
            });
            $("#star").val(star);
            });
           
            //to save reveiw or feedback by using ajax
            $("#btnsave").click(function(){
            topic= $("#topic").val();
            message= $("#message").val();
            starrating= $("#star").val();
            var mydata={ftopic:topic,fmessage:message,fstar:starrating};
    $.get("savefeedback.jsp",mydata,function(res){
        $("#topic").val("");
        $("#message").val("");
        $(".rating").attr("src","../images/ratingstar/st1.png");
       alert(res); 
    });        
    });
});
   </script>
    </head>
    <body> 
        <div class="container-fluid">
            <%@include  file="uheader.jsp"%>
        <div class="row main" style="min-height:600px;background-color:#FFF;">
            <div class='col-sm-2'></div>
            <div class="col-sm-8" style="font-family:'Cinzel',serif;" >
                <h1 class="text-center"style="font-family:'Cinzel',serif;font-weight: bold;margin-top: 50px;margin-bottom: 20px;color:#00aa54;">Terms and Conditions.</h1>
                <hr/>
                <label class="l">1.Don't turn off your Wi-Fi during Examination.</label><br>
                <label class="l">2.Every Question is Compulsary and each contains of 4 Marks.</label><br>
                <label class="l">3.You cannot change any answer after attempting it once.</label><br>
                <label class="l">4.Total time given is of 3 Hrs.</label><br>
                <label class="l">5.You are not allowed to use any Electronic Device in the exam.</label><br>
                                <form style='text-align:center' action="exam.jsp">
                                    <label><input type='checkbox' required="true" style="font-family:sans-serif;line-height: 25px;"/>I,accept all the following above given Terms & Conditions.</label>
                                    <br> <input type='submit' value='Submit' class="btn btn-success" style="margin-top: 20px;font-size: 20px;width:200px;border:0px;background-color:#00aa54;color:white;"/>
                                </form>
            </div>
            <div class="col-sm-2"></div>
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
            <input id="topic" type="text" class="form-control" name="topic" placeholder="Enter your topic" required="true" style="margin-bottom:8px;background-color: #FFFFFF;color:#09243f;"/>
            <textarea id="message" class="form-control" rows="4" name="message" placeholder="Enter Your Feedback Message.." required="true" style="margin-bottom:8px;resize:none;background-color: #FFFFFF;color:#09243f;"></textarea>
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
            <input type="Submit" class="form-control" id="btnsave"value="Save Feedaback" style="margin-bottom:8px;font-family: 'Cinzel',serif;COLOR:#09243f;font-size: 20PX;border:0px;background-color: white;"/>
        </div>

    </body>
</html>
