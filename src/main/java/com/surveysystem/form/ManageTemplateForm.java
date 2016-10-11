package com.surveysystem.form;

import java.util.ArrayList;

import com.surveysystem.model.Tag;
import com.surveysystem.model.Template;

public class ManageTemplateForm {
	private ArrayList<Template> templates;
	private ArrayList<Tag> tags;
	public ArrayList<Template> getTemplates() {
		return templates;
	}
	public void setTemplates(ArrayList<Template> templates) {
		this.templates = templates;
	}
	public ArrayList<Tag> getTags() {
		return tags;
	}
	public void setTags(ArrayList<Tag> tags) {
		this.tags = tags;
	}
	
	
}
