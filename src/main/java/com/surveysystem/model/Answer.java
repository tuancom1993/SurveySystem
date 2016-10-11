package com.surveysystem.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the answer database table.
 * 
 */
@Entity
@Table(name="answer")
@NamedQuery(name="Answer.findAll", query="SELECT a FROM Answer a")
public class Answer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idanswer;

	private String content;

	//bi-directional many-to-one association to Question
	@ManyToOne
	@JoinColumn(name="idquestion")
	private Question question;

	public Answer() {
	}

	public int getIdanswer() {
		return this.idanswer;
	}

	public void setIdanswer(int idanswer) {
		this.idanswer = idanswer;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Question getQuestion() {
		return this.question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

}