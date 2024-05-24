<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
	<title>Instructor Course Content</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
            margin-bottom: 20px;
        }
        .course-content h3 {
            margin-top: 0;
        }
        .delete-btn {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }
        .add-content-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .add-content-form input[type="text"] {
            width: 100%;
            margin-bottom: 10px;
            padding: 8px;
            border-radius: 3px;
            border: 1px solid #ced4da;
        }
        .add-content-form input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 3px;
            cursor: pointer;
        }
        .add-content-form input[type="submit"]:hover {
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
        <div class="row">
            <div class="col-md-6">
                <div class="course-content">
                    <c:forEach var="courseContent" items="${instructorCourseContent}">
                        <h4>${courseContent.topic}</h4>
                        <p>${courseContent.explanation}</p>
                        <form method="GET" action="/instructor/deleteCourseContent/${courseContent.id}">
                            <center><button type="submit" class="btn btn-danger delete-btn">Delete</button></center>
                        </form>
                        <br/>
                        <hr/>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-6">
                <div class="add-content-form">
                    <h3>Add New Course Content</h3>
                    <hr/>
                    <form method="GET" action="/instructor/addNewCourseContent/${courseId}">
                        <div class="form-group">
                            <label for="topic">Topic</label>
                            <input type="text" id="topic" name="topic" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="explanation">Explanation</label>
                            <input type="text" id="explanation" name="explanation" class="form-control" required>
                        </div>
                        <center><button type="submit" class="btn btn-primary">Create Course Content</button></center>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
