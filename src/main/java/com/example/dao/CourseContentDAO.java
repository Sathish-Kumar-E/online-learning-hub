package com.example.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.hibernate.query.Query;

import com.example.pojo.Course;
import com.example.pojo.UserRole;
import com.example.pojo.User;
import com.example.pojo.CourseContent;

@Repository
public class CourseContentDAO {
	
	public List<CourseContent> getByCourseId(int courseId) {
	    try {
	        Session session = DAO.getSessionFactory().openSession();
	        Query<CourseContent> query = session.createQuery("FROM CourseContent WHERE course.id = :courseId", CourseContent.class);
	        query.setParameter("courseId", courseId);
	        return query.getResultList();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	public CourseContent deleteCourseContent(int courseContentId) {
	    try {
	    	Session session = DAO.getSessionFactory().openSession();
	        CourseContent courseContent = session.get(CourseContent.class, courseContentId);
	        if (courseContent != null) {
	        	session.beginTransaction();
	            session.remove(courseContent);
	            session.getTransaction().commit();
	        }
	        return courseContent;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	public boolean addCourseContent(CourseContent courseContent) {
	    try {
	        Session session = DAO.getSessionFactory().openSession();
	        session.beginTransaction();
            session.persist(courseContent);
            session.getTransaction().commit();
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
}
