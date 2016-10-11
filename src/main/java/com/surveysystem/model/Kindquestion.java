package com.surveysystem.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the kindquestion database table.
 * 
 */
@Entity
@Table(name="kindquestion")
@NamedQuery(name="Kindquestion.findAll", query="SELECT k FROM Kindquestion k")
public class Kindquestion implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idkindquestion;

	private String kind;

	//bi-directional many-to-one association to Question
	@OneToMany(mappedBy="kindquestion")
	private List<Question> questions;

	public Kindquestion() {
	}

	public int getIdkindquestion() {
		return this.idkindquestion;
	}

	public void setIdkindquestion(int idkindquestion) {
		this.idkindquestion = idkindquestion;
	}

	public String getKind() {
		return this.kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public List<Question> getQuestions() {
		return this.questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public Question addQuestion(Question question) {
		getQuestions().add(question);
		question.setKindquestion(this);

		return question;
	}

	public Question removeQuestion(Question question) {
		getQuestions().remove(question);
		question.setKindquestion(null);

		return question;
	}

}