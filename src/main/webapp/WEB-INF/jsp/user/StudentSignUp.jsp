<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Student Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        header, footer {
            background-color: #a8dadc;
            text-align: center;
            padding: 10px 0;
        }

        form {
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"], input[type="password"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: block;
            margin: 0 auto; /* Centers the button */
            opacity: 0.5;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        input[type="submit"]:disabled {
            opacity: 0.5;
        }
    </style>
</head>
<body>
    <header>
        <h1>Student Registration</h1>
    </header>
    <div class="container">
        <form method="POST" action="registerStudent">
            <label for="firstName"><b>First Name</b></label>
            <input type="text" id="firstName" name="firstName" required><br>

            <label for="lastName"><b>Last Name</b></label>
            <input type="text" id="lastName" name="lastName" required><br>

            <label for="email"><b>Email</b></label>
            <input type="email" id="email" name="email" required><br>

            <label for="password"><b>Password</b></label>
            <input type="password" id="password" name="password" required><br>
            
            <center><input type="submit" value="Register"></center>
        </form>
    </div>
</body>
</html>
