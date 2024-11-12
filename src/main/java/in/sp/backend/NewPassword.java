package in.sp.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;

        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

            Connection con = null;
            PreparedStatement pst = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo?useSSL=false", "root", "Sanju@098");
                
                pst = con.prepareStatement("UPDATE register SET password = ? WHERE email = ?");
                pst.setString(1, newPassword);
                pst.setString(2, (String) session.getAttribute("email"));

                int rowCount = pst.executeUpdate();
                if (rowCount > 0) {
                    request.setAttribute("status", "resetSuccess");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                } else {
                    request.setAttribute("status", "resetFailed");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                }
                
                dispatcher.forward(request, response);
                
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                request.setAttribute("status", "error");
                dispatcher = request.getRequestDispatcher("error.jsp");
                dispatcher.forward(request, response);
                
            } finally {
                try {
                    if (pst != null) pst.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            request.setAttribute("status", "passwordMismatch");
            dispatcher = request.getRequestDispatcher("new_password.jsp");
            dispatcher.forward(request, response);
        }
    }
}
