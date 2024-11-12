<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filtered Records</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            padding: 20px;
        }
        h1, h2 {
            color: #3a3f51;
            margin-bottom: 20px;
        }
        table {
            width: 90%;
            max-width: 800px;
            border-collapse: collapse;
            margin-bottom: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border-radius: 10px;
            animation: fadeIn 0.6s ease-in;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #3a3f51;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 14px;
        }
        tr {
            background-color: #ffffff;
            transition: background-color 0.3s ease;
        }
        tr:hover {
            background-color: #f1f1f5;
        }
        td {
            font-size: 14px;
            color: #555;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <h1>Filtered Records</h1>

    <%
        int month = Integer.parseInt(request.getParameter("month"));
        int year = Integer.parseInt(request.getParameter("year"));
    %>

    <!-- Filtered Registered Users Table -->
    <h2>Registered Users - <%= month %>/<%= year %></h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Date of Birth</th>
            <th>City</th>
        </tr>
        <%
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");
                 PreparedStatement pstmt = con.prepareStatement("SELECT * FROM register WHERE MONTH(dob) = ? AND YEAR(dob) = ?")) {

                pstmt.setInt(1, month);
                pstmt.setInt(2, year);
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getDate("dob") %></td>
            <td><%= rs.getString("city") %></td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<h3>Error fetching registered users: " + e.getMessage() + "</h3>");
            }
        %>
    </table>

    <!-- Filtered New Attendance Table -->
    <h2>New Attendance - <%= month %>/<%= year %></h2>
    <table>
        <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Name</th>
            <th>Date</th>
            <th>Status</th>
        </tr>
        <%
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");
                 PreparedStatement pstmt = con.prepareStatement("SELECT * FROM newattendance WHERE MONTH(date) = ? AND YEAR(date) = ?")) {

                pstmt.setInt(1, month);
                pstmt.setInt(2, year);
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getInt("user_id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getDate("date") %></td>
            <td><%= rs.getString("status") %></td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<h3>Error fetching new attendance records: " + e.getMessage() + "</h3>");
            }
        %>
    </table>
</body>
</html>
