package com.surveysystem.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surveysystem.configuration.Common;
import com.surveysystem.form.AnswerUserForm;
import com.surveysystem.form.DataSurveyTableForm;
import com.surveysystem.form.chart.AnswerChart;
import com.surveysystem.form.chart.QuestionChart;
import com.surveysystem.form.chart.SurveyChart;
import com.surveysystem.model.*;
import com.surveysystem.repository.AnswerRepoInterface;
import com.surveysystem.repository.AnswerUserRepoInterface;
import com.surveysystem.repository.QuestionRepoInterface;
import com.surveysystem.repository.SurveyRepoInterface;

@Service
public class ManageShowDataSurveyServiceImpl implements ManageShowDataSurveyServiceInterface {
	@Autowired ManageSurveyServiceInterface manageSurveyServiceInterface;
	@Autowired SurveyRepoInterface surveyRepoInterface;
	@Autowired AnswerRepoInterface answerRepoInterface;
	@Autowired AnswerUserRepoInterface answerUserRepoInterface;
	@Autowired QuestionRepoInterface questionRepoInterface; 
	
	@Override
	public DataSurveyTableForm getDataSurveyTable(int idSurvey) {
		try {
			DataSurveyTableForm form = new DataSurveyTableForm();
			Survey survey = surveyRepoInterface.findOne(idSurvey);
			System.out.println("User create survey: "+survey.getUser().getIduser());
			survey.setQuestions(questionRepoInterface.getQuestionsBySurveyOrderByIndexq(idSurvey));
			form.setSurvey(survey);
			
			ArrayList<AnswerUserForm> answerUserForms = new ArrayList<AnswerUserForm>();
			
			List<Datasurvey> datasurveys = survey.getDatasurveys();
			List<Question> questions = survey.getQuestions();  
			
			for(Datasurvey datasurvey : datasurveys){
				/*System.out.println("***********************************************");*/
				AnswerUserForm answerUserForm = new AnswerUserForm();
				ArrayList<String> contents = new ArrayList<String>();
				contents.add(Common.dateFormartToSring(datasurvey.getSurveydate(), "dd-MMM-yyy"));
				for(Question question : questions){
					/*String content = "";*/
					StringBuffer content = new StringBuffer("");
					ArrayList<Answeruser> answerusers = answerUserRepoInterface.findAnswerUserByDatasurveyAndQuestion(datasurvey, question);
					if(answerusers==null || answerusers.isEmpty());
					else {
						if (question.getKindquestion().getIdkindquestion()==1 || question.getKindquestion().getIdkindquestion()==2){
							content.append(answerusers.get(0).getContent());
						} else if (question.getKindquestion().getIdkindquestion() == 4) {
							try {
								int idAnswer = Integer.parseInt(answerusers.get(0).getContent());
								content.append(answerRepoInterface.findOne(idAnswer).getContent());
							} catch (Exception e) {
								content.append("");
							}
							
						} else if (question.getKindquestion().getIdkindquestion() == 3) {
							for(Answeruser answeruser : answerusers){
								int idAnswer = 0;
								try {
									idAnswer = Integer.parseInt(answeruser.getContent());
									content.append(answerRepoInterface.findOne(idAnswer).getContent()).append(", ");	
								} catch (Exception e) {
									content.append(", ");	
								}				
							}
						}
					}
					contents.add(content.toString());
				}
				answerUserForm.setContents(contents);
				answerUserForms.add(answerUserForm);
			}
			form.setAnswerUserForms(answerUserForms);
			
			return form;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public SurveyChart getDataSurveyChart(int idSurvey) {
		try {
			SurveyChart surveyChart = new SurveyChart();
				Survey survey = surveyRepoInterface.findOne(idSurvey);
				survey.setQuestions(questionRepoInterface.getQuestionsBySurveyOrderByIndexq(idSurvey));
			surveyChart = transferDataSurvey(surveyChart, survey);
			surveyChart = transferListQuestion(surveyChart, survey);
			surveyChart = transferListAnswer(surveyChart, survey);
			
			System.out.println("Question size: "+surveyChart.getQuestionCharts().size());
			return surveyChart;
		} catch (Exception e) {
			return null;
		}
	}
	
	private SurveyChart transferDataSurvey(SurveyChart surveyChart, Survey survey){
		try {
			surveyChart.setCover(survey.getCover());
			surveyChart.setCreatedate(survey.getCreatedate());
			surveyChart.setIdsurvey(survey.getIdsurvey());
			surveyChart.setMaincolor(survey.getMaincolor());
			surveyChart.setSurveydescribe(survey.getSurveydescribe());
			surveyChart.setTitle(survey.getTitle());
			surveyChart.setRGBA(Common.hexToRGBA(surveyChart.getMaincolor()));
			surveyChart.setIdUser(survey.getUser().getIduser());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return surveyChart;
	}
	
	private SurveyChart transferListQuestion(SurveyChart surveyChart, Survey survey){
		try {
			List<QuestionChart> questionCharts = new ArrayList<QuestionChart>();
			List<Question> questions = survey.getQuestions();
			for(Question question : questions){
				QuestionChart questionChart = new QuestionChart();
				questionChart.setContentquestion(question.getContentquestion());
				questionChart.setIdquestion(question.getIdquestion());
				questionChart.setIdkindquestion(question.getKindquestion().getIdkindquestion());
				
				questionCharts.add(questionChart);
			}
			
			surveyChart.setQuestionCharts(questionCharts);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return surveyChart;
	}
	
	private SurveyChart transferListAnswer(SurveyChart surveyChart, Survey survey){
		try {
			List<Question> questions = survey.getQuestions();
			List<QuestionChart> questionCharts = surveyChart.getQuestionCharts();
			for(int i = 0; i<questions.size(); i++){
				
				Question question = questions.get(i);
				QuestionChart questionChart = questionCharts.get(i);
				
				ArrayList<AnswerChart> answerCharts = new ArrayList<>();
				
				if(questionChart.getIdkindquestion()==1 || questionChart.getIdkindquestion()==2){
					ArrayList<Answeruser> answerusers = answerUserRepoInterface.findAnswerUserByQuestion(question);
					for (Answeruser answeruser : answerusers) {
						AnswerChart answerChart = new AnswerChart();
						if("".equals(answeruser.getContent().trim())) continue;
						answerChart.setContent(answeruser.getContent());
						answerChart.setIdanswer(answeruser.getIdansweruser());
						answerCharts.add(answerChart);
					}
				} else {
					List<Answer> answers = question.getAnswers();
					for(Answer answer : answers){
						AnswerChart answerChart = new AnswerChart();
						answerChart.setContent(answer.getContent());
						answerChart.setIdanswer(answer.getIdanswer());
						answerChart.setNumber(""+answerUserRepoInterface.getCountAnswerSelectedByQuestionAndAnswer(question.getIdquestion(), ""+ answer.getIdanswer()));
						/*answerChart.setNumber(""+answerUserRepoInterface.findAnswerUserByQuestionAndContent(question, ""+answer.getIdanswer()).size());*/
						System.out.println("AnswerChaet number: "+answerChart.getNumber());
						answerCharts.add(answerChart);
					}
				}
				
				questionChart.setAnswerCharts(answerCharts);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return surveyChart;
	}

	@Override
	public QuestionChart getQuestionChart(int idQuestion) {
		QuestionChart questionChart = new QuestionChart();
		try {
			Question question = questionRepoInterface.findOne(idQuestion);
			questionChart.setContentquestion(question.getContentquestion());
			questionChart.setIdquestion(question.getIdquestion());
			questionChart.setIdkindquestion(question.getKindquestion().getIdkindquestion());
			
			ArrayList<AnswerChart> answerCharts = new ArrayList<>();
			if(questionChart.getIdkindquestion()==1 || questionChart.getIdkindquestion()==2){
				ArrayList<Answeruser> answerusers = answerUserRepoInterface.findAnswerUserByQuestion(question);
				for (Answeruser answeruser : answerusers) {
					AnswerChart answerChart = new AnswerChart();
					if("".equals(answeruser.getContent().trim())) continue;
					answerChart.setContent(answeruser.getContent());
					answerChart.setIdanswer(answeruser.getIdansweruser());
					answerCharts.add(answerChart);
				}
			} else {
				List<Answer> answers = question.getAnswers();
				for(Answer answer : answers){
					AnswerChart answerChart = new AnswerChart();
					answerChart.setContent(answer.getContent());
					answerChart.setIdanswer(answer.getIdanswer());
					answerChart.setNumber(""+answerUserRepoInterface.getCountAnswerSelectedByQuestionAndAnswer(question.getIdquestion(), ""+ answer.getIdanswer()));
					answerCharts.add(answerChart);
				}
			}
			
			questionChart.setAnswerCharts(answerCharts);
			return questionChart;
		} catch (Exception e) {
			e.printStackTrace();
			return questionChart;
		}
	}
}
