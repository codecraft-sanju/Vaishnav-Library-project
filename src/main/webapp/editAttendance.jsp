<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Attendance</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Edit Attendance</h1>
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "Sanju@098");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM attendance WHERE id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
    %>
    <form action="UpdateAttendance" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
        <label for="user_id">User ID:</label>
        <input type="text" name="user_id" value="<%= rs.getInt("user_id") %>" readonly>
        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= rs.getString("name") %>" readonly>
        <label for="date">Date:</label>
        <input type="date" name="date" value="<%= rs.getDate("date") %>">
        <label for="status">Status:</label>
        <select name="status">
            <option value="Present" <%= rs.getString("status").equals("Present") ? "selected" : "" %>>Present</option>
            <option value="Absent" <%= rs.getString("status").equals("Absent") ? "selected" : "" %>>Absent</option>
        </select>
        <button type="submit">Update</button>
    </form>
    <%
        }
        con.close();
    %>
</body>
</html>
