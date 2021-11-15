<%@page import="DBman.DbManager"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <%@include file="UserLinks.html"%>
</head>
<body class="pa">
    <%! String picpath,uname;%>
    <% 
            if(session.getAttribute("UserId")==null)
            {out.print("<script>alert('Sorry! you are not authorized to access this Website.');"
                    + "window.location.href='../Login.jsp';</script>");
            }
            DbManager dm=new DbManager();
            String uid =session.getAttribute("UserId").toString();
            String []ar=dm.getNameAndPhoto(uid);
            uname=ar[0];
            picpath=ar[1];
            %>
           
    <div class="container-fluid" style="padding: 0px;">
    <div class="row" style="min-height: 100px;">
        <div class="col-sm-12">
<nav class="navbar navbar-fixed-top" style='background-color:#00aa54;'>
  <div class="container-fluid">
      <div class="row">
          <div class="col-sm-4">
               <img src="../images/userzoneimg/logouser.jpeg" alt="" style="max-height: 100px; max-width:250px;"/>
    </div>
     
          <div class="col-sm-7">
      <div class=" nav navbar-nav navbar-right">
       
 <a  href="LogOut.jsp" style="color:#FFFFFF; text-decoration: none;margin-right:40px;font-weight: bold;font-family: 'Cinzel',serif;"><i class="fa fa-unlock-alt" style="font-size:30px;margin-top:40px;"></i>&nbsp;LOGOUT</a>       
 <span  id="speq" class="btn btn-info" style="background-color:#00aa54;height:45px;border:0px;text-align: center;
        margin-right:40px; " onclick="managePopup()"><i class="fa fa-star-o" style="font-size:30px;font-weight: bold;background-color:#00aa54;
                              color:white;"></i></span>
           
            
 
      </div>
    </div>
          <div class="col-sm-1">
           <img id="upic" src="../Userpics/<%=picpath %>" alt="" title="User Picture" style="width:100%;max-height:80px;padding-top: 10px;border-radius: 50%"/>
                <br>
                <span style="color:white;font-family:'EB Garamond',serif;font-size: 12px;"><%=uname %></span>   
          </div>
      </div>
  </div>
</nav>
        </div>
    </div>
        <!--<div class="row flash" style="min-height:150px;background-color: #007bff;color:white;">
            <div class="col-sm-10" style="padding: 0px;margin:0px"> 
                <embed src="../images/banner.swf" width="100%" height="100%"><embed>
            </div>
            <div class="col-sm-2 pic" >
                <img id="upic" src="../Userpics/<!--%=picpath %>" alt="" title="User Picture" style="width:100%;max-height: 150px;padding-top: 10px;border-radius: 50%"/>
                <br>
                <span><!--%=uname %></span>
            </div>
        </div>
        </div>-->

</body>
</html> 
