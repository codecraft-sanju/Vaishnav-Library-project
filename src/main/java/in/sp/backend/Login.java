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

@WebServlet("/LoginForm")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String myemail = req.getParameter("email1");
        String mypass = req.getParameter("pass1");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM register WHERE email=? AND password=?");
            ps.setString(1, myemail);
            ps.setString(2, mypass);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                // Get user_id and name from the result set
                int userId = rs.getInt("id");
                String name = rs.getString("name");

                // Store user_id and name in session
                HttpSession session = req.getSession();
                session.setAttribute("user_id", userId);
                session.setAttribute("name", name);

                // Redirect to attendance page
                resp.setContentType("text/html");
                RequestDispatcher rd = req.getRequestDispatcher("/attendance.jsp");
                rd.include(req, resp);
            } else {
                // If credentials are incorrect
                resp.setContentType("text/html");
                out.print("<h3 style='color:red'>Please Enter Correct Email and Password</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("/Login.jsp");
                rd.include(req, resp);
            }
        } catch (Exception e) {
            resp.setContentType("text/html");
            e.printStackTrace();
            out.println("<h3 style='color:red'>" + e.getMessage() + "</h3>");
            RequestDispatcher rd = req.getRequestDispatcher("/Login.jsp");
            rd.include(req, resp);
        }
    }
}
