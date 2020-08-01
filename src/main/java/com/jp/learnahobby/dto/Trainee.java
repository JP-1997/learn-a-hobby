package com.jp.learnahobby.dto;

public class Trainee {

	private Long enrollmentId;
	private Long skillId;
	private String skillName;
	private String traineeName;
	private String traineeEmail;
	private String traineePhoneNumber;
	private Boolean acquired;

	public String getSkillName() {
		return skillName;
	}

	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}

	public String getTraineeName() {
		return traineeName;
	}

	public void setTraineeName(String traineeName) {
		this.traineeName = traineeName;
	}

	public String getTraineeEmail() {
		return traineeEmail;
	}

	public void setTraineeEmail(String traineeEmail) {
		this.traineeEmail = traineeEmail;
	}

	public String getTraineePhoneNumber() {
		return traineePhoneNumber;
	}

	public void setTraineePhoneNumber(String traineePhoneNumber) {
		this.traineePhoneNumber = traineePhoneNumber;
	}

	public Boolean getAcquired() {
		return acquired;
	}

	public void setAcquired(Boolean acquired) {
		this.acquired = acquired;
	}

	public Long getSkillId() {
		return skillId;
	}

	public void setSkillId(Long skillId) {
		this.skillId = skillId;
	}

	public Long getEnrollmentId() {
		return enrollmentId;
	}

	public void setEnrollmentId(Long enrollmentId) {
		this.enrollmentId = enrollmentId;
	}

}
