package com.surveysystem.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the datasurvey database table.
 * 
 */
@Entity
@Table(name="datasurvey")
@NamedQuery(name="Datasurvey.findAll", query="SELECT d FROM Datasurvey d")
public class Datasurvey implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int iddatasurvey;

	@Temporal(TemporalType.DATE)
	private Date surveydate;

	//bi-directional many-to-one association to Answeruser
	@OneToMany(mappedBy="datasurvey")
	private List<Answeruser> answerusers;

	//bi-directional many-to-one association to Survey
	@ManyToOne
	@JoinColumn(name="idsurvey")
	private Survey survey;

	public Datasurvey() {
	}

	public int getIddatasurvey() {
		return this.iddatasurvey;
	}

	public void setIddatasurvey(int iddatasurvey) {
		this.iddatasurvey = iddatasurvey;
	}

	public Date getSurveydate() {
		return this.surveydate;
	}

	public void setSurveydate(Date surveydate) {
		this.surveydate = surveydate;
	}

	public List<Answeruser> getAnswerusers() {
		return this.answerusers;
	}

	public void setAnswerusers(List<Answeruser> answerusers) {
		this.answerusers = answerusers;
	}

	public Answeruser addAnsweruser(Answeruser answeruser) {
		getAnswerusers().add(answeruser);
		answeruser.setDatasurvey(this);

		return answeruser;
	}

	public Answeruser removeAnsweruser(Answeruser answeruser) {
		getAnswerusers().remove(answeruser);
		answeruser.setDatasurvey(null);

		return answeruser;
	}

	public Survey getSurvey() {
		return this.survey;
	}

	public void setSurvey(Survey survey) {
		this.survey = survey;
	}

}