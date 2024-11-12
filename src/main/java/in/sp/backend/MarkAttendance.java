   package in.sp.backend; 
   import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MarkAttendance")
public class MarkAttendance extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("user_id");
        String name = req.getParameter("name");
        String date = req.getParameter("date");
        String status = req.getParameter("status");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098")) {
            
            // Step 1: Check if user is in the `attendance` table
            PreparedStatement checkUserStmt = conn.prepareStatement("SELECT * FROM attendance WHERE user_id = ?");
            checkUserStmt.setString(1, userId);
            ResultSet userResult = checkUserStmt.executeQuery();

            if (userResult.next()) {
                // Step 2: User is in `attendance` table, now check for today's date in `newattendance` table
                PreparedStatement checkDateStmt = conn.prepareStatement("SELECT * FROM newattendance WHERE user_id = ? AND date = ?");
                checkDateStmt.setString(1, userId);
                checkDateStmt.setString(2, date);
                ResultSet dateResult = checkDateStmt.executeQuery();

                if (!dateResult.next()) {
                    // Step 3: If no record exists for today's date, insert into `newattendance`
                    PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO newattendance (user_id, name, date, status) VALUES (?, ?, ?, ?)");
                    insertStmt.setString(1, userId);
                    insertStmt.setString(2, name);
                    insertStmt.setString(3, date);
                    insertStmt.setString(4, status);
                    insertStmt.executeUpdate();

                    req.getSession().setAttribute("attendanceMessage", "Attendance marked successfully for today.");
                } else {
                    // User has already marked attendance for today
                    req.getSession().setAttribute("attendanceMessage", "Your attendance for today is already marked.");
                }
            } else {
                // Step 4: User is not in `attendance` table, show message to join the library first
                req.getSession().setAttribute("attendanceMessage", "Please join the library first for attendance.");
            }

            resp.sendRedirect("attendance.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
