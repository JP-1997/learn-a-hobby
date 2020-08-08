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
import com.jp.learnahobby.entities.User;
import com.jp.learnahobby.services.EnrollService;
import com.jp.learnahobby.services.ProfileService;
import com.jp.learnahobby.services.SkillService;
import com.jp.learnahobby.services.TrainingService;

@Controller
public class EnrollmentController {
	
	@Autowired
	EnrollService enrollService;
	
	@Autowired
	TrainingService trainingService;
	
	@Autowired
	ProfileService profileService;
	
	@Autowired
	SkillService skillService;

	private static final Logger LOGGER = LoggerFactory.getLogger(EnrollmentController.class);
	
	@RequestMapping("/showEnroll")
	public String showEnroll(@RequestParam("skillId") Long skillId, ModelMap modelMap) {
		User user = profileService.fetchUser();
		Skill skill = skillService.findSkillById(skillId);
		modelMap.addAttribute("skill", skill);
		return "enrollment/showEnroll";
	}
	
	@RequestMapping("/showCheckout")
	public String showCheckout(@RequestParam("skillId") Long skillId, ModelMap modelMap) {
		Skill skill = skillService.findSkillById(skillId);
		if(skill.getFee() == 0.0) {
			User user = profileService.fetchUser();
			String paymentGateway = "No payment";
			boolean isEnrolled = enrollService.enroll(paymentGateway, skillId, user.getId());
			if(isEnrolled) {
				return "redirect:/enrollmentSuccessful";
			}
			else {
				return "redirect:/enrollmentUnsuccessful";			
			}
		}
		modelMap.addAttribute("skill", skill);
		return "enrollment/payment";
	}
	
	
	@RequestMapping(value= "/enroll", method = RequestMethod.POST)
	public String enroll(@RequestParam("skillId") Long skillId, @RequestParam("paymentGateway") String paymentGateway, ModelMap modelMap) {
		User user = profileService.fetchUser();
		boolean isEnrolled = enrollService.enroll(paymentGateway, skillId, user.getId());
		if(isEnrolled) {
			return "redirect:/enrollmentSuccessful";
		}
		else {
			return "redirect:/enrollmentUnsuccessful";			
		}
	}
	
	@RequestMapping("/enrollmentSuccessful")
	public String enrollmentSuccessful(){
		return "enrollment/enrollmentSuccessful";
	}
	
	@RequestMapping("/enrollmentUnsuccessful")
	public String enrollmentUnsuccessful(){
		return "enrollment/enrollmentUnsuccessful";
	}
	
	@RequestMapping("/showTrainees")
	public String showTrainees(ModelMap modelMap) {
		User user = profileService.fetchUser();
		List<Trainee> trainees = trainingService.getTrainees(user.getId());
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
	public String showEnrollments(ModelMap modelMap) {
		User user = profileService.fetchUser();
		List<Enrollment> enrollments = enrollService.findAllEnrollmentsByUserId(user.getId());
		modelMap.addAttribute("enrollments", enrollments);
		return "enrollment/enrollments";
	}
	
	@RequestMapping(value = "/contactInstructor", method = RequestMethod.POST)
	public String contactInstructor(@RequestParam("enrollmentId") Long enrollmentId, ModelMap modelMap) {
		String instructorContact = enrollService.fetchInstructorContact(enrollmentId);
		modelMap.addAttribute("instructorContactDetails", instructorContact);
		return "enrollment/contactInstructor";
	}
	
	
	@RequestMapping(value = "/showRateCourse", method = RequestMethod.POST)
	public String rateCourse(@RequestParam("enrollmentId") Long enrollmentId, ModelMap modelMap) {
		Enrollment enrollment = enrollService.findEnrollmentById(enrollmentId);
		Skill skill = skillService.findSkillById(enrollment.getSkillId());
		modelMap.addAttribute("course", skill);
		modelMap.addAttribute("enrollmentId", enrollmentId);
		return "enrollment/rateCourse";
	}

}
