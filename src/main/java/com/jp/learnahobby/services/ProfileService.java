package com.jp.learnahobby.services;

import com.jp.learnahobby.entities.User;

public interface ProfileService {
	
	public User updateProfile(User user, User newUser);
	
	public User fetchUser();
}
