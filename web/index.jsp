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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"> 
        <link rel="icon" href="logo.jpg">
        <title>PDMS</title>
        <style>
            
            *{
                margin:0px;
                box-sizing: border-box;
            }
            .center { margin-left: auto; margin-right: auto;}
            .header{ width:100%; background-color: #7c00d4; padding:10px 10px;
                     font-family: timesnewroman; color:white; position:fixed; 
                     z-index:1; top:0%;}
            body { font-family: Arial; background-color: #d0cfd1;  }
            .maincontent{ top:15%; left:32%; position:fixed; width:35%; border-top: 7px solid #7c00d4; color:#7c00d4; box-shadow: 0px 0px 10px 5px grey; 
                          background-color: white; padding:20px;}
            .form_header{ text-align:center;font-size:50px; font-family:timesnewroman; 
                          word-wrap:break-word;}
            .login__field { position: relative; margin:15px;}
            .login__icon { position: absolute; padding:0px 5px; top: 25px; 
                          color:#7c00d4; width:50px; height:50px; }  
            .login__input { padding: 10px; padding-left: 50px; width: 100%; 
                           font-size:22pt; height: 70px; }  
            .button{ padding:10px 20px; background-color:#7c00d4; color:white; 
                     width:80%; font-size:35px; cursor: pointer; }
            .button:hover{
                background-color:#2d004d;
            }
        </style>
        <script>
            window.history.forward();
        </script>
    </head>
    <body> 
        <div class="header">
            <table style="width:100%;">
                <tr>
                    <td style="width:17%;" align="LEFT"><img alt="no image" src="logo.jpg" style="width:40px;height:40px" /></td>
                    <td style="width:80%; font-size:40px;"> PROJECT DOCUMENT MANAGEMENT SYSTEM </td>
                    
                </tr>
            </table>
        </div>
        <br>
        <div class="maincontent center">
            <h1 class="form_header">LOGIN</h1>
            <br>
            <form action="login_validation.jsp" method="post">  
                <center>
                    <div class="login__field">
                        <i class = "login__icon fas fa-user"> </i> 
                        <input value="balaji_123" class="login__input" type="text" id="username" name="username" placeholder="Username"  title="Username must contain 5 digit only" required/>
                    </div>
                        <br>
                    <div class="login__field">
                        <i class = "login__icon fas fa-lock"> </i> 
                        <input value="balaji123" class="login__input" type="password" name="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z]).{8,}"  title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>
                    </div>
                        <br>
                    <div style="float:left;text-align:center; width:100%;" class="center">
                        <%
                        if(session.getAttribute("status")!=null && session.getAttribute("msg")!=null)
                        {
                            if(session.getAttribute("status").toString().equals("success"))
                            {
                            %>
                            <p style="color:green;"><%=session.getAttribute("msg").toString()%></p>
                            <%
                            }
                            else
                            {
                            %>
                            <p style="color:red;"><%=session.getAttribute("msg").toString()%></p>
                            <%
                            }
                            session.setAttribute("msg","");
                            session.setAttribute("status","");
                        }
                        %>
                    </div>      
                    <br><br><br><br><br><br>
                    <input class="button" type="submit" value="Login"/>
                </center>    
            </form>         
        </div>
    </body>
</html>
