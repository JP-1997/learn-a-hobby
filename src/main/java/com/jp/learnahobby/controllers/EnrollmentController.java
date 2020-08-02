package com.jp.learnahobby.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jp.learnahobby.dto.Trainee;
import com.jp.learnahobby.entities.Enrollment;
import com.jp.learnahobby.entities.Skill;
import com.jp.learnahobby.repos.EnrollmentRepository;
import com.jp.learnahobby.repos.SkillRepository;
import com.jp.learnahobby.services.EnrollService;
import com.jp.learnahobby.services.TrainingService;

@Controller
public class EnrollmentController {
	
	@Autowired
	SkillRepository skillRepository;
	
	@Autowired
	EnrollService enrollService;
	
	@Autowired
	TrainingService trainingService;
	
	@Autowired
	EnrollmentRepository enrollmentRepository;

	
	Long userId;

	private static final Logger LOGGER = LoggerFactory.getLogger(EnrollmentController.class);
	
	@RequestMapping("/showEnroll")
	public String showEnroll(@RequestParam("skillId") Long skillId, @RequestParam("userId") Long userId, ModelMap modelMap) {
		this.userId = userId;
		Skill skill = skillRepository.findById(skillId).get();
		modelMap.addAttribute("skill", skill);
		return "enrollment/showEnroll";
	}
	
	@RequestMapping("/showCheckout")
	public String showCheckout(@RequestParam("skillId") Long skillId, ModelMap modelMap) {
		Skill skill = skillRepository.findById(skillId).get();
		modelMap.addAttribute("skill", skill);
		return "enrollment/payment";
	}
	
	@RequestMapping("/enroll")
	public String enroll(@RequestParam("skillId") Long skillId, @RequestParam("paymentGateway") String paymentGateway, ModelMap modelMap) {
		boolean isEnrolled = enrollService.enroll(paymentGateway, skillId, userId);
		if(isEnrolled) {
			return "enrollment/enrollmentSuccessful";
		}
		else {
			return "enrollment/enrollmentUnsuccessful";			
		}
	}
	
	@RequestMapping("/showTrainees")
	public String showTrainees(@RequestParam("userId") Long userId, ModelMap modelMap) {
		List<Trainee> trainees = trainingService.getTrainees(userId);
		modelMap.addAttribute("trainees", trainees);
		return "enrollment/showTrainees";
	}
	
	@RequestMapping(value = "/setCompleted", method = RequestMethod.POST)
	public String setCompleted(@RequestParam("enrollmentId") Long enrollmentId, ModelMap modelMap) {
		LOGGER.info("enroll id" + enrollmentId.toString());
		trainingService.markAsTrained(enrollmentId);
		Long instructorId = enrollService.getInstructorId(enrollmentId);
		List<Trainee> trainees = trainingService.getTrainees(instructorId);
		modelMap.addAttribute("trainees", trainees);
		return "enrollment/showTrainees";
	}
	
	@RequestMapping("/showEnrollments")
	public String showEnrollments(@RequestParam("userId") Long userId, ModelMap modelMap) {
		List<Enrollment> enrollments = enrollmentRepository.findAllByUserId(userId);
		modelMap.addAttribute("enrollments", enrollments);
		return "enrollment/enrollments";
	}
	
	@RequestMapping("/contactInstructor")
	public String contactInstructor(@RequestParam("enrollmentId") Long enrollmentId, ModelMap modelMap) {
		String instructorContact = enrollService.fetchInstructorContact(enrollmentId);
		modelMap.addAttribute("instructorContactDetails", instructorContact);
		return "enrollment/contactInstructor";
	}
	
}
