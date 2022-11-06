<%@page import="java.security.MessageDigest"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Pragma","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Expires","0");
    response.setDateHeader("Expires",-1);
%>
<%!
    public static String getMd5(String input)
    {
        try 
        {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) 
            {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        }catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    } 
%>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/pdms?zeroDateTimeBehavior=CONVERT_TO_NULL";
    Connection con = DriverManager.getConnection(url,"root","123456");
    String user = request.getParameter("username");
    String pass = request.getParameter("password");
    String uid = "";
    String uname = "";
    String udesi = "";
    String sql="select * from login where username='"+user+"' and password='"+pass+"'";
    Statement stm = con.createStatement();
    ResultSet rs =null;
    Statement stm1 = con.createStatement();
    ResultSet rs1 =null;
    rs=stm.executeQuery(sql);
    if(rs.next())
    {
        rs1 = stm1.executeQuery("select * from empl where empid='"+rs.getString("uid")+"'");
        if(rs1.next())
        {
            uid=rs.getString("uid");
            uname=rs1.getString("fname")+" "+rs1.getString("lname");
            udesi=rs1.getString("desi");
        }
        
        session.setAttribute("connection",con);
        session.setAttribute("uid",uid);
        session.setAttribute("uname",uname);
        if(udesi.equals("Project Manager"))
        {
            session.setAttribute("udesi","pm_id");
        }
        else
        {
            session.setAttribute("udesi","m_id");
        }
        response.sendRedirect("team_dashboard.jsp");
        
    }
    else
    {
        session.setAttribute("msg","Invalid username or password");
        session.setAttribute("status","failed");
        response.sendRedirect("index.jsp");
    }
%>



