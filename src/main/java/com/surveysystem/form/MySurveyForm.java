package com.surveysystem.form;

import java.util.ArrayList;

import com.surveysystem.model.Survey;

public class MySurveyForm {
	private ArrayList<Survey> surveys;
	private int page;
	private int numOfPage;
	private String varSearch;

	public ArrayList<Survey> getSurveys() {
		return surveys;
	}

	public void setSurveys(ArrayList<Survey> surveys) {
		this.surveys = surveys;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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
