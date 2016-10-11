package com.surveysystem.service;

import java.util.ArrayList;

import com.surveysystem.model.Tag;
import com.surveysystem.model.Template;

public interface ManageTemplateServiceInterface {
	boolean createTemplate(Template template);
	Template getTemplate(int idTemplage);
	ArrayList<Template> getTemplates();
	boolean editTemplate(Template template);
	boolean deleteTemplate(int idTemplate);
	ArrayList<Tag> getTags();
}
