package com.surveysystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surveysystem.model.Role;
import com.surveysystem.model.Survey;
import com.surveysystem.model.User;
import com.surveysystem.repository.AnswerUserRepoInterface;
import com.surveysystem.repository.RoleRepoInterface;
import com.surveysystem.repository.SurveyRepoInterface;
import com.surveysystem.repository.UserRepoInterface;

@Service
public class LoginServiceImpl implements LoginServiceInterface {
	
	@Autowired
	private UserRepoInterface userRepoInterface;
	
	@Override
	public User getUse(String userName, String passWord) {
		User user = null;
		try {
			user = userRepoInterface.findByUsernameAndPassword(userName, passWord);
		} catch (Exception e) {
			return null;
		} finally {
			return user;
		}
		
	}

	@Override
	public User getUser(int idUser) {
		User user = null;
		try {
			user = userRepoInterface.findByIduser(idUser);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return user;
		}
	}

}
