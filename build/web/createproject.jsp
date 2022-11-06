<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="logo.jpg">
        <link rel="stylesheet" href="drop_drag.css">
        <title>PDMS</title>
        <style>
            *{
                margin:0px;
                box-sizing: border-box;
            }
            body{
                font-family: arial;
                background-color: #d0cfd1;
            }
            .header{ 
                top:0%;
                width:100%; 
                color:white; 
                position:fixed; 
                font-size:30px;
                background-color: #7c00d4;
                font-family: timesnewroman; 
                padding:10px 30px 10px 10px;
            }
            .img_style{
                width:35px;
                float:left;
                height:35px;
                margin-right: 10px;
            }
            .menu{
                top:12%;
                width:19%;
                float:left;
                position: fixed;
                padding:10px;
                height:570px;
                background-color: #7c00d4;
            }
            
            .tabcontent{
                top:12%;
                left:25%;
                width:71%;
                float:left;
                display:none;
                padding:20px;
                height:570px;
                position:fixed;
                overflow-y:scroll; 
                word-break: break-word;
                background-color: #7c00d4;
            }
            .history{
                text-align:center;
                border:none;
                border-top:1px solid black; 
                border-top-style: double;
                border-bottom:1px solid black;
                border-bottom-style: double;
                
            }
            .tab button,.tab input[type=submit]{
                border-radius: 10px;
                text-align:center;
                background-color: #2d1240;
                color:white;               
                font-size: 20px;
                font-weight: bolder;
                padding:20px;
                margin:10px;
                width:80%;
                cursor:pointer;
            }
            .tab button:hover,.tab button:active,.tab input[type=submit]:hover,.tab input[type=submit]:active{
                background-color:#62278b;
            }
            .menu1{
                overflow-y:scroll;
            }
            .inputstyle{
                width:90%;
                height:8%;
                font-size:30px;
                font-weight: lighter;
            }
            .selectstyle{
                width:90%;
                font-size:20px;
                font-weight: lighter;
            }
            textarea {
                resize: none;
            }
            
        </style>
    </head>
    <body>
    <%
    try{    
    
        Connection con = (Connection)session.getAttribute("connection");
        Statement stm = con.createStatement();
        ResultSet rs = null;
        String uid = (String)session.getAttribute("uid");
        String uname = (String)session.getAttribute("uname");
        String udesi = (String)session.getAttribute("udesi");
        %>
        <div class="header">
            <table style="width:100%;">
                <tr>
                    <td align="left">
                        <img src="logo.jpg" class="img_style" alt="no image">
                        <div style="margin-top:3px; float:left; font-size:25px; ">PROJECT DOCUMENT MANAGEMENT SYSTEM</div>
                        <a href="team_dashboard.jsp">
                            <img class="img_style" style="margin-left: 10px" src="home.jpg" alt="no image">
                        </a>
                    </td>
                    <td align="right">
                        <a href='logout.jsp'>
                            <img class="img_style" src="profile.png" alt="no image">
                        </a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="menu">
            <div class="tab">
                <button class="tablinks" onclick="opentab(event,'title')">Project Title</button>
            </div>
            <div class="tab">
                <button class="tablinks" onclick="opentab(event,'roles')">Roles Assigning</button>
            </div>
            <div class="tab">
                <button class="tablinks" onclick="opentab(event,'brs')">Budget<br>Resource<br>Scheduling</button>
            </div>
            <form id="form1" name="form1" method="post" action="validation.jsp" onsubmit="return validation()">
                <div class="tab">
                    <input type="submit" value="Submit"/>
                </div>
            </form>
        </div>
        <div id="title" class="tabcontent" style='padding-left:30px;'>
            <h1>Project Title</h1>
            <input form="form1" type='text' name='title' class='inputstyle'/>
            <br><br><br>
            <h1>Project Description</h1>
            <textarea form="form1" rows='13' cols='70' name='desc' width='90%' height='60%' style="font-size:20px;"></textarea>
            <div class="tab">
                <button style="width:17%;padding:10px;float:right;" class="tablinks" onclick="opentab(event,'roles')">Next</button>
            </div>
        </div>
        <div id="roles" class="tabcontent">
            <table class='center' style='width:90%;' cellpadding='20'>
                <tr>
                    <td align='right'><h1>Requirements</h1></td>
                    <td>
                        <select form="form1" name='rid' class='selectstyle' size="3" multiple>
                            <optgroup label="Select the member/members">
                            <%
                            rs=stm.executeQuery("select * from empl where desi!='Project Manager'");
                            while(rs.next())
                            {
                            %>
                                <option value='<%=rs.getString("empid")%>'><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                            <%
                            }
                            %>
                            </optgroup>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align='right'><h1>Design</h1></td>
                    <td>
                        <select form="form1" name='did' class='selectstyle' size="3" multiple>
                            <optgroup label="Select the member/members">
                            <%
                            rs=stm.executeQuery("select * from empl where desi!='Project Manager'");
                            while(rs.next())
                            {
                            %>
                                <option value='<%=rs.getString("empid")%>'><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                            <%
                            }
                            %>
                            </optgroup>
                        </select>
                    </td>
                </tr>
                <tr>    
                    <td align='right'><h1>Implementation</h1></td>
                    <td>
                        <select form="form1" name='iid' class='selectstyle' size="3" multiple>
                            <optgroup label="Select the member/members">
                            <%
                            rs=stm.executeQuery("select * from empl where desi!='Project Manager'");
                            while(rs.next())
                            {
                            %>
                                <option value='<%=rs.getString("empid")%>'><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                            <%
                            }
                            %>
                            </optgroup>
                        </select>
                    </td>
                </tr>
                <tr>    
                    <td align='right'><h1>Testing</h1></td>
                    <td>
                        <select form="form1" name='tid' class='selectstyle' size="3" multiple>
                            <optgroup label="Select the member/members">
                            <%
                            rs=stm.executeQuery("select * from empl where desi!='Project Manager'");
                            while(rs.next())
                            {
                            %>
                                <option value='<%=rs.getString("empid")%>'><%=rs.getString("empid")+" - "+rs.getString("fname")+" "+rs.getString("lname")%></option>
                            <%
                            }
                            %>
                            </optgroup>
                        </select>
                    </td>
            </table>
            <div class="tab">
                <button style="width:17%;padding:10px;float:left;" class="tablinks" onclick="opentab(event,'title')">Prev</button>
            </div>
            <div class="tab">
                <button style="width:17%;padding:10px;float:right;" class="tablinks" onclick="opentab(event,'brs')">Next</button>
            </div>
        </div>
        <div id="brs" class="tabcontent">
            <table style='width:100%;'>
                <tr>
                    <td align='center' style=""><h1>Budget</h1></td>
                    <td><input form="form1" type="text" name="budget" id="budget" class="selectstyle" style="width:100%;"/></td>
                    <td align='center'><h1>Resource</h1></td>
                    <td><textarea form="form1" rows=3 cols=20 name="resource" class="selectstyle" style="width:90%;"></textarea></td>
                </tr>
                <tr>
                    <td colspan="4" align="left"><h1>Scheduling</h1></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
                <tr>
                    <td><h2>Start Date</h2></td>
                    <td><input form="form1" type="date" id="sdate" name="sdate" class="selectstyle" onchange="checkdate()"/></td>
                    <td><h2>End Date</h2></td>
                    <td><input form="form1" type="date" id="edate" name="edate" min="sdate" class="selectstyle" onchange="checkdate()"/></td>
                </tr>
                <tr>
                    <td><h2>Project Plan<br>Start Date</h2></td>
                    <td><input form="form1" type="date" id="psdate" name="psdate" class="selectstyle"/></td>
                    <td><h2>Project Plan<br>End Date</h2></td>
                    <td><input form="form1" type="date" id="pedate" name="pedate" min="psdate" class="selectstyle"/></td>
                </tr>
                <tr>
                    <td><h2>Requirements<br>Start Date</h2></td>
                    <td><input form="form1" type="date" id="rsdate" name="rsdate" class="selectstyle"/></td>
                    <td><h2>Requirements<br>End Date</h2></td>
                    <td><input form="form1" type="date" id="redate" value="2022-09-06" name="redate" min="rsdate" class="selectstyle"/></td>
                </tr>
                <tr>
                    <td><h2>Design<br>Start Date</h2></td>
                    <td><input form="form1" type="date" id="dsdate" name="dsdate" class="selectstyle"/></td>
                    <td><h2>Design<br>End Date</h2></td>
                    <td><input form="form1" type="date" id="dedate" name="dedate" min="rsdate" class="selectstyle"/></td>
                </tr>
                <tr>
                    <td><h2>Implementation<br>Start Date</h2></td>
                    <td><input form="form1" type="date" id="isdate" name="isdate" class="selectstyle"/></td>
                    <td><h2>Implementation<br>End Date</h2></td>
                    <td><input form="form1" type="date" id="iedate" name="iedate" min="rsdate" class="selectstyle"/></td>
                </tr>
                <tr>
                    <td><h2>Testing<br>Start Date</h2></td>
                    <td><input form="form1" type="date" id="tsdate" name="tsdate" class="selectstyle"/></td>
                    <td><h2>Testing<br>End Date</h2></td>
                    <td><input form="form1" type="date" id="tedate" name="tedate" min="rsdate" class="selectstyle"/></td>
                </tr>
            </table>
            <div class="tab">
                <button style="width:17%;padding:10px;float:left;" class="tablinks" onclick="opentab(event,'roles')">Prev</button>
            </div>
        </div>      
    <%
    }
    catch(Exception e)
    {
        %><%=e%><%
    }
    %>
        <script src="drop_drag.js"></script>
        <script>
            document.getElementById('title').style.display="block";
            function opentab(evt, operator) 
            {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace("active", "");
                }
                document.getElementById(operator).style.display = "block";
                evt.currentTarget.className += " active";
            }
            function validation()
            {
                if(document.form1.title.value.length<=0)
                {
                    opentab(event,'title');
                    document.form1.title.focus();
                    alert("Project Title Can't be Empty");
                    return false;
                }
                if(document.form1.desc.value.length<=0)
                {
                    opentab(event,'title');
                    document.form1.desc.focus();
                    alert("Project Description Can't be Empty");
                    return false;
                }
                if(document.form1.rid.selectedIndex == -1)
                {
                    opentab(event,'roles');
                    document.form1.rid.focus();
                    alert("Assign anyone for Requirement Gathering");
                    return false;
                }
                if(document.form1.did.selectedIndex == -1)
                {
                    opentab(event,'roles');
                    document.form1.did.focus();
                    alert("Assign anyone for Designing");
                    return false;
                }
                if(document.form1.iid.selectedIndex == -1)
                {
                    opentab(event,'roles');
                    document.form1.iid.focus();
                    alert("Assign anyone for Implementation");
                    return false;
                }
                if(document.form1.tid.selectedIndex == -1)
                {
                    opentab(event,'roles');
                    document.form1.tid.focus();
                    alert("Assign anyone for Testing");
                    return false;
                }
                if(document.form1.budget.value.length<=0)
                {
                    opentab(event,'brs');
                    document.form1.budget.focus();
                    alert("Budget Can't be Empty");
                    return false;
                }
                if(isNaN(document.form1.budget.value))
                {
                    opentab(event,'brs');
                    document.form1.budget.focus();
                    alert("Budget should contain only digits");
                    return false;
                }
                if(document.form1.resource.value.length<=0)
                {
                    opentab(event,'brs');
                    document.form1.resource.focus();
                    alert("Resource Can't be Empty");
                    return false;
                }
                if(document.form1.sdate.value.length<=0)
                {
                    opentab(event,'brs');
                    document.form1.sdate.focus();
                    alert("Start Date Can't be Empty");
                    return false;
                }
                if(document.form1.edate.value.length<=0)
                {
                    opentab(event,'brs');
                    document.form1.edate.focus();
                    alert("End Date Can't be Empty");
                    return false;
                }
            }
            function checkdate()
            {
                var start = document.getElementById("sdate").value;
                var end = document.getElementById("edate").value;
                if(start.length>0 && end.length>0)
                {
                    let date1 = new Date(start);
                    let date2 = new Date(end);
                    var duration = (date2-date1)/(1000*60*60*24) + 1;
                    if(duration<-1)
                    {
                        document.form1.edate.value="";
                        document.form1.edate.focus();
                        alert("End date can't be before Stsrt date");
                    }
                    else
                    {
                    var timing = [5,25,20,30,20];
                    var timing1 = [0,0,0,0,0];  
                    var total = 0;
                    for(let i=0;i<timing.length;i++)
                    {
                      timing1[i]= (timing[i]*duration/100).toFixed();
                      total+=parseInt(timing1[i]);
                    }
                    if(Math.abs(duration - total) !== 0)
                    {
                      timing1[timing.length - 1] = parseInt(timing1[timing.length - 1]) +  duration - total;
                    }
                    var dates = "";
                    document.getElementById('psdate').value=start;
                    dates = returndate(date1,timing1[0]-1);
                    document.getElementById('pedate').value=dates;
                    dates = returndate(date1,1);
                    document.getElementById('rsdate').value=dates;
                    dates = returndate(date1,timing1[1]-1);
                    document.getElementById('redate').value=dates;
                    dates = returndate(date1,1);
                    document.getElementById('dsdate').value=dates;
                    dates = returndate(date1,timing1[2]-1);
                    document.getElementById('dedate').value=dates;
                    dates = returndate(date1,1);
                    document.getElementById('isdate').value=dates;
                    dates = returndate(date1,timing1[3]-1);
                    document.getElementById('iedate').value=dates;
                    dates = returndate(date1,1);
                    document.getElementById('tsdate').value=dates;
                    dates = returndate(date1,timing1[4]-1);
                    document.getElementById('tedate').value=dates;
                    }
                }
            }
            function returndate(date,days)  
            {
                var dates = [];
                date.setDate(parseInt(date.getDate()) + parseInt(days));
                dates.push(date.getFullYear());
                if(parseInt(date.getMonth())+1>9)
                    dates.push(parseInt(date.getMonth())+1);
                else
                    dates.push("0"+(parseInt(date.getMonth())+parseInt(1)));
                if(date.getDate()>9)
                    dates.push(date.getDate());
                else
                    dates.push("0"+date.getDate());
                return dates.join("-");
            }
        </script>
    </body>
</html>

