package com.jp.learnahobby.services;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.jp.learnahobby.entities.Role;
import com.jp.learnahobby.entities.User;
import com.jp.learnahobby.repos.RoleRepository;
import com.jp.learnahobby.repos.UserRepository;

@Service
public class SecurityServiceImpl implements SecurityService {

	@Autowired
	UserDetailsService userDetailsService;

	@Autowired
	AuthenticationManager authenticationManager;
	
	@Autowired
	RoleRepository roleRepository;
	
	@Autowired
	UserRepository userRepository;

	@Override
	public boolean login(String username, String password) {
		UserDetails userDetails = userDetailsService.loadUserByUsername(username);
		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(userDetails, password,
				userDetails.getAuthorities());
		authenticationManager.authenticate(token);
		boolean result = token.isAuthenticated();
		if (result) {
			SecurityContextHolder.getContext().setAuthentication(token);
		}
		return result;
	}

	@Override
	public void assignRoleToUser(User user) {
		Role role = roleRepository.findByName("USER");
		Set<Role> roles = new HashSet<Role>();
		roles.add(role);
		user.setRoles(roles);
		userRepository.save(user);
	}

}
