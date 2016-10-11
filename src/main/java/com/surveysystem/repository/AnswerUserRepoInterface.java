package com.surveysystem.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.surveysystem.model.Answeruser;
import com.surveysystem.model.Datasurvey;
import com.surveysystem.model.Question;

public interface AnswerUserRepoInterface extends CrudRepository<Answeruser, Integer> {
	ArrayList<Answeruser> findAnswerUserByQuestion(Question question);
	ArrayList<Answeruser> findAnswerUserByDatasurveyAndQuestion(Datasurvey datasurvey, Question question);
	ArrayList<Answeruser> findAnswerUserByQuestionAndContent(Question question, String content);
	
	
	@Query(value="Select COUNT(idansweruser) From answeruser  Where idquestion = :_idquestion and content = :_idanswer ", nativeQuery=true)
	int getCountAnswerSelectedByQuestionAndAnswer(@Param("_idquestion") int idQuestion, @Param("_idanswer") String idanswer);
}
