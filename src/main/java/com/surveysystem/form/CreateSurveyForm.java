package com.surveysystem.form;

public class CreateSurveyForm {
	private int kindSurvey;
	private String cover;
	private String mainColor;
	private String rgba;
	private int idTemplate;
	
	
	
	public int getIdTemplate() {
		return idTemplate;
	}
	public void setIdTemplate(int idTemplate) {
		this.idTemplate = idTemplate;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getMainColor() {
		return mainColor;
	}
	public void setMainColor(String mainColor) {
		this.mainColor = mainColor;
	}
	public String getRgba() {
		return rgba;
	}
	public void setRgba(String rgba) {
		this.rgba = rgba;
	}
	public int getKindSurvey() {
		return kindSurvey;
	}
	public void setKindSurvey(int kindSurvey) {
		this.kindSurvey = kindSurvey;
	}
	
	
}
