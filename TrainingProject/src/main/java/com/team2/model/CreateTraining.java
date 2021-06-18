package com.team2.model;

public class CreateTraining {

	private String course_id;
	private String course_name;
	private String description;
	private String status;
	private String date;
	private String startTime;

	private String endTime;
	private String instructor;
	
	
	
	
	
	
	
	
	
	
	
	public CreateTraining(String course_id, String course_name, String description, String status, String date,
			String startTime, String endTime, String instructor) {
		super();
		this.course_id = course_id;
		this.course_name = course_name;
		this.description = description;
		this.status = status;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.instructor = instructor;
	}






	public String getDate() {
		return date;
	}






	public String getInstructor() {
		return instructor;
	}






	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}










	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public void setDate(String date) {
		this.date = date;
	}


	public String getCourse_id() {
		return course_id;
	}

	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


}
