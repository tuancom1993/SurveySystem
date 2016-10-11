package com.surveysystem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.surveysystem.form.DataSurveyTableForm;
import com.surveysystem.form.chart.QuestionChart;
import com.surveysystem.form.chart.SurveyChart;
import com.surveysystem.model.Question;
import com.surveysystem.model.User;
import com.surveysystem.service.ManageShowDataSurveyServiceInterface;

@Controller
public class ManageShowDataSurvey {

	@Autowired
	ManageShowDataSurveyServiceInterface manageShowDataSurveyServiceInterface;

	@RequestMapping(value = "/view-datasurvey/table")
	public String showDataSurveyTable(Model model, @RequestParam("id") int idSurvey, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getBlock() == 1)
				return "redirect:/";
			else {
				DataSurveyTableForm form = manageShowDataSurveyServiceInterface.getDataSurveyTable(idSurvey);
				System.out.println("id user-survey: "+form.getSurvey().getUser().getIduser());
				if (userLogin.getRole().getIdrole() == 1
						|| form.getSurvey().getUser().getIduser() == userLogin.getIduser()){
					model.addAttribute("form", form);
					return "view-data-survey-table";
				} else return "redirect:/my-survey?page=0";
			}
		}
	}

	@RequestMapping(value = "/view-datasurvey/chart")
	public String showDataSurveyChart(Model model, @RequestParam("id") int idSurvey, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getBlock() == 1)
				return "redirect:/";
			else {
				SurveyChart surveyChart = manageShowDataSurveyServiceInterface.getDataSurveyChart(idSurvey);
				if (userLogin.getRole().getIdrole() == 1 || surveyChart.getIdUser() == userLogin.getIduser()){
					model.addAttribute("surveyChart", surveyChart);
					return "view-data-survey-chart";
				} else return "redirect:/my-survey?page=0";
			}
		}
	}
	
	@RequestMapping(value = "/view-datasurvey/table/chart")
	public @ResponseBody String getQuestionChart(@RequestBody Question question){
		String result="";
		try {
			QuestionChart questionChart = manageShowDataSurveyServiceInterface.getQuestionChart(question.getIdquestion());
			result = new ObjectMapper().writeValueAsString(questionChart);
			System.out.println("Json: "+result);
			return result;
		} catch (Exception e) {
			return result;
		}
	}
}
