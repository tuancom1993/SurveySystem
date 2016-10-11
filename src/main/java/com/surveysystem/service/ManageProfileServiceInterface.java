package com.surveysystem.service;

import com.surveysystem.model.User;

public interface ManageProfileServiceInterface {
	
	User getUser(int idUser);
	boolean editProfileAdmin(User user);
	boolean editProfileUser(User user);
	boolean changePassword(int idUser ,String password);
}
