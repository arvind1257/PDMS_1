<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="logo.jpg">
        <title>PDMS</title>
        <script>
            function submit1()
            {
                if(document.getElementById("check").value==="done")
                {
                    document.form1.submit();
                    alert("Successfully Submitted");
                }
                else
                {
                    alert(document.getElementById("check").value);
                    history.back();
                }
            }
        </script>
    </head>
    <body onload="submit1()">
    <%
    try{    
    
        Connection con = (Connection)session.getAttribute("connection");
        String uid = (String)session.getAttribute("uid");
        String uname = (String)session.getAttribute("uname");
        String udesi = (String)session.getAttribute("udesi");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String dob = request.getParameter("dob");
        String empid = request.getParameter("empid");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        PreparedStatement ps = con.prepareStatement("update empl set fname=?,lname=?,dob=?,email=?,phone=? where empid=?");
        ps.setString(1,fname);
        ps.setString(2,lname);
        ps.setString(3,dob);
        ps.setString(4,email);
        ps.setString(5,phone);
        ps.setString(6,empid);
        ps.executeUpdate();
        session.setAttribute("uname",fname+" "+lname);
        
    }
    catch(Exception e)
    {
        %><input type="hidden" value="<%=e%>" id="check"/><%
    }
    %>
    <form name="form1" action="team_dashboard.jsp" method="post"></form>    
        <input type="hidden" value="done" id="check"/>
    </body>
</html>

