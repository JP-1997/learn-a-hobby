package com.jp.learnahobby.security.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	public void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests()
				.antMatchers("/showReg", "/", "/index.html", "/registerUser", "/showLogin", "/login", "/logout")
				.permitAll()
				.antMatchers("/showProfile", "/showEditProfile", "/updateProfile", "/showDeleteProfile",
						"/deleteProfile", "/showDashboard", "/showSkillDetails", "/showLearn", "/autocomplete",
						"/showTeach", "/addNewCourse", "/showEnroll", "/showCheckout", "/enroll", "/showTrainees",
						"/setCompleted", "/showEnrollments", "/contactInstructor", "/showCourses",
						"/enrollmentSuccessful", "/enrollmentUnsuccessful", "/showRateCourse", "/editMyCourse",
						"/updateCourse", "/deleteMyCourse", "/rateCourse")
				.hasAnyAuthority("USER").anyRequest().authenticated().and().formLogin().loginPage("/showLogin")
				.usernameParameter("email").passwordParameter("password").loginProcessingUrl("/performLogin")
				.successForwardUrl("/showDashboard").permitAll().and().logout().logoutUrl("/performLogout")
				.invalidateHttpSession(true).permitAll();
	}

	@Bean(name = BeanIds.AUTHENTICATION_MANAGER)
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}
}
