<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            response.setHeader("Pragma","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setHeader("Expires","0");
            response.setDateHeader("Expires",-1);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="logo.jpg">
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
                width:100%; 
                color:white; 
                font-size:30px;
                position: fixed;
                top:0%;
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
                width:19%;
                top:12%;
                position:fixed; 
                float:left;
                padding:10px;
                height:570px;
                background-color: #7c00d4;
            }
            
            .tabcontent{
                display:none;
                position:fixed;
                top:12%;
                left:25%;
                width:69%;
                float:left;
                padding:10px;
                height:570px;
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
            .tab button{
                word-break: break-word;
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
            .tab button:hover,.tab button:active{
                background-color:#62278b;
            }
            .menu1{
                overflow-y:scroll;
                height:450px;
            }
            .chartBox {
                width: 700px;
                padding: 20px;
                border-radius: 20px;
                border: solid 3px rgba(255, 26, 104, 1);
                background: white;
            }
            .tabcontent1{
                display:none;
            }
            .tablestyle {
                width:90%; 
                margin-left:auto;
                margin-right:auto;
            }
            .tablestyle th{
                font-size: 25px;
                text-align: right;
            }
            .tablestyle input{
                width:100%;
                font-size:20px;
            }
            .range{
                width:400px;
                height:15px;
                -webkit-appearance:none;
                background:purple;
                outline:none;
                border-radius:15px;
                overflow:hidden;
                box-shadow:inset 0 0 5px rgba(0,0,0,1);
            }
            .range::-webkit-slider-thumb
            {
            -webkit-appearance:none;
            width:15px;
            height:15px;
            border-radius:50%;
            background:#00fd0a;
            border:4px solid #00fd0a;
            box-shadow: -407px 0 0 400px #00fd0a;
            }
        </style>
    </head>
    <body>
    <%
    try{    
    
        Connection con = (Connection)session.getAttribute("connection");
        Statement stm = con.createStatement();
        ResultSet rs = null;
        Statement stm1 = con.createStatement();
        ResultSet rs1 = null;
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
            <h1 align="center"><span class="history">Project History</span></h1>
            <br><br>
            <div class="menu1"> 
            <%
            if(udesi.equals("pm_id"))
            {
            %>
            <div class="tab" style="text-align: center;">
                <button onclick="location.href='createproject.jsp'">Create Project</button>
            </div>    
            <%
            }
            int countp=0;
            int[] pids = new int[50];
            rs=stm.executeQuery("select distinct(pid),pname from plist where "+udesi+" like '%"+uid+"%'");
            if(rs.next())
            {
            do{    
            %>
            <div class="tab" style="text-align: center;">
                <button class="tablinks" onclick="opentarget(event,'<%=rs.getString("pid")%>')"><%=rs.getString("pname")%></button>
            </div>
            <%
            pids[countp]=Integer.parseInt(rs.getString("pid"));
            countp++;
            }while(rs.next());
            }
            else
            {
            %>
            <p align="center">No Project History</p>
            <%
            }
            %>
            </div>
        </div>
        <div id="default" class="tabcontent">
            <h1>PROFILE</h1>
            <br><Br>
            <%
            rs=stm.executeQuery("select * from empl where empid='"+uid+"'");
            while(rs.next())
            {
            %>
            <div id="profile_view" class="tabcontent1">
                <table class="tablestyle" border="2" cellspacing="10" cellpadding="5">
                    <tr>
                        <%
                        String filename="profile.png";
                        if(rs.getString("photo")!=null)
                        {
                        filename=rs.getString("photo");
                        }
                        %>    
                        <td rowspan="7" style="width:35%;" align="center">
                            <img src="<%=filename%>" width="90%" height="300px"/>
                        </td>
                        <th style="width:30%;">First Name  </th>
                        <td style="width:35%;"><input type="text" value='<%=rs.getString("fname")%>' readonly/></td>
                    </tr>
                    <tr>
                        <th>Last Name  </th>
                        <td><input type="text" value='<%=rs.getString("lname")%>' readonly/></td>
                    </tr>
                    <tr>
                        <th>Date of Birth  </th>
                        <td><input type="date" value='<%=rs.getString("dob")%>' readonly/></td>
                    </tr>
                    <tr>
                        <th>EMP ID  </th>
                        <td><input type="text" value='<%=rs.getString("empid")%>' readonly/></td>
                    </tr>
                    <tr>
                        <th>Email ID  </th>
                        <td><input type="email" value='<%=rs.getString("email")%>' readonly/></td>
                    </tr>
                    <tr>
                        <th>Phone No  </th>
                        <td><input type="text" value='<%=rs.getString("phone")%>' readonly/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <center>
                            <div class="tab">
                                <button style="width:40%;" class="tablinks1" onclick="opentab1(event,'profile_edit')">Edit</button>
                            </div>
                            </center>
                        </td>
                    </tr>
                </table>
                
            </div>
            <div id="profile_edit" class="tabcontent1">
                <form name="form2" id="form2" method="post" action="editdetails.jsp" onsubmit="return validation()"></form>
                <table class="tablestyle" border="2" cellspacing="10" cellpadding="5">
                    <tr>
                        <td rowspan="7" style="width:35%;" align="center">
                            <%
                            filename="profile.png";
                            if(rs.getString("photo")!=null)
                            {
                                filename=rs.getString("photo");
                            }
                            %>    
                            <img src="<%=filename%>" width="90%" height="300px"/>
                            <div id="view1" class="tab">
                                <button id="view1" style="padding:10px;width:60%;" onclick="edit()">Change</button>
                            </div>
                            <div id="view2" class="tab">
                                <form id="form1" action="FileUploadServlet" method="post" enctype="multipart/form-data">
                                </form>
                                <input form="form1" type="file" name="photo" style="width:80%;"/>
                                <button style="padding:7px;width:30%;" onclick="edit1()">Back</button>
                                <button form="form1" style="padding:7px;width:40%;">Update</button>
                            </div>
                        </td>
                        <th style="width:30%;">First Name  </th>
                        <td style="width:35%;"><input form="form2" type="text" value='<%=rs.getString("fname")%>' name="fname" required/></td>
                    </tr>
                    <tr>
                        <th>Last Name  </th>
                        <td><input form="form2" type="text" value='<%=rs.getString("lname")%>' name="lname" required/></td>
                    </tr>
                    <tr>
                        <th>Date of Birth  </th>
                        <td><input form="form2" type="date" value='<%=rs.getString("dob")%>' name="dob" required/></td>
                    </tr>
                    <tr>
                        <th>EMP ID  </th>
                        <td><input form="form2" type="text" value='<%=rs.getString("empid")%>' name="empid" readonly/></td>
                    </tr>
                    <tr>
                        <th>Email ID  </th>
                        <td><input form="form2" type="email" value='<%=rs.getString("email")%>' name="email" required/></td>
                    </tr>
                    <tr>
                        <th>Phone No  </th>
                        <td><input form="form2" type="text" value='<%=rs.getString("phone")%>' name="phone" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div style="float:left;" class="tab">
                                <button style="width:100%;" class="tablinks1" onclick="opentab1(event,'profile_view')">Back</button>
                            </div>
                            <div style="float:right;" class="tab">
                                <button form="form2" style="width:90%;">Update</button>
                            </div>
                        </td>`
                    </tr>
                </table>
            </div>
            <%
            }
            %>
        </div>   
        
        <%
        
        for(int i=0;i<countp;i++)
        {
            int countu=0;
            String[] uids = new String[50];
            String[] unames = new String[50];
            String[] roles = new String[50];
            rs=stm.executeQuery("select distinct(m_id),fname,lname from plist inner join empl on m_id=empid where plist.pid ='"+pids[i]+"'");
            while(rs.next())
            {
                uids[countu]=rs.getString("m_id").trim();
                unames[countu]=(rs.getString("fname")+" "+rs.getString("lname")).trim();
                countu++;
            }
            for(int j=0;j<countu;j++)
            {
                roles[j]="";
                rs=stm.executeQuery("select * from plist where pid ='"+pids[i]+"'and m_id='"+uids[j]+"'");
                int count=0;
                while(rs.next())
                {
                    if(count==0) roles[j]=rs.getString("roles");
                    else roles[j]+=", "+rs.getString("roles");
                    count++;
                }
            }
            rs=stm.executeQuery("select distinct(plist.pid),pname,pdetails.description,ps_date,pe_date,rs_date,re_date,ds_date,de_date,is_date,ie_date,ts_date,te_date,SDP from plist inner join pdetails on plist.pid=pdetails.pid where plist.pid ='"+pids[i]+"'");
            while(rs.next())
            {
            %>
            <div id="<%=rs.getString("plist.pid")%>" class="tabcontent">
                <h1><%=rs.getString("plist.pname")%> Description</h1>
                <br><Br>
                <P><%=rs.getString("pdetails.description")%></p>
                <br>
                <h2>Roles</h2>
                <table cellspacing="10" style="width:70%;">
                    <%
                    for(int j=0;j<countu;j++)
                    {
                    %>
                    <tr>
                        <td style="width:30%;">
                            <ul>
                                <li><%=uids[j]%> - <%=unames[j]%></li>
                            </ul>
                        </td>
                        <td style="width:40%;"><%=roles[j]%></td>
                    </tr>
                    <%
                    }
                    %>
                </table>
                <br>
                <h2>Completion Status</h2>
                <br>
                <%
                int percent = 0;
                if(rs.getString("SDP")!=null) percent+=10;
                rs1=stm1.executeQuery("select distinct(roles),dstatus from plist where pid='"+rs.getString("plist.pid")+"'");
                while(rs1.next())
                {
                    if(rs1.getString("roles").equals("Requirements Gathering") && rs1.getString("dstatus").equals("COMPLETED")) percent+=20;
                    else if(rs1.getString("roles").equals("Design") && rs1.getString("dstatus").equals("COMPLETED")) percent+=20;
                    else if(rs1.getString("roles").equals("Implementation") && rs1.getString("dstatus").equals("COMPLETED")) percent+=30;
                    else if(rs1.getString("roles").equals("Testing") && rs1.getString("dstatus").equals("COMPLETED")) percent+=20;
                }
                %>
                <input class="range" type="range" value="<%=percent%>" min="0" max="100" onmousedown="return false">&ensp;&ensp;&ensp;&ensp;<span style="font-weight:bolder;font-size:20px; "><%=percent%>%</span>
                <br>
                <div style="float:left;width:50%;" class="tab">
                    <button class="tablinks" style="float:right;width:40%; padding:10px;" onclick="opentab(event,'gantt_<%=i%>')" >Gantt Chart</button>
                </div>
                <form name="form3<%=i%>" id="form3<%=i%>" method="post" action="projectview.jsp">
                    <input form="form3<%=i%>" type="hidden" id="pid<%=i%>" name="pid" value=""/>
                </form>
                <div style="float:left;width:50%;"; class="tab">
                    <button style="float:left; width:40%; padding:10px;" onclick="submit1('<%=rs.getString("plist.pid")%>','<%=i%>')" >Open</button>
                </div>
            </div>
            <div class="tabcontent" id="gantt_<%=i%>">   
                <input type="hidden" id="psdate<%=i%>" value="<%=rs.getString("ps_date")%>"/>
                <input type="hidden" id="pedate<%=i%>" value="<%=rs.getString("pe_date")%>"/>
                <input type="hidden" id="rsdate<%=i%>" value="<%=rs.getString("rs_date")%>"/>
                <input type="hidden" id="redate<%=i%>" value="<%=rs.getString("re_date")%>"/>
                <input type="hidden" id="dsdate<%=i%>" value="<%=rs.getString("ds_date")%>"/>
                <input type="hidden" id="dedate<%=i%>" value="<%=rs.getString("de_date")%>"/>
                <input type="hidden" id="isdate<%=i%>" value="<%=rs.getString("is_date")%>"/>
                <input type="hidden" id="iedate<%=i%>" value="<%=rs.getString("ie_date")%>"/>
                <input type="hidden" id="tsdate<%=i%>" value="<%=rs.getString("ts_date")%>"/>
                <input type="hidden" id="tedate<%=i%>" value="<%=rs.getString("te_date")%>"/>
                <h2><span class="history">GANTT CHART</span></h2>
                <br><br><br><br>
                <center>
                    <div class="chartBox">
                        <canvas id="myChart<%=i%>"></canvas>
                    </div>
                </center>    
            </div>    
            <%
            }
        }
        %>
        
    <%
    }
    catch(Exception e)
    {
        %><%=e.getMessage()%><%
    }
    %>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
    <script>
        if(document.getElementById('defaultclick'))
            document.getElementById('defaultclick').click();
        document.getElementById('default').style.display="block";
        document.getElementById('profile_view').style.display="block";
        document.getElementById('view2').style.display="none";
        function edit()
        {
            document.getElementById('view1').style.display="none";
            document.getElementById('view2').style.display="block";
        }
        function edit1()
        {
            document.getElementById('view2').style.display="none";
            document.getElementById('view1').style.display="block";
        }
        function validation()
        {
            if(isNaN(document.form2.phone.value))
            {
               document.form2.phone.focus();
               alert("Phone Number Should Contain 10 Numberic Digits Only");
               return false;
            }
            if(document.form2.phone.value.length!==10)
            {
               document.form2.phone.focus();
               alert("Phone Number Should Contain 10 Numberic Digits Only");
               return false;
            }
            return true;
        }
        function submit1(no,n)
        {
            document.getElementById('pid'+n).value=no;
            document.getElementById('form3'+n).submit();
        }
        function opentarget(evt, operator) 
        {
            let i, tabcontent, tablinks;
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
        function opentab1(evt, operator) 
        {
            let i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent1");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks1");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace("active", "");
            }
            document.getElementById(operator).style.display = "block";
            evt.currentTarget.className += " active";
        }
        function returndate(date1,days)
            {
                var dates = [];
                var date = new Date(date1);
                date.setDate(parseInt(date.getDate()) + parseInt(days));
                dates.push(date.getFullYear());
                if(parseInt(date.getMonth())+1>9)
                    dates.push(parseInt(date.getMonth())+parseInt(1));
                else
                    dates.push("0"+parseInt((date.getMonth())+parseInt(1)));
                if(date.getDate()>9)
                    dates.push(date.getDate());
                else
                    dates.push("0"+date.getDate());
                return dates.join("-");
            }
        function opentab(evt, operator) 
        {
            var n = "";
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
            let str = operator.split("_");
            n=str[1];
            
            const data = {
                labels: ['Project Plan', 'Requirements', 'Design', 'Development', 'Testing'],
                datasets: [{
                    label: 'Gantt Chart',
                    data: [
                        [document.getElementById('psdate'+n).value,returndate(document.getElementById('pedate'+n).value,1)],
                        [document.getElementById('rsdate'+n).value,returndate(document.getElementById('redate'+n).value,1)],
                        [document.getElementById('dsdate'+n).value,returndate(document.getElementById('dedate'+n).value,1)],
                        [document.getElementById('isdate'+n).value,returndate(document.getElementById('iedate'+n).value,1)],
                        [document.getElementById('tsdate'+n).value,returndate(document.getElementById('tedate'+n).value,1)]
                    ],
                    backgroundColor: [
                        'rgba(255, 26, 104, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(0, 0, 0, 1)'
                    ],
                    borderColor: [
                        'rgba(255, 26, 104, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(0, 0, 0, 1)'
                    ],
                    barPercentage:0.2
                }]
            };

          // config 
            const config = {
                type: 'bar',
                data,
                options: {
                    indexAxis:'y',
                    scales: {
                        x:{
                            min:document.getElementById('psdate'+n).value,
                            type:'time',
                            time: {
                                unit: 'day'
                            }
                        },
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            };

          // render init block
            const myChart = new Chart(document.getElementById('myChart'+n),config);
        }
    </script>    
    </body>
</html>

