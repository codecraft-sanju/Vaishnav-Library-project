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

@WebServlet("/DeleteNewAttendance")
public class DeleteNewAttendance extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");

            // Get the user name associated with the newattendance record
            PreparedStatement ps1 = con.prepareStatement("SELECT name FROM newattendance WHERE id = ?");
            ps1.setInt(1, id);
            var rs = ps1.executeQuery();
            String userName = null;
            if (rs.next()) {
                userName = rs.getString("name");
            }

            // Delete from newattendance table
            PreparedStatement ps = con.prepareStatement("DELETE FROM newattendance WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();

            // Delete the user from the register table
            if (userName != null) {
                PreparedStatement ps2 = con.prepareStatement("DELETE FROM register WHERE name = ?");
                ps2.setString(1, userName);
                ps2.executeUpdate();
            }

            con.close();
            resp.sendRedirect("adminDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
