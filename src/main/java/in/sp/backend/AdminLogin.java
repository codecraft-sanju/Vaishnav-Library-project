package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE username = ? AND password = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
            	
                // Create a session for the admin user
                HttpSession session = req.getSession();
                session.setAttribute("adminUser", username);
                
                // Redirect to the admin dashboard
                resp.setContentType("text/html");
                RequestDispatcher rd = req.getRequestDispatcher("/adminDashboard.jsp");
                rd.forward(req, resp);
            } else {
                PrintWriter out = resp.getWriter();
                resp.setContentType("text/html");
                out.println("<h3 style='color:red'>Invalid Username or Password</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("/adminLogin.jsp");
                rd.include(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
