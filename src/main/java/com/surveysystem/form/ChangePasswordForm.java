package com.surveysystem.form;

public class ChangePasswordForm {
	private int idUser;
	private String password;
	private String rePassword;
	public ChangePasswordForm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRePassword() {
		return rePassword;
	}
	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}
	
	
}
