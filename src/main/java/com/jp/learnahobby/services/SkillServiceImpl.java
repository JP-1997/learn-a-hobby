package com.jp.learnahobby.services;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jp.learnahobby.entities.Skill;
import com.jp.learnahobby.entities.User;
import com.jp.learnahobby.repos.EnrollmentRepository;
import com.jp.learnahobby.repos.SkillRepository;
import com.jp.learnahobby.repos.UserRepository;

@Service
public class SkillServiceImpl implements SkillService {

	@Autowired
	SkillRepository skillRepository;
	
	@Autowired
	EnrollmentRepository enrollmentRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Override
	public List<String> getSkillName(String term) {
		 return skillRepository.getSkillName(term);
	}

	@Override
	public List<String> fetchMySkills(Long userId) {
		Set<String> skillSet = new HashSet<String>();
		List<String> mySkillsFromEnrollmentRepo = enrollmentRepository.fetchMySkills(userId);
		 for(String se : mySkillsFromEnrollmentRepo)
			 skillSet.add(se);
		 List<String> mySkillsFromSkillRepo = skillRepository.fetchMySkills(userId);
		 for(String ss : mySkillsFromSkillRepo)
			 skillSet.add(ss);
		 List<String> listOfSkills = new ArrayList<String>(skillSet);
		return listOfSkills;
	}

	@Override
	public Skill addCourse(String name, String description, Float fee, Long instructorId) {
		User instructor = userRepository.findById(instructorId).get();
		Skill skill = new Skill();
		skill.setName(name);
		skill.setDescription(description);
		skill.setInstructorId(instructor.getId());
		skill.setInstructorName(instructor.getFirstName() + " " + instructor.getLastName());
		skill.setFee(fee);
		skill.setRating(0.0f);
		skill.setStudentsSoFar(0L);
		return skillRepository.save(skill);
	}

	@Override
	public Skill updateCourse(Skill course) {
		Skill updatedCourse = skillRepository.findById(course.getId()).get();
		updatedCourse.setName(course.getName());
		updatedCourse.setDescription(course.getDescription());
		updatedCourse.setFee(course.getFee());
		return skillRepository.save(updatedCourse);
	}
	
	
	

}
