package com.surveysystem.model;

import java.util.ArrayList;

public class JsonDataSurvey {

	private int iddatasurvey;
	private int idsurvey;
	private ArrayList<JsonAnswerUser> answerusers;

	public int getIddatasurvey() {
		return iddatasurvey;
	}

	public void setIddatasurvey(int iddatasurvey) {
		this.iddatasurvey = iddatasurvey;
	}

	public int getIdsurvey() {
		return idsurvey;
	}

	public void setIdsurvey(int idsurvey) {
		this.idsurvey = idsurvey;
	}

	public ArrayList<JsonAnswerUser> getAnswerusers() {
		return answerusers;
	}

	public void setAnswerusers(ArrayList<JsonAnswerUser> answerusers) {
		this.answerusers = answerusers;
	}

}
