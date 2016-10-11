package com.surveysystem.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the answeruser database table.
 * 
 */
@Entity
@Table(name="answeruser")
@NamedQuery(name="Answeruser.findAll", query="SELECT a FROM Answeruser a")
public class Answeruser implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idansweruser;

	@Lob
	private String content;

	//bi-directional many-to-one association to Datasurvey
	@ManyToOne
	@JoinColumn(name="iddatasurvey")
	private Datasurvey datasurvey;

	//bi-directional many-to-one association to Question
	@ManyToOne
	@JoinColumn(name="idquestion")
	private Question question;

	public Answeruser() {
	}

	public int getIdansweruser() {
		return this.idansweruser;
	}

	public void setIdansweruser(int idansweruser) {
		this.idansweruser = idansweruser;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Datasurvey getDatasurvey() {
		return this.datasurvey;
	}

	public void setDatasurvey(Datasurvey datasurvey) {
		this.datasurvey = datasurvey;
	}

	public Question getQuestion() {
		return this.question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

}