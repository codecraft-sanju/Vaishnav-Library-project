<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Background Styling */
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            color: #333;
            padding: 1rem;
        }

        /* Form Container */
        .form-container {
            background-color: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
            transition: all 0.3s ease;
        }

        h2 {
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
            color: #4a4a4a;
            animation: slideIn 1s ease-in-out;
        }

        input[type="password"] {
            width: 100%;
            padding: 0.8rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        input[type="password"]:focus {
            border-color: #6e8efb;
            outline: none;
            box-shadow: 0 0 5px rgba(110, 142, 251, 0.4);
        }

        /* Button Styling */
        input[type="submit"] {
            background: #6e8efb;
            color: #fff;
            border: none;
            padding: 0.8rem 1.2rem;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background: #a777e3;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(167, 119, 227, 0.4);
        }

        /* Keyframes for Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive Styling */
        @media (max-width: 768px) {
            .form-container {
                padding: 1.5rem;
                max-width: 350px;
            }
            h2 {
                font-size: 1.6rem;
            }
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 1rem;
                max-width: 300px;
            }
            h2 {
                font-size: 1.4rem;
            }
            input[type="password"], input[type="submit"] {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Reset Password</h2>
        <form action="ResetPassword" method="post">
            <input type="hidden" name="email" value="${email}" />
            <label for="password" style="display:none;">New Password:</label>
            <input type="password" name="password" placeholder="Enter new password" required>
            <input type="submit" value="Reset Password">
        </form>
    </div>
</body>
</html>
