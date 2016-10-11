package com.surveysystem.service;

import java.util.ArrayList;
import java.util.List;

import com.surveysystem.model.Answeruser;
import com.surveysystem.model.JsonDataSurvey;
import com.surveysystem.model.Question;

public interface ManageAnswerUserServiceInterface {
	Answeruser getAnsweruser(int idAnsweruser);
	ArrayList<Answeruser> getAnswerusers();
	ArrayList<Answeruser> getAnswerusers(Question question);
	boolean addAnsweruser(Answeruser answeruser);
	boolean editAnsweruser(Answeruser answeruser);
	boolean deleteAnsweruser(Answeruser answeruser);
	boolean deleteAnsweruser(int idansweruser);
	boolean deleteAnsweruser(List<Answeruser> answerusers);
}