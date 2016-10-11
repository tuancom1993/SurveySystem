package com.surveysystem.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

public class JsonAnswer {

	private int idanswer;

	private String content;

	private int idquestion;

	public int getIdanswer() {
		return idanswer;
	}

	public void setIdanswer(int idanswer) {
		this.idanswer = idanswer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getIdquestion() {
		return idquestion;
	}

	public void setIdquestion(int idquestion) {
		this.idquestion = idquestion;
	}

	
}
