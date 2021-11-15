<% 
            if(session.getAttribute("adminid")==null)
            {out.print("<script>alert('Sorry! you are not authorized to access this Website.');"
                    + "window.location.href='AdminLogin.jsp';</script>");
            }
            %>
<style>
    .sidenav {
        width:0px;
        height: 100%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
        background-color:#164f84;
        overflow-x: hidden;
        transition: 0.5s;
        padding-top: 60px;
    }

    .sidenav a{
        font-family: 'Cinzel', serif;
        padding: 40px 8px 8px 12px;
        text-decoration: none;
        font-size: 14px;
        font-weight: bold;
        color: #FFF;
        display: block;
        border-bottom: 2px solid white;
        transition: 0.7s;
    }

    .sidenav a:hover {
        color: #164f84;
        background-color: #fff;
        border-bottom-color: #164f84;
    }

    .sidenav .closebtn {
        position: absolute;
        top: 55px;
        right: 10px;
        font-size: 26px;
         border-bottom: 0px;
       
    }
    .sidenav .closebtn:hover {
       color: #fff; 
       background-color: #164f84;
    }
    @media screen and (max-height: 450px) {
        .sidenav {padding-top: 10px;}
        .sidenav a {font-size: 18px;}
    }
</style>

<div class="container-fluid" style="padding: 0px;">
    <div class="row" style="min-height: 50px;">
        <div class="col-sm-12">
            <nav class="navbar navbar-fixed-top" style="background-color: #FFF;border-bottom:4px solid #164f84;">
  <div class="col-sm-1">
     
    <ul class="nav navbar-nav " >
      <li class="active"><span style="font-size:40px;cursor:pointer;color:#164f84;" onclick="openNav()">&#9776; </span></li>      
    </ul>
  </div> 
 <div class="col-sm-8"></div>
 
        <div class="col-sm-3"><img src="../images/admin/adlogo.jpeg" alt="" width="200px"  height="80px" style="margin-left:80px;"/></div>
                
</nav>
        </div>
        
    </div>
</div>
<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="upload.jsp">Upload Question Paper</a>
    <a href="res.jsp">Result Management</a>
    <a href="ManageEnquiry.jsp">Manage Enquiry</a>
    <a href="ManageNotification.jsp">News & Updates</a>
    <a href="ManageFeedback.jsp">Feedback Management</a>
    <a href="SendSMS.jsp">Send SMS</a>
    <a href="CandidateProfile.jsp">Candidate Profile <br>Management</a>
    <a href="ChangePassword.jsp">Change Password?</a>
    <a href="AdminLogout.jsp">Log Out</a>

</div>            
<!--nav bar opening-->
<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "300px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }
</script>   
