package com.jp.learnahobby.services;

import java.util.List;

import com.jp.learnahobby.dto.Trainee;

public interface TrainingService {

	public List<Trainee> getTrainees(Long instructorId);
	
	public void markAsTrained(Long enrollmentId);
}
