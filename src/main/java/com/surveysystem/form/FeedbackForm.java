package com.surveysystem.form;

import java.util.Date;

import javax.persistence.Lob;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

public class FeedbackForm {
	private int idfeedback;
	private String contact;
	private String content;
	private Date feedbackdate;
	private String name;
	public int getIdfeedback() {
		return idfeedback;
	}
	public void setIdfeedback(int idfeedback) {
		this.idfeedback = idfeedback;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getFeedbackdate() {
		return feedbackdate;
	}
	public void setFeedbackdate(Date feedbackdate) {
		this.feedbackdate = feedbackdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
