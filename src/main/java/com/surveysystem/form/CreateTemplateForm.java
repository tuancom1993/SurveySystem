package com.surveysystem.form;

import java.util.ArrayList;

import com.surveysystem.model.Tag;
import com.surveysystem.model.Template;

public class CreateTemplateForm {
	private Template template;
	private ArrayList<Tag> tags;
	private int a;
	public Template getTemplate() {
		return template;
	}
	public void setTemplate(Template template) {
		this.template = template;
	}
	public ArrayList<Tag> getTags() {
		return tags;
	}
	public void setTags(ArrayList<Tag> tags) {
		this.tags = tags;
	}
	
	
}
