package com.surveysystem.service;

import java.util.ArrayList;
import java.util.List;

import com.surveysystem.model.Answer;
import com.surveysystem.model.JsonAnswerUser;
import com.surveysystem.model.Question;

public interface ManageAnswerServiceInterface {
	
	Answer getAnswer(int idAnswer);
	ArrayList<Answer> getAnswers();
	ArrayList<Answer> getAnswersByQuestion(Question question);
	boolean createAnswer(Answer answer);
	boolean editAnswer(Answer answer);
	boolean deleteAnswer(int idAnswer);
	boolean deleteAnswer(Answer answer);
	boolean deleteAnswer(List<Answer> answers);
	boolean deleteAnswerAndRelation(int idAnswer);
}
