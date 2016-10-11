package com.surveysystem.service;

import com.surveysystem.form.DataSurveyTableForm;
import com.surveysystem.form.chart.QuestionChart;
import com.surveysystem.form.chart.SurveyChart;

public interface ManageShowDataSurveyServiceInterface {
	DataSurveyTableForm getDataSurveyTable(int idSurvey);
	SurveyChart getDataSurveyChart(int idSurvey);
	QuestionChart getQuestionChart(int idQuestion);
}
