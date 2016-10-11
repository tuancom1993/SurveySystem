package com.surveysystem.repository;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;

import com.surveysystem.model.Answer;
import com.surveysystem.model.Question;

public interface AnswerRepoInterface extends CrudRepository<Answer, Integer> {
	ArrayList<Answer> findAnswerByQuestion(Question question);
}
