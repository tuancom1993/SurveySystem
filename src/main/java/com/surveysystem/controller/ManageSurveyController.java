package com.surveysystem.controller;

import java.util.ArrayList;

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
import com.surveysystem.configuration.SMTPMailSender;
import com.surveysystem.form.CreateSurveyForm;
import com.surveysystem.form.EditSurveyForm;
import com.surveysystem.form.ManageSurveyForm;
import com.surveysystem.form.MySurveyForm;
import com.surveysystem.form.PreCreateSurveyForm;
import com.surveysystem.model.JsonAnswer;
import com.surveysystem.model.JsonDataSurvey;
import com.surveysystem.model.JsonQuestion;
import com.surveysystem.model.JsonSurvey;
import com.surveysystem.model.Survey;
import com.surveysystem.model.Tag;
import com.surveysystem.model.Template;
import com.surveysystem.model.User;
import com.surveysystem.repository.SurveyRepoInterface;
import com.surveysystem.service.ManageAnswerServiceInterface;
import com.surveysystem.service.ManageQuestionServiceInterface;
import com.surveysystem.service.ManageSurveyServiceInterface;
import com.surveysystem.service.ManageTemplateServiceInterface;

@Controller
public class ManageSurveyController {

	@Autowired
	ManageSurveyServiceInterface manageSurveyServiceInterface;
	@Autowired
	SurveyRepoInterface surveyRepoInterface;
	@Autowired
	ManageTemplateServiceInterface manageTemplateServiceInterface;
	@Autowired 
	ManageQuestionServiceInterface manageQuestionServiceInterface;
	@Autowired
	ManageAnswerServiceInterface manageAnswerServiceInterface;
	
	
	@RequestMapping(method = RequestMethod.GET, value = "/manage-survey/pre")
	public String showTemplateToChose(Model model, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/login";
		else {
			if (userLogin.getBlock() == 1)
				return "redirect:/";
			else {
				PreCreateSurveyForm form = new PreCreateSurveyForm();
				ArrayList<Template> templates = manageTemplateServiceInterface.getTemplates();
				ArrayList<Tag> tags = manageTemplateServiceInterface.getTags();
				form.setTemplates(templates);
				form.setTags(tags);
				model.addAttribute("form", form);
				return "pre-create-survey";
			}
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/manage-survey/create")
	public String showCreateSurvey(Model model, @RequestParam("idtemplate") int idTemplate, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getBlock() == 1)
				return "redirect:/";
			else {
				if (idTemplate == 0) {
					showCreateSurveyCuz(model);
					return "create-survey-cuz";
				} else {
					Template template = manageTemplateServiceInterface.getTemplate(idTemplate);
					CreateSurveyForm form = new CreateSurveyForm();
					form.setKindSurvey(1);
					form.setCover(template.getCover());
					form.setMainColor(template.getMaincolor());
					form.setRgba(Common.hexToRGBA(template.getMaincolor()));
					form.setIdTemplate(idTemplate);

					model.addAttribute("form", form);
					return "create-survey";
				}
			}
		}
		
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/manage-survey/create")
	public @ResponseBody String createSurvey(@RequestBody JsonSurvey jsonSurvey, HttpSession session){
		String result = "";
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			result = "notalow";
		else {
			if (userLogin.getBlock() == 1){
				result = "notalow"; 
			}else {
				Survey surveyAdded =manageSurveyServiceInterface.createSurvey(jsonSurvey, userLogin);
				if (surveyAdded!=null){
					result = "{\"title\":\""+ surveyAdded.getTitle()+"\", \"id\":\""+ surveyAdded.getIdsurvey() +"\"}";
				} else result = "fail";
			}
		}
		System.out.println("Create survey "+result);
		return result;
	}
	
	private boolean showCreateSurveyCuz(Model model){
		try {
			CreateSurveyForm form = new CreateSurveyForm();
			form.setKindSurvey(0);
			form.setCover("#2196F3");
			form.setMainColor("#2196F3");
			form.setRgba(Common.hexToRGBA("#2196F3"));
			form.setIdTemplate(0);

			model.addAttribute("form", form);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	@RequestMapping(value="/my-survey")
	public String showMySurvey(Model model, HttpSession session, @RequestParam("page") int page){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getBlock() == 1)
				return "redirect:/";
			else {
				MySurveyForm form = new MySurveyForm();
				ArrayList<Survey> surveys = manageSurveyServiceInterface.getLimitSurveysByUser(page, userLogin.getIduser());
				form.setPage(page);
				form.setNumOfPage(manageSurveyServiceInterface.getPageNumberMySurvey(userLogin.getIduser()));
				form.setSurveys(surveys);
				model.addAttribute("form", form);
				
				return "my-survey";
			}
		}
	}
	
	@RequestMapping(value="/manage-survey")
	public String showManageSurvey(Model model, HttpSession session, @RequestParam("page") int page){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 2) return "redirect:/homepage";
			else{
				ManageSurveyForm form = new ManageSurveyForm();
				ArrayList<Survey> surveys = manageSurveyServiceInterface.getLimitSurveys(page);
				if (surveys == null) surveys = new ArrayList<Survey>();
				form.setSurveys(surveys);
				form.setPage(page);
				form.setNumOfPage(manageSurveyServiceInterface.getPageNumberAllSurvey());
				model.addAttribute("form", form);
				return "manage-survey";
			}
		}
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/manage-survey/edit")
	public String showEditSurvey(Model model, HttpSession session, @RequestParam("idsurvey") int idSurvey){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getBlock() == 1)
				return "redirect:/";
			else {
				EditSurveyForm form = new EditSurveyForm();
				Survey survey = manageSurveyServiceInterface.getSurvey(idSurvey, true);
				form.setSurvey(survey);
				form.setRgba(Common.hexToRGBA(survey.getMaincolor()));
				
				model.addAttribute("form", form);
				
				return "edit-survey";
			}
		}
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/manage-survey/edit")
	public @ResponseBody String doEditSurvey(@RequestBody JsonSurvey jsonSurvey, HttpSession session){
		String result = "";
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			result = "notalow";
		else {
			if (userLogin.getBlock() == 1){
				result = "notalow"; 
			}else {
				System.out.println("Create Date: "+jsonSurvey.getCreatedate());
				Survey surveyAdded = manageSurveyServiceInterface.editSurvey(jsonSurvey, userLogin);
				if (surveyAdded!=null){
					result = "{\"title\":\""+ surveyAdded.getTitle()+"\", \"id\":\""+ surveyAdded.getIdsurvey() +"\"}";
				} else result = "fail";
			}
		}
		System.out.println("Edit survey "+result);
		return result;
	}
	
	@RequestMapping (value = "/manage-survey/delete")
	public String deleteSurvey(HttpSession session, @RequestParam("idsurvey") int idSurvey){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 1){
				System.out.println("Vao day roi");
				manageSurveyServiceInterface.deleteSurvey(idSurvey);
				return "redirect:/manage-survey?page=0";
			}
			return "redirect:/homepage";
		}
		
	}
	
	@RequestMapping (value = "/my-survey/delete")
	public String deleteMySurvey(HttpSession session, @RequestParam("idsurvey") int idSurvey){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			Survey survey = manageSurveyServiceInterface.getSurvey(idSurvey, false);
			if (userLogin.getIduser() == survey.getUser().getIduser()){
				manageSurveyServiceInterface.deleteSurvey(idSurvey);
			}
		}
		return "redirect:/my-survey?page=0";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/manage-survey/delete-question")
	public @ResponseBody String doDeleteQuestion(@RequestBody JsonQuestion jsonQuestion, HttpSession session){
		String result = "";
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			result = "notalow";
		else {
			if (userLogin.getBlock() == 1){
				result = "notalow"; 
			}else {
				if (manageQuestionServiceInterface.deleteQuestionAndRelation(jsonQuestion.getIdquestion()))
				result = "Delete Question Successfull!";
				else result = "Delete Question Fail. Pleas try again!";
			}
		}
		System.out.println("Edit survey (Delete queeestion): "+result);
		return result;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/manage-survey/delete-answer")
	public @ResponseBody String doDeleteAnswer(@RequestBody JsonAnswer jsonAnswer, HttpSession session){
		String result = "";
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			result = "notalow";
		else {
			if (userLogin.getBlock() == 1){
				result = "notalow"; 
			}else {
				if (manageAnswerServiceInterface.deleteAnswerAndRelation(jsonAnswer.getIdanswer()))
				result = "Delete Answer Successfull!";
				else result = "Delete Answer Fail. Pleas try again!";
			}
		}
		System.out.println("Edit survey (Delete answerv): "+result);
		return result;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/manage-survey/search")
	public String searchSurveyByAdmin(@RequestParam("varSearch") String varSearch, Model model ,HttpSession session){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 2) return "redirect:/homepage";
			else{
				ManageSurveyForm form = new ManageSurveyForm();
				ArrayList<Survey> surveys = manageSurveyServiceInterface.getSurveyBySearchByAdmin(varSearch);
				if (surveys == null) surveys = new ArrayList<Survey>();
				System.out.println("Survey Search count: "+surveys.size());
				form.setSurveys(surveys);
				form.setPage(0);
				form.setNumOfPage(1);
				form.setVarSearch(varSearch);
				model.addAttribute("form", form);
				return "manage-survey";
			}
		}
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/my-survey/search")
	public String searchSurveyByUser(@RequestParam("varSearch") String varSearch, Model model ,HttpSession session){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
				MySurveyForm form = new MySurveyForm();
				ArrayList<Survey> surveys = manageSurveyServiceInterface.getSurveyBySearchByUser(userLogin.getIduser(),varSearch);
				if (surveys == null) surveys = new ArrayList<Survey>();
				System.out.println("Survey Search count: "+surveys.size());
				form.setSurveys(surveys);
				form.setPage(0);
				form.setNumOfPage(1);
				form.setVarSearch(varSearch);
				model.addAttribute("form", form);
				return "my-survey";
			
		}
	}
}
