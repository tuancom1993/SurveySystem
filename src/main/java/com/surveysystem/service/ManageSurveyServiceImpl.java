package com.surveysystem.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.loader.custom.Return;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surveysystem.configuration.Common;
import com.surveysystem.model.Answer;
import com.surveysystem.model.Answeruser;
import com.surveysystem.model.Datasurvey;
import com.surveysystem.model.JsonAnswer;
import com.surveysystem.model.JsonQuestion;
import com.surveysystem.model.JsonSurvey;
import com.surveysystem.model.Kindquestion;
import com.surveysystem.model.Question;
import com.surveysystem.model.Survey;
import com.surveysystem.model.Tag;
import com.surveysystem.model.Template;
import com.surveysystem.model.User;
import com.surveysystem.repository.AnswerRepoInterface;
import com.surveysystem.repository.QuestionRepoInterface;
import com.surveysystem.repository.SurveyRepoInterface;
import com.surveysystem.repository.TemplateRepoInterface;


@Service
public class ManageSurveyServiceImpl implements ManageSurveyServiceInterface{
	
	@Autowired SurveyRepoInterface surveyRepoInterface;
	@Autowired QuestionRepoInterface questionRepoInterface;
	@Autowired AnswerRepoInterface answerRepoInterface;
	@Autowired ManageQuestionServiceInterface manageQuestionServiceInterface;
	@Autowired ManageAnswerServiceInterface manageAnswerServiceInterface;
	@Autowired ManageAnswerUserServiceInterface manageAnswerUserServiceInterface;
	@Autowired ManageDataSurveyServiceInterface manageDataSurveyServiceInterface;
	@Autowired TemplateRepoInterface templateRepoInterface;
	
	private final int LIMIT_SURVEY = 6;
	
