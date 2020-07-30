package com.jp.learnahobby.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jp.learnahobby.entities.Skill;

public interface SkillRepository extends JpaRepository<Skill, Long> {

}
