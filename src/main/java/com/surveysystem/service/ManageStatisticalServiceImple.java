package com.surveysystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surveysystem.form.StatisticalForm;
import com.surveysystem.model.Template;

@Service
public class ManageStatisticalServiceImple implements ManageStatisticalServiceInterface {
	@Autowired ManageTemplateServiceInterface manageTemplateServiceInterface;
	
	@Override
	public StatisticalForm getStatisticalForm() {
		StatisticalForm form = new StatisticalForm();
		try {
			form.setTemplates(getTemplates());
			return form;
		} catch (Exception e) {
			return form;
		}
	}

	@Override
	public List<Template> getTemplates() {
		try {
			return manageTemplateServiceInterface.getTemplates();
		} catch (Exception e) {
			return null;
		}
	}

}
