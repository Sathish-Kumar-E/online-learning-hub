<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Instructor Home Page</title>
	    <meta charset="ISO-8859-1">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
	  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
	        .course-table {
	            margin-top: 2rem;
	        }
	        .create-course-form {
	            margin-top: 2rem;
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
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <table class="table course-table">
                    <thead>
                        <tr>
                            <th>Course Name</th>
                            <th>Description</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="course" items="${instructorCourses}">
                            <tr>
                                <td>${course.name}</td>
                                <td>${course.description}</td>
                                <td>
                                    <form method="GET" action="/instructor/courseContent/${course.id}">
                                        <button type="submit" class="btn btn-primary">View</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <div class="create-course-form">
                    <h2>Create New Course</h2>
                    <form method="POST" action="/instructor/addNewCourse">
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <input type="text" class="form-control" id="description" name="description" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Create Course</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
	</body>
</html>
