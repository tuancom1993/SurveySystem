package com.surveysystem.model;

import java.util.List;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class JsonQuestion {

	private int idquestion;

	private String contentquestion;

	private byte mandatory;

	private List<JsonAnswer> answers;

	private List<Answeruser> answerusers;

	private int idkindquestion;

	private int idsurvey;
	
	private int indexquestion;
	
	public int getIdquestion() {
		return idquestion;
	}

	public void setIdquestion(int idquestion) {
		this.idquestion = idquestion;
	}

	public String getContentquestion() {
		return contentquestion;
	}

	public void setContentquestion(String contentquestion) {
		this.contentquestion = contentquestion;
	}

	public byte getMandatory() {
		return mandatory;
	}

	public void setMandatory(byte mandatory) {
		this.mandatory = mandatory;
	}

	public List<JsonAnswer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<JsonAnswer> answers) {
		this.answers = answers;
	}

	public List<Answeruser> getAnswerusers() {
		return answerusers;
	}

	public void setAnswerusers(List<Answeruser> answerusers) {
		this.answerusers = answerusers;
	}

	public int getIdkindquestion() {
		return idkindquestion;
	}

	public void setIdkindquestion(int idkindquestion) {
		this.idkindquestion = idkindquestion;
	}

	public int getIdsurvey() {
		return idsurvey;
	}

	public void setIdsurvey(int idsurvey) {
		this.idsurvey = idsurvey;
	}

	public int getIndexquestion() {
		return indexquestion;
	}

	public void setIndexquestion(int indexquestion) {
		this.indexquestion = indexquestion;
	}


	
	
}
