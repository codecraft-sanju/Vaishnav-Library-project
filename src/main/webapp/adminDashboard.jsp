<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./Event/dashboard.css">
</head>
<body>
    <h1>Admin Dashboard</h1>

    <!-- Button to filter records by month and year -->
    <form action="filterAdmin.jsp" method="GET">
        <label for="month">Month:</label>
        <select id="month" name="month">
            <option value="1">January</option>
            <option value="2">February</option>
            <option value="3">March</option>
            <option value="4">April</option>
            <option value="5">May</option>
            <option value="6">June</option>
            <option value="7">July</option>
            <option value="8">August</option>
            <option value="9">September</option>
            <option value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
        </select>

        <label for="year">Year:</label>
        <select id="year" name="year">
            <option value="2024">2024</option>
            <option value="2025">2025</option>
        </select>

        <button type="submit">View Records</button>
    </form>

    <!-- Registered Users Table - Current Month -->
    <h2>Registered Users - Current Month</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Date of Birth</th>
            <th>City</th>
            <th>Action</th>
        </tr>
        <%
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");
                 PreparedStatement pstmt = con.prepareStatement("SELECT * FROM register WHERE MONTH(dob) = MONTH(CURRENT_DATE()) AND YEAR(dob) = YEAR(CURRENT_DATE())");
                 ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getDate("dob") %></td>
            <td><%= rs.getString("city") %></td>
            <td>
                <a href="EditUser?id=<%= rs.getInt("id") %>">Edit</a>
                <a href="DeleteUser?id=<%= rs.getInt("id") %>">Delete</a>
            </td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<h3>Error fetching registered users: " + e.getMessage() + "</h3>");
            }
        %>
    </table>

    <!-- Library Students Table - Current Month -->
    <h2>Library Students</h2>

    <!-- Button to open addAttendance.jsp -->
    <form action="addAttendance.jsp" method="GET" style="margin-bottom: 20px;">
        <button type="submit">Add New Attendance Record</button>
    </form>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Name</th>
            <th>Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");
                 PreparedStatement pstmt = con.prepareStatement("SELECT * FROM attendance WHERE MONTH(date) = MONTH(CURRENT_DATE()) AND YEAR(date) = YEAR(CURRENT_DATE())");
                 ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getInt("user_id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getDate("date") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
                <a href="editAttendance.jsp?id=<%= rs.getInt("id") %>">Edit</a>
                <a href="javascript:void(0);" onclick="confirmDeleteAttendance(<%= rs.getInt("id") %>);">Delete</a>
            </td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<h3>Error fetching attendance records: " + e.getMessage() + "</h3>");
            }
        %>
    </table>

    <!-- New Attendance Table - Current Month -->
    <h2>New Attendance - Current Month</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Name</th>
            <th>Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");
                 PreparedStatement pstmt = con.prepareStatement("SELECT * FROM newattendance WHERE MONTH(date) = MONTH(CURRENT_DATE()) AND YEAR(date) = YEAR(CURRENT_DATE())");
                 ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getInt("user_id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getDate("date") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
                <a href="editNewAttendance.jsp?id=<%= rs.getInt("id") %>">Edit</a>
                <a href="javascript:void(0);" onclick="confirmDeleteNewAttendance(<%= rs.getInt("id") %>);">Delete</a>
            </td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<h3>Error fetching new attendance records: " + e.getMessage() + "</h3>");
            }
        %>
    </table>

    <script>
        function confirmDeleteAttendance(id) {
            if (confirm("Are you sure you want to delete this attendance record?")) {
                window.location.href = "DeleteAttendance?id=" + id;
            }
        }

        function confirmDeleteNewAttendance(id) {
            if (confirm("Are you sure you want to delete this new attendance record?")) {
                window.location.href = "DeleteNewAttendance?id=" + id;
            }
        }
    </script>
</body>
</html>
