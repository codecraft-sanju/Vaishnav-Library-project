package in.sp.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collections;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;

@WebServlet("/googleSignIn")
public class GoogleSignInServlet extends HttpServlet {
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String credential = req.getParameter("credential");

        try {
            GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(   
            		GoogleNetHttpTransport.newTrustedTransport(), JSON_FACTORY)
                    .setAudience(Collections.singletonList("1092036301830-a2fb2tmua1l2vgbps7g5ub3k4ufn65it.apps.googleusercontent.com"))
                    .build();

            GoogleIdToken idToken = verifier.verify(credential);
            if (idToken != null) {
                Payload payload = idToken.getPayload();
                String email = payload.getEmail();
                String name = (String) payload.get("name");
                System.out.println("Google Payload: " + payload.toString()); 

                // Connect to the database
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");

                // Check if user already exists
                PreparedStatement checkEmailStmt = con.prepareStatement("SELECT * FROM register WHERE email = ?");
                checkEmailStmt.setString(1, email);
                ResultSet rs = checkEmailStmt.executeQuery();

                HttpSession session = req.getSession();
                if (!rs.next()) {
                    // New user: insert into database and create a new session
                    PreparedStatement insertStmt = con.prepareStatement(
                            "INSERT INTO register (name, email) VALUES (?, ?)");
                    insertStmt.setString(1, name);
                    insertStmt.setString(2, email);
                    insertStmt.executeUpdate();
                    
                    // Set a session attribute for a new user
                    session.setAttribute("user", name);
                    session.setAttribute("email", email);
                    resp.setStatus(HttpServletResponse.SC_CREATED); // 201 Created

                } else {
                    // Existing user: set session attribute
                    session.setAttribute("user", name);
                    session.setAttribute("email", email);
                    resp.setStatus(HttpServletResponse.SC_OK); // 200 OK
                }

                con.close();
            } else {
                resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid ID token.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        }
    }
}
