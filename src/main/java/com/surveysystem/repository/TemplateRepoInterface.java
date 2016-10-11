package com.surveysystem.repository;

import org.springframework.data.repository.CrudRepository;

import com.surveysystem.model.Template;

public interface TemplateRepoInterface extends CrudRepository<Template, Integer> {

}
