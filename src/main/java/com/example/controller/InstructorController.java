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
@RequestMapping(value = "/instructor")
public class InstructorController {
    
    @Autowired
    private CourseContentDAO courseContentDAO;

    @GetMapping("/course")
    public String viewInstructorHomePage(HttpServletRequest request, HttpServletResponse response, CourseDAO coursedao, Model model) {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        int instructorId = loggedInUser.getId();
        model.addAttribute("instructor", loggedInUser.getFirstName() + " " + loggedInUser.getLastName());
        model.addAttribute("instructorCourses", coursedao.getCoursesByInstructorId(instructorId));
        return "/instructor/InstructorHomePage";
    }
    
    @PostMapping("/addNewCourse")
    public String addNewCourse(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("course") Course course, CourseDAO coursedao, Model model) {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        course.setInstructor(loggedInUser);
        boolean result = coursedao.save(course);
        return "redirect:/instructor/course";
    }
    
    @GetMapping("/courseContent/{courseId}")
    public String viewCourseContent(@PathVariable("courseId") int courseId, Model model, HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        model.addAttribute("instructor", loggedInUser.getFirstName() + " " + loggedInUser.getLastName());
        model.addAttribute("courseId", courseId);
        model.addAttribute("instructorCourseContent", courseContentDAO.getByCourseId(courseId));
        return "/instructor/InstructorCourseContent";
    }
    
    @GetMapping("/deleteCourseContent/{courseContentId}")
    public String deleteCourseContent(@PathVariable("courseContentId") int courseContentId, Model model, HttpServletRequest request, HttpServletResponse response, CourseContentDAO courseContentdao) {
    	CourseContent cc = courseContentdao.deleteCourseContent(courseContentId);
        return "redirect:/instructor/courseContent/" + cc.getCourse().getId();
    }
    
    @GetMapping("/addNewCourseContent/{courseId}")
    public String addNewCourseContent(@PathVariable("courseId") int courseId, @ModelAttribute("courseContent") CourseContent courseContent, Model model, HttpServletRequest request, HttpServletResponse response, CourseContentDAO courseContentdao, CourseDAO coursedao) {
        courseContent.setCourse(coursedao.getCourseById(courseId));
    	courseContentdao.addCourseContent(courseContent);
    	System.out.println(courseContent);
        return "redirect:/instructor/courseContent/" + courseId;
    }
    
}
