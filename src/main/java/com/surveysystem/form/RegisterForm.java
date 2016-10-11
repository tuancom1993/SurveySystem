package com.surveysystem.form;

import java.io.File;

import com.surveysystem.model.User;

public class RegisterForm {
	private User user;
	private File fileAvata;
	private String repassword;
	
	public RegisterForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RegisterForm(User user, File fileAvata, String repassword) {
		super();
		this.user = user;
		this.fileAvata = fileAvata;
		this.repassword = repassword;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public File getFileAvata() {
		return fileAvata;
	}

	public void setFileAvata(File fileAvata) {
		this.fileAvata = fileAvata;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	
}
	