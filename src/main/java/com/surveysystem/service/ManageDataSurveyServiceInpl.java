package com.surveysystem.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surveysystem.configuration.Common;
import com.surveysystem.model.Answeruser;
import com.surveysystem.model.Datasurvey;
import com.surveysystem.model.JsonAnswerUser;
import com.surveysystem.model.JsonDataSurvey;
import com.surveysystem.model.Question;
import com.surveysystem.model.Survey;
import com.surveysystem.repository.DataSurveyRepoInterface;

@Service
public class ManageDataSurveyServiceInpl implements ManageDataSurveyServiceInterface{
	
	@Autowired DataSurveyRepoInterface dataSurveyRepoInterface;
	@Autowired ManageAnswerUserServiceInterface manageAnswerUserServiceInterface;
	
	@Override
	public Datasurvey getDataSurvey(int idDataSurvey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Datasurvey getDataSurveyBySurvey(Survey survey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean createDataSurvey(JsonDataSurvey jsonDataSurvey) {
		try {
			Datasurvey datasurvey = new Datasurvey();
				Survey survey = new Survey();
				survey.setIdsurvey(jsonDataSurvey.getIdsurvey());
			datasurvey.setSurvey(survey);
			datasurvey.setSurveydate(Common.getCurrentDate());
			
			dataSurveyRepoInterface.save(datasurvey);
			
			ArrayList<JsonAnswerUser> jsonAnswerUsers = (ArrayList<JsonAnswerUser>) jsonDataSurvey.getAnswerusers();
			for(JsonAnswerUser jsonAnswerUser : jsonAnswerUsers){
				Answeruser answeruser = new Answeruser();
				answeruser.setDatasurvey(datasurvey);
				answeruser.setContent(jsonAnswerUser.getContent());
					Question question = new Question();
					question.setIdquestion(jsonAnswerUser.getIdquestion());
				answeruser.setQuestion(question);
				manageAnswerUserServiceInterface.addAnsweruser(answeruser);
				
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean createDataSurvey(Datasurvey datasurvey) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean editDataSurvey(Datasurvey datasurvey) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteDataSurvey(Datasurvey datasurvey) {
		try {
			dataSurveyRepoInterface.delete(datasurvey);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteDataSurvey(int iddatasurvey) {
		try {
			dataSurveyRepoInterface.delete(iddatasurvey);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteDataSurvey(List<Datasurvey> datasurveys) {
		try {
			dataSurveyRepoInterface.delete(datasurveys);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}
