package com.surveysystem.form;

import java.util.ArrayList;

import com.surveysystem.model.Survey;

public class DataSurveyTableForm {
	private Survey survey;
	private ArrayList<AnswerUserForm> answerUserForms;
	
	public Survey getSurvey() {
		return survey;
	}
	public void setSurvey(Survey survey) {
		this.survey = survey;
	}
	public ArrayList<AnswerUserForm> getAnswerUserForms() {
		return answerUserForms;
	}
	public void setAnswerUserForms(ArrayList<AnswerUserForm> answerUserForms) {
		this.answerUserForms = answerUserForms;
	}
	
	
}
