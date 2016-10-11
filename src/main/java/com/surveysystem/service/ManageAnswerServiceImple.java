package com.surveysystem.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surveysystem.model.Answer;
import com.surveysystem.model.Answeruser;
import com.surveysystem.model.JsonAnswerUser;
import com.surveysystem.model.Question;
import com.surveysystem.repository.AnswerRepoInterface;
import com.surveysystem.repository.AnswerUserRepoInterface;

@Service
public class ManageAnswerServiceImple implements ManageAnswerServiceInterface{
	
	@Autowired AnswerRepoInterface  answerRepoInterface;
	@Autowired ManageAnswerUserServiceInterface manageAnswerUserServiceInterface;
	
	@Override
	public Answer getAnswer(int idAnswer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Answer> getAnswers() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public ArrayList<Answer> getAnswersByQuestion(Question question) {
		try {
			return answerRepoInterface.findAnswerByQuestion(question);
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public boolean createAnswer(Answer answer) {
		try {
			answerRepoInterface.save(answer);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean editAnswer(Answer answer) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteAnswer(int idAnswer) {
		try {
			answerRepoInterface.delete(idAnswer);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteAnswer(List<Answer> answers) {
		try {
			answerRepoInterface.delete(answers);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteAnswer(Answer answer) {
		try {
			answerRepoInterface.delete(answer);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteAnswerAndRelation(int idAnswer) {
		try {
			Answer answer = answerRepoInterface.findOne(idAnswer);
			Question question = answer.getQuestion();
			List<Answeruser> answerusers = question.getAnswerusers();
			
			if(question.getKindquestion().getIdkindquestion() ==1 || question.getKindquestion().getIdkindquestion()==2){
				//manageAnswerUserServiceInterface.deleteAnsweruser(answerusers);
			} else {
				for(Answeruser answeruser : answerusers){
					if (answer.getIdanswer() == Integer.parseInt(answeruser.getContent())){
						manageAnswerUserServiceInterface.deleteAnsweruser(answeruser);
					}
				}
				answerRepoInterface.delete(idAnswer);
			}
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}

	

	

}
