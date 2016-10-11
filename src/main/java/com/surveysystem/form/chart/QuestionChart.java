package com.surveysystem.form.chart;

import java.util.List;

public class QuestionChart {
	private int idquestion;
	private String contentquestion;
	private int idkindquestion;
	private List<AnswerChart> answerCharts;
	public int getIdquestion() {
		return idquestion;
	}
	public void setIdquestion(int idquestion) {
		this.idquestion = idquestion;
	}
	public String getContentquestion() {
		return contentquestion;
	}
	public void setContentquestion(String contentquestion) {
		this.contentquestion = contentquestion;
	}
	public List<AnswerChart> getAnswerCharts() {
		return answerCharts;
	}
	public void setAnswerCharts(List<AnswerChart> answerCharts) {
		this.answerCharts = answerCharts;
	}
	public int getIdkindquestion() {
		return idkindquestion;
	}
	public void setIdkindquestion(int idkindquestion) {
		this.idkindquestion = idkindquestion;
	}
	
}
