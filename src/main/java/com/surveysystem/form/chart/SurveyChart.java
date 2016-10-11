package com.surveysystem.form.chart;

import java.util.Date;
import java.util.List;

public class SurveyChart {
	
	private int idsurvey;
	private int idUser;
	private String title;
	private String cover;
	private Date createdate;
	private String maincolor;
	private String RGBA;
	private String surveydescribe;
	private List<QuestionChart> questionCharts;
	public int getIdsurvey() {
		return idsurvey;
	}
	public void setIdsurvey(int idsurvey) {
		this.idsurvey = idsurvey;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getMaincolor() {
		return maincolor;
	}
	public void setMaincolor(String maincolor) {
		this.maincolor = maincolor;
	}
	public String getSurveydescribe() {
		return surveydescribe;
	}
	public void setSurveydescribe(String surveydescribe) {
		this.surveydescribe = surveydescribe;
	}
	public List<QuestionChart> getQuestionCharts() {
		return questionCharts;
	}
	public void setQuestionCharts(List<QuestionChart> questionCharts) {
		this.questionCharts = questionCharts;
	}
	public String getRGBA() {
		return RGBA;
	}
	public void setRGBA(String rGBA) {
		RGBA = rGBA;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	
	
	
}
