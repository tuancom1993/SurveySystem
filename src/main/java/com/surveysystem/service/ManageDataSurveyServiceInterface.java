package com.surveysystem.service;

import java.util.List;

import com.surveysystem.model.Datasurvey;
import com.surveysystem.model.JsonDataSurvey;
import com.surveysystem.model.Survey;

public interface ManageDataSurveyServiceInterface {
	Datasurvey getDataSurvey(int idDataSurvey);
	Datasurvey getDataSurveyBySurvey(Survey survey);
	boolean createDataSurvey(JsonDataSurvey jsonDataSurvey);
	boolean createDataSurvey(Datasurvey datasurvey);
	boolean editDataSurvey(Datasurvey datasurvey);
	boolean deleteDataSurvey(Datasurvey datasurvey);
	boolean deleteDataSurvey(int iddatasurvey);
	boolean deleteDataSurvey(List<Datasurvey> datasurveys);
}
