<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
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
                document.form1.submit();
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
        if(request.getParameter("date1")!=null && request.getParameter("time1")!=null && request.getParameter("message")!=null)
        {
            PreparedStatement ps = con.prepareStatement("insert into pchat(pid,uid,message,date1,time1) values(?,?,?,?,?)");
            ps.setString(1,request.getParameter("pid"));
            ps.setString(2,request.getParameter("uid"));
            ps.setString(3,request.getParameter("message"));
            ps.setString(4,request.getParameter("date1"));
            ps.setString(5,request.getParameter("time1"));
            ps.executeUpdate();
        }
        else if(request.getParameter("date11")!=null && request.getParameter("time11")!=null && request.getParameter("message1")!=null)
        {
            PreparedStatement ps = con.prepareStatement("insert into pchat1(pid,roles,uid,message,date1,time1) values(?,?,?,?,?,?)");
            ps.setString(1,request.getParameter("pid"));
            ps.setString(2,request.getParameter("roles"));
            ps.setString(3,request.getParameter("uid"));
            ps.setString(4,request.getParameter("message1"));
            ps.setString(5,request.getParameter("date11"));
            ps.setString(6,request.getParameter("time11"));
            ps.executeUpdate();
        }
        else if(request.getParameter("role1")!=null)
        {
            PreparedStatement ps = con.prepareStatement("update plist set dstatus='WAITING' where pid=? and roles=?");
            ps.setString(1,request.getParameter("pid"));
            ps.setString(2,request.getParameter("role1"));
            ps.executeUpdate();
        }
        else if(request.getParameter("role2")!=null && request.getParameter("status")!=null)
        {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
            Calendar cal = Calendar.getInstance();  
            String enddate = sdf.format(cal.getTime());
            cal.add(Calendar.DAY_OF_MONTH,1);  
            String startdate = sdf.format(cal.getTime());
            PreparedStatement ps = null;
            if(request.getParameter("role2").equals("Requirements Gathering") && request.getParameter("status").equals("COMPLETED"))  
            {
                ps = con.prepareStatement("update pdetails set re_date=?,ds_date=? where pid=?");
                ps.setString(1,enddate);
                ps.setString(2,startdate);
                ps.setString(3,request.getParameter("pid"));
                ps.executeUpdate();
            }
            else if(request.getParameter("role2").equals("Design") && request.getParameter("status").equals("COMPLETED")) 
            {
                ps = con.prepareStatement("update pdetails set de_date=?,is_date=? where pid=?");
                ps.setString(1,enddate);
                ps.setString(2,startdate);
                ps.setString(3,request.getParameter("pid"));
                ps.executeUpdate();
            }
            else if(request.getParameter("role2").equals("Implementation") && request.getParameter("status").equals("COMPLETED")) 
            {
                ps = con.prepareStatement("update pdetails set ie_date=?,ts_date=? where pid=?");
                ps.setString(1,enddate);
                ps.setString(2,startdate);
                ps.setString(3,request.getParameter("pid"));
                ps.executeUpdate();
            }
            else if(request.getParameter("role2").equals("Testing") && request.getParameter("status").equals("COMPLETED")) 
            {
                ps = con.prepareStatement("update pdetails set te_date=?,end_date=? where pid=?");
                ps.setString(1,enddate);
                ps.setString(2,enddate);
                ps.setString(3,request.getParameter("pid"));
                ps.executeUpdate();
            }
            ps = con.prepareStatement("update plist set dstatus=? where pid=? and roles=?");
            ps.setString(1,request.getParameter("status"));
            ps.setString(2,request.getParameter("pid"));
            ps.setString(3,request.getParameter("role2"));
            ps.executeUpdate();
        }
        else if(request.getParameter("sdate")!=null && request.getParameter("edate")!=null)
        {
            try{    
            PreparedStatement ps = con.prepareStatement("update pdetails set start_date=?,end_date=?,ps_date=?,pe_date=?,rs_date=?,re_date=?,ds_date=?,de_date=?,is_date=?,ie_date=?,ts_date=?,te_date=? where pid=?");
            ps.setString(1,request.getParameter("sdate"));
            ps.setString(2,request.getParameter("edate"));
            ps.setString(3,request.getParameter("psdate"));
            ps.setString(4,request.getParameter("pedate"));
            ps.setString(5,request.getParameter("rsdate"));
            ps.setString(6,request.getParameter("redate"));
            ps.setString(7,request.getParameter("dsdate"));
            ps.setString(8,request.getParameter("dedate"));
            ps.setString(9,request.getParameter("isdate"));
            ps.setString(10,request.getParameter("iedate"));
            ps.setString(11,request.getParameter("tsdate"));
            ps.setString(12,request.getParameter("tedate"));
            ps.setString(13,request.getParameter("pid"));
            ps.executeUpdate();
        }
catch(Exception e)
{
%><%=e%><%
}
        }
        %>
        <input form="form1" type="hidden" value="done" id="check"/>
        <%
    }
    catch(Exception e)
    {
        %><input form="form1" type="hidden" value="<%=e%>" id="check"/><%
    }
    %>
    <form name="form1" id="form1" action="projectview.jsp" method="post"></form>    
        <input form="form1" type="hidden" value="<%=request.getParameter("pid")%>" name="pid"/>
    </body>
</html>

