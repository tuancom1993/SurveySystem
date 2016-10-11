package com.surveysystem.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.surveysystem.configuration.Common;
import com.surveysystem.form.CreateTemplateForm;
import com.surveysystem.form.EditTemplateForm;
import com.surveysystem.form.EditUserForm;
import com.surveysystem.form.ManageTemplateForm;
import com.surveysystem.model.Tag;
import com.surveysystem.model.Template;
import com.surveysystem.model.User;
import com.surveysystem.service.ManageTemplateServiceInterface;

@Controller
public class ManageTemplateController {

	@Autowired
	ManageTemplateServiceInterface manageTemplateServiceInterface;

	@RequestMapping(method = RequestMethod.GET, value = "/manage-template")
	public String showManageTemplate(Model model, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 2)
				return "redirect:/";
			else {
				ManageTemplateForm form = new ManageTemplateForm();
				ArrayList<Template> templates = manageTemplateServiceInterface.getTemplates();
				ArrayList<Tag> tags = manageTemplateServiceInterface.getTags();
				form.setTemplates(templates);
				form.setTags(tags);
				model.addAttribute("form", form);
				return "manage-template";
			}
		}

	}

	@RequestMapping(method = RequestMethod.GET, value = "/manage-template/create")
	public String showCreateTemplate(Model model, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 2)
				return "redirect:/";
			else {
				CreateTemplateForm form = new CreateTemplateForm();
				Template template = new Template();
				template.setMaincolor("#fd3e00");
				ArrayList<Tag> tags = manageTemplateServiceInterface.getTags();
				form.setTemplate(template);
				form.setTags(tags);
				model.addAttribute("form", form);
				return "create-template";
			}
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/manage-template/create")
	public String createTemplate(@ModelAttribute("form") CreateTemplateForm createTemplateForm,
			@RequestParam("cover") MultipartFile file, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 2)
				return "redirect:/";
			else {
				Template template = createTemplateForm.getTemplate();
				Common.executeUploadCover(template, file);
				template.setCreatedate(Common.getCurrentDate());
				manageTemplateServiceInterface.createTemplate(template);
				return "redirect:/manage-template";
			}
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/manage-template/edit")
	public String showEditTemplate(Model model, @RequestParam("idtemplate") String idTemplate, HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 2)
				return "redirect:/";
			else {
				EditTemplateForm form = new EditTemplateForm();
				Template template = manageTemplateServiceInterface.getTemplate(Integer.parseInt(idTemplate));
				if (template == null)
					return "redirect:/manage-template";
				ArrayList<Tag> tags = manageTemplateServiceInterface.getTags();
				form.setTemplate(template);
				form.setTags(tags);
				model.addAttribute("form", form);
				return "edit-template";
			}
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/manage-template/edit")
	public String editTemplate(@ModelAttribute("form") EditTemplateForm editTemplateForm,
			@RequestParam("cover") MultipartFile file, @RequestParam("idtemplate") int idTemplate,
			HttpSession session) {
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 2)
				return "redirect:/";
			else {
				Template template = editTemplateForm.getTemplate();
				template.setIdtemplate(idTemplate);
				Common.executeUploadCover(template, file);
				manageTemplateServiceInterface.editTemplate(template);
				return "redirect:/manage-template";
			}
		}
	}
	
	@RequestMapping(value="/manage-template/delete")
	public String deleteTemplate(HttpSession session, @ModelAttribute("idtemplate") String idTemplate){
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null)
			return "redirect:/";
		else {
			if (userLogin.getRole().getIdrole() == 2)
				return "redirect:/";
			else {
				if ("".equals(idTemplate) || idTemplate==null) return "redirect:/manage-template";
				else manageTemplateServiceInterface.deleteTemplate(Integer.parseInt(idTemplate));
			}
		}
		
		return "redirect:/manage-template";
	}

}
