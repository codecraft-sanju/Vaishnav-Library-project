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

@WebServlet("/regForm")
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String myname = req.getParameter("name1");
        String myemail = req.getParameter("email1");
        String mypass = req.getParameter("pass1");
        String mydob = req.getParameter("dob1");  // Retrieve the date of birth
        String mygender = req.getParameter("gender1");
        String mycity = req.getParameter("city1");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");

            // Check if the email already exists
            PreparedStatement checkEmailPs = con.prepareStatement("SELECT * FROM register WHERE email = ?");
            checkEmailPs.setString(1, myemail);
            ResultSet rs = checkEmailPs.executeQuery();

            if (rs.next()) {
                // Email already registered
                resp.setContentType("text/html");
                out.println("<h3 style='color:red'>You are already registered with this email.</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
                rd.include(req, resp);
            } else {
                // Email not found, proceed to register
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO register (name, email, password, dob, gender, city) VALUES (?, ?, ?, ?, ?, ?)");
                ps.setString(1, myname);
                ps.setString(2, myemail);
                ps.setString(3, mypass);
                ps.setString(4, mydob);  // Insert the date of birth
                ps.setString(5, mygender);
                ps.setString(6, mycity);

                int count = ps.executeUpdate();
                if (count > 0) {
                    resp.setContentType("text/html");
                    RequestDispatcher rd = req.getRequestDispatcher("/Login.jsp");
                    rd.include(req, resp);
                } else {
                    resp.setContentType("text/html");
                    out.println("<h3 style='color:red'>User not registered due to some error.</h3>");
                    RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
                    rd.include(req, resp);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("text/html");
            out.println("<h3 style='color:red'>Exception occurred: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
            rd.include(req, resp);
        }
    }
}
