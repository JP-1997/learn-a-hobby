package com.jp.learnahobby.services;

import com.jp.learnahobby.entities.User;

public interface SecurityService {

	boolean login(String username, String password);
	
	void assignRoleToUser(User user);
}
