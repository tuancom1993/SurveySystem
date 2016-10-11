package com.surveysystem.model;

public class JsonMail {
	
	private String[] to;
	private String subject;
	private String content;
	private String linkSurveyStep;
	private String linkSurvey;
	
	
	public String getLinkSurveyStep() {
		return linkSurveyStep;
	}
	public void setLinkSurveyStep(String linkSurveyStep) {
		this.linkSurveyStep = linkSurveyStep;
	}
	public String getLinkSurvey() {
		return linkSurvey;
	}
	public void setLinkSurvey(String linkSurvey) {
		this.linkSurvey = linkSurvey;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String[] getTo() {
		return to;
	}
	public void setTo(String[] to) {
		this.to = to;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
