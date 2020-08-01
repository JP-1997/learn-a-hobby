package com.jp.learnahobby.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jp.learnahobby.repos.SkillRepository;

@Service
public class SkillServiceImpl implements SkillService {

	@Autowired
	SkillRepository skillRepository;
	
	@Override
	public List<String> getSkillName(String term) {
		 return skillRepository.getSkillName(term);
	}

}
