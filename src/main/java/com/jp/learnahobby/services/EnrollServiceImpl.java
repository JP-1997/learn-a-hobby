package com.jp.learnahobby.services;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jp.learnahobby.entities.Enrollment;
import com.jp.learnahobby.entities.Skill;
import com.jp.learnahobby.repos.EnrollmentRepository;
import com.jp.learnahobby.repos.SkillRepository;
import com.jp.learnahobby.util.PaymentUtility;

@Service
public class EnrollServiceImpl implements EnrollService {

	@Autowired
	SkillRepository skillRepository;
	
	@Autowired
	EnrollmentRepository enrollmentRepository;
	
	@Autowired
	PaymentUtility paymentUtility;
	
	@Transactional
	@Override
	public boolean enroll(String paymentGateway, Long skillId, Long userId) {
		Skill skill = skillRepository.findById(skillId).get();
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
			enrollmentRepository.save(enrollment);
			return true;
		}
		return false;
	}
	
	public Long getInstructorId(Long enrollmentId) {
		Enrollment enrollment = enrollmentRepository.findById(enrollmentId).get();
		return enrollment.getInstructorId();
	}

}
