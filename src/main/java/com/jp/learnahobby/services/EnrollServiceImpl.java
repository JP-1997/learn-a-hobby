package com.jp.learnahobby.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jp.learnahobby.entities.Enrollment;
import com.jp.learnahobby.entities.Skill;
import com.jp.learnahobby.entities.User;
import com.jp.learnahobby.repos.EnrollmentRepository;
import com.jp.learnahobby.repos.SkillRepository;
import com.jp.learnahobby.repos.UserRepository;
import com.jp.learnahobby.util.PaymentUtility;

@Service
public class EnrollServiceImpl implements EnrollService {

	@Autowired
	SkillRepository skillRepository;
	
	@Autowired
	EnrollmentRepository enrollmentRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	PaymentUtility paymentUtility;
	
	@Transactional
	@Override
	public boolean enroll(String paymentGateway, Long skillId, Long userId) {
		Skill skill = skillRepository.findById(skillId).get();
		long studentsSoFar = skill.getStudentsSoFar() + 1;
		skill.setStudentsSoFar(studentsSoFar);
		String paymentDetails = paymentUtility.doPayment(paymentGateway, skill.getFee());
		if(paymentDetails != null) {
			Enrollment enrollment = new Enrollment();
			enrollment.setSkillId(skill.getId());
			enrollment.setSkillName(skill.getName());
			enrollment.setUserId(userId);
			enrollment.setInstructorId(skill.getInstructorId());
			enrollment.setInstructorName(skill.getInstructorName());
			enrollment.setDateEnrolled(new Date());			
			enrollment.setPaymentDetails(paymentDetails);
			enrollment.setAcquired(false);
			enrollment.setIsRated(false);
			enrollmentRepository.save(enrollment);
			skillRepository.save(skill);
			return true;
		}
		return false;
	}
	
	public Long getInstructorId(Long enrollmentId) {
		Enrollment enrollment = enrollmentRepository.findById(enrollmentId).get();
		return enrollment.getInstructorId();
	}

	@Override
	public String fetchInstructorContact(Long enrollmentId) {
		Enrollment enrollment = enrollmentRepository.findById(enrollmentId).get();
		Long instructorId = enrollment.getInstructorId();
		User instructor = userRepository.findById(instructorId).get();
		String instructorEmail = instructor.getEmail();
		return instructorEmail;
	}


}
