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

@WebServlet("/UpdateAttendance")
public class UpdateAttendance extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String date = req.getParameter("date");
        String status = req.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");
            PreparedStatement ps = con.prepareStatement("UPDATE attendance SET date=?, status=? WHERE id=?");
            ps.setString(1, date);
            ps.setString(2, status);
            ps.setInt(3, id);

            ps.executeUpdate();
            con.close();
            resp.sendRedirect("adminDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
