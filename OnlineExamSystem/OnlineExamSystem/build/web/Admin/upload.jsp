<%-- 
    Document   : AdminHome
    Created on : Aug 7, 2019, 6:26:20 AM
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBman.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="AdminLink.html"%>
        <script>
            function validateData()
            {
                var que, A, B, C, D, status = true;
                var spq, spA, spB, spC, spD;
                que = document.getElementById("que").value.trim();
                A = document.getElementById("A").value.trim();
                B = document.getElementById("B").value.trim();
                C = document.getElementById("C").value.trim();
                D = document.getElementById("D").value.trim();
                spq = document.getElementById("spq");
                spA = document.getElementById("spA");
                spB = document.getElementById("spB");
                spC = document.getElementById("spC");
                spD = document.getElementById("spD");
                spq.innerHTML = "";
                spA.innerHTML = "";
                spB.innerHTML = "";
                spC.innerHTML = "";
                spD.innerHTML = "";
//to validate name....
                if (que.length == 0)
                {
                    spq.innerHTML = "Please enter the Question.";
                    status = false;
                }
//to validate option a
                if (A.length == 0)
                {
                    spA.innerHTML = "Please enter option A.";
                    status = false;
                }
//to validate option B
                if (B.length == 0)
                {
                    spB.innerHTML = "Please enter option B.";
                    status = false;
                }
//to validate option C
                if (C.length == 0)
                {
                    spC.innerHTML = "Please enter option C.";
                    status = false;
                }
//to validate option D
                if (D.length == 0)
                {
                    spD.innerHTML = "Please enter option D.";
                    status = false;
                }
                return status;
            }
        </SCRIPT>
        <!--validation end-->
    </head>
    <body>
        <div class="container-fluid">
 <%@include file="AdminHeader.jsp" %>  
            <div class="row" style="min-height: 600px;">
                <div class="col-sm-3"></div>
                <div class="col-sm-7">
                    <h1 class="text-center" style="color:#164f84;font-family: serif;margin-top: 100px;">Upload & Manage Question Paper.</h1>
                    <hr style="color:#164f84;"/>
                    <%

                        DbManager dbm = new DbManager();
                        int c = 1;
                        dbm.cmd = "Select * from qp";
                        ResultSet rs = dbm.DQL();
                        while (rs.next()) {%>

                    <label class="l">Question.<%=c%>:&nbsp;&nbsp;&nbsp;<%= rs.getString(2)%></label><BR>
                    <label class="l">A.&nbsp;&nbsp;&nbsp;<%= rs.getString(3)%></label><br>
                    <label class="l">B.&nbsp;&nbsp;&nbsp;<%= rs.getString(4)%></label><br>
                    <label class="l">C.&nbsp;&nbsp;&nbsp;<%= rs.getString(5)%></label><br>
                    <label class="l">D.&nbsp;&nbsp;&nbsp;<%= rs.getString(6)%></label><br>
                    <label class="l">Answer.&nbsp;&nbsp;&nbsp;<%= rs.getString(7)%></label><br>
                    <a href="../deleteq?qno=<%= rs.getString(1)%>" style="text-decoration: none;color:#164f84;font-size: 15px;">Delete this Question</a><br><br>

                    <% c++;
                        }
                    %>
                    <button class="btn btn-info"style="align:right;border:0px;background-color:#164f84;"><a href="../deleteqp" style="text-decoration: none;color:white;">Delete the Question Paper</a></button><br><br>

                    <h1 class="text-center" style="color:#164f84;font-family: serif;">Add New Question.</h1>
                    <hr/>
                    <form ACTION="../saveqp" method="post">
                        <label>Question: &nbsp;<textarea name="Q" id="que" style="width:600px"></textarea></label><BR>
                        <p class="text-left" id="spq" style="color:red;margin-left: 40px;"></p><BR>

                        <label>A: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea id="A" name="A" style="width:600px"></textarea></label>
                        <p class="text-left" id="spA" style="color:red;margin-left: 40px;"></p><BR>

                        <label>B: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea  id="B" name="B" style="width:600px"></textarea></label>
                        <p class="text-left" id="spB" style="color:red;margin-left: 40px;"></p><BR>

                        <label>C: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea id="C" name="C" style="width:600px"></textarea></label>
                        <p class="text-left" id="spC" style="color:red;margin-left: 40px;"></p><BR>

                        <label>D: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <textarea name="D" id="D" style="width:600px"></textarea></label>
                        <p class="text-left" id="spD" style="color:red;margin-left: 40px;"></p>
                        <BR><br>
                        <LABEL>ANSWER:&nbsp;&nbsp;</LABEL>
                        <LABEL><INPUT TYPE="radio" NAME="ANS" VALUE="A"/> A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</LABEL>
                        <LABEL><INPUT TYPE="radio" NAME="ANS" VALUE="B"/> B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</LABEL>
                        <LABEL><INPUT TYPE="radio" NAME="ANS" VALUE="C"/> C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</LABEL>
                        <LABEL><INPUT TYPE="radio" NAME="ANS" VALUE="D"/> D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</LABEL><br>
                        <center><input CLASS='btn btn-danger' style='width:200px;margin: 40px;' onclick="return validateData()" type="submit" value="save"/></center>
                    </form>
                </div>
                <div class="col-sm-2"></div>
            </div>
                    <%@include file="AdminFooter.html"%> 
        </div> 
    </body>
</html>
