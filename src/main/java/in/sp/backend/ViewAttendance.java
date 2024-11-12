package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewAttendance")
public class ViewAttendance extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");
            PreparedStatement ps = con.prepareStatement("select * from attendance");
            ResultSet rs = ps.executeQuery();

            out.println("<h3>Attendance Report:</h3>");
            out.println("<table border='1'><tr><th>User ID</th><th>Date</th><th>Status</th></tr>");
            while (rs.next()) {
                out.println("<tr><td>" + rs.getInt("user_id") + "</td><td>" + rs.getDate("date") + "</td><td>" + rs.getString("status") + "</td></tr>");
            }
            out.println("</table>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red'>" + e.getMessage() + "</h3>");
        }
    }
}
