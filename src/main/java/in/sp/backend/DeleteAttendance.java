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

@WebServlet("/DeleteAttendance")
public class DeleteAttendance extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");
            
            // Get the user_id associated with the attendance record
            PreparedStatement ps1 = con.prepareStatement("SELECT user_id FROM attendance WHERE id = ?");
            ps1.setInt(1, id);
            var rs = ps1.executeQuery();
            int userId = -1;
            if (rs.next()) {
                userId = rs.getInt("user_id");
            }
            
            // Delete from attendance table
            PreparedStatement ps = con.prepareStatement("DELETE FROM attendance WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
            
            // Delete the user from the register table
            if (userId != -1) {
                PreparedStatement ps2 = con.prepareStatement("DELETE FROM register WHERE id = ?");
                ps2.setInt(1, userId);
                ps2.executeUpdate();
            }

            con.close();
            resp.sendRedirect("adminDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
