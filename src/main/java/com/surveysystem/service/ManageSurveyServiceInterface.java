package com.surveysystem.service;

import java.util.ArrayList;

import com.surveysystem.model.JsonSurvey;
import com.surveysystem.model.Survey;
import com.surveysystem.model.Tag;
import com.surveysystem.model.Template;
import com.surveysystem.model.User;

public interface ManageSurveyServiceInterface {
	
	Survey getSurvey(int idSurvey, boolean isEdit);
	ArrayList<Survey> getSurveys();
	ArrayList<Survey> getSurveys(User user);
	ArrayList<Survey> getLimitSurveysByUser(int page, int idUser);
	ArrayList<Survey> getLimitSurveys(int page);
	Survey createSurvey(Survey survey);
	Survey createSurvey(JsonSurvey jsonSurvey, User user);
	Survey editSurvey(JsonSurvey jsonSurvey ,User user);
	boolean deleteSurvey(int idSurvey);
	int getPageNumberAllSurvey();
	int getPageNumberMySurvey(int idUser);
	ArrayList<Survey> getSurveyBySearchByAdmin(String varSearch);
	ArrayList<Survey> getSurveyBySearchByUser(int idUser,String varSearch);

}
