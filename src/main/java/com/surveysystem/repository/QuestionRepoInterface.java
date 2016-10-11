package com.surveysystem.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.surveysystem.model.Question;
import com.surveysystem.model.Survey;

public interface QuestionRepoInterface extends CrudRepository<Question, Integer> {
	ArrayList<Question> findBySurvey(Survey survey);
	
	@Query(value = "Select * From question q Where q.idsurvey = :_idsurvey Order By q.indexquestion", nativeQuery=true)
	List<Question>  getQuestionsBySurveyOrderByIndexq(@Param("_idsurvey") int idSurvey);
}
