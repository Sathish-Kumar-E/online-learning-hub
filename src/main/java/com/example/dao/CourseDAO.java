package com.example.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.example.pojo.Course;
import com.example.pojo.UserRole;
import com.example.pojo.User;

@Repository
public class CourseDAO {
	
	public Course getCourseById(int courseId) {
	    try {
	        Session session = DAO.getSessionFactory().openSession();
	        Query<Course> query = session.createQuery("FROM Course WHERE id = :courseId", Course.class);
	        query.setParameter("courseId", courseId);
	        return query.uniqueResult();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	public List<Course> getAllCourses() {
	    try {
	        Session session = DAO.getSessionFactory().openSession();
	        Query<Course> query = session.createQuery("FROM Course", Course.class);
	        return query.getResultList();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	public boolean save(Course course) {
    	System.out.println("Course DAO reacher");
        try {
        	Session session = DAO.getSessionFactory().openSession();
            session.beginTransaction();
            session.persist(course);
            session.getTransaction().commit();
            return true;
        } catch(Exception e) {
        	e.printStackTrace();
        	return false;
        }
    }
	
	 public List<Course> getCoursesByInstructorId(int instructorId) {
		 try {
			 Session session = DAO.getSessionFactory().openSession();
			 Query<Course> query = session.createQuery("FROM Course WHERE instructor.id = :instructorId", Course.class);
	            query.setParameter("instructorId", instructorId);
	            return query.getResultList();
	     } catch (Exception e) {
	         e.printStackTrace();
	         return null;
	     }
	 }
	 
}
