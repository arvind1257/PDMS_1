package uploadfile;
import java.io.IOException;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig
public class FileUploadServlet extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        
            HttpSession session = request.getSession();
        
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(FileUploadServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        
            Connection con = (Connection)session.getAttribute("connection");
            String uid = (String)session.getAttribute("uid");
            String uname = (String)session.getAttribute("uname");
            String udesi = (String)session.getAttribute("udesi");
            if(request.getPart("photo")!=null)
            {
                Part file = request.getPart("photo");
                String filename = getFilename(file);
                InputStream filecontent = file.getInputStream();
                File file1 = new File(getServletContext().getRealPath("images")+File.separator+ file.getSubmittedFileName());
                FileOutputStream outputStream = new FileOutputStream(file1);

                int read = 0;
                byte[] bytes = new byte[1024];
                while ((read = filecontent.read(bytes)) != -1) 
                {
                    outputStream.write(bytes, 0, read);
                }
                response.setContentType("text/plain");
                response.setCharacterEncoding("UTF-8");
                try{
                    PreparedStatement pst = con.prepareStatement("update empl set photo=? where empid=?");
                    pst.setString(1,"images"+File.separator+file.getSubmittedFileName());
                    pst.setString(2,uid);
                    pst.executeUpdate();
                }
                catch(SQLException e)
                {
                    response.getWriter().print(e);
                }
                response.sendRedirect("team_dashboard.jsp");
            }
            else if(request.getParameter("pid")!=null)
            {
                if(request.getPart("chatphoto")!=null)
                {
                    Part file = request.getPart("chatphoto");
                    String filename = getFilename(file);
                    InputStream filecontent = file.getInputStream();
                    File file1 = new File(getServletContext().getRealPath("images")+File.separator+ file.getSubmittedFileName());
                    FileOutputStream outputStream = new FileOutputStream(file1);

                    int read = 0;
                    byte[] bytes = new byte[1024];
                    while ((read = filecontent.read(bytes)) != -1) 
                    {
                        outputStream.write(bytes, 0, read);
                    }
                    response.setContentType("text/plain");
                    response.setCharacterEncoding("UTF-8");
                    try{
                        if(request.getParameter("date1")!=null && request.getParameter("time1")!=null && request.getParameter("message")!=null)
                        {
                            PreparedStatement ps = con.prepareStatement("insert into pchat(pid,uid,message,date1,time1,photo) values(?,?,?,?,?,?)");
                            ps.setString(1,request.getParameter("pid"));
                            ps.setString(2,request.getParameter("uid"));
                            ps.setString(3,request.getParameter("message"));
                            ps.setString(4,request.getParameter("date1"));
                            ps.setString(5,request.getParameter("time1"));
                            ps.setString(6,"images"+File.separator+file.getSubmittedFileName());
                            ps.executeUpdate();
                        }
                        else if(request.getParameter("date11")!=null && request.getParameter("time11")!=null && request.getParameter("message1")!=null)
                        {
                            PreparedStatement ps = con.prepareStatement("insert into pchat1(pid,roles,uid,message,date1,time1,photo) values(?,?,?,?,?,?,?)");
                            ps.setString(1,request.getParameter("pid"));
                            ps.setString(2,request.getParameter("roles"));
                            ps.setString(3,request.getParameter("uid"));
                            ps.setString(4,request.getParameter("message1"));
                            ps.setString(5,request.getParameter("date11"));
                            ps.setString(6,request.getParameter("time11"));
                            ps.setString(7,"images"+File.separator+file.getSubmittedFileName());
                            ps.executeUpdate();
                        }
                    }
                    catch(SQLException e)
                    {
                        response.getWriter().print(e);
                    }
                }
                response.sendRedirect("projectview.jsp?pid="+request.getParameter("pid"));
            }
            else if(request.getParameter("pid1")!=null)
            {   
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date date1 = new Date();
                    Part file = request.getPart("myFile");
                    String filename = getFilename(file);
                    InputStream filecontent = file.getInputStream();
                    File file1 = new File(getServletContext().getRealPath("files")+File.separator+ file.getSubmittedFileName());
                    FileOutputStream outputStream = new FileOutputStream(file1);
                    int read = 0;
                    byte[] bytes = new byte[1024];
                    while ((read = filecontent.read(bytes)) != -1) 
                    {
                        outputStream.write(bytes, 0, read);
                    }
                    response.setContentType("text/plain");
                    response.setCharacterEncoding("UTF-8");
                    try{
                        switch (request.getParameter("role")) {
                            case "Project Manager":
                                {
                                    PreparedStatement ps = con.prepareStatement("update pdetails set SDP=?,DATE_SDP=? where pid=?");
                                    ps.setString(1,"files"+File.separator+file.getSubmittedFileName());
                                    ps.setString(2,sdf.format(date1));
                                    ps.setString(3,request.getParameter("pid1"));
                                    ps.executeUpdate();
                                    break;
                                }
                            case "Requirements Gathering":
                                {
                                    PreparedStatement ps = con.prepareStatement("update pdetails set SRS=?,DATE_SRS=? where pid=?");
                                    ps.setString(1,"files"+File.separator+file.getSubmittedFileName());
                                    ps.setString(2,sdf.format(date1));
                                    ps.setString(3,request.getParameter("pid1"));
                                    ps.executeUpdate();
                                    break;
                                }
                            case "Design":
                                {
                                    PreparedStatement ps = con.prepareStatement("update pdetails set SDS=?,DATE_SDS=? where pid=?");
                                    ps.setString(1,"files"+File.separator+file.getSubmittedFileName());
                                    ps.setString(2,sdf.format(date1));
                                    ps.setString(3,request.getParameter("pid1"));
                                    ps.executeUpdate();
                                    break;
                                }
                            case "Implementation":
                                {
                                    PreparedStatement ps = con.prepareStatement("update pdetails set IMP=?,DATE_IMP=? where pid=?");
                                    ps.setString(1,"files"+File.separator+file.getSubmittedFileName());
                                    ps.setString(2,sdf.format(date1));
                                    ps.setString(3,request.getParameter("pid1"));
                                    ps.executeUpdate();
                                    break;
                                }
                            case "Testing":
                                {
                                    PreparedStatement ps = con.prepareStatement("update pdetails set TREPORT=?,DATE_TREPORT=? where pid=?");
                                    ps.setString(1,"files"+File.separator+file.getSubmittedFileName());
                                    ps.setString(2,sdf.format(date1));
                                    ps.setString(3,request.getParameter("pid1"));
                                    ps.executeUpdate();
                                    break;
                                }
                            default:
                                break;
                        }
                    }
                    catch(SQLException e)
                    {
                        response.getWriter().print(e);
                    }
                response.sendRedirect("projectview.jsp?pid="+request.getParameter("pid1"));
            }
         
        
    }
    private static String getFilename(Part part) 
    {
        for (String cd : part.getHeader("content-disposition").split(";")) 
        {
            if (cd.trim().startsWith("filename")) 
            {
                String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }
}
