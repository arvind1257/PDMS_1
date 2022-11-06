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
            }
            .header{ 
                width:100%; 
                color:white; 
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
                width:25%;
                float:left;
                margin:5px;
                padding:10px;
                height:570px;
                background-color: #7c00d4;
            }
            
            .tabcontent{
                width:65%;
                float:left;
                padding:170px;
                height:570px;
                margin:5px 60px;
                display:block;
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
                height:530px;
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
                        <a href="team_manager.jsp">
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
            <div class="menu1">
            <h1 align="center"><span class="history">TEAM LIST</span></h1>
            <br><br>
            <table border=1 style="width:80%;border:1px solid black; border-collapse:collapse;" cellpadding="5">
                <%
                rs=stm.executeQuery("select * from plist where "+udesi+"='"+uid+"'");
                if(rs.next())
                {
                do{
                %>
                <tr>
                    <th colspan="3"><%=rs.getString("pname")%></th>
                </tr>  
                <tr>
                    <th>Name</th>
                    <th>Emp ID</th>
                    <th>Roles</th>
                </tr>
                <%
                int count=0;
                String[] id_list = new String[20];
                String[] rid = rs.getString("r_id").split(",");   
                String[] did = rs.getString("d_id").split(",");   
                String[] iid = rs.getString("i_id").split(",");   
                String[] tid = rs.getString("t_id").split(",");   
                for(int i=0;i<rid.length;i++)
                {
                    id_list[count]=rid[i];
                    count++;
                }
                for(int i=0;i<did.length;i++)
                {
                    id_list[count]=did[i];
                    count++;
                }
                for(int i=0;i<iid.length;i++)
                {
                    id_list[count]=iid[i];
                    count++;
                }
                for(int i=0;i<tid.length;i++)
                {
                    id_list[count]=tid[i];
                    count++;
                }
                for(int i=0;i<count;i++)
                {
                rs1=stm1.executeQuery("select * from empl where empid='"+id_list[i]+"'");
                if(rs1.next())
                {
                do{
                %>
                <tr>                    
                    <td><%=rs1.getString("fname")+" "+rs1.getString("lname")%></td>
                    <td><%=rs1.getString("empid")%></td>
                    <td><%=rs1.getString("desi")%></td>
                </tr>
                <%
                }while(rs1.next());
                }
                }    
                }while(rs.next());
                }    
                %>
                <tr>
                    
                </tr>
            </table>   
            </div>
        </div>
        <div class="tabcontent">
            <div style="float:left;" class="tab"><button id="project" onclick="location.href='team_dashboard.jsp'">VIEW PROJECT</button></div>
            <div style="float:right;" class="tab"><button id="signup" onclick="location.href='signup.jsp'">SIGNUP NEW MEMBERS</button></div>
        </div>
    <%
    }
    catch(Exception e)
    {
        %><%=e%><%
    }
    %>
    </body>
</html>

