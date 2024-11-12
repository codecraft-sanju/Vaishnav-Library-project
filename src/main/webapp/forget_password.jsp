<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password | Vaishnav Library</title>
    <style>
        /* Reset default margins and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        
        /* Background styling */
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            overflow: hidden;
        }
        
        /* Animation for background */
        body::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 10%, transparent 10.1%);
            background-size: 10% 10%;
            animation: movingBackground 20s linear infinite;
        }
        
        /* Card styling */
        .card {
            position: relative;
            background: #fff;
            border-radius: 12px;
            padding: 30px;
            max-width: 400px;
            width: 100%;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            z-index: 1;
            animation: fadeIn 1s ease;
        }
        
        .card h2 {
            margin-bottom: 20px;
            color: #333;
            font-size: 1.8em;
        }
        
        /* Form styling */
        .card label {
            font-size: 1em;
            color: #666;
            margin-bottom: 8px;
            display: block;
            text-align: left;
        }
        
        .card input[type="email"] {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0;
            border: 2px solid #ddd;
            border-radius: 8px;
            transition: border-color 0.3s ease;
        }
        
        .card input[type="email"]:focus {
            border-color: #6a11cb;
            outline: none;
        }
        
        .card input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            border: none;
            background: #6a11cb;
            color: #fff;
            font-weight: bold;
            font-size: 1em;
            cursor: pointer;
            border-radius: 8px;
            transition: background 0.3s ease, transform 0.1s ease;
        }
        
        .card input[type="submit"]:hover {
            background: #2575fc;
        }

        .card input[type="submit"]:active {
            transform: scale(0.98);
        }

        /* Background animation keyframe */
        @keyframes movingBackground {
            0% { transform: translate(0, 0); }
            100% { transform: translate(50px, 50px); }
        }

        /* Fade-in animation for the card */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Forgot Password</h2>
        <form action="ForgetPassword" method="post">
            <label for="email">Enter your registered email:</label>
            <input type="email" name="email" required>
            <input type="submit" value="Send Reset Link">
        </form>
    </div>
</body>
</html>
