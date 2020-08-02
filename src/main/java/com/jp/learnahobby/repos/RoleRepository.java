package com.jp.learnahobby.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jp.learnahobby.entities.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

	Role findByName(String string);

}
