package com.surveysystem.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.surveysystem.model.Datasurvey;

public interface DataSurveyRepoInterface extends CrudRepository<Datasurvey, Integer> {
	
}
