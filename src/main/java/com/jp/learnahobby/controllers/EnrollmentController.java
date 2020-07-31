package com.jp.learnahobby.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jp.learnahobby.entities.Skill;
import com.jp.learnahobby.repos.SkillRepository;

@Controller
public class EnrollmentController {
	
	@Autowired
	SkillRepository skillRepository;

	@RequestMapping("/showEnroll")
	public String showEnroll(@RequestParam("skillId") Long skillId, ModelMap modelMap) {
		Skill skill = skillRepository.findById(skillId).get();
		modelMap.addAttribute("skill", skill);
		return "enrollment/showEnroll";
	}
}