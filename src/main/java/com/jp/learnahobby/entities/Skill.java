package com.jp.learnahobby.entities;

import javax.persistence.Entity;

@Entity
public class Skill extends AbstractEntity {

	private String name;
	private String description;
	private Long instructorId;
	private String instructorName;
	private Float fee;
	private Float rating;
	private Long studentsSoFar;
	private Long usersRated;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getInstructorId() {
		return instructorId;
	}

	public void setInstructorId(Long instructorId) {
		this.instructorId = instructorId;
	}

	public Float getFee() {
		return fee;
	}

	public void setFee(Float fee) {
		this.fee = fee;
	}

	public Float getRating() {
		return rating;
	}

	public void setRating(Float rating) {
		this.rating = rating;
	}

	public Long getStudentsSoFar() {
		return studentsSoFar;
	}

	public void setStudentsSoFar(Long studentsSoFar) {
		this.studentsSoFar = studentsSoFar;
	}

	@Override
	public String toString() {
		return "Skill [name=" + name + ", description=" + description + ", instructorId=" + instructorId + ", fee="
				+ fee + ", rating=" + rating + ", studentsSoFar=" + studentsSoFar + "]";
	}

	public String getInstructorName() {
		return instructorName;
	}

	public void setInstructorName(String instructorName) {
		this.instructorName = instructorName;
	}

	public Long getUsersRated() {
		return usersRated;
	}

	public void setUsersRated(Long usersRated) {
		this.usersRated = usersRated;
	}

}
