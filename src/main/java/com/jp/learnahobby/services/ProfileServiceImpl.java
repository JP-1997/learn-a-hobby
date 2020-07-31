package com.jp.learnahobby.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jp.learnahobby.entities.User;
import com.jp.learnahobby.repos.UserRepository;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	UserRepository userRepository;

	@Override
	public User updateProfile(User user, User newUser) {
		user.setFirstName(newUser.getFirstName());
		user.setLastName(newUser.getLastName());
		user.setDateOfBirth(newUser.getDateOfBirth());
		user.setGender(newUser.getGender());
		user.setCountry(newUser.getCountry());
		user.setPhoneNumber(newUser.getPassword());
		User updatedUser = userRepository.save(user);
		return updatedUser;
	}
	
	

}
