package com.surveysystem.service;

import java.util.ArrayList;
import java.util.List;

import com.surveysystem.model.Kindquestion;
import com.surveysystem.model.Question;
import com.surveysystem.model.Survey;

public interface ManageQuestionServiceInterface {
	
	Question getQuestion(int idQuestion);
	ArrayList<Question> getQuestions();
	ArrayList<Question> getQuestionsBySurvey(Survey survey);
	boolean createQuestion(Question question);
	boolean editQuestion(Question question);
	boolean deleteQuestion(int idQuestion);
	boolean deleteQuestion(Question question);
	boolean deleteQuestion(List<Question> questions);
	boolean deleteQuestionAndRelation(int idQuestion);
	
	Kindquestion getKindQuestion(int idKindQuestion);
}