	@Override
	public Survey getSurvey(int idSurvey, boolean isEdit) {
		Survey survey = surveyRepoInterface.findOne(idSurvey);
		if(!isEdit){
			survey.setSurveydescribe(survey.getSurveydescribe().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>"));
		}
		/*ArrayList<Question> questions = manageQuestionServiceInterface.getQuestionsBySurvey(survey);*/
		List<Question> questions = questionRepoInterface.getQuestionsBySurveyOrderByIndexq(survey.getIdsurvey());
		for (Question question : questions) {
			ArrayList<Answer> answers = manageAnswerServiceInterface.getAnswersByQuestion(question);
			question.setAnswers(answers);
		}
		survey.setQuestions(questions);
		return survey;
	}

	@Override
	public ArrayList<Survey> getSurveys() {
		// TODO Auto-generated method stub
		return (ArrayList<Survey>) surveyRepoInterface.findAll();
	}
	
	@Override
	public ArrayList<Survey> getSurveys(User user) {
		try {
			return surveyRepoInterface.findByUser(user);
		} catch (Exception e) {
			return null;
		}
		
	}
	

	@Override
	public ArrayList<Survey> getLimitSurveysByUser(int page, int idUser) {
		try {
			ArrayList<Survey> surveys = surveyRepoInterface.getLimitSurveysByUser(LIMIT_SURVEY, (page*LIMIT_SURVEY), idUser);
			return surveys;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public ArrayList<Survey> getLimitSurveys(int page) {
		try {
			ArrayList<Survey> surveys = surveyRepoInterface.getLimitSurveys(LIMIT_SURVEY, (page*LIMIT_SURVEY));
			return surveys;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	

	@Override
	public int getPageNumberAllSurvey() {
		try {
			/*int count = surveyRepoInterface.getCountAllSurvey();
			int pageNum = 0;
			if (count%LIMIT_SURVEY == 0) pageNum = count/LIMIT_SURVEY;
			else pageNum = count/LIMIT_SURVEY + 1;*/
			int pageNum = (int) Math.ceil(((double) surveyRepoInterface.getCountAllSurvey())/LIMIT_SURVEY);
			return pageNum;
		} catch (Exception e) {
			return 1;
		}
		
	}

	@Override
	public int getPageNumberMySurvey(int idUser) {
		try {
			/*int count = surveyRepoInterface.getCountAllSurveyByUser(idUser);
			int pageNum = 0;
			if (count % LIMIT_SURVEY == 0) pageNum = count/LIMIT_SURVEY;
			else pageNum = count/LIMIT_SURVEY + 1;*/
			int pageNum = (int) Math.ceil(((double) surveyRepoInterface.getCountAllSurveyByUser(idUser))/LIMIT_SURVEY);
			return pageNum;
		} catch (Exception e) {
			return 1;
		}
	}
	
	@Override
	public Survey createSurvey(Survey survey) {
		Survey surveyAdded = null;
		if(survey != null){
			try {
				surveyAdded = surveyRepoInterface.save(survey);
				return surveyAdded;
			} catch (Exception e) {
				return surveyAdded;
			}
		}
		return surveyAdded;
	}
	
	

	@Override
	public boolean deleteSurvey(int idSurvey) {
		try {
			Survey survey = surveyRepoInterface.findOne(idSurvey);
			if (survey == null) return false;
			else {
				
				List<Datasurvey> datasurveys = survey.getDatasurveys();
				for(Datasurvey datasurvey : datasurveys){
					manageAnswerUserServiceInterface.deleteAnsweruser(datasurvey.getAnswerusers());
				}
				manageDataSurveyServiceInterface.deleteDataSurvey(datasurveys);
				
				List<Question> questions = survey.getQuestions();
				for(Question question : questions){
					manageAnswerServiceInterface.deleteAnswer(question.getAnswers());
				}
				manageQuestionServiceInterface.deleteQuestion(questions);
				
				if(survey.getCover().startsWith("C")) {
					File cover = new File("src/main/resources/static/img/cover/survey-cover/"+survey.getCover());
					if(cover.exists()) cover.delete();
				}
				surveyRepoInterface.delete(survey);
			}
			
			return true;
		} catch (Exception e) {	
			e.printStackTrace();
			return false;
		}
	}


	@Override
	public Survey createSurvey(JsonSurvey jsonSurvey, User user) {
		Survey survey = transferDataSurvey(jsonSurvey, user);
		try {
			surveyRepoInterface.save(survey);
			
			for(Question question : survey.getQuestions()){
				question.setSurvey(survey);
				manageQuestionServiceInterface.createQuestion(question);
				
				for(Answer answer : question.getAnswers()){
					answer.setQuestion(question);
					manageAnswerServiceInterface.createAnswer(answer);
				}
			}
			
			if(jsonSurvey.getIdTemplate()!=0){
				Template template = templateRepoInterface.findOne(jsonSurvey.getIdTemplate());
				template.setIndexselect(template.getIndexselect()+1);
				templateRepoInterface.save(template);
			}
	
			return survey;
		} catch (Exception e) {
			e.printStackTrace();
			return survey;
		}
		
	}
	
	private Survey transferDataSurvey(JsonSurvey jsonSurvey, User user){
		Survey survey = new Survey();
		String cover = "";
		if(jsonSurvey.getCover().startsWith("#")) cover = jsonSurvey.getCover(); 
		else cover = Common.addSurveyCoverByTemplate(jsonSurvey.getCover(), user);
		try {
			survey.setCover(cover);
			survey.setCreatedate(Common.getCurrentDate());
			survey.setSurveydescribe(jsonSurvey.getDescribe());
			//.replaceAll("<", "&lt;").replaceAll(">", "&gt;")
			survey.setMaincolor(jsonSurvey.getMaincolor());
			survey.setStopsurvey(jsonSurvey.getStop());
			survey.setTitle(jsonSurvey.getTitle());
			survey.setUser(user);
			survey.setKindsurvey(jsonSurvey.getKindsurvey());
			ArrayList<Question> questions = new ArrayList<>();
			for(JsonQuestion jsonQuestion : jsonSurvey.getQuestions()){
				Question question = new Question();
					Kindquestion kindquestion = new Kindquestion();
					kindquestion.setIdkindquestion(jsonQuestion.getIdkindquestion());
				question.setContentquestion(jsonQuestion.getContentquestion());
				question.setKindquestion(kindquestion);
				question.setMandatory(jsonQuestion.getMandatory());
				question.setIndexquestion(jsonQuestion.getIndexquestion());
				ArrayList<Answer> answers = new ArrayList<>();
				for(JsonAnswer jsonAnswer : jsonQuestion.getAnswers()){
					Answer answer = new Answer();
					answer.setContent(jsonAnswer.getContent());
					answers.add(answer);
				}
				question.setAnswers(answers);
				questions.add(question);
			}
			survey.setQuestions(questions);
	
			return survey;
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public Survey editSurvey(JsonSurvey jsonSurvey , User user) {
		Survey survey = transferDataSurveyForEdit(jsonSurvey, user);
		try {
			surveyRepoInterface.save(survey);

			for(Question question : survey.getQuestions()){
				question.setSurvey(survey);
				/*manageQuestionServiceInterface.createQuestion(question);*/
				questionRepoInterface.save(question);
				for(Answer answer : question.getAnswers()){
					answer.setQuestion(question);
					answerRepoInterface.save(answer);
					/*manageAnswerServiceInterface.createAnswer(answer);*/
				}
			}
			
			return survey;
		} catch (Exception e) {
			e.printStackTrace();
			return survey;
		}
	}
	
	private Survey transferDataSurveyForEdit(JsonSurvey jsonSurvey, User user){
		Survey survey = new Survey();
		/*String cover = "";
		if(jsonSurvey.getCover().startsWith("#")) cover = jsonSurvey.getCover(); 
		else cover = Common.addSurveyCoverByTemplate(jsonSurvey.getCover(), user);*/
		try {
			System.out.println("Id survey: "+jsonSurvey.getIdsurvey());
			survey.setIdsurvey(jsonSurvey.getIdsurvey());
			survey.setCover(jsonSurvey.getCover());
			survey.setSurveydescribe(jsonSurvey.getDescribe());
			survey.setMaincolor(jsonSurvey.getMaincolor());
			survey.setStopsurvey(jsonSurvey.getStop());
			survey.setTitle(jsonSurvey.getTitle());
			survey.setCreatedate(Common.createDate(jsonSurvey.getCreatedate(), "yyyy-MM-dd"));
			survey.setUser(surveyRepoInterface.findOne(jsonSurvey.getIdsurvey()).getUser());
			survey.setKindsurvey(jsonSurvey.getKindsurvey());
			
			ArrayList<Question> questions = new ArrayList<>();
			for(JsonQuestion jsonQuestion : jsonSurvey.getQuestions()){
				Question question = new Question();
				System.out.println("Id question: "+jsonQuestion.getIdquestion());
				question.setIdquestion(jsonQuestion.getIdquestion());
					Kindquestion kindquestion = new Kindquestion();
					kindquestion.setIdkindquestion(jsonQuestion.getIdkindquestion());
				question.setContentquestion(jsonQuestion.getContentquestion());
				question.setKindquestion(kindquestion);
				question.setMandatory(jsonQuestion.getMandatory());
				question.setIndexquestion(jsonQuestion.getIndexquestion());
				ArrayList<Answer> answers = new ArrayList<>();
				for(JsonAnswer jsonAnswer : jsonQuestion.getAnswers()){
					Answer answer = new Answer();
					System.out.println("Id answer: "+jsonAnswer.getIdanswer());
					answer.setIdanswer(jsonAnswer.getIdanswer());
					answer.setContent(jsonAnswer.getContent());
					answers.add(answer);
				}
				question.setAnswers(answers);
				questions.add(question);
			}
			survey.setQuestions(questions);
	
			return survey;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ArrayList<Survey> getSurveyBySearchByAdmin(String varSearch) {
		try {
			return surveyRepoInterface.getSurveyBySearchByAdmin("%"+varSearch+"%");
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public ArrayList<Survey> getSurveyBySearchByUser(int idUser, String varSearch) {
		try {
			return surveyRepoInterface.getSurveyBySearchByUser(idUser, "%"+varSearch+"%");
		} catch (Exception e) {
			return null;
		}
	}



}
