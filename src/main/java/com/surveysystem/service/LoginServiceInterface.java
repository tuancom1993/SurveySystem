package com.surveysystem.service;

import org.springframework.stereotype.Service;

import com.surveysystem.model.User;

public interface LoginServiceInterface {
	User getUse(String userName, String passWord);
	User getUser(int id);
}
