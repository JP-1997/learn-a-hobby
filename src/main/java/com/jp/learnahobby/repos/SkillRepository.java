package com.jp.learnahobby.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.jp.learnahobby.entities.Skill;

public interface SkillRepository extends JpaRepository<Skill, Long> {

	@Query(value = "Select distinct s.name from skill s group by s.name order by s.students_so_far desc limit 5", nativeQuery = true)
	List<String> fetchTrendingSkills();
}
