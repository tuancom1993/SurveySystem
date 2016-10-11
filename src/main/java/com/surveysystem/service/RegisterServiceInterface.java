package com.surveysystem.service;

import com.surveysystem.model.User;

public interface RegisterServiceInterface {
	boolean registerUser(User user);
	boolean existUserName(String username);
}
