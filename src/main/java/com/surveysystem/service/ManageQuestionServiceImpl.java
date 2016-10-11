package com.surveysystem.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.query.InvalidJpaQueryMethodException;
import org.springframework.stereotype.Service;

import com.surveysystem.model.Answer;
import com.surveysystem.model.Answeruser;
import com.surveysystem.model.Kindquestion;
import com.surveysystem.model.Question;
import com.surveysystem.model.Survey;
import com.surveysystem.repository.KindQuestionRepoInterface;
import com.surveysystem.repository.QuestionRepoInterface;

@Service
public class ManageQuestionServiceImpl implements ManageQuestionServiceInterface{
	
	@Autowired QuestionRepoInterface questionRepoInterface;
	@Autowired KindQuestionRepoInterface kindQuestionRepoInterface;
	@Autowired ManageAnswerUserServiceInterface manageAnswerUserServiceInterface;
	@Autowired ManageAnswerServiceInterface manageAnswerServiceInterface;
	
	@Override
	public Question getQuestion(int idQuestion) {
		// TODO Auto-generated method stub
		return questionRepoInterface.findOne(idQuestion);
	}

	@Override
	public ArrayList<Question> getQuestions() {
		// TODO Auto-generated method stub
		return (ArrayList<Question>) questionRepoInterface.findAll();
	}
	
	@Override
	public ArrayList<Question> getQuestionsBySurvey(Survey survey) {
		// TODO Auto-generated method stub
		return questionRepoInterface.findBySurvey(survey);
	}
	
	@Override
	public boolean createQuestion(Question question) {
		if (question!=null) {
			questionRepoInterface.save(question);
			return true;
		}
		return false;
	}

	@Override
	public boolean editQuestion(Question question) {
		if (question!=null) {
			questionRepoInterface.save(question);
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteQuestion(int idQuestion) {
		try {
			questionRepoInterface.delete(idQuestion);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	@Override
	public boolean deleteQuestion(Question question) {
		try {
			questionRepoInterface.delete(question);
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}

	@Override
	public boolean deleteQuestion(List<Question> questions) {
		try {
			questionRepoInterface.delete(questions);
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}

	@Override
	public Kindquestion getKindQuestion(int idKindQuestion) {
		// TODO Auto-generated method stub
		return kindQuestionRepoInterface.findOne(idKindQuestion);
	}

	@Override
	public boolean deleteQuestionAndRelation(int idQuestion) {
		try {
			Question question = questionRepoInterface.findOne(idQuestion);
			
			List<Answeruser> answerusers = question.getAnswerusers();
			manageAnswerUserServiceInterface.deleteAnsweruser(answerusers);
			
			List<Answer> answers = question.getAnswers();
			manageAnswerServiceInterface.deleteAnswer(answers);
			
			questionRepoInterface.delete(question);
			
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}

	

	

}
