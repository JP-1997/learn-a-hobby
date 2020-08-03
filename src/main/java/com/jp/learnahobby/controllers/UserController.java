package com.jp.learnahobby.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jp.learnahobby.entities.User;
import com.jp.learnahobby.repos.EnrollmentRepository;
import com.jp.learnahobby.repos.SkillRepository;
import com.jp.learnahobby.repos.UserRepository;
import com.jp.learnahobby.services.ProfileService;
import com.jp.learnahobby.services.SecurityService;
import com.jp.learnahobby.services.SkillService;

@Controller
public class UserController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	EnrollmentRepository enrollmentRepository;

	@Autowired
	SkillRepository skillRepository;

	@Autowired
	ProfileService profileService;

	@Autowired
	SkillService skillService;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Autowired
	private SecurityService securityService;

	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

	@RequestMapping("/showReg")
	public String showRegistration() {
		return "login/register";
	}

	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public String register(@ModelAttribute("user") User user) {
		user.setPassword(encoder.encode(user.getPassword()));
		userRepository.save(user);
		securityService.assignRoleToUser(user);
		return "login/login";
	}

	@RequestMapping("/showLogin")
	public String showLoginPage() {
		return "login/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("email") String email, @RequestParam("password") String password,
			ModelMap modelMap) {
		
		boolean loginResponse = securityService.login(email, password);
		if (loginResponse) {
			User user = profileService.fetchUser();
			List<String> trendingSkills = skillRepository.fetchTrendingSkills();
			modelMap.addAttribute("trendingSkills", trendingSkills);
			List<String> mySkills = skillService.fetchMySkills(user.getId());
			modelMap.addAttribute("mySkills", mySkills);
			return "dashboard";
		} else {
			modelMap.addAttribute("msg", "Invalid username or password. Please try again");
		}
		return "login/login";
	}

	@RequestMapping("/showProfile")
	public String showInstructorProfile(ModelMap modelMap) {
		User user = profileService.fetchUser();
		modelMap.addAttribute("userDetails", user);
		return "profile/showProfile";
	}

	@RequestMapping("/showEditProfile")
	public String showEditProfile(ModelMap modelMap) {
		User user = profileService.fetchUser();
		modelMap.addAttribute("userDetails", user);
		return "profile/editProfile";
	}

	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("user") User user1, ModelMap modelMap) {
		LOGGER.info(user1.toString());
		User user = profileService.fetchUser();
		User updateUser = profileService.updateProfile(user, user1);
		modelMap.addAttribute("userDetails", updateUser);
		return "profile/showProfile";
	}

	@RequestMapping("/showDeleteProfile")
	public String showDeleteProfile() {
		return "profile/deleteProfile";
	}

	@RequestMapping("/deleteProfile")
	public String deleteProfile() {
		User user = profileService.fetchUser();
		userRepository.deleteById(user.getId());
		return "profile/deletedSuccessfully";
	}

	@RequestMapping("/showDashboard")
	public String showDashboard(ModelMap modelMap) {
		User user = profileService.fetchUser();
		List<String> trendingSkills = skillRepository.fetchTrendingSkills();
		modelMap.addAttribute("trendingSkills", trendingSkills);
		List<String> mySkills = skillService.fetchMySkills(user.getId());
		modelMap.addAttribute("mySkills", mySkills);
		modelMap.addAttribute("userId", user.getId());
		return "dashboard";
	}

	@RequestMapping("/logout_wya")
	public String logout() {
		SecurityContextHolder.getContext().setAuthentication(null);
		return "login/login";
	}

}
