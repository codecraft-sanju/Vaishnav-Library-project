package in.sp.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String newPassword = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");

            PreparedStatement ps = con.prepareStatement("UPDATE register SET password = ? WHERE email = ?");
            ps.setString(1, newPassword);
            ps.setString(2, email);

            int result = ps.executeUpdate();

            if (result > 0) {
                resp.sendRedirect("register.jsp");
            } else {
                resp.getWriter().println("<h3 style='color:red'>Password reset failed.</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
