<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <link rel="stylesheet" href="drop_drag.css">
        <script src="/scripts/snippet-javascript-console.min.js?v=1"></script>
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
                top:0%;
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
                width:29%;
                top:12%;
                position:fixed;
                float:left;
                padding:10px;
                height:570px;
                background-color: #7c00d4;
            }
            
            .tabcontent{
                width:64%;
                top:12%;
                left:33%;
                float:right;
                padding:10px;
                height:570px;
                position: fixed;
                overflow-y:scroll; 
                overflow-x:hidden;
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
            .chat{
                width:100%;
                height:480px;
                margin-top:20px;
                margin-left:auto;
                margin-right:auto;
                text-align:center;
                border-radius: 20px;
                background-color:white;
            }
            .btn{
                height:35px; 
                width:40px;
                border:none; 
                background-color:#0050b3; 
                border-top-right-radius:10px;
                border-bottom-right-radius:10px; 
            }
            .btn:HOVER {
                box-shadow: 0px 0px 3px 1px grey;
            }
            .chatinput{
                margin-top:4px; 
                font-size:15pt; 
                resize:none; 
                width:80%; 
                height:35px; 
                border-top-left-radius:10px;
                border-bottom-left-radius:10px;
            }
            .tableview{
                height:380px; 
                overflow-y:scroll;
            }
            .tableview td{
                word-break:break-word; 
            }
            .tab1{
                width:auto;
                height:auto;
                padding:5px;
                border-radius:10px; 
                background-color: lightblue;
            }
            .tab2 {
                overflow: hidden;
                width:100%;
                margin-left:auto;
                margin-right:auto;
                border:2px solid #62278b;
                border-bottom: none;
                border-top-right-radius:10px;
                border-top-left-radius:10px;
                background-color: #7c00d4;
              }
            .tab2 button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
                font-size: 17px;
                font-weight:bolder;
              }
            .tab2 button:hover {
                background-color: #62278b;
              }
            .tab2 button.active {
                background-color: #62278b;
              }
              .tabcontent2 {
                display: none;
                background-color: #7c00d4;
                border:2px solid #62278b;
                border-bottom-right-radius:10px;
                border-bottom-left-radius:10px;
                padding: 6px 12px;
                height:500px;
              }
              .tabcontent10 {
                display: none;
                background-color: #7c00d4;
                border:2px solid #62278b;
                border-bottom-right-radius:10px;
                border-bottom-left-radius:10px;
                padding: 6px 12px;
                height:285px;
              }
              .tabcontent11 {
                display: none;
                background-color: #7c00d4;
                border:2px solid #62278b;
                border-bottom-right-radius:10px;
                border-bottom-left-radius:10px;
                padding: 6px 12px;
                height:285px;
              }
              .tabcontent12 {
                display: none;
                background-color: #7c00d4;
                border:2px solid #62278b;
                border-bottom-right-radius:10px;
                border-bottom-left-radius:10px;
                padding: 6px 12px;
                height:285px;
              }
              .tabcontent13 {
                display: none;
                background-color: #7c00d4;
                border:2px solid #62278b;
                border-bottom-right-radius:10px;
                border-bottom-left-radius:10px;
                padding: 6px 12px;
                height:285px;
              }
              .tabcontent14 {
                display: none;
                background-color: #7c00d4;
                border:2px solid #62278b;
                border-bottom-right-radius:10px;
                border-bottom-left-radius:10px;
                padding: 6px 12px;
                height:285px;
              }
            .tabcontent3 {
                display: none;
                width:100%;
                margin-left:auto;
                margin-right:auto;
                background-color: #7c00d4;
                border:2px solid #62278b;
                border-bottom-right-radius:10px;
                border-bottom-left-radius:10px;
                padding: 6px 12px;
                height:545px;
              }
              
            label {
                cursor: pointer;
             }

            #imgInp,#imgInp0,#imgInp1,#imgInp2,#imgInp3 {
                opacity: 0;
                position: absolute;
                z-index: -1;
             }
             
            .button1 button{
                word-break: break-word;
                border-radius: 10px;
                text-align:center;
                background-color: #2d1240;
                color:white;               
                font-size: 12px;
                font-weight: bolder;
                padding:8px;
                margin:5px;
                width:35%;
                cursor:pointer;
                
            } 
            .text{
                word-break: break-word;
                font-size: 18px;
                font-weight: bolder;
            }
            .popup {
               position: relative;
               display: inline-block;
               cursor: pointer;
               -webkit-user-select: none;
               -moz-user-select: none;
               -ms-user-select: none;
             }

            .popup .popuptext {
               visibility: hidden;
               width: 160px;
               background-color: #555;
               color: #fff;
               text-align: center;
               border-radius: 6px;
               padding: 8px 5px;
               position: absolute;
               z-index: 1;
               top: 125%;
               left: 50%;
               margin-left: -80px;
             }

            .popup .popuptext::after {
               content: "";
               position: absolute;
               bottom: 100%;
               left: 50%;
               margin-left: -5px;
               border-width: 5px;
               border-style: solid;
               border-color: #555 transparent transparent transparent;
             }

            .popup .show {
               visibility: visible;
               -webkit-animation: fadeIn 1s;
               animation: fadeIn 1s;
             }
             .tab3{
                width:80%;
                margin-left: auto;
                margin-right: auto;
                text-align:center;
                border:2px solid purple;
                border-radius: 10px;
                background-color:#9047c4;
                
             }
            .tablestyle input{
                font-size:15pt;
            }
            @-webkit-keyframes fadeIn {
               from {opacity: 0;} 
               to {opacity: 1;}
             }
             a{
                 color:purple;
             }
            @keyframes fadeIn {
               from {opacity: 0;}
               to {opacity:1 ;}
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
        Statement stm2 = con.createStatement();
        ResultSet rs2 = null;
        String uid = (String)session.getAttribute("uid");
        String uname = (String)session.getAttribute("uname");
        String udesi = (String)session.getAttribute("udesi");
        String pid = request.getParameter("pid");
        String[] roles = new String[10];
        int count = 0;
        String role = "";
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
            <div style='width:100%;' class="tab2">
            <%
            if(udesi.equals("pm_id"))
            {
                %>
                <button class="tablinks2" onclick="opentab(event, 'sdp')" id="default">SDP</button>
                <button class="tablinks2" onclick="opentab(event, 'approval')">APPROVAL</button>
                <%
            }
            rs=stm.executeQuery("select * from plist where pid='"+pid+"' and m_id='"+uid+"'");   
            while(rs.next())
            {
                String name = ""; 
                roles[count]=rs.getString("roles");
                if(rs.getString("roles").equals("Requirements Gathering")) name="SRS";
                else if(rs.getString("roles").equals("Design")) name="SDS";
                else if(rs.getString("roles").equals("Implementation")) name="SOURCE CODE";
                else if(rs.getString("roles").equals("Testing")) name="TEST REPORT";
                if(count==0)
                {
                %>
                <button class="tablinks2" onclick="opentab(event, '<%=rs.getString("roles")%>')" id="default"><%=name%></button>
                <%
                }
                else
                {
                %>
                <button class="tablinks2" onclick="opentab(event, '<%=rs.getString("roles")%>')"><%=name%></button>
                <%
                }
                count++;
            } 
            
            %>
            </div>
            <%
            count=0;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = new Date();
            Date d1 = sdf.parse(sdf.format(d)); //current date
            Date d2 = new Date(); // start date
            Date d3 = new Date(); // end date
            rs=stm.executeQuery("select * from plist inner join pdetails on plist.pid=pdetails.pid where plist.pid='"+pid+"' and m_id='"+uid+"'");   
            while(rs.next())
            {
                if(rs.getString("roles").equals("Requirements Gathering"))
                {
                    d2 = sdf.parse(rs.getString("rs_date"));
                    d3 = sdf.parse(rs.getString("re_date"));
                }
                else if(rs.getString("roles").equals("Design"))
                {
                    d2 = sdf.parse(rs.getString("ds_date"));
                    d3 = sdf.parse(rs.getString("de_date"));
                }
                else if(rs.getString("roles").equals("Implementation"))
                {
                    d2 = sdf.parse(rs.getString("is_date"));
                    d3 = sdf.parse(rs.getString("ie_date"));
                }
                else if(rs.getString("roles").equals("Testing"))
                {
                    d2 = sdf.parse(rs.getString("ts_date"));
                    d3 = sdf.parse(rs.getString("te_date"));
                }
            %>
            <div id='<%=rs.getString("roles")%>' class='tabcontent2'>
                <br>
                <h2><span class="history"><%=rs.getString("roles")%></span></h2>
                <br>
                <%
                if(((d1.getTime() - d2.getTime())/ (1000 * 60 * 60 * 24))<0)
                {
                %>
                <span>Status : &ensp;&ensp;Time not Started</span>
                <br>
                <div style='width:100%;' class="tab2">
                    <button style="width:50%;" class="tablinks1<%=count%>" onclick="opentab1<%=count%>(event, 'document<%=count%>')" id="default1<%=count%>">Documents<br>List</button>
                </div>
                <%
                }
                else if(((d3.getTime() - d1.getTime())/(1000 * 60 * 60 * 24))>=0 && rs.getString("dstatus").equals("NOT COMPLETED"))
                {
                %>
                <span>Status : &ensp;&ensp;Remaining <%=((d3.getTime() - d1.getTime())/ (1000 * 60 * 60 * 24))%> days</span>
                <br>
                <div style='width:100%;' class="tab2">
                    <button style="width:50%;" class="tablinks1<%=count%>" onclick="opentab1<%=count%>(event, 'document<%=count%>')" id="default1<%=count%>">Documents<br>List</button>
                    <button style="width:50%;" class="tablinks1<%=count%>" onclick="opentab1<%=count%>(event, 'upload<%=count%>')">Upload Document</button>
                </div>
                <%
                }
                else if(((d3.getTime() - d1.getTime())/(1000 * 60 * 60 * 24))>=0 && rs.getString("dstatus").equals("WAITING"))
                {
                %>
                <span>Status : &ensp;&ensp;Waiting for Approval</span>
                <br>
                <div style='width:100%;' class="tab2">
                    <button style="width:50%;" class="tablinks1<%=count%>" onclick="opentab1<%=count%>(event, 'document<%=count%>')" id="default1<%=count%>">Documents<br>List</button>
                    <button style="width:50%;" class="tablinks1<%=count%>" onclick="opentab1<%=count%>(event, 'upload<%=count%>')">Upload Document</button>
                </div>
                <%
                }    
                else
                {
                    if(rs.getString("dstatus").equals("COMPLETED"))
                    {
                    %>
                <span>Status : &ensp;&ensp;Work Completed</span>
                <br>
                <div style='width:100%;' class="tab2">
                    <button style="width:50%;" class="tablinks1<%=count%>" onclick="opentab1<%=count%>(event, 'document<%=count%>')" id="default1<%=count%>">Documents<br>List</button>
                </div>
                    <%
                    }
                    else
                    {
                    %>
                <span>Status : &ensp;&ensp;Time Over</span>
                <br>
                <div style='width:100%;' class="tab2">
                    <button style="width:50%;" class="tablinks1<%=count%>" onclick="opentab1<%=count%>(event, 'document<%=count%>')" id="default1<%=count%>">Documents<br>List</button>
                </div>  
                    <%
                    }
                }
                %>
                <div id="document<%=count%>" class="tabcontent1<%=count%>">
                    <h2><span class="history">Document List</span></h2>
                    <br><br>
                    <table style="width:100%; margin-left:auto; margin-right:auto;"  cellspacing="2">
                        <tr>
                            <td style="width:25%;">SDP</td>
                            <%
                            if(rs.getString("SDP")!=null)
                            {
                            %>
                            <td style="width:45%;"><a href="<%=rs.getString("SDP")%>">Click to Download</a></td>
                            <td align="center"><%=rs.getString("DATE_SDP")%></td>
                            <%
                            }
                            else
                            {
                            %>
                            <td style="width:45%;">NOT UPLOADED</td>
                            <td align="center">-</td>
                            <%
                            }
                            %>
                        </tr>
                        <tr>
                            <td>SRS</td>
                            <%
                            if(rs.getString("SRS")!=null)
                            {
                            %>
                            <td><a href="<%=rs.getString("SRS")%>">Click to Download</a></td>
                            <td align="center"><%=rs.getString("DATE_SRS")%></td>
                            <%
                            }
                            else
                            {
                            %>
                            <td>NOT UPLOADED</td>
                            <td align="center">-</td>
                            <%
                            }
                            %>
                        </tr>
                        <tr>
                            <td>SDS</td>
                            <%
                            if(rs.getString("SDS")!=null)
                            {
                            %>
                            <td><a href="<%=rs.getString("SDS")%>">Click to Download</a></td>
                            <td align="center"><%=rs.getString("DATE_SDS")%></td>
                            <%
                            }
                            else
                            {
                            %>
                            <td>NOT UPLOADED</td>
                            <td align="center">-</td>
                            <%
                            }
                            %>
                        </tr>
                        <tr>
                            <td>SOURCE<br>CODE</td>
                            <%
                            if(rs.getString("IMP")!=null)
                            {
                            %>
                            <td><a href="<%=rs.getString("IMP")%>">Click to Download</a></td>
                            <td align="center"><%=rs.getString("DATE_IMP")%></td>
                            <%
                            }
                            else
                            {
                            %>
                            <td>NOT UPLOADED</td>
                            <td align="center">-</td>
                            <%
                            }
                            %>
                        </tr>
                        <tr>
                            <td>TEST<br>REPORT</td>
                            <%
                            if(rs.getString("TREPORT")!=null)
                            {
                            %>
                            <td><a href="<%=rs.getString("TREPORT")%>">Click to Download</a></td>
                            <td align="center"><%=rs.getString("DATE_TREPORT")%></td>
                            <%
                            }
                            else
                            {
                            %>
                            <td>NOT UPLOADED</td>
                            <td align="center">-</td>
                            <%
                            }
                            %>
                        </tr>
                    </table>
                </div>
                <div id="upload<%=count%>" class="tabcontent1<%=count%>">
                    <form id="form3<%=count%>" action="FileUploadServlet" method="post" enctype="multipart/form-data">
                        <input form="form3<%=count%>" type="hidden" name="pid1" value="<%=pid%>"/>
                        <input form="form3<%=count%>" type="hidden" name="count" value="<%=count%>"/>
                        <input form="form3<%=count%>" type="hidden" name="role" value="<%=rs.getString("roles")%>"/>
                    </form>
                    <h2><span class="history">Upload Document</span></h2>
                    <br>
                    <div class="drop-zone" style="height:175px; margin-left:auto;margin-right:auto;">
                        <span class="drop-zone__prompt">Drop file here or click to upload</span>
                        <input form='form3<%=count%>' type="file" name="myFile" class="drop-zone__input">
                    </div>
                    <center>
                        <div class="tab">
                            <button form="form3<%=count%>" style="padding:5px; width:35%;">UPLOAD</button>
                        </div>
                    </center>
                </div>
                <form id="form4<%=count%>" name="form4<%=count%>" method="post" action="updatechat.jsp">
                    <input form="form4<%=count%>" type="hidden" name="pid" value="<%=pid%>"/>
                    <input form="form4<%=count%>" type="hidden" name="role1" value="<%=rs.getString("roles")%>"/>
                </form>         
                <%
                if(((d1.getTime() - d2.getTime())/ (1000 * 60 * 60 * 24))<0) {}
                else if(((d3.getTime() - d1.getTime())/(1000 * 60 * 60 * 24))>=0 && rs.getString("dstatus").equals("NOT COMPLETED"))
                {
                %>
                <center>
                    <div class="tab">
                        <button form="form4<%=count%>" style="padding:5px; width:45%;">COMPLETE</button>
                    </div>   
                </center>
                <%
                }
                %> 
            </div>
            <%
            count++;
            }
            %>
            <div class="tabcontent2" id="approval">
                <h2><span class="history">APPROVAL for DOCUMENTS</span></h2>
                <br><br>
                <%
                int f=0;    
                rs=stm.executeQuery("select distinct(roles),dstatus from plist where pid='"+pid+"'");
                if(rs.next())
                {
                do
                {
                    f++;
                    String role1="";
                    if(rs.getString("roles").equals("Requirements Gathering") && rs.getString("dstatus").equals("WAITING"))  role1="SRS Document has been Uploaded";
                    else if(rs.getString("roles").equals("Design") && rs.getString("dstatus").equals("WAITING")) role1="SDS Document has been Uploaded";
                    else if(rs.getString("roles").equals("Implementation") && rs.getString("dstatus").equals("WAITING")) role1="SOURCE CODE has been Uploaded";
                    else if(rs.getString("roles").equals("Testing") && rs.getString("dstatus").equals("WAITING")) role1="TEST REPORT has been Uploaded";
                    if(role1!="")
                    {
                %>
                <div class="tab3">
                    <form name='form5<%=f%>' id='form5<%=f%>' method='post' action='updatechat.jsp'/>
                        <input form="form5<%=f%>" type='hidden' name="pid" value="<%=pid%>"/>
                        <input form="form5<%=f%>" type="hidden" name="role2" value="<%=rs.getString("roles")%>"/>
                        <input form="form5<%=f%>" type="hidden" id="status" name="status" value=""/>
                    </form>
                    <p class="text"><br><%=role1%>. Kindly Verify and Approve it.</p>
                    <div class="button1">
                        <button onclick="update5('<%=f%>','COMPLETED')">APPROVE</button>
                        <button onclick="update5('<%=f%>','NOT COMPLETED')">CANCEL</button>
                    </div>
                    <br>
                </div>
                <%
                }
                }while(rs.next());
                }
                else
                {
                %>
                <p class="text">No Pending Approvals.</p>
                <%
                }
                %>
            </div>
            <div class="tabcontent2" id="sdp">
            <%
            rs=stm.executeQuery("select distinct(plist.pid),ps_date,pe_date,sdp,srs,sds,imp,treport,date_sdp,date_srs,date_sds,date_imp,date_treport from plist inner join pdetails on plist.pid=pdetails.pid where plist.pid='"+pid+"' and pm_id='"+uid+"'");   
            while(rs.next())
            {
                d2 = sdf.parse(rs.getString("ps_date"));
                d3 = sdf.parse(rs.getString("pe_date"));
            %>
                <br>
                <h2><span class="history">Project Manager</span></h2>
                <br>
                <%
                if(((d1.getTime() - d2.getTime())/ (1000 * 60 * 60 * 24))<0)
                {
                %>
                <span>Status : &ensp;&ensp;Time not Started</span>
                <br>
                <div style='width:100%;' class="tab2">
                    <button style="width:50%;" class="tablinks14" onclick="opentab14(event, 'document4')" id="default14">Documents<br>List</button>
                </div>
                <%
                }
                else if(((d3.getTime() - d1.getTime())/(1000 * 60 * 60 * 24))>=0 && rs.getString("dstatus").equals("NOT COMPLETED"))
                {
                %>
                <span>Status : &ensp;&ensp;Remaining <%=((d3.getTime() - d1.getTime())/ (1000 * 60 * 60 * 24))%> days</span>
                <br>
                <div style='width:100%;' class="tab2">
                    <button style="width:50%;" class="tablinks14" onclick="opentab14(event, 'document4')" id="default14">Documents<br>List</button>
                    <button style="width:50%;" class="tablinks14" onclick="opentab14(event, 'upload4')">Upload Document</button>
                </div>
                <%
                }
                else
                {
                    if(rs.getString("sdp")!=null || rs.getString("sdp").equals(""))
                    {
                    %>
                <span>Status : &ensp;&ensp;Work Completed</span>
                <br>
                <div style='width:100%;' class="tab2">
                    <button style="width:50%;" class="tablinks14" onclick="opentab14(event, 'document4')" id="default14">Documents<br>List</button>
                </div>
                    <%
                    }
                    else
                    {
                    %>
                    2
                <span>Status : &ensp;&ensp;Time Over</span>
                <br>
                <div style='width:100%;' class="tab2">
                    <button style="width:50%;" class="tablinks14" onclick="opentab14(event, 'document4')" id="default14">Documents<br>List</button>
                </div>  
                    <%
                    }
                }
                %>
                <div id="document4" class="tabcontent14">
                    <h2><span class="history">Document List</span></h2>
                    <br><br>
                    <table style="width:100%; margin-left:auto; margin-right:auto;"  cellspacing="2">
                        <tr>
                            <td style="width:25%;">SDP</td>
                            <%
                            if(rs.getString("SDP")!=null)
                            {
                            %>
                            <td style="width:45%;"><a href="<%=rs.getString("SDP")%>">Click to Download</a></td>
                            <td align="center"><%=rs.getString("DATE_SDP")%></td>
                            <%
                            }
                            else
                            {
                            %>
                            <td style="width:45%;">NOT UPLOADED</td>
                            <td align="center">-</td>
                            <%
                            }
                            %>
                        </tr>
                        <tr>
                            <td>SRS</td>
                            <%
                            if(rs.getString("SRS")!=null)
                            {
                            %>
                            <td><a href="<%=rs.getString("SRS")%>">Click to Download</a></td>
                            <td align="center"><%=rs.getString("DATE_SRS")%></td>
                            <%
                            }
                            else
                            {
                            %>
                            <td>NOT UPLOADED</td>
                            <td align="center">-</td>
                            <%
                            }
                            %>
                        </tr>
                        <tr>
                            <td>SDS</td>
                            <%
                            if(rs.getString("SDS")!=null)
                            {
                            %>
                            <td><a href="<%=rs.getString("SDS")%>">Click to Download</a></td>
                            <td align="center"><%=rs.getString("DATE_SDS")%></td>
                            <%
                            }
                            else
                            {
                            %>
                            <td>NOT UPLOADED</td>
                            <td align="center">-</td>
                            <%
                            }
                            %>
                        </tr>
                        <tr>
                            <td>SOURCE<br>CODE</td>
                            <%
                            if(rs.getString("IMP")!=null)
                            {
                            %>
                            <td><a href="<%=rs.getString("IMP")%>">Click to Download</a></td>
                            <td align="center"><%=rs.getString("DATE_IMP")%></td>
                            <%
                            }
                            else
                            {
                            %>
                            <td>NOT UPLOADED</td>
                            <td align="center">-</td>
                            <%
                            }
                            %>
                        </tr>
                        <tr>
                            <td>TEST<br>REPORT</td>
                            <%
                            if(rs.getString("TREPORT")!=null)
                            {
                            %>
                            <td><a href="<%=rs.getString("TREPORT")%>">Click to Download</a></td>
                            <td align="center"><%=rs.getString("DATE_TREPORT")%></td>
                            <%
                            }
                            else
                            {
                            %>
                            <td>NOT UPLOADED</td>
                            <td align="center">-</td>
                            <%
                            }
                            %>
                        </tr>
                    </table>
                </div>
                <div id="upload4" class="tabcontent14">
                    <form id="form34" action="FileUploadServlet" method="post" enctype="multipart/form-data">
                        <input form="form34" type="hidden" name="pid1" value="<%=pid%>"/>
                        <input form="form34" type="hidden" name="count" value="4"/>
                        <input form="form34" type="hidden" name="role" value="Project Manager"/>
                    </form>
                    <h2><span class="history">Upload Document</span></h2>
                    <br>
                    <div class="drop-zone" style="height:175px; margin-left:auto;margin-right:auto;">
                        
                        <span class="drop-zone__prompt">Drop file here or click to upload</span>
                        <input form='form34' type="file" name="myFile" class="drop-zone__input">
                    </div>
                    <center>
                        <div class="tab">
                            <button form="form34" style="padding:5px; width:35%;">UPLOAD</button>
                        </div>
                    </center>
                </div>
            </div>
            <%
            }
            %>    
            </div>
        </div>
        <input type='hidden' id='count' value='<%=count%>'/> 
        <div class="tabcontent">
            <div class="tab2">
                <button class="tablinks3" onclick="opentab3(event, 'tchat')" id="default1">Team Chat</button>
                
            <%
            if(udesi.equals("pm_id"))
            {
            %>
            <button class="tablinks3" onclick="opentab3(event, 'settings')">SETTINGS</button>
            <%
            }
            for(int i=0;i<count;i++)
            {
                String name = ""; 
                if(roles[i].equals("Requirements Gathering")) name="SRS";
                else if(roles[i].equals("Design")) name="SDS";
                else if(roles[i].equals("Implementation")) name="SOURCE CODE";
                else if(roles[i].equals("Testing")) name="TEST REPORT";
                rs=stm.executeQuery("select count(m_id) from plist where pid='"+pid+"' group by roles having ROLES='"+roles[i]+"'");
                while(rs.next())
                {
                    if(Integer.parseInt(rs.getString(1))>1)
                    {
                    %>
                    <button class="tablinks3" onclick="opentab3(event, '<%=roles[i]%>1')"><%=name%></button>
                    <%
                    }
                }
            }
            %>
            </div>
            <div style="height:500px;" class="tabcontent3" id="settings">
                <h2><span class="history">Project Scheduling</span></h2>
                <br>
                <form name="form6" id="form6" method="post" action="updatechat.jsp">
                    <input form="form6" type="hidden" name="pid" value="<%=pid%>"/>
                </form>
                <table style="width:100%;" class="tablestyle" cellspacing="10">
                    <%
                    rs=stm.executeQuery("select * from pdetails where pid='"+pid+"'");
                    while(rs.next())
                    {
                    %>
                    <tr>
                        <td><h2>Start Date</h2></td>
                        <td><input form="form6" type="date" id="sdate" value="<%=rs.getString("start_date")%>" name="sdate" class="selectstyle" onchange="checkdate()"/></td>
                        <td><h2>End Date</h2></td>
                        <td><input form="form6" type="date" id="edate" value="<%=rs.getString("end_date")%>" name="edate" class="selectstyle" onchange="checkdate()"/></td>
                    </tr>
                    <tr>
                        <td><h2>Project Plan<br>Start Date</h2></td>
                        <td><input form="form6" type="date" id="psdate" value="<%=rs.getString("ps_date")%>" name="psdate" class="selectstyle" onchange="checkdate1()"/></td>
                        <td><h2>Project Plan<br>End Date</h2></td>
                        <td><input form="form6" type="date" id="pedate" value="<%=rs.getString("pe_date")%>" name="pedate" class="selectstyle" onchange="checkdate1()"/></td>
                    </tr>
                    <tr>
                        <td><h2>Requirements<br>Start Date</h2></td>
                        <td><input form="form6" type="date" id="rsdate" value="<%=rs.getString("rs_date")%>" name="rsdate" class="selectstyle" onchange="checkdate1()"/></td>
                        <td><h2>Requirements<br>End Date</h2></td>
                        <td><input form="form6" type="date" id="redate" value="<%=rs.getString("re_date")%>" name="redate" class="selectstyle" onchange="checkdate1()"/></td>
                    </tr>
                    <tr>
                        <td><h2>Design<br>Start Date</h2></td>
                        <td><input form="form6" type="date" id="dsdate" value="<%=rs.getString("ds_date")%>" name="dsdate" class="selectstyle" onchange="checkdate1()"/></td>
                        <td><h2>Design<br>End Date</h2></td>
                        <td><input form="form6" type="date" id="dedate" value="<%=rs.getString("de_date")%>" name="dedate" class="selectstyle" onchange="checkdate1()"/></td>
                    </tr>
                    <tr>
                        <td><h2>Implementation<br>Start Date</h2></td>
                        <td><input form="form6" type="date" id="isdate" value="<%=rs.getString("is_date")%>" name="isdate" class="selectstyle" onchange="checkdate1()"/></td>
                        <td><h2>Implementation<br>End Date</h2></td>
                        <td><input form="form6" type="date" id="iedate" value="<%=rs.getString("ie_date")%>" name="iedate" class="selectstyle" onchange="checkdate1()"/></td>
                    </tr>
                    <tr>
                        <td><h2>Testing<br>Start Date</h2></td>
                        <td><input form="form6" type="date" id="tsdate" value="<%=rs.getString("ts_date")%>" name="tsdate" class="selectstyle" onchange="checkdate1()"/></td>
                        <td><h2>Testing<br>End Date</h2></td>
                        <td><input form="form6" type="date" id="tedate" value="<%=rs.getString("te_date")%>" name="tedate" class="selectstyle" onchange="checkdate1()"/></td>
                    </tr>
                    <%
                    }
                    %>
                </table>
                    
                <div class="tab">
                    <button style="padding:8px;width:20%;" form="form6">UPDATE</button>
                </div>
            </div>
            <%
            for(int i=0;i<count;i++)
            {
            String name = ""; 
            rs2=stm2.executeQuery("select count(m_id) from plist where pid='"+pid+"' group by roles having ROLES='"+roles[i]+"'");
            while(rs2.next())
            {
            if(Integer.parseInt(rs2.getString(1))>1)
            {
            %>
            <div id="<%=roles[i]%>1" class="tabcontent3">
            <h2><span class="history"><%=roles[i]%> Team Chat</span></h2>
            <form name="form1<%=i%>" id="form1<%=i%>" method="post" action="updatechat.jsp">
                <input form="form1<%=i%>" type="hidden" name="pid" value="<%=pid%>"/>
                <input form="form1<%=i%>" type="hidden" name="uid" value="<%=uid%>"/>
                <input form="form1<%=i%>" type="hidden" name="roles" value="<%=roles[i]%>"/>
                <input form="form1<%=i%>" type="hidden" name="date11" value=""/>
                <input form="form1<%=i%>" type="hidden" name="time11" value=""/>
            </form>
            <form name="form2<%=i%>" id="form2<%=i%>" method="post" action="projectview.jsp">
                <input form="form2<%=i%>" type="hidden" name="pid" value="<%=pid%>"/>
            </form>
            <div class="chat">
                <br>
                <div style="margin:3px;" class="input">
                    <table style="width:100%; border-collapse: collapse;">
                        <tr>
                            <td style="width:10%;">
                                <button form="form2<%=i%>" style="border:none; background-color:white;"><img title="Refresh" src="refresh.png" width="70%" height="40px" alt="no img"/></button>
                            </td>
                            <td align="right" style="width:70%;">
                                <textarea form="form1<%=i%>" class="chatinput" rows="2" cols="50" placeholder="Text Here" type="text" name="message1"></textarea>
                            </td>
                            <td align="center" style="width:5%;">
                                <div class="popup">
                                    <label for="imgInp<%=i%>">
                                        <img src="attachment.jpg" style="margin-top:3px;" width="35px" height="35px"/>
                                    </label>
                                    <input form="form1<%=i%>" accept="image/*" type='file' name="chatphoto" id="imgInp<%=i%>" />
                                    <span class="popuptext" id="myPopup<%=i%>">
                                        <img id="blah<%=i%>" src="#" alt="your image" width="150px" height="100px"/>
                                    </span>
                                </div>
                            </td>
                            <td align="left" style="width:15%;">
                                <div class="mb-3">
                                    <button type="button" class="btn btn-secondary" onclick="update<%=i%>()">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
                                            <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
                                        </svg>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <hr>
                <div class="tableview">
                    <table style="width:100%;" cellspacing="20" > 
                        <%
                        SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy"); 
                        rs1=stm1.executeQuery("select distinct(date1) from pchat1 where pid='"+pid+"' and roles='"+roles[i]+"' ORDER BY date1 DESC ");
                        while(rs1.next())
                        {
                            Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("date1"));   
                        %>
                        <tr>
                            <td style="width:40%; text-align:left; "></td>
                            <td style="width:20%; text-align:center; "><%=formatter.format(date1)%></td>
                            <td style="width:40%; text-align:right; "></td>
                        </tr>
                        <%
                        rs=stm.executeQuery("select * from pchat1 inner join empl on uid=empid where pid='"+pid+"' and roles='"+roles[i]+"' and date1='"+rs1.getString("date1")+"' ORDER BY time1 DESC;");
                        while(rs.next())
                        {
                        if(rs.getString("uid").equals(uid))
                        {
                        %>
                        <tr>
                            <td style="width:40%; text-align:left; "></td>
                            <td style="width:20%; text-align:center; "></td>
                            <td style="width:40%; text-align:right; ">
                                <div class="tab1">
                                    <div class="sender"><b><u>You</u></b></div>
                                    <%
                                    if(rs.getString("photo")!=null)
                                    {
                                    %>
                                    <div class="msg"><img src="<%=rs.getString("photo")%>" width="150px" height="100px"/></div>
                                    <%
                                    }
                                    %>
                                    <div class="msg"><%=rs.getString("message")%></div>
                                    <div style="font-size:7pt;text-align: left;"><%=rs.getString("time1")%></div>
                                </div>
                            </td>
                        </tr>
                        <%
                        }
                        else
                        {
                        %>
                        <tr>
                            <td style="width:40%; text-align:left; ">
                                <div class="tab1">
                                    <div class="sender"><b><u><%=rs.getString("fname")%></u></b></div>
                                    <%
                                    if(rs.getString("photo")!=null)
                                    {
                                    %>
                                    <div class="msg"><img src="<%=rs.getString("photo")%>" width="150px" height="100px"/></div>
                                    <%
                                    }
                                    %>
                                    <div class="msg"><%=rs.getString("message")%></div>
                                    <div style="font-size:7pt;text-align: right;"><%=rs.getString("time1")%></div>
                                </div>
                            </td>
                            <td style="width:20%; text-align:center; "></td>
                            <td style="width:40%; text-align:right; "></td>
                        </tr>
                        <%
                        }
                        }
                        }
                        %>
                    </table>
                </div>
            </div>
            </div>  
            <%
            }
            }
            }
            %>
            <div id="tchat" class="tabcontent3">
            <h2><span class="history">Project Team Chat</span></h2>
            <form name="form1" id="form1" method="post" action="updatechat.jsp" onsubmit="return check()">
                <input form="form1" type="hidden" name="pid" value="<%=pid%>"/>
                <input form="form1" type="hidden" name="uid" value="<%=uid%>"/>
                <input form="form1" type="hidden" name="date1" value=""/>
                <input form="form1" type="hidden" name="time1" value=""/>
            </form>
            <form name="form2" id="form2" method="post" action="projectview.jsp">
                <input form="form2" type="hidden" name="pid" value="<%=pid%>"/>
            </form>
            <div class="chat">
                <br>
                <div style="margin:3px;" class="input">
                    <table style="width:100%; border-collapse: collapse;">
                        <tr>
                            <td style="width:10%;">
                                <button form="form2" style="border:none; background-color:white;"><img title="Refresh" src="refresh.png" width="70%" height="40px" alt="no img"/></button>
                            </td>
                            <td align="right" style="width:70%;">
                                <textarea form="form1" class="chatinput" rows="2" cols="50" placeholder="Text Here" type="text" name="message"></textarea>
                            </td>
                            <td align="center" style="width:5%;">
                                <div class="popup">
                                    <label for="imgInp">
                                        <img src="attachment.jpg" style="margin-top:3px;" width="35px" height="35px"/>
                                    </label>
                                    <input form="form1" accept="image/*" type='file' name="chatphoto" id="imgInp" />
                                    <span class="popuptext" id="myPopup">
                                        <img id="blah" src="#" alt="your image" width="150px" height="100px"/>
                                    </span>
                                </div>
                            </td>
                            <td align="left" style="width:15%;">
                                <div class="mb-3">
                                    <button type="button" class="btn btn-secondary" onclick="update()">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
                                            <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
                                        </svg>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <hr>
                <div class="tableview">
                    <table style="width:100%;" cellspacing="20" > 
                        <%
                        SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy"); 
                        rs1=stm1.executeQuery("select distinct(date1) from pchat where pid='"+pid+"' ORDER BY date1 DESC ");
                        while(rs1.next())
                        {
                            Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("date1"));   
                        %>
                        <tr>
                            <td style="width:40%; text-align:left; "></td>
                            <td style="width:20%; text-align:center; "><%=formatter.format(date1)%></td>
                            <td style="width:40%; text-align:right; "></td>
                        </tr>
                        <%
                        rs=stm.executeQuery("select * from pchat inner join empl on uid=empid where pid='"+pid+"' and date1='"+rs1.getString("date1")+"' ORDER BY time1 DESC;");
                        while(rs.next())
                        {
                        if(rs.getString("uid").equals(uid))
                        {
                        %>
                        <tr>
                            <td style="width:40%; text-align:left; "></td>
                            <td style="width:20%; text-align:center; "></td>
                            <td style="width:40%; text-align:right; ">
                                <div class="tab1">
                                    <div class="sender"><b><u>You</u></b></div>
                                    <%
                                    if(rs.getString("photo")!=null)
                                    {
                                    %>
                                    <div class="msg"><img src="<%=rs.getString("photo")%>" width="150px" height="100px"/></div>
                                    <%
                                    }
                                    %>
                                    <div class="msg"><%=rs.getString("message")%></div>
                                    <div style="font-size:7pt;text-align: left;"><%=rs.getString("time1")%></div>
                                </div>
                            </td>
                        </tr>
                        <%
                        }
                        else
                        {
                        %>
                        <tr>
                            <td style="width:40%; text-align:left; ">
                                <div class="tab1">
                                    <div class="sender"><b><u><%=rs.getString("fname")%></u></b></div>
                                    <%
                                    if(rs.getString("photo")!=null)
                                    {
                                    %>
                                    <div class="msg"><img src="<%=rs.getString("photo")%>" width="150px" height="100px"/></div>
                                    <%
                                    }
                                    %>
                                    <div class="msg"><%=rs.getString("message")%></div>
                                    <div style="font-size:7pt;text-align: right;"><%=rs.getString("time1")%></div>
                                </div>
                            </td>
                            <td style="width:20%; text-align:center; "></td>
                            <td style="width:40%; text-align:right; "></td>
                        </tr>
                        <%
                        }
                        }
                        }
                        %>
                    </table>
                </div>
            </div>
            </div>        
        </div>
    <%
    }
    catch(Exception e)
    {
        %>
        <%=e.getMessage()%>
        <%
    }
    %>
    <script src="drop_drag.js"></script>
    <script type="text/javascript">
        if(document.getElementById("imgInp"))
        {
        imgInp.onchange = evt => {
            const [file] = imgInp.files;
            if (file) {
                blah.src = URL.createObjectURL(file);
                blah.style.display="block";
                myPopup.classList.toggle("show");
            }
        };    
        }
        if(document.getElementById("imgInp0"))
        {
        imgInp0.onchange = evt => {
            const [file] = imgInp0.files;
            if (file) {
                blah0.src = URL.createObjectURL(file);
                blah0.style.display="block";
                myPopup0.classList.toggle("show");
            }
        };
        }
        if(document.getElementById("imgInp1"))
        {
        imgInp1.onchange = evt => {
            const [file] = imgInp1.files;
            if (file) {
                blah1.src = URL.createObjectURL(file);
                blah1.style.display="block";
                myPopup1.classList.toggle("show");
            }
        };
        }
        if(document.getElementById("imgInp2"))
        {
        imgInp2.onchange = evt => {
            const [file] = imgInp2.files;
            if (file) {
                blah2.src = URL.createObjectURL(file);
                blah2.style.display="block";
                myPopup2.classList.toggle("show");
            }
        };
        }
        if(document.getElementById("imgInp3"))
        {
        imgInp3.onchange = evt => {
            const [file] = imgInp3.files;
            if (file) {
                blah3.src = URL.createObjectURL(file);
                blah3.style.display="block";
                myPopup3.classList.toggle("show");
            }
        };
        }
    </script>
    <script>
        if(document.getElementById("default1")) 
        { document.getElementById("default1").click(); }
        
        if(document.getElementById("default")) 
        { document.getElementById("default").click(); }
        
        for(let i=0;i<5;i++)
        { 
            if(document.getElementById("default1"+i)) 
            { document.getElementById("default1"+i).click(); }
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
        function checkdate1()
        {
            let sdate = new Date(document.form6.sdate.value);
            let edate = new Date(document.form6.edate.value);
            let psdate = new Date(document.form6.psdate.value);
            let pedate = new Date(document.form6.pedate.value);
            let rsdate = new Date(document.form6.rsdate.value);
            let redate = new Date(document.form6.redate.value);
            let dsdate = new Date(document.form6.dsdate.value);
            let dedate = new Date(document.form6.dedate.value);
            let isdate = new Date(document.form6.isdate.value);
            let iedate = new Date(document.form6.iedate.value);
            let tsdate = new Date(document.form6.tsdate.value);
            let tedate = new Date(document.form6.tedate.value);
            if((pedate-psdate)<0)
            {
                document.form6.pedate.value="";
                document.form6.pedate.focus();
            }
            if((redate-rsdate)<0)
            {
                document.form6.redate.value="";
                document.form6.redate.focus();
            }
            if((dedate-dsdate)<0)
            {
                document.form6.dedate.value="";
                document.form6.dedate.focus();
            }
            if((iedate-isdate)<0)
            {
                document.form6.iedate.value="";
                document.form6.iedate.focus();
            }
            if((tedate-tsdate)<0)
            {
                document.form6.tedate.value="";
                document.form6.edate.value="";
                document.form6.tedate.focus();
            }
            if((rsdate-pedate)/(1000*60*60*24)!=1)
            {
                let dates = [];
                pedate.setDate(parseInt(pedate.getDate() + 1));
                dates.push(pedate.getFullYear());
                if(parseInt(pedate.getMonth())+1>9)
                    dates.push(parseInt(pedate.getMonth())+1);
                else
                    dates.push("0"+(parseInt(pedate.getMonth())+parseInt(1)));
                if(pedate.getDate()>9)
                    dates.push(pedate.getDate());
                else
                    dates.push("0"+pedate.getDate());
                document.form6.rsdate.value = dates.join("-");
                if((redate-rsdate)<0)
                {
                    document.form6.redate.value="";
                    document.form6.redate.focus();
                }
            }
            if((dsdate-redate)/(1000*60*60*24)!=1)
            {
                let dates = [];
                redate.setDate(parseInt(redate.getDate() + 1));
                dates.push(redate.getFullYear());
                if(parseInt(redate.getMonth())+1>9)
                    dates.push(parseInt(redate.getMonth())+1);
                else
                    dates.push("0"+(parseInt(redate.getMonth())+parseInt(1)));
                if(redate.getDate()>9)
                    dates.push(redate.getDate());
                else
                    dates.push("0"+redate.getDate());
                document.form6.dsdate.value = dates.join("-");
                if((dedate-dsdate)<0)
                {
                    document.form6.dedate.value="";
                    document.form6.dedate.focus();
                }
            }
            if((isdate-dedate)/(1000*60*60*24)!=1)
            {
                let dates = [];
                dedate.setDate(parseInt(dedate.getDate() + 1));
                dates.push(dedate.getFullYear());
                if(parseInt(dedate.getMonth())+1>9)
                    dates.push(parseInt(dedate.getMonth())+1);
                else
                    dates.push("0"+(parseInt(dedate.getMonth())+parseInt(1)));
                if(dedate.getDate()>9)
                    dates.push(dedate.getDate());
                else
                    dates.push("0"+dedate.getDate());
                document.form6.isdate.value = dates.join("-");
                if((iedate-isdate)<0)
                {
                    document.form6.dedate.value="";
                    document.form6.dedate.focus();
                }
            }
            if((tsdate-iedate)/(1000*60*60*24)!=1)
            {
                let dates = [];
                iedate.setDate(parseInt(iedate.getDate() + 1));
                dates.push(iedate.getFullYear());
                if(parseInt(iedate.getMonth())+1>9)
                    dates.push(parseInt(iedate.getMonth())+1);
                else
                    dates.push("0"+(parseInt(iedate.getMonth())+parseInt(1)));
                if(iedate.getDate()>9)
                    dates.push(iedate.getDate());
                else
                    dates.push("0"+iedate.getDate());
                document.form6.tsdate.value = dates.join("-");
                if((tedate-tsdate)<0)
                {
                    document.form6.iedate.value="";
                    document.form6.iedate.focus();
                }
            }
            if((edate-tedate)!=0)
            {
                let dates = [];
                tedate.setDate(parseInt(tedate.getDate() + 1));
                dates.push(tedate.getFullYear());
                if(parseInt(tedate.getMonth())+1>9)
                    dates.push(parseInt(tedate.getMonth())+1);
                else
                    dates.push("0"+(parseInt(tedate.getMonth())+parseInt(1)));
                if(tedate.getDate()>9)
                    dates.push(tedate.getDate());
                else
                    dates.push("0"+tedate.getDate());
                document.form6.edate.value = dates.join("-");
            }           
        }
        function opentab(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent2");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks2");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }
        function opentab10(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent10");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks10");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }
        function opentab11(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent11");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks11");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }
        function opentab12(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent12");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks12");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }
        function opentab13(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent13");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks13");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }
        function opentab14(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent14");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks14");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }
        function update()
        {
            var date1 = new Date();
            document.form1.date1.value=date1.getFullYear()+"-"+(parseInt(date1.getMonth())+1)+"-"+date1.getDate();
            document.form1.time1.value=date1.getHours()+":"+date1.getMinutes()+":"+date1.getSeconds();
            if(document.getElementById('imgInp').value!=="")
            {
                document.form1.action="FileUploadServlet";
                document.form1.enctype="multipart/form-data";
            }
            document.form1.submit();
        }
        function update0()
        {
            var date1 = new Date();
            document.form10.date11.value=date1.getFullYear()+"-"+(parseInt(date1.getMonth())+1)+"-"+date1.getDate();
            document.form10.time11.value=date1.getHours()+":"+date1.getMinutes()+":"+date1.getSeconds();
            if(document.getElementById('imgInp0').value!=="")
            {
                document.form10.action="FileUploadServlet";
                document.form10.enctype="multipart/form-data";
            }
            document.form10.submit();
        }
        function update1()
        {
            var date1 = new Date();
            document.form11.date11.value=date1.getFullYear()+"-"+(parseInt(date1.getMonth())+1)+"-"+date1.getDate();
            document.form11.time11.value=date1.getHours()+":"+date1.getMinutes()+":"+date1.getSeconds();
            if(document.getElementById('imgInp1').value!=="")
            {
                document.form11.action="FileUploadServlet";
                document.form11.enctype="multipart/form-data";
            }
            document.form11.submit();
        }
        function update2()
        {
            var date1 = new Date();
            document.form12.date11.value=date1.getFullYear()+"-"+(parseInt(date1.getMonth())+1)+"-"+date1.getDate();
            document.form12.time11.value=date1.getHours()+":"+date1.getMinutes()+":"+date1.getSeconds();
            if(document.getElementById('imgInp2').value!=="")
            {
                document.form12.action="FileUploadServlet";
                document.form12.enctype="multipart/form-data";
            }
            document.form12.submit();
        }
        function update3()
        {
            var date1 = new Date();
            document.form13.date11.value=date1.getFullYear()+"-"+(parseInt(date1.getMonth())+1)+"-"+date1.getDate();
            document.form13.time11.value=date1.getHours()+":"+date1.getMinutes()+":"+date1.getSeconds();
            if(document.getElementById('imgInp3').value!=="")
            {
                document.form13.action="FileUploadServlet";
                document.form13.enctype="multipart/form-data";
            }
            document.form13.submit();
        }
        function update5(count,status)
        {
            document.getElementById("status").value=status;
            document.getElementById('form5'+count).submit();
        }
        function opentab3(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent3");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks3");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }
        function submit1(no)
        {
            document.getElementById("count").value=no;
            alert("form3"+no);
            document.getElementById("form3"+no).submit();
        }
    </script>    
    </body>
</html>

