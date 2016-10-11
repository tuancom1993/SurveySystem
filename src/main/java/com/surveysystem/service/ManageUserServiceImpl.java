package com.surveysystem.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surveysystem.model.Survey;
import com.surveysystem.model.User;
import com.surveysystem.repository.FeedbackRepoInterface;
import com.surveysystem.repository.UserRepoInterface;

@Service
public class ManageUserServiceImpl implements ManageUserServiceInterface{
	
	@Autowired UserRepoInterface userRepoInterface; 
	@Autowired FeedbackRepoInterface feedbackRepoInterface;
	@Autowired ManageSurveyServiceInterface manageSurveyServiceInterface;
	
	@Override
	public List<User> getUsers() {
		List<User> users = (List<User>) userRepoInterface.findAll();
		return users;
	}


	@Override
	public User getUser(int idUser) {
		User user = userRepoInterface.findByIduser(idUser);
		return user;
	}


	@Override
	public boolean editUser(User newUser) {
		User oldUser = userRepoInterface.findOne(newUser.getIduser());
		newUser.setPassword(oldUser.getPassword());
		if("".equals(newUser.getAvata())) newUser.setAvata(oldUser.getAvata());
		else {
			File avata = new File("src/main/resources/static/img/avata/"+oldUser.getAvata());
			if(!"User.png".equals(oldUser.getAvata())) 
				if (avata.exists()) avata.delete();
		}
		if (userRepoInterface.save(newUser)!=null)
			return true;
		return false;
	}


	@Override
	public boolean deleteUser(String idUser) {
		if(idUser!=null && !"".equals(idUser) ){
			User user = userRepoInterface.findOne(Integer.parseInt(idUser));
			
			File avata = new File("src/main/resources/static/img/avata/"+user.getAvata());
			if (avata.exists() && !"User.png".equals(user.getAvata())) avata.delete();
			
			List<Survey> surveys = user.getSurveys();
			System.out.println("Nember survey of user: "+surveys.size());
			for(Survey survey : surveys){
				manageSurveyServiceInterface.deleteSurvey(survey.getIdsurvey());
			}
			
			userRepoInterface.delete(Integer.parseInt(idUser));
			return true;
		}
		return false;
	}


	@Override
	public boolean changePassword(int idUser, String password) {
		User user = userRepoInterface.findByIduser(idUser);
		if (user!=null && !"".equals(password) && null!=password){
			user.setPassword(password);
			userRepoInterface.save(user);
			return true;
		}
		return false;
	}
	
}
