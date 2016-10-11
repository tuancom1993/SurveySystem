package com.surveysystem.service;

import java.util.List;

import com.surveysystem.form.StatisticalForm;
import com.surveysystem.model.Template;

public interface ManageStatisticalServiceInterface {
	
	StatisticalForm getStatisticalForm();
	List<Template> getTemplates();
}