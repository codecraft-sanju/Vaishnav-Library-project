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

@WebServlet("/AddAttendance")
public class AddAttendance extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("user_id");
        String name = req.getParameter("name");
        String date = req.getParameter("date");
        String status = req.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");
            PreparedStatement ps = con.prepareStatement("INSERT INTO attendance (user_id, name, date, status) VALUES (?, ?, ?, ?)");
            ps.setString(1, userId);
            ps.setString(2, name);
            ps.setString(3, date);
            ps.setString(4, status);

            int result = ps.executeUpdate();
            if (result > 0) {
                resp.sendRedirect("adminDashboard.jsp"); // Redirect to the attendance management page after successful insertion
            } else {
                resp.getWriter().println("Error in adding attendance");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
