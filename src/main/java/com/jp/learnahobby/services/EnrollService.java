package com.jp.learnahobby.services;

import java.util.List;

import com.jp.learnahobby.entities.Enrollment;

public interface EnrollService {

	public boolean enroll(String paymentGateway, Long skillId, Long userId);
	
	public Long getInstructorId(Long enrollmentId);
	
	public String fetchInstructorContact(Long enrollmentId);
	
	public List<Enrollment> findAllEnrollmentsByUserId(Long userId);
	
	public Enrollment findEnrollmentById(Long enrollmentId);
	
}
