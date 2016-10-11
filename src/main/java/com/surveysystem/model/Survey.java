package com.surveysystem.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the survey database table.
 * 
 */
@Entity
@Table(name="survey")
@NamedQuery(name="Survey.findAll", query="SELECT s FROM Survey s")
public class Survey implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idsurvey;

	private String cover;

	@Temporal(TemporalType.DATE)
	private Date createdate;

	private int kindsurvey;

	private String maincolor;

	private int stopsurvey;

	@Lob
	private String surveydescribe;

	private String title;

	//bi-directional many-to-one association to Datasurvey
	@OneToMany(mappedBy="survey")
	private List<Datasurvey> datasurveys;

	//bi-directional many-to-one association to Question
	@OneToMany(mappedBy="survey")
	private List<Question> questions;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="iduser")
	private User user;

	public Survey() {
	}

	public int getIdsurvey() {
		return this.idsurvey;
	}

	public void setIdsurvey(int idsurvey) {
		this.idsurvey = idsurvey;
	}

	public String getCover() {
		return this.cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public Date getCreatedate() {
		return this.createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public int getKindsurvey() {
		return this.kindsurvey;
	}

	public void setKindsurvey(int kindsurvey) {
		this.kindsurvey = kindsurvey;
	}

	public String getMaincolor() {
		return this.maincolor;
	}

	public void setMaincolor(String maincolor) {
		this.maincolor = maincolor;
	}

	public int getStopsurvey() {
		return this.stopsurvey;
	}

	public void setStopsurvey(int stopsurvey) {
		this.stopsurvey = stopsurvey;
	}

	public String getSurveydescribe() {
		return this.surveydescribe;
	}

	public void setSurveydescribe(String surveydescribe) {
		this.surveydescribe = surveydescribe;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Datasurvey> getDatasurveys() {
		return this.datasurveys;
	}

	public void setDatasurveys(List<Datasurvey> datasurveys) {
		this.datasurveys = datasurveys;
	}

	public Datasurvey addDatasurvey(Datasurvey datasurvey) {
		getDatasurveys().add(datasurvey);
		datasurvey.setSurvey(this);

		return datasurvey;
	}

	public Datasurvey removeDatasurvey(Datasurvey datasurvey) {
		getDatasurveys().remove(datasurvey);
		datasurvey.setSurvey(null);

		return datasurvey;
	}

	public List<Question> getQuestions() {
		return this.questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public Question addQuestion(Question question) {
		getQuestions().add(question);
		question.setSurvey(this);

		return question;
	}

	public Question removeQuestion(Question question) {
		getQuestions().remove(question);
		question.setSurvey(null);

		return question;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}