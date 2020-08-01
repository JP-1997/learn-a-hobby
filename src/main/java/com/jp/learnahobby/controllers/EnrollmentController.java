package com.jp.learnahobby.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jp.learnahobby.entities.Skill;
import com.jp.learnahobby.repos.SkillRepository;
import com.jp.learnahobby.services.EnrollService;

@Controller
public class EnrollmentController {
	
	@Autowired
	SkillRepository skillRepository;
	
	@Autowired
	EnrollService enrollService;
	
	Long userId;

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
	
	
}
