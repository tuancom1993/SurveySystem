package com.surveysystem.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the question database table.
 * 
 */
@Entity
@Table(name="question")
@NamedQuery(name="Question.findAll", query="SELECT q FROM Question q")
public class Question implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idquestion;

	private String contentquestion;

	private int indexquestion;

	private int mandatory;

	//bi-directional many-to-one association to Answer
	@OneToMany(mappedBy="question")
	private List<Answer> answers;

	//bi-directional many-to-one association to Answeruser
	@OneToMany(mappedBy="question")
	private List<Answeruser> answerusers;

	//bi-directional many-to-one association to Kindquestion
	@ManyToOne
	@JoinColumn(name="idkindquestion")
	private Kindquestion kindquestion;

	//bi-directional many-to-one association to Survey
	@ManyToOne
	@JoinColumn(name="idsurvey")
	private Survey survey;

	public Question() {
	}

	public int getIdquestion() {
		return this.idquestion;
	}

	public void setIdquestion(int idquestion) {
		this.idquestion = idquestion;
	}

	public String getContentquestion() {
		return this.contentquestion;
	}

	public void setContentquestion(String contentquestion) {
		this.contentquestion = contentquestion;
	}

	public int getIndexquestion() {
		return this.indexquestion;
	}

	public void setIndexquestion(int indexquestion) {
		this.indexquestion = indexquestion;
	}

	public int getMandatory() {
		return this.mandatory;
	}

	public void setMandatory(int mandatory) {
		this.mandatory = mandatory;
	}

	public List<Answer> getAnswers() {
		return this.answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public Answer addAnswer(Answer answer) {
		getAnswers().add(answer);
		answer.setQuestion(this);

		return answer;
	}

	public Answer removeAnswer(Answer answer) {
		getAnswers().remove(answer);
		answer.setQuestion(null);

		return answer;
	}

	public List<Answeruser> getAnswerusers() {
		return this.answerusers;
	}

	public void setAnswerusers(List<Answeruser> answerusers) {
		this.answerusers = answerusers;
	}

	public Answeruser addAnsweruser(Answeruser answeruser) {
		getAnswerusers().add(answeruser);
		answeruser.setQuestion(this);

		return answeruser;
	}

	public Answeruser removeAnsweruser(Answeruser answeruser) {
		getAnswerusers().remove(answeruser);
		answeruser.setQuestion(null);

		return answeruser;
	}

	public Kindquestion getKindquestion() {
		return this.kindquestion;
	}

	public void setKindquestion(Kindquestion kindquestion) {
		this.kindquestion = kindquestion;
	}

	public Survey getSurvey() {
		return this.survey;
	}

	public void setSurvey(Survey survey) {
		this.survey = survey;
	}

}