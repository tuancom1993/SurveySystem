package com.surveysystem.form;

import javax.validation.constraints.Size;

import com.surveysystem.model.User;

public class EditUserForm {
	private User user;
	private String rePassword;

	
	
	
	public EditUserForm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EditUserForm(User user, String rePassword) {
		super();
		this.user = user;
		this.rePassword = rePassword;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getRePassword() {
		return rePassword;
	}
	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

	
	
}
