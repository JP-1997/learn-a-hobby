package com.jp.learnahobby.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jp.learnahobby.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {

	User findByEmail(String email);
	
}
