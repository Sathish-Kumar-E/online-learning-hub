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

import com.example.pojo.UserRole;
import com.example.pojo.User;
import com.example.dao.UserDAO;
import com.example.dao.CourseDAO;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	@GetMapping("/")
	public String viewSignIn() {
		return "/user/Login";
	}
	
	@PostMapping("/validateLogin")
	public String validateLogin(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("user")User user, UserDAO userdao, CourseDAO coursedao, Model model) {
		String email = user.getEmail();
		String password = user.getPassword();
		User userFetched = userdao.validateLogin(email, password);
		if (userFetched != null) {
	        switch (userFetched.getUserRole().getId()) {
	            case 1:
	            	HttpSession sessionStudent = request.getSession();
	                sessionStudent.setAttribute("user", userFetched);
	                return "redirect:/student/course";
	            case 2:
	                HttpSession session = request.getSession();
	                session.setAttribute("user", userFetched);
	                model.addAttribute("instructorCourses", coursedao.getCoursesByInstructorId(userFetched.getId()));
	        		return "/instructor/InstructorHomePage";
	            default:
	            	return "/user/Login";
	        }
	    } else {
	    	return "/user/Login";
	    }
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session != null) {
	        session.invalidate();
	    }
		return "redirect:/user/";
	}
	
	@GetMapping("/viewRegisterStudent")
	public String viewRegisterStudent() {
		return "/user/StudentSignUp";
	}
	
	@GetMapping("/viewRegisterInstructor")
	public String viewRegisterInstructor() {
		return "/user/InstructorSignUp";
	}
	
	@PostMapping("/registerStudent")
	public String registerStudent(@ModelAttribute("user")User user, UserDAO userdao) {
		System.out.println("Reached Register Student Endpoint");
		UserRole userRole = new UserRole();
		userRole.setId(1);
		userRole.setName("Student");
		user.setUserRole(userRole);
		userdao.save(user);
		return "/user/Login";
	}
	
	@PostMapping("/registerInstructor")
	public String registerInstructor(@ModelAttribute("user")User user, UserDAO userdao) {
		System.out.println("Reached Register Instructor Endpoint");
		UserRole userRole = new UserRole();
		userRole.setId(2);
		userRole.setName("Instructor");
		user.setUserRole(userRole);
		userdao.save(user);
		return "/user/Login";
	}
	
}
