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
import org.springframework.web.bind.annotation.ResponseBody;

import com.jp.learnahobby.entities.Skill;
import com.jp.learnahobby.entities.User;
import com.jp.learnahobby.repos.SkillRepository;
import com.jp.learnahobby.repos.UserRepository;
import com.jp.learnahobby.services.SkillService;

@Controller
public class SkillController {

	@Autowired
	SkillRepository skillRepository;

	@Autowired
	SkillService skillService;

	@Autowired
	UserRepository userRepository;

	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

	@RequestMapping("/showSkillDetails")
	public String showSkillDetails(@RequestParam("skillName") String skillName, @RequestParam("userId") Long userId,
			ModelMap modelMap) {
		List<Skill> allSkills = skillRepository.findAllByName(skillName);
		for (Skill s : allSkills)
			LOGGER.info(s.toString());
		modelMap.addAttribute("allSkills", allSkills);
		modelMap.addAttribute("userId", userId);
		return "skill/skillDetails";
	}

	@RequestMapping("/showLearn")
	public String showLearn() {
		return "skill/searchHobby";
	}

	@RequestMapping(value = "/autocomplete")
	@ResponseBody
	public List<String> autoName(@RequestParam(value = "term", required = false, defaultValue = "") String term) {
		List<String> skillNames = skillService.getSkillName(term);
		return skillNames;
	}

	@RequestMapping("/showTeach")
	public String showTeach(@RequestParam("userId") Long userId, ModelMap modelMap) {
		modelMap.addAttribute("instructorId", userId);
		return "skill/addNewCourse";
	}

	@RequestMapping(value = "/addNewCourse", method = RequestMethod.POST)
	public String addNewCourse(@RequestParam("name") String name, @RequestParam("description") String description,
			@RequestParam("fee") Float fee, @RequestParam("instructorId") Long instructorId, ModelMap modelMap) {
		User instructor = userRepository.findById(instructorId).get();
		Skill skill = new Skill();
		skill.setName(name);
		skill.setDescription(description);
		skill.setInstructorId(instructor.getId());
		skill.setInstructorName(instructor.getFirstName() + " " + instructor.getLastName());
		skill.setFee(fee);
		skill.setRating(0.0f);
		skill.setStudentsSoFar(0L);
		skillRepository.save(skill);
		return "skill/addCourseSuccessful";
	}
}
