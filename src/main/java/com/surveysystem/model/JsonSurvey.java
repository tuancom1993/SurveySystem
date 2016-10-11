package com.surveysystem.model;

import java.util.Date;
import java.util.List;

import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

public class JsonSurvey {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idsurvey;

	private String cover;

	private String createdate;

	private String describe;

	private String maincolor;

	private byte stop;

	private String title;

	private List<JsonQuestion> questions;

	private int iduser;
	
	private int idTemplate;
	
	private int kindsurvey;
	

	public int getIdTemplate() {
		return idTemplate;
	}

	public void setIdTemplate(int idTemplate) {
		this.idTemplate = idTemplate;
	}

	public int getIdsurvey() {
		return idsurvey;
	}

	public void setIdsurvey(int idsurvey) {
		this.idsurvey = idsurvey;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}


	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getMaincolor() {
		return maincolor;
	}

	public void setMaincolor(String maincolor) {
		this.maincolor = maincolor;
	}

	public byte getStop() {
		return stop;
	}

	public void setStop(byte stop) {
		this.stop = stop;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<JsonQuestion> getQuestions() {
		return questions;
	}

	public void setQuestions(List<JsonQuestion> questions) {
		this.questions = questions;
	}

	public int getIduser() {
		return iduser;
	}

	public void setIduser(int iduser) {
		this.iduser = iduser;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public int getKindsurvey() {
		return kindsurvey;
	}

	public void setKindsurvey(int kindsurvey) {
		this.kindsurvey = kindsurvey;
	}
	
	
}
