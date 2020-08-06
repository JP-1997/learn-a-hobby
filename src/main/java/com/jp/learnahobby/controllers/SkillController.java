package com.jp.learnahobby.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jp.learnahobby.entities.Skill;
import com.jp.learnahobby.entities.User;
import com.jp.learnahobby.repos.SkillRepository;
import com.jp.learnahobby.repos.UserRepository;
import com.jp.learnahobby.services.ProfileService;
import com.jp.learnahobby.services.SkillService;

@Controller
public class SkillController {

	@Autowired
	SkillRepository skillRepository;

	@Autowired
	SkillService skillService;

	@Autowired
	UserRepository userRepository;

	@Autowired
	ProfileService profileService;

	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

	@RequestMapping("/showSkillDetails")
	public String showSkillDetails(@RequestParam("skillName") String skillName, ModelMap modelMap) {
		User user = profileService.fetchUser();
		List<Skill> allSkills = skillRepository.findAllByName(skillName);
		for (Skill s : allSkills)
			LOGGER.info(s.toString());
		modelMap.addAttribute("allSkills", allSkills);
		modelMap.addAttribute("userId", user.getId());
		return "skill/skillDetails";
	}

	@RequestMapping("/showLearn")
	public String showLearn(ModelMap modelMap) {
		User user = profileService.fetchUser();
		modelMap.addAttribute("userId", user.getId());
		return "skill/searchHobby";
	}

	@RequestMapping(value = "/autocomplete")
	@ResponseBody
	public List<String> autoName(@RequestParam(value = "term", required = false, defaultValue = "") String term) {
		List<String> skillNames = skillService.getSkillName(term);
		return skillNames;
	}

	@RequestMapping("/showTeach")
	public String showTeach(ModelMap modelMap) {
		User user = profileService.fetchUser();
		modelMap.addAttribute("instructorId", user.getId());
		return "skill/addNewCourse";
	}

	@RequestMapping(value = "/addNewCourse", method = RequestMethod.POST)
	public String addNewCourse(@RequestParam("name") String name, @RequestParam("description") String description,
			@RequestParam("fee") Float fee, ModelMap modelMap) {
		User user = profileService.fetchUser();
		skillService.addCourse(name, description, fee, user.getId());
		return "redirect:/addCourseSuccessful";
	}
	
	@RequestMapping("/addCourseSuccessful")
	public String addCourseSuccessfull() {
		return "skill/addCourseSuccessful";
	}

	@RequestMapping("/showCourses")
	public String showCourses(ModelMap modelMap) {
		User user = profileService.fetchUser();
		List<Skill> myCourses = skillRepository.findAllByInstructorId(user.getId());
		modelMap.addAttribute("myCourses", myCourses);
		return "skill/myCourses";
	}

	@RequestMapping(value = "/editMyCourse")
	public String editMyCourse(@RequestParam("courseId") Long skillId, ModelMap modelMap) {
		User user = profileService.fetchUser();
		Skill course = skillRepository.findById(skillId).get();
		if (course.getInstructorId() == user.getId()) {
			modelMap.addAttribute("course", course);
			return "skill/editMyCourse";
		}
		return "redirect:/showCourses";
	}

	@RequestMapping(value = "/updateCourse", method = RequestMethod.POST)
	public String updateCourse(@ModelAttribute("skill") Skill course, ModelMap modelMap) {
		skillService.updateCourse(course);
		return "redirect:/showCourses";
	}

	@RequestMapping(value = "/deleteMyCourse")
	public String deleteMyCourse(@RequestParam("courseId") Long skillId, ModelMap modelMap) {
		User user = profileService.fetchUser();
		Skill course = skillRepository.findById(skillId).get();
		if (course.getInstructorId() == user.getId()) {
			skillRepository.deleteById(skillId);
		}
		return "redirect:/showCourses";
	}

	@RequestMapping(value = "/rateCourse", method = RequestMethod.POST)
	public String rateCourse(@RequestParam("star") Long ratingStar, @RequestParam("skillId") Long skillId,
			@RequestParam("enrollmentId") Long enrollmentId) {
		skillService.rateCourse(ratingStar, skillId, enrollmentId);
		return "redirect:/showEnrollments";
	}
}
