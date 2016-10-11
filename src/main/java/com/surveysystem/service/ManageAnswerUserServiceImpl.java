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
import com.surveysystem.repository.AnswerUserRepoInterface;

@Service
public class ManageAnswerUserServiceImpl implements ManageAnswerUserServiceInterface {
	@Autowired AnswerUserRepoInterface answerUserRepoInterface;
	
	
	@Override
	public Answeruser getAnsweruser(int idAnsweruser) {
		try {
			return answerUserRepoInterface.findOne(idAnsweruser);
		} catch (Exception e) {
			return null;
		}
		
	}

	@Override
	public ArrayList<Answeruser> getAnswerusers() {
		try {
			return (ArrayList<Answeruser>) answerUserRepoInterface.findAll();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public ArrayList<Answeruser> getAnswerusers(Question question) {
		try {
			return answerUserRepoInterface.findAnswerUserByQuestion(question);
		} catch (Exception e) {
			return null;
		}
	}

	/*@Override
	public boolean addAnsweruser(JsonAnswerUserForm form) {
		try {
			ArrayList<JsonAnswerUser> jsonAnswerUsers = (ArrayList<JsonAnswerUser>) form.getAnswerusers();
			for(JsonAnswerUser jsonAnswerUser : jsonAnswerUsers){
				Answeruser answeruser = new Answeruser();
				answeruser.setContent(jsonAnswerUser.getContent());
					Question question = new Question();
					question.setIdquestion(jsonAnswerUser.getIdquestion());
				answeruser.setQuestion(question);
				answerUserRepoInterface.save(answeruser);
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}*/
	
	@Override
	public boolean addAnsweruser(Answeruser answeruser) {
		try {
			answerUserRepoInterface.save(answeruser);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public boolean editAnsweruser(Answeruser answeruser) {
		try {
			answerUserRepoInterface.save(answeruser);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteAnsweruser(Answeruser answeruser) {
		try {
			answerUserRepoInterface.delete(answeruser);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteAnsweruser(int idansweruser) {
		try {
			answerUserRepoInterface.delete(idansweruser);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteAnsweruser(List<Answeruser> answerusers) {
		try {
			answerUserRepoInterface.delete(answerusers);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	

}
