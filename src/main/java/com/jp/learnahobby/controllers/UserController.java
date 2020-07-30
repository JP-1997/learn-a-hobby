package com.jp.learnahobby.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jp.learnahobby.entities.Enrollment;
import com.jp.learnahobby.entities.User;
import com.jp.learnahobby.repos.EnrollmentRepository;
import com.jp.learnahobby.repos.SkillRepository;
import com.jp.learnahobby.repos.UserRepository;

@Controller
public class UserController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	EnrollmentRepository enrollmentRepository;

	@Autowired
	SkillRepository skillRepository;
	
	private User user;

	@RequestMapping("/showReg")
	public String showRegistration() {
		return "login/register";
	}

	@RequestMapping(value = "registerUser", method = RequestMethod.POST)
	public String register(@ModelAttribute("user") User user) {
		userRepository.save(user);
		return "login/login";
	}

	@RequestMapping("/showLogin")
	public String showLoginPage() {
		return "login/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("email") String email, @RequestParam("password") String password,
			ModelMap modelMap) {
		user = userRepository.findByEmail(email);
		if (password.equals(user.getPassword())) {
			List<String> trendingSkills = skillRepository.fetchTrendingSkills();
			modelMap.addAttribute("trendingSkills", trendingSkills);
			List<String> mySkills = enrollmentRepository.fetchMySkills(user.getId());
			modelMap.addAttribute("mySkills", mySkills);
			return "dashboard";
		} else {
			modelMap.addAttribute("msg", "Invalid username or password. Please try again");
		}
		return "login/login";
	}
	
	@RequestMapping("/showProfile")
	public String showInstructorProfile(ModelMap modelMap) {
		modelMap.addAttribute("userDetails", user);
		return "profile/showProfile";
	}
	
	@RequestMapping("/showEditProfile")
	public String showEditProfile(ModelMap modelMap) {
		modelMap.addAttribute("userDetails", user);
		return "profile/editProfile";
	}
}
