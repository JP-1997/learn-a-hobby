package com.jp.learnahobby.services;

public interface EnrollService {

	public boolean enroll(String paymentGateway, Long skillId, Long userId);
	
	public Long getInstructorId(Long enrollmentId);
}
