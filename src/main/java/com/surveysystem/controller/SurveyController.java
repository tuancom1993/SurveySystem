package com.surveysystem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.surveysystem.configuration.Common;
import com.surveysystem.form.DataSurveyTableForm;
import com.surveysystem.form.SurveyForm;
import com.surveysystem.form.SurveySuccessForm;
import com.surveysystem.model.JsonDataSurvey;
import com.surveysystem.model.Survey;
import com.surveysystem.service.ManageAnswerUserServiceInterface;
import com.surveysystem.service.ManageDataSurveyServiceInterface;
import com.surveysystem.service.ManageShowDataSurveyServiceInterface;
import com.surveysystem.service.ManageSurveyServiceInterface;
import com.surveysystem.service.ManageTemplateServiceInterface;

@Controller
public class SurveyController {
	
	@Autowired
	ManageSurveyServiceInterface manageSurveyServiceInterface;
	@Autowired
	ManageDataSurveyServiceInterface manageDataSurveyServiceInterface; 
	
	
	@RequestMapping(value="/survey")
	public String showSurvey(@RequestParam("idsurvey") int idSurvey,Model model, HttpSession session){
		try {
			Survey survey = manageSurveyServiceInterface.getSurvey(idSurvey, false);
			if (survey == null) return "/my-survey";
			else {
				if (survey.getStopsurvey()==1) return "redirect:/";
				else{
					SurveyForm form = new SurveyForm();
					form.setSurvey(survey);
					form.setColorRGBA(Common.hexToRGBA(survey.getMaincolor()));
					model.addAttribute("form", form);
					
					if(survey.getKindsurvey()==0) return "survey";
					else return "survey-step";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/survey")
	public @ResponseBody String doSurvey(@RequestBody JsonDataSurvey jsonDataSurvey){
		String result="";
		if(manageDataSurveyServiceInterface.createDataSurvey(jsonDataSurvey))
			return "success";
		else return "error";
	}
	
	/*@RequestMapping(value="/survey-step")
	public String showSurveyStep(@RequestParam("idsurvey") int idSurvey,Model model, HttpSession session){
		try {
			Survey survey = manageSurveyServiceInterface.getSurvey(idSurvey, false);
			if (survey == null) return "/my-survey";
			else {
				if (survey.getStopsurvey()==1) return "redirect:/";
				else{
					SurveyForm form = new SurveyForm();
					form.setSurvey(survey);
					form.setColorRGBA(Common.hexToRGBA(survey.getMaincolor()));
					model.addAttribute("form", form);
					
					return "survey-step";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
	}*/
	
	@RequestMapping(value="/survey/success")
	public String surveySuccess(@RequestParam("i") int idSurvey, Model model){
		Survey survey = manageSurveyServiceInterface.getSurvey(idSurvey, false);
		SurveySuccessForm form = new SurveySuccessForm();
		form.setCover(survey.getCover());
		form.setIdsurvey(survey.getIdsurvey());
		form.setMainColor(survey.getMaincolor());
		form.setRGBA(Common.hexToRGBA(survey.getMaincolor()));
		
		model.addAttribute("form", form);
		return "thanktosurvey";
	}
}
