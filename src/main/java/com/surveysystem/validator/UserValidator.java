package com.surveysystem.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.surveysystem.model.User;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return User.class.equals(arg0);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
		
	}

}
