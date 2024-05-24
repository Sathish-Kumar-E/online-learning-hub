package com.example.dao;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Environment;

import com.example.pojo.User;
import com.example.pojo.UserRole;
import com.example.pojo.Course;
import com.example.pojo.CourseContent;

public class DAO {
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                        .applySetting(Environment.DRIVER, "com.mysql.cj.jdbc.Driver")
                        .applySetting(Environment.URL, "jdbc:mysql://localhost:3306/olh")
                        .applySetting(Environment.USER, "root")
                        .applySetting(Environment.PASS, "MySQL123")
                        .applySetting(Environment.DIALECT, "org.hibernate.dialect.MySQLDialect")
                        .applySetting(Environment.SHOW_SQL, "true")
                        .applySetting(Environment.HBM2DDL_AUTO, "update")
                        .build();

                MetadataSources metadataSources = new MetadataSources(serviceRegistry);
                metadataSources.addAnnotatedClass(User.class);
                metadataSources.addAnnotatedClass(UserRole.class);
                metadataSources.addAnnotatedClass(Course.class);
                metadataSources.addAnnotatedClass(CourseContent.class);
                
                Metadata metadata = metadataSources.getMetadataBuilder().build();
                
                sessionFactory = metadata.getSessionFactoryBuilder().build();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return sessionFactory;
    }

}
