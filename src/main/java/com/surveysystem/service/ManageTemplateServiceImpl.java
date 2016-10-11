package com.surveysystem.service;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surveysystem.model.Tag;
import com.surveysystem.model.Template;
import com.surveysystem.repository.TagRepoInterface;
import com.surveysystem.repository.TemplateRepoInterface;

@Service
public class ManageTemplateServiceImpl implements ManageTemplateServiceInterface {
	
	@Autowired TemplateRepoInterface templateRepoInterface;
	@Autowired TagRepoInterface tagRepoInterface; 
	
	@Override
	public boolean createTemplate(Template template) {
		if ("".equals(template.getCover())) template.setCover("cover-common.jpg");
		template.setIndexselect(0);
		templateRepoInterface.save(template);
		return true;
	}

	@Override
	public Template getTemplate(int idTemplage) {
		// TODO Auto-generated method stub
		return templateRepoInterface.findOne(idTemplage);
	}

	@Override
	public ArrayList<Template> getTemplates() {
		// TODO Auto-generated method stub
		return (ArrayList<Template>) templateRepoInterface.findAll();
	}

	@Override
	public boolean editTemplate(Template template_new) {
		Template template_old =  templateRepoInterface.findOne(template_new.getIdtemplate());
		if ("".equals(template_new.getCover())) template_new.setCover(template_old.getCover());
		else{
			if (!"cover-common.jpg".equals(template_old.getCover())){
				File oldCover = new File("src/main/resources/static/img/cover/"+template_old.getCover());
				oldCover.delete();
			}
		}
		template_new.setCreatedate(template_old.getCreatedate());
		templateRepoInterface.save(template_new);
		return true;
	}

	@Override
	public boolean deleteTemplate(int idTemplate) {
		Template template =  templateRepoInterface.findOne(idTemplate);
		templateRepoInterface.delete(idTemplate);
		if (!"cover-common.jpg".equals(template.getCover())){
			File oldCover = new File("src/main/resources/static/img/cover/"+template.getCover());
			if(oldCover.exists()) oldCover.delete();
		}
		return true;
	}

	@Override
	public ArrayList<Tag> getTags() {
		return (ArrayList<Tag>) tagRepoInterface.findAll();
	}
	
}
