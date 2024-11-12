<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Attendance</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(135deg, #e0eafc, #cfdef3);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            width: 400px;
            position: relative;
            overflow: hidden;
            transition: transform 0.3s ease;
            animation: slideIn 0.5s ease-out;
        }

        @keyframes slideIn {
            from {
                transform: translateY(-20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
            font-size: 24px;
            position: relative;
        }

        h1::after {
            content: '';
            display: block;
            height: 4px;
            width: 50px;
            background: #007bff;
            margin: 10px auto;
            border-radius: 2px;
        }

        label {
            margin: 10px 0 5px;
            display: block;
            color: #555;
            font-weight: 600;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 2px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        button::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: rgba(255, 255, 255, 0.2);
            transform: translateX(-100%);
            transition: transform 0.4s ease;
            z-index: -1;
        }

        button:hover::after {
            transform: translateX(0);
        }

        button:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        button:active {
            transform: translateY(0);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2) inset;
        }

        @media (max-width: 500px) {
            .container {
                width: 90%;
            }

            h1 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Attendance Record</h1>
        <form action="AddAttendance" method="post">
            <label for="user_id">User ID:</label>
            <input type="number" name="user_id" required>
            
            <label for="name">Name:</label>
            <input type="text" name="name" required>
            
            <label for="date">Date:</label>
            <input type="date" name="date" required>
            
            <button type="submit">Add Attendance</button>
        </form>
    </div>
</body>
</html>
