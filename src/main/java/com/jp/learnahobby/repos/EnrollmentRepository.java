package com.jp.learnahobby.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jp.learnahobby.entities.Enrollment;

public interface EnrollmentRepository extends JpaRepository<Enrollment, Long> {

}
