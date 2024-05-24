<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Course</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding-top: 60px; /* Add padding to accommodate fixed navbar */
        }
        header {
            background-color: #007bff;
            color: #fff;
            padding: 1.5rem;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }
        header h4 {
            margin: 0;
            font-size: 1.5rem;
        }
        .logout-btn {
            text-align: right;
        }
        .container {
            margin-top: 80px; /* Adjust margin to avoid overlap with fixed navbar */
        }
        .course-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .course-content h3 {
            margin-top: 0;
        }
        .course-content p {
            margin-bottom: 0;
        }
        .course-content hr {
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <header>
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-md-11">
                    <h4>My Bootstrap Header</h4>
                </div>
                <div class="col-md-1 logout-btn">
                    <form method="GET" action="/user/logout">
                        <button type="submit" class="btn btn-light">Logout</button>
                    </form>
                </div>
            </div>
        </div>
    </header>
    
    <div class="container">
        <div class="course-content">
            <c:forEach var="courseContent" items="${studentCourseContent}">
                <h3>${courseContent.topic}</h3>
                <p>${courseContent.explanation}</p>
                <hr>
            </c:forEach>
        </div>
    </div>
</body>
</html>

