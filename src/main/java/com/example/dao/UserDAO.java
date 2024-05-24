package com.example.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.example.pojo.UserRole;
import com.example.pojo.User;

@Repository
public class UserDAO {
	
	public void save(User user) {
    	System.out.println("User DAO reacher");
        Session session = DAO.getSessionFactory().openSession();
        session.beginTransaction();
        session.persist(user);
        session.getTransaction().commit();
    }
	
	public User validateLogin(String email, String password) {
		Session session = DAO.getSessionFactory().openSession();
		User user = (User) session.createQuery("FROM User WHERE email = :email AND password = :password")
                .setParameter("email", email)
                .setParameter("password", password)
                .uniqueResult();
		return user;
	}
	
}
