package com.jp.learnahobby.services;

import java.util.List;

import com.jp.learnahobby.entities.Skill;

public interface SkillService {

	public List<String> getSkillName(String term);

	public List<String> fetchMySkills(Long userId);
	
	public Skill addCourse(String name, String description, Float fee, Long instructorId);
	
	public Skill updateCourse(Skill course);
}
