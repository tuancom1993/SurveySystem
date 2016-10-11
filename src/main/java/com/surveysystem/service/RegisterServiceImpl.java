package com.surveysystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surveysystem.model.Role;
import com.surveysystem.model.User;
import com.surveysystem.repository.UserRepoInterface;

@Service
public class RegisterServiceImpl implements RegisterServiceInterface {
	
	@Autowired UserRepoInterface userRepoInterface; 
	
	@Override
	public boolean registerUser(User user) {
		
		if (userRepoInterface.save(user) != null)
		return true;
		return false;
	}

	@Override
	public boolean existUserName(String username) {
		try {
			if(userRepoInterface.getCountUserByUserName(username) != 0) return true;
			return false;
		} catch (Exception e) {
			return true;
		}
	}

}
