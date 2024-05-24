package com.example.lab11;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"com.example.pojo","com.example.controller","com.example.dao"})
public class Lab11Application {
	
	public static void main(String[] args) {
		SpringApplication.run(Lab11Application.class, args);
	}
	
}
