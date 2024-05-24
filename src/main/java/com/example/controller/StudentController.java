package com.example.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.dao.UserDAO;
import com.example.dao.CourseDAO;
import com.example.dao.CourseContentDAO;
import com.example.pojo.Course;
import com.example.pojo.User;
import com.example.pojo.CourseContent;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	
	@GetMapping("/course")
	public String viewStudentCourse(Model model, HttpServletRequest request, HttpServletResponse response, CourseDAO coursedao) {
		model.addAttribute("studentCourses", coursedao.getAllCourses());
		return "/student/studentCourse";
	}
	
	@GetMapping("/courseContent/{courseId}")
	public String viewStudentCourseContent(@PathVariable("courseId") int courseId, Model model, HttpServletRequest request, HttpServletResponse response, CourseContentDAO coursecontentdao) {
		model.addAttribute("studentCourseContent", coursecontentdao.getByCourseId(courseId));
		return "/student/studentCourseContent";
	}
	
}
