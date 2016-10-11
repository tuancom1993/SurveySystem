package com.surveysystem.form;

import java.util.ArrayList;

import com.surveysystem.model.Survey;

public class ManageSurveyForm {
	private int page;
	private int numOfPage;
	private ArrayList<Survey> surveys;
	private String varSearch;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public ArrayList<Survey> getSurveys() {
		return surveys;
	}
	public void setSurveys(ArrayList<Survey> surveys) {
		this.surveys = surveys;
	}
	public int getNumOfPage() {
		return numOfPage;
	}
	public void setNumOfPage(int numOfPage) {
		this.numOfPage = numOfPage;
	}
	public String getVarSearch() {
		return varSearch;
	}
	public void setVarSearch(String varSearch) {
		this.varSearch = varSearch;
	}
	
	
}
