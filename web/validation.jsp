<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        hi
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="logo.jpg">
        <link rel="stylesheet" href="drop_drag.css">
        <title>PDMS</title>
        <script>
            function submit1()
            {
                if(document.getElementById("check").value==="done")
                {
                    alert("Successfully Submitted");
                    document.form1.submit();
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
    <%!
        public String randomid(Connection con)
        {
            try
            {
            int max=999999,min=111111;
            int id = (int)(Math.random()*(max-min+1)+min);
            String id1 = Integer.toString(id);
            Statement stm1 = con.createStatement();
            ResultSet rs1 = null;
            rs1=stm1.executeQuery("select * from plist");
            while(rs1.next())
            {
                if(id1.equals(rs1.getString("pid")))
                {
                    id1 = randomid(con);
                    break;
                }
            }
            return id1; 
            }
            catch(Exception e)
            {
                return "0";
            }    
        }
    %>    
    <%
    try{    
    
        Connection con = (Connection)session.getAttribute("connection");
        Statement stm = con.createStatement();
        ResultSet rs = null;
        String uid = (String)session.getAttribute("uid");
        String uname = (String)session.getAttribute("uname");
        String pid = randomid(con);
        String title = request.getParameter("title");
        String desc = request.getParameter("desc");
        String[] rid = request.getParameterValues("rid");
        String[] did = request.getParameterValues("did");
        String[] iid = request.getParameterValues("iid");
        String[] tid = request.getParameterValues("tid");
        String budget = request.getParameter("budget");
        String resource = request.getParameter("resource");
        String sdate = request.getParameter("sdate");
        String edate = request.getParameter("edate");
        String psdate = request.getParameter("psdate");
        String pedate = request.getParameter("pedate");
        String rsdate = request.getParameter("rsdate");
        String redate = request.getParameter("redate");
        String dsdate = request.getParameter("dsdate");
        String dedate = request.getParameter("dedate");
        String isdate = request.getParameter("isdate");
        String iedate = request.getParameter("iedate");
        String tsdate = request.getParameter("tsdate");
        String tedate = request.getParameter("tedate");
        
        String[] res = resource.split(",");
        desc = "<h2>Project Scope</h2><br>"
             + "<p>"+desc+"</p><br>"
             + "<h2>Budget:</h2><br>"
             + "<p>"+budget+"/-</p><br>"
             + "<h2>Resources:</h2><Br>"
             + "<ul> ";
        for(int j=0;j<res.length;j++)
        {
            desc+="<li>"+res[j].trim()+"</li>";
        }
        desc+="</ul>";
            
        for(int j=0;j<rid.length;j++)
        {
            PreparedStatement ps = con.prepareStatement("Insert into plist(pid,pname,pm_id,m_id,pstatus,dstatus,roles) values(?,?,?,?,?,?,?)");
            ps.setString(1,pid);
            ps.setString(2,title);
            ps.setString(3,uid);
            ps.setString(4,rid[j].trim());
            ps.setString(5,"ACTIVE");
            ps.setString(6,"NOT COMPLETED");
            ps.setString(7,"Requirements Gathering");
            ps.executeUpdate();
        }
        for(int j=0;j<did.length;j++)
        {
            PreparedStatement ps = con.prepareStatement("Insert into plist(pid,pname,pm_id,m_id,pstatus,dstatus,roles) values(?,?,?,?,?,?,?)");
            ps.setString(1,pid);
            ps.setString(2,title);
            ps.setString(3,uid);
            ps.setString(4,did[j].trim());
            ps.setString(5,"ACTIVE");
            ps.setString(6,"NOT COMPLETED");
            ps.setString(7,"Design");
            ps.executeUpdate();
        }
        for(int j=0;j<iid.length;j++)
        {
            PreparedStatement ps = con.prepareStatement("Insert into plist(pid,pname,pm_id,m_id,pstatus,dstatus,roles) values(?,?,?,?,?,?,?)");
            ps.setString(1,pid);
            ps.setString(2,title);
            ps.setString(3,uid);
            ps.setString(4,iid[j].trim());
            ps.setString(5,"ACTIVE");
            ps.setString(6,"NOT COMPLETED");
            ps.setString(7,"Implementation");
            ps.executeUpdate();
        }
        for(int j=0;j<tid.length;j++)
        {
            PreparedStatement ps = con.prepareStatement("Insert into plist(pid,pname,pm_id,m_id,pstatus,dstatus,roles) values(?,?,?,?,?,?,?)");
            ps.setString(1,pid);
            ps.setString(2,title);
            ps.setString(3,uid);
            ps.setString(4,tid[j].trim());
            ps.setString(5,"ACTIVE");
            ps.setString(6,"NOT COMPLETED");
            ps.setString(7,"Testing");
            ps.executeUpdate();
        }
        
        PreparedStatement ps = con.prepareStatement("Insert into pdetails(pid,start_date,end_date,ps_date,pe_date,rs_date,re_date,ds_date,de_date,is_date,ie_date,ts_date,te_date,description) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        ps.setString(1,pid);
        ps.setString(2,sdate);
        ps.setString(3,edate);
        ps.setString(4,psdate);
        ps.setString(5,pedate);
        ps.setString(6,rsdate);
        ps.setString(7,redate);
        ps.setString(8,dsdate);
        ps.setString(9,dedate);
        ps.setString(10,isdate);
        ps.setString(11,iedate);
        ps.setString(12,tsdate);
        ps.setString(13,tedate);
        ps.setString(14,desc);
        ps.executeUpdate();
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


    