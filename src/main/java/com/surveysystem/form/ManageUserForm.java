package com.surveysystem.form;

import java.util.List;

import com.surveysystem.model.User;

public class ManageUserForm {
	private List<User> users;
	
	public ManageUserForm() {
		super();
	}
	
	public ManageUserForm(List<User> users) {
		super();
		this.users = users;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
	
}
