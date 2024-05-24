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
        }
        header {
            background-color: #007bff;
            color: #fff;
            padding: 1.5rem;
            text-align: center;
        }
        header h4 {
            margin: 0;
            font-size: 1.5rem;
        }
        .logout-btn {
            text-align: right;
        }
        .container {
            margin-top: 20px;
        }
        .course-table {
            width: 100%;
            border-collapse: collapse;
        }
        .course-table th,
        .course-table td {
            padding: 8px;
            border: 1px solid #dee2e6;
        }
        .course-table th {
            background-color: #007bff;
            color: #fff;
        }
        .course-table tbody tr:nth-child(odd) {
            background-color: #f8f9fa;
        }
        .course-table tbody tr:hover {
            background-color: #e9ecef;
        }
        .action-btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
        }
        .action-btn:hover {
            background-color: #0056b3;
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
        <table class="course-table">
            <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Description</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="course" items="${studentCourses}">
                    <tr>
                        <td>${course.name}</td>
                        <td>${course.description}</td>
                        <td>
                            <form method="GET" action="/student/courseContent/${course.id}">
                                <button type="submit" class="btn action-btn">View</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>

