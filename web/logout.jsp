<%
    
    try
    {  
        session.removeAttribute("uid");
        session.removeAttribute("con");
        session.removeAttribute("uname");
        session.removeAttribute("udesi");
        session.invalidate();
        HttpSession session1 = request.getSession();  
        session1.setAttribute("msg","Successfully Logout");
        session1.setAttribute("status","success");
        response.setHeader("Pragma","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Expires","0");
        response.setDateHeader("Expires",-1);
        response.sendRedirect("index.jsp");
    }
    catch(Exception e)
    {
        
    }
%>