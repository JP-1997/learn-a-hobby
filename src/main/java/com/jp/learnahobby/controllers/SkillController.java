package com.jp.learnahobby.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jp.learnahobby.entities.Skill;
import com.jp.learnahobby.repos.SkillRepository;

@Controller
public class SkillController {
	
	@Autowired
	SkillRepository skillRepository;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

	@RequestMapping("/showSkillDetails")
	public String showSkillDetails(@RequestParam("skillName") String skillName, ModelMap modelMap) {
		List<Skill> allSkills = skillRepository.findAllByName(skillName);
		for(Skill s : allSkills)
		LOGGER.info(s.toString());
		modelMap.addAttribute("allSkills", allSkills);
		return "skill/skillDetails";
	}
}
